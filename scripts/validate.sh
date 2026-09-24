#!/usr/bin/env bash
# Structure checks for ux-field-kit.
#
# Run locally:  ./scripts/validate.sh    (or: npm run validate)
# CI runs this exact file, so local and CI can never disagree.
#
# Needs no API key, makes no network calls, costs nothing.

set -uo pipefail
cd "$(dirname "$0")/.."

FAIL=0
pass() { printf '  \033[32mok\033[0m       %s\n' "$1"; }
fail() { printf '  \033[31mFAIL\033[0m     %s\n' "$1"; FAIL=1; }
head() { printf '\n\033[1m%s\033[0m\n' "$1"; }

# In GitHub Actions, also emit annotations so failures appear inline on the PR.
annotate() { [ -n "${GITHUB_ACTIONS:-}" ] && echo "::error::$1"; }
err() { fail "$1"; annotate "$1"; }

head "Manifests"

for f in .claude-plugin/plugin.json .claude-plugin/marketplace.json; do
  if [ ! -f "$f" ]; then
    err "$f is missing"
  elif command -v node >/dev/null 2>&1; then
    if node -e "JSON.parse(require('fs').readFileSync('$f','utf8'))" 2>/dev/null; then
      pass "$f is valid JSON"
    else
      err "$f is not valid JSON"
    fi
  else
    pass "$f exists (no node available to parse it)"
  fi
done

for f in plugin.json marketplace.json; do
  if [ -f "$f" ]; then
    err "$f must live in .claude-plugin/, not the repository root — Claude Code will not find it here"
  fi
done
[ -f plugin.json ] || [ -f marketplace.json ] || pass "manifests are not at the repository root"

head "Skills"

COUNT=0
for d in skills/*/; do
  [ -d "$d" ] || continue
  COUNT=$((COUNT + 1))
  slug=$(basename "$d")
  f="$d/SKILL.md"

  if [ ! -f "$f" ]; then
    err "$slug has no SKILL.md"
    continue
  fi

  name=$(awk '/^name:/{sub(/^name:[[:space:]]*/,""); print; exit}' "$f")
  [ "$slug" = "$name" ] || err "$slug: frontmatter name is '$name', does not match the directory"

  grep -q '^description:'    "$f" || err "$slug: missing 'description' in frontmatter"
  grep -q '^when_to_use:'    "$f" || err "$slug: missing 'when_to_use' in frontmatter"
  grep -q '^## Start here'   "$f" || err "$slug: missing '## Start here'"
  grep -q '^## Evidence bar' "$f" || err "$slug: missing '## Evidence bar'"

  # description + when_to_use share a 1536-character budget, sent every turn
  n=$(awk '/^(description|when_to_use):/{sub(/^[a-z_]+:[[:space:]]*/,""); t+=length($0)} END{print t+0}' "$f")
  [ "$n" -le 1536 ] || err "$slug: description + when_to_use is $n chars, budget is 1536"

  # the two halves of the invocation switch must agree
  y="$d/agents/openai.yaml"
  md=$(grep -c '^disable-model-invocation: true' "$f" 2>/dev/null || true)
  yml=0
  [ -f "$y" ] && yml=$(grep -c 'allow_implicit_invocation: false' "$y" 2>/dev/null || true)
  [ "$md" = "$yml" ] || err "$slug: disable-model-invocation ($md) and allow_implicit_invocation ($yml) disagree — set both or neither"

  [ -f "$y" ] || err "$slug: missing agents/openai.yaml"

  # reference links must resolve
  for t in $(grep -oE '\]\([a-z0-9-]+\.md\)' "$f" | tr -d ']()'); do
    [ -f "$d/$t" ] || err "$slug: SKILL.md links to $t, which does not exist"
  done
done
[ "$COUNT" -gt 0 ] && pass "$COUNT skill directories checked"

head "Cross-references"

if grep -rqnE '\]\(\.\./[a-z-]+/' skills/ 2>/dev/null; then
  grep -rnE '\]\(\.\./[a-z-]+/' skills/
  err "skills must reference siblings by name in backticks, never by relative path — each directory ships on its own"
else
  pass "no cross-skill relative links"
fi

# every skill named in the ownership table exists, and vice versa
if [ -f AGENTS.md ]; then
  missing=0
  for d in skills/*/; do
    slug=$(basename "$d")
    grep -q "| \`$slug\` |" AGENTS.md || { err "$slug is not in the rule-ownership table in AGENTS.md"; missing=1; }
  done
  [ "$missing" = 0 ] && pass "every skill appears in the ownership table"
fi

head "Eval suite"

if [ -d evals ]; then
  cases=$(find evals -name prompt.md | wc -l | tr -d ' ')
  pass "$cases eval cases present"
  if command -v node >/dev/null 2>&1; then
    node scripts/check-evals.js >/dev/null 2>&1 \
      && pass "eval suite passes static validation" \
      || err "eval suite failed static validation — run: node scripts/check-evals.js"
  fi
else
  err "evals/ is missing"
fi

head "Result"
if [ "$FAIL" = 0 ]; then
  printf '  \033[32mAll structure checks passed.\033[0m\n\n'
else
  printf '  \033[31mStructure checks failed.\033[0m\n\n'
fi
exit "$FAIL"
