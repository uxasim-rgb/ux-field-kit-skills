# Contributing

Thanks for looking. This repository is documentation only — no build, no dependencies, no tests beyond the eval suite and the structure checks in CI.

Read [AGENTS.md](AGENTS.md) before changing anything under `skills/`. It holds the shape of a skill, the rule-ownership table, and the invocation rules. Most review comments on a PR would otherwise just be quoting it back.

## Before you open a PR

- [ ] The frontmatter `name` matches the directory name
- [ ] `description` and `when_to_use` are both present, and together are under 1,536 characters
- [ ] `## Start here` and `## Evidence bar` are present
- [ ] Sibling skills are referenced by name in backticks, never by relative path
- [ ] `version` in `.claude-plugin/plugin.json` is bumped in the same commit
- [ ] If the skill is user-invoked, **both** halves of the switch are set

Run `npm run validate` and it checks all of these for you. CI runs the same script, so local and CI cannot disagree.

```bash
npm run validate
```

## The version bump is not optional

`claude plugin update` compares `version` in `.claude-plugin/plugin.json` and nothing else. A change shipped without a bump reports "already at the latest version" and never reaches anyone who installed the plugin.

Patch for wording, minor for a new skill or a new section, major for anything that changes what an existing skill owns or removes a reference file.

## Adding a skill

Scaffold it, which writes the SKILL.md shell, the Codex config and the eval case:

```bash
npm run new-skill onboarding-design "Onboarding Design" "First-run flows and activation"
```

Then:

1. **Check it does not already have an owner.** The ownership table in AGENTS.md is the source of truth. A rule lives in exactly one skill; if your idea belongs inside an existing one, add it there.
2. **Pick a job-shaped name.** `usability-testing`, not `asim-testing` and not `testing-stuff`. The name is what a person types, so it should match what they would type.
3. **Write `SKILL.md` to the house shape** — opener, Works with, Start here, Role lens where roles differ, principles with headings that carry their point, Evidence bar, Before you ship, Reporting.
4. **Add it to the ownership table and the band table** in AGENTS.md, and to the map in README.md.
5. **Add `agents/openai.yaml`** with a display name and a short description.
6. **Add an eval case.** See below. A skill with no eval case has not been shown to trigger.

## Changing an existing skill

Keep rule ownership intact. If you find yourself explaining a contrast threshold inside `typography`, that rule belongs to `accessibility` — reference it by name instead of restating it. Restated rules drift.

If a change moves ownership from one skill to another, update the table in AGENTS.md in the same PR.

## Adding an eval case

Every skill has a case under `evals/<skill-name>/`. A case is a directory with `prompt.md` and a `graders/` directory. See [`evals/README.md`](evals/README.md) for the format and the grader types.

Write the prompt the way a person would actually type it. **Do not name the skill in the prompt** — the point is to test whether Claude chooses it from natural phrasing.

Check it is well-formed first — free, no API calls:

```bash
npm run check:evals
```

Then run it for real, if you have the CLI installed and want to spend the tokens:

```bash
npm run eval:case <your-case-name>
```

A single run is noisy. Confirm at the default three runs before you trust a result.

If two skills compete for the same kind of request, add a case under `evals/routing/` asserting the right one fires and the wrong one does not.

## What gets declined

- **A skill with one consumer.** If only your project needs it, keep it in your project.
- **A rule restated from another skill.** Reference it by name.
- **A reference file that repeats its principle at greater length.** A principle states the rule; a reference file carries the recipe. Neither restates the other.
- **A finding style that cannot name a consequence.** Every rule in this collection has to say what it costs a user. If it cannot, it is a preference and preferences are not shipped as rules.
- **Speculative variants and hypothetical states.** Same reason `design-systems` declines them: each one is permanent maintenance.

## Tone

Prescriptive and specific. Exact values, exact properties, exact thresholds — `44px` and `WCAG 2.5.8`, not "large enough". Numbers from a standard cite the standard; numbers that are a house default say so.

Write for an agent that will act on it immediately and a human who will read it once. Both are poorly served by throat-clearing.

## Reporting a problem

Open an issue with the skill name, the request that went wrong, and what you expected instead. A trigger failure — the wrong skill fired, or none did — is the most useful bug report this repository can get, because it usually means a `when_to_use` is wrong and that is a quick fix.

## Licence

MIT. By contributing you agree your contribution is licensed under it.
