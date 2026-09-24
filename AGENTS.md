# AGENTS.md

Single source of guidance for agents working in this repository. `CLAUDE.md` imports it and adds nothing.

## What this repository is

Agent skills covering the whole UX practice, not only the styling end of it. It is documentation-only: no build, no lint, no tests. Distributed as the Claude Code plugin `ux-field-kit` and via `npx skills add uxasim-rgb/ux-field-kit-skills`.

`.claude-plugin/plugin.json` and `.claude-plugin/marketplace.json` define the plugin. Both live inside `.claude-plugin/`; every component directory, including `skills/`, lives at the repository root. Skills are discovered from `skills/` with no manifest entry, so adding one needs no manifest change — but `version` in `plugin.json` must be bumped in the same commit as any change under `skills/`, because `claude plugin update` compares that number and nothing else. A change shipped without a bump reports "already at the latest version" and never reaches anyone.

## Who it is for

Most interface skill collections assume the reader is already in a code editor styling a component. This one assumes the reader could be any of these, and says so in each skill:

| Role | Enters at |
| --- | --- |
| UX researcher | `research-planning`, `user-interviews`, `usability-testing`, `surveys-and-measurement`, `research-synthesis` |
| Product designer | `problem-framing`, `prioritization`, `success-metrics`, `user-flows`, `design-docs` |
| UX designer | `information-architecture`, `user-flows`, `forms-and-input`, `content-design` |
| UI designer | `layout-and-composition`, `typography`, `color-and-theming`, `components-and-states`, `icons-and-imagery` |
| UX/UI designer | the `field-guide` router, which spans both bands |
| Design engineer | `design-engineering`, `design-systems`, `design-handoff`, `prototyping`, `review-the-change` |
| Content designer | `content-design`, `global-and-inclusive` |
| Design ops | `design-ops`, `design-critique`, `research-synthesis` |
| Anyone job-hunting | `case-studies`, `stakeholder-communication` |

A skill that serves more than one of these carries a `## Role lens` section saying what each takes from it. That section is the reason this collection can be one folder instead of five.

## Bands

Skills are grouped by the phase of work they belong to, not by the CSS property they touch. The band is not in the skill name — names stay job-shaped so they match what a person types — but every skill states its band in the opener.

| Band | Skills |
| --- | --- |
| Route | `field-guide`, `full-review` |
| Research | `research-planning`, `user-interviews`, `usability-testing`, `surveys-and-measurement`, `research-synthesis`, `heuristic-evaluation` |
| Define | `problem-framing`, `audience-and-journeys`, `prioritization`, `success-metrics` |
| Structure | `information-architecture`, `user-flows`, `forms-and-input`, `content-design` |
| Craft | `layout-and-composition`, `typography`, `color-and-theming`, `components-and-states`, `motion-and-interaction`, `icons-and-imagery` |
| Inclusive | `accessibility`, `global-and-inclusive` |
| Build | `design-systems`, `design-handoff`, `design-engineering`, `prototyping` |
| Validate | `review-the-change`, `design-critique`, `experimentation-and-analytics` |
| Practice | `design-docs`, `stakeholder-communication`, `design-ops`, `case-studies` |

## The shape of a skill

Every `SKILL.md` carries these sections in this order. The order is fixed; which optional sections appear depends on the skill.

### Frontmatter

```yaml
---
name: <matches the directory, lowercase, hyphens>
description: <one sentence, the primary use case first>
when_to_use: <trigger phrases and keywords a person would actually type>
---
```

`description` and `when_to_use` share a 1,536-character budget and are sent on every turn, so both stay tight. Keep the split honest: `description` says what the skill does, `when_to_use` says what a request looks like when this skill is the answer. Do not restate one inside the other. Trigger phrases belong in `when_to_use` only — a description stuffed with keywords reads as spam to a human browsing the list and buys nothing in retrieval that `when_to_use` does not already buy.

User-invoked skills add `disable-model-invocation: true`. See **Invocation** below.

### Opener

A plain-language H1, then two or three sentences: what the skill does, which band it sits in, and the one idea that governs it. Not why the domain matters. An agent does not need persuading and a reader can tell the difference.

### Works with

One line naming the sibling skills that own adjacent territory, by skill name in backticks. Never a relative link across skill directories, because each directory ships on its own and the link would dangle.

### Start here

**This section is mandatory and is the thing that makes a 35-skill collection usable.** A two-column table: the situation a person is actually in, and where to go. Most people land in the wrong skill, because the name they typed matched a word rather than their problem. `Start here` catches them and redirects before they read a rule that does not apply.

It routes inside the skill as often as outside it. `usability-testing` routes "I have five minutes and no participants" to `heuristic-evaluation`, and "I already ran the sessions" to `research-synthesis`.

### Role lens

Only where the skill genuinely serves several roles differently. Two or three rows: role, and the one thing that role takes from this skill. Skip it where the answer is the same for everyone.

### Principles

Sentence-case headings that carry their own point. `Recruit for the behavior, not the demographic`, never `Recruiting`. A heading that names only the topic makes the reader read the paragraph to find out whether it applies.

Number them only where the steps genuinely run in order, as `full-review`, `review-the-change` and `research-synthesis` do. Numbering flat reference implies a sequence that is not there and turns every insertion into a renumber. Reference a principle by its heading in bold, never by its number.

### Evidence bar

Every skill carries one. It says how hard to press in this domain: what is exact versus approximate, what counts as a finding versus a preference, and when the correct output is nothing at all.

A skill that lists rules without saying how hard to press leaves that to chance, and the difference between a review that blocks on measured evidence and one that blocks on taste is decided here. In quantitative domains it names what must be computed rather than estimated. In qualitative domains it names how many observations make a pattern.

### Before you ship

A three-column table where the domain has recurring failures:

| Symptom | What it means | Fix |

The left column is a detection pattern, not a rule restated as a mistake. A principle tells you what to do; this table tells you how to notice you did not. The heading names the moment it is worth consulting — `Common mistakes` is a label a reader skims past while orienting.

### Reporting

Every skill that can produce a review carries its own severity ladder, its verification checks and a standalone output format. Research and practice skills carry a deliverable format instead: what the artifact contains and what makes it done.

`full-review` holds the orchestrated cross-discipline format in `how-to-report.md`. `review-the-change` holds the change-scoped format. Domain skills hold the smaller standalone format, grouped by the principle each finding violates.

Those three overlap on purpose. Someone who installs only `typography` has no `full-review` on disk to read a format out of, and a skill that works only when its siblings are present is a skill that fails silently.

## Reference files

Supporting `.md` files carry depth past the principle statements: procedures, code, lookup tables, worked examples, templates. Link each one from the principle that needs it, so the link sits where the reader lands.

A principle states the rule and links out for the recipe. It never restates the reference file in shorter form, and the reference file never restates the principle in longer form. Add one only when the depth genuinely exceeds what a principle can hold — a skill with six thin reference files is one skill wearing a costume.

## Rule ownership

Each rule lives in exactly one skill. Others point to it by name in backticks.

| Skill | Owns |
| --- | --- |
| `field-guide` | The map, role entry points, routing between bands, and the intake questions that decide which band a request belongs to |
| `full-review` | Cross-discipline orchestration, shared severity and escalation triggers, consolidation, coverage, the finding cap, the orchestrated format and the verdict |
| `review-the-change` | Target resolution, surface expansion from changed files, the before-and-after read, and defect origin labelling (New / Reintroduced / Inherited) |
| `research-planning` | Method selection, research questions, sampling and recruiting, consent and research ethics |
| `user-interviews` | Guide structure, moderation, probing, interviewer bias |
| `usability-testing` | Task design, moderated and unmoderated protocol, think-aloud, severity rating of usability problems |
| `surveys-and-measurement` | Question and scale design, sample size, standardized instruments (SUS, UMUX-Lite, SEQ, NPS) and their analysis |
| `research-synthesis` | Coding, affinity work, theme construction, insight statements, evidence strength, the research repository |
| `heuristic-evaluation` | Expert inspection, heuristic sets, competitive teardown, benchmarking |
| `problem-framing` | Jobs to be done, assumption mapping, opportunity framing, problem statements |
| `audience-and-journeys` | Segments, evidence-based personas, journey maps, service blueprints |
| `prioritization` | Scoring models, effort and impact, scope cutting, declining work |
| `success-metrics` | Metric selection, HEART, north star and guardrails, instrumentation requests |
| `information-architecture` | Taxonomy, labeling, navigation models, card sorting, tree testing, search versus browse |
| `user-flows` | Entry points, happy path, edge and error and recovery paths, state coverage |
| `forms-and-input` | Field design, input types, validation timing, error recovery, multi-step and autofill |
| `content-design` | Voice and tone, microcopy, labels, error wording, empty states, readability |
| `layout-and-composition` | Grouping, alignment, spacing scale, density, responsive structure, reading order |
| `typography` | Type scale, measure, line-height, wrapping, truncation, variable fonts, OpenType |
| `color-and-theming` | Color space and notation, ramps, semantic tokens, theming, gamut, contrast computation |
| `components-and-states` | Component anatomy, variants, the full state set, loading and empty and error surfaces |
| `motion-and-interaction` | Easing, duration, enter and exit, gesture, interruption, reduced motion |
| `icons-and-imagery` | Icon grid and optical sizing, icon semantics, image treatment and performance |
| `accessibility` | Keyboard, focus, ARIA, screen readers, hit areas, contrast requirements, zoom, motion sensitivity |
| `global-and-inclusive` | Internationalization, localization, RTL, names and dates and addresses, cognitive load, low-bandwidth |
| `design-systems` | Token architecture, naming, component API, versioning, governance, contribution and deprecation |
| `design-handoff` | Spec content, redlines, acceptance criteria, what engineering actually needs |
| `design-engineering` | Implementing design in code, CSS architecture, performance budgets, browser reality |
| `prototyping` | Fidelity selection, what to prototype, throwaway versus production, prototype hygiene |
| `design-critique` | Running and receiving critique, feedback framing, decision capture |
| `experimentation-and-analytics` | Test design, what not to test, power and duration, funnels and cohorts, replay ethics |
| `design-docs` | The design document, decision records, writing for asynchronous readers |
| `stakeholder-communication` | Presenting work, framing per audience, handling pushback, negotiating scope |
| `design-ops` | File and naming hygiene, rituals, intake, the operating cadence of a design team |
| `case-studies` | Portfolio structure, evidence selection, what reviewers look for |

## Invocation

A user-invoked skill may invoke model-invoked skills but can never reach another user-invoked skill. That rule decides the setting; it is not a preference.

- `review-the-change`, `design-critique`, `prototyping` and `case-studies` carry `disable-model-invocation: true`. Each writes a substantial artifact or passes judgement on work in progress, and an agent firing one unprompted produces work nobody asked for.
- Every other skill is model-invoked, because something has to reach it. `field-guide` routes to every band and `full-review` routes across disciplines, and neither can reach a skill that has opted out of model invocation.
- `full-review` therefore cannot start `review-the-change`. Where it would want to, it asks the person to run it.

## Evals

Skill collections fail quietly. A skill that never triggers looks identical to one that works until someone notices they have been getting generic answers for a month. With 35 skills the risk is not that one fails to fire — it is that two compete and the wrong one wins.

The suite lives in `evals/` and runs with `claude plugin eval .` from the repository root. Each case runs three times with the plugin loaded and three times without, reporting `WITH`, `W/OUT` and the difference `Δ`. A high `WITH` score with a `Δ` near zero means Claude would have answered as well without the plugin, which means the skill is not contributing.

| Directory | Cases | Checks |
| --- | --- | --- |
| `evals/<skill-name>/` | 35 | The skill fires on natural phrasing, and the answer is the right kind of answer |
| `evals/routing/` | 8 | Neighbouring skills do not steal each other's requests |
| `evals/negative/` | 3 | Unrelated requests invoke nothing |

Every skill has a case. A skill with no case has not been shown to trigger, and adding one is part of adding a skill.

`skill-fired` graders carry `arm: with-only`, because a skill cannot fire in the no-plugin arm and scoring it there would drag every `Δ` downward for no reason. Rubric graders are scored in both arms so the `Δ` measures something real.

The most common finding is a `tool_used: Skill` grader failing on natural phrasing. The fix is nearly always `when_to_use` rather than the skill body — the body is not read until the skill has already been chosen.

## CI

`.github/workflows/validate.yml` runs on push and pull request. The structure job needs no secrets and checks:

- Manifests are valid JSON and live in `.claude-plugin/`, not the repository root.
- Every skill directory has a `SKILL.md`, and its frontmatter `name` matches the directory.
- `description`, `when_to_use`, `## Start here` and `## Evidence bar` are present.
- `description` plus `when_to_use` fits the 1,536-character budget.
- `disable-model-invocation` and `allow_implicit_invocation` agree — both set or neither. They are the Claude Code and Codex halves of one switch, and a skill with only one set behaves differently per harness.
- No cross-skill relative links.
- `plugin.json` was touched whenever `skills/` changed.

The eval job runs only on pull requests and only when `ANTHROPIC_API_KEY` is present in repository secrets. Without the secret it skips cleanly rather than failing, so a fork can still run the structure checks.

## Other harnesses

`opencode.json` registers `skills/` so opencode loads the collection while this repository is open. That is for working on the skills; opencode users install through the skills CLI, which exposes each skill as a slash command on its own, so this repository carries no command wrappers.

Each skill carries `agents/openai.yaml` with a display name and short description for Codex, plus `policy.allow_implicit_invocation: false` on the four user-invoked skills.

## Authoring conventions

- Principles are prescriptive and specific. Exact values, exact properties, exact thresholds. `44px` and `WCAG 2.5.8`, not "large enough".
- Numbers that come from a standard cite the standard. Numbers that are a house default say so, and say what they are a default for.
- Match the project's existing system rather than importing this one. Where a project has a spacing scale, a token set or a component library, the rules here are read against it, not over it.
- A skill's name appears in three places: the directory, the frontmatter `name`, and this file's ownership table. Renaming means changing all three.
- Write for an agent that will act on this immediately and a human who will read it once. Both are poorly served by throat-clearing.
