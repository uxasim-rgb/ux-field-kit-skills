#!/usr/bin/env bash
# Scaffold a new skill to the house shape, with its agent config and eval case.
#
#   ./scripts/new-skill.sh <slug> "<Display Name>" "<short description>"
#
# Example:
#   ./scripts/new-skill.sh onboarding-design "Onboarding Design" "First-run flows and activation"
#
# Writes skills/<slug>/ and evals/<slug>/, then reminds you of the three
# places a new skill must also be registered.

set -euo pipefail
cd "$(dirname "$0")/.."

SLUG="${1:-}"; NAME="${2:-}"; DESC="${3:-}"

if [ -z "$SLUG" ] || [ -z "$NAME" ] || [ -z "$DESC" ]; then
  echo "usage: ./scripts/new-skill.sh <slug> \"<Display Name>\" \"<short description>\""
  exit 1
fi

if ! echo "$SLUG" | grep -qE '^[a-z][a-z0-9-]*$'; then
  echo "error: slug must be lowercase with hyphens, e.g. onboarding-design"
  exit 1
fi

if [ -d "skills/$SLUG" ]; then
  echo "error: skills/$SLUG already exists"
  exit 1
fi

mkdir -p "skills/$SLUG/agents" "evals/$SLUG/graders"

cat > "skills/$SLUG/SKILL.md" <<SKILL
---
name: $SLUG
description: <One sentence. What this skill does, primary use case first. Do not put trigger keywords here.>
when_to_use: Use when <what a request looks like when this skill is the answer — the phrases a person would actually type>.
---

# $NAME

<Two or three sentences: what the skill does, which band it sits in, and the one idea that governs it. Not why the domain matters.>

The governing idea: <the single sentence someone should remember>.

**Works with:** \`<sibling>\` owns <adjacent territory> · \`<sibling>\` owns <adjacent territory>.

## Start here

| The situation | Go to |
| --- | --- |
| <the situation a person is actually in> | **<Principle heading>** below |
| <a situation this skill does not own> | \`<owning-skill>\` |

## Principles

<Sentence-case headings that carry their own point. "Recruit for the behavior, not the demographic", never "Recruiting". Number them only if the steps genuinely run in order.>

## Evidence bar

<How hard to press in this domain. What must be measured rather than estimated. What counts as a finding versus a preference. When the correct output is nothing at all.>

## Before you ship

| Symptom | What it means | Fix |
| --- | --- | --- |
| <a detection pattern, not a rule restated> | <what it indicates> | <what to do> |

## Reporting

**Severity ladder:** \`Critical\` — <…> · \`Serious\` — <…> · \`Moderate\` — <…> · \`Minor\` — <…>

**Verification:** <what must be checked before reporting>

**Format:** <what the deliverable contains, in order>

**Done when:** <the condition that makes this finished>
SKILL

cat > "skills/$SLUG/agents/openai.yaml" <<YAML
interface:
  display_name: "$NAME"
  short_description: "$DESC"
YAML

cat > "evals/$SLUG/prompt.md" <<PROMPT
---
max_turns: 8
allowed_tools: [Read, Glob, Grep, Skill]
---

<A request phrased the way a person would actually type it. Do NOT name the skill — the point is to test whether Claude chooses it from natural phrasing.>
PROMPT

cat > "evals/$SLUG/graders/skill-fired.md" <<GRADER
---
type: tool_used
tool: Skill
input_match: '"skill"\s*:\s*"(?:[\w-]+:)?$SLUG"'
arm: with-only
---
GRADER

cat > "evals/$SLUG/graders/criteria.md" <<CRIT
---
type: llm
---

PASS if <what a correct response contains, concretely>.
FAIL if <what a wrong or generic response looks like>.
CRIT

cat <<DONE

Created:
  skills/$SLUG/SKILL.md
  skills/$SLUG/agents/openai.yaml
  evals/$SLUG/prompt.md
  evals/$SLUG/graders/skill-fired.md
  evals/$SLUG/graders/criteria.md

Still to do by hand — validate.sh will fail until you do:

  1. AGENTS.md  — add '$SLUG' to the rule-ownership table and to its band
  2. README.md  — add it to the map
  3. .claude-plugin/plugin.json — bump "version"

If this skill should only run when a user asks for it, set BOTH halves:
  skills/$SLUG/SKILL.md          disable-model-invocation: true
  skills/$SLUG/agents/openai.yaml  policy.allow_implicit_invocation: false

Then:  npm run validate

DONE
