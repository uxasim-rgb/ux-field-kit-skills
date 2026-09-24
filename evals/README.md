# Eval suite

Run from the repository root:

```bash
claude plugin eval .
```

Each case runs three times with the plugin loaded and three times without, and reports
`WITH`, `W/OUT` and the difference `Δ` — what the plugin contributed.

## Layout

| Directory | Cases | What it checks |
| --- | --- | --- |
| `evals/<skill-name>/` | 35 | Each skill fires on natural phrasing, and produces the right kind of answer |
| `evals/routing/` | 8 | Neighbouring skills do not steal each other's requests |
| `evals/negative/` | 3 | Unrelated requests do not invoke a skill at all |

## Graders

- `skill-fired.md` — `tool_used: Skill`, scoped to that skill's name. Marked `arm: with-only`,
  since the skill cannot fire in the no-plugin arm.
- `routes-to-owner.md` / `avoids-neighbour.md` — the routing pair. The second uses
  `min: 0, max: 0` to assert the neighbour was **not** invoked. Weighted 2:1 toward the owner.
- `no-skill-fires.md` — negative cases. Asserts no skill ran.
- `criteria.md` — an `llm` rubric on the answer itself, scored in both arms so `Δ` is meaningful.

## Reading a failure

A `Δ` near zero with `skill-fired` failing means Claude is not choosing the skill on natural
phrasing. Fix the skill's `description` and `when_to_use`, then re-run and compare.

A routing case where `avoids-neighbour` fails means two skills compete for the same request.
Tighten the `when_to_use` of both — the one that should win and the one that should not.

## Iterating on one case

```bash
claude plugin eval . --case usability-testing --runs 1 --ablation none
```

A single run is noisy. Confirm any change at the default three runs before trusting it.

## Static validation (free, no API calls)

Before spending anything on a run, check the suite is well-formed:

```bash
node scripts/check-evals.js
```

It verifies that every frontmatter block parses, that each `input_match` regex matches a real
Skill-call payload in both bare (`{"skill":"typography"}`) and namespaced
(`{"skill":"ux-field-kit:typography"}`) form without cross-matching another skill, that every
skill has a case, that no prompt contains its own skill name, and that each routing case names
two distinct real skills.

This catches the failure that would otherwise waste a full paid run: a grader regex that never
matches, which makes every `skill-fired` check fail for reasons that have nothing to do with
the skills.

## Cost

At roughly $0.41 per case for the default 3 runs across both arms, the full suite is about
**$19–25**. Bound it:

```bash
claude plugin eval . --trust-plugin --max-cost-usd 30 --no-publish
```

To check the plumbing for about a dollar first:

```bash
claude plugin eval . --case usability-testing --runs 1 --ablation none
```
