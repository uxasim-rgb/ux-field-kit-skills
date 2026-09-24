---
name: heuristic-evaluation
description: Inspects an interface against a named heuristic set and produces rated issues without recruiting participants. Use when there is no time or budget for a study, and for competitive teardowns and benchmarking.
when_to_use: Use when doing an expert review or design audit, applying Nielsen's heuristics, evaluating a competitor's product, benchmarking against other tools, or when someone needs findings before the end of the week and there are no participants available.
---

# Heuristic evaluation

This skill inspects an interface against known principles and returns a rated issue list, with no participants involved. It sits in the Research band as the method of last resort and of first speed.

The governing idea: it produces hypotheses about what will hurt users, not evidence that it does. That distinction is the whole discipline, and collapsing it is how expert review acquires its bad reputation.

**Works with:** `research-planning` owns whether this is the right method · `usability-testing` validates what this finds · `full-review` runs the cross-discipline craft review that overlaps with this · `research-synthesis` combines these findings with study data.

## Start here

| The situation | Go to |
| --- | --- |
| You need the heuristic sets | [Heuristic sets](heuristic-sets.md) |
| You are evaluating your own product's craft in detail | `full-review` — it routes to every domain skill |
| You are evaluating a competitor | **Competitive teardown** below |
| You have participants and time | `usability-testing` — stronger evidence, use it |
| You need a number to track over time | `surveys-and-measurement`, SUS or UMUX-Lite |
| You found issues and need them ranked | **Rate by consequence** below, then `prioritization` |

## Role lens

| Role | Takes from this skill |
| --- | --- |
| UX researcher | A defensible fast method when recruiting is blocked, and its honest limits |
| Product designer | A structured audit to run before committing to a redesign |
| Design engineer | The pass that catches state, error and edge-case gaps before they reach QA |

## Use several evaluators or state that you did not

A single evaluator finds a fraction of the issues present, and which fraction depends heavily on their background. Three to five evaluators working independently find substantially more, with sharply diminishing returns past five.

The procedure: each evaluates alone, against the same heuristic set and the same task list, and writes findings before anyone compares. Then merge, deduplicate, and rate together. Comparing before writing produces the first speaker's list with three names on it.

Where only one evaluator is available — the common case — say so in the report. A single-evaluator review is legitimate and it is weaker, and the reader deserves to know which they are holding.

## Walk tasks, not screens

Screen-by-screen inspection finds cosmetic issues and misses flow failures, which are the expensive ones. Walk the same realistic tasks a usability test would use, then inspect the screens encountered on the way.

Take the task list from `usability-testing` conventions: goals with a reason, not instructions. Then do two passes. The first goes through each task at speed, getting a feel for the flow. The second goes slowly, inspecting against the heuristics.

Cover the unhappy path deliberately — empty states, errors, permission denials, the longest realistic input, the slowest connection. Expert review is unusually good at these because you can force them, where a usability test has to wait for them to happen.

## Name the heuristic, or it is an opinion

Every finding cites the specific heuristic it violates. A finding without one is a preference, and it will be treated as such by the first person who disagrees.

The sets are in [heuristic sets](heuristic-sets.md): Nielsen's ten for general interface work, plus narrower sets for forms, data-heavy interfaces and mobile. Pick one set and use it throughout. Mixing sets mid-review produces an issue list with no consistent basis.

Where a problem is real but no heuristic covers it, hand it to the domain skill that owns it — `content-design`, `accessibility`, `information-architecture`, `components-and-states` — and cite that instead. Inventing a heuristic to justify a preference is the failure mode this rule exists to prevent.

## Rate by consequence, and mark the confidence separately

Use the same severity model as `usability-testing` — impact, frequency, persistence — so that findings from both methods can sit in one backlog.

Add one column that usability findings do not need: **confidence**. It is the honest part of an expert review.

| Confidence | Means |
| --- | --- |
| High | A standards violation or a definite failure: unreachable by keyboard, contrast below threshold, a dead end with no recovery. Observable without users. |
| Medium | A clear heuristic violation whose impact is inferred. Likely to hurt, unverified. |
| Low | A judgement call, or a pattern that may be fine for this audience. |

Anything rated Critical at Low confidence is a candidate for a five-person test rather than an immediate fix. That sentence is what makes the method useful rather than expensive: it converts the weakest findings into a cheap research question instead of a rebuild.

## Competitive teardown

Same method, different subject, and two additional rules.

**Evaluate against the user's goal, not against your product's feature list.** A teardown that lists what a competitor has and you do not is a feature inventory and it will produce a roadmap of catching up. The useful question is which of their decisions serve the user better and why.

**Separate what you can see from what you can infer.** You do not know their constraints, their data, their test results, or whether the pattern you admire is performing. A competitor's design is evidence of what they decided, not of what worked.

Structure the teardown by task: for each task, how they handle it, how you handle it, and what the difference costs the user. End with the two or three decisions worth stealing and the reason — never a list of features.

## Benchmarking over time

To make a review comparable across rounds, hold constant: the heuristic set, the task list, the evaluator count, and the severity model. Then report issue counts by severity per round.

This produces a crude but real trend line, and it is substantially better than nothing for teams with no research budget. State clearly that it measures heuristic conformance, not user success — those diverge, and a team that forgets it will optimize toward the audit.

## Evidence bar

A heuristic finding is a hypothesis. Write it as one. "This is likely to cause users to miss the save action" is honest; "users cannot find save" claims an observation you did not make.

Never report expert findings in the same list as study findings without marking which is which. They have different evidence weight, and merging them silently upgrades the weaker ones — which is the single most common way expert review misleads a team.

Some findings are not hypotheses but facts, and should be stated flatly: a contrast ratio below 4.5:1, a control unreachable by keyboard, a form field with no label. These are measurable and either true or false. `accessibility` owns them, and they should be measured rather than eyeballed.

Where the interface is genuinely fine in an area, say so. An audit that finds forty issues and no strengths reads as an attack on the person who built it, and it will be received that way regardless of accuracy.

Cap the list. Beyond roughly twenty issues nobody acts on any of them; report the top twenty by severity and put the rest in an appendix.

## Before you ship

| Symptom | What it means | Fix |
| --- | --- | --- |
| A finding cites no heuristic | It is a preference | Cite one, hand it to a domain skill, or cut it |
| Findings are written as observed facts | Hypotheses are being presented as evidence | Rewrite as "likely to"; reserve flat statements for measurable violations |
| Evaluators discussed before writing | One person's list now has three names on it | Write independently, merge after |
| Only screens were inspected | Flow failures are invisible | Walk tasks; force the unhappy path |
| Expert and study findings are in one unmarked list | The weak ones just got promoted | Mark the source on every row |
| A contrast or keyboard issue was eyeballed | These are measurable | Measure them; `accessibility` owns the thresholds |
| The teardown is a feature comparison | It will produce a catch-up roadmap | Restructure by user task and cost |
| 60 issues reported | None will be fixed | Top 20 by severity; rest in an appendix |
| No confidence rating | The reader cannot tell which to test and which to fix | Add the column |

## Reporting

**The deliverable is a rated hypothesis list**, marked as expert findings throughout.

**Verification before reporting:** every finding cites a heuristic or an owning skill; every finding has severity and confidence; measurable violations were measured; the evaluator count and heuristic set are stated; strengths are included.

**Format:**

1. **Scope** — what was evaluated, which build, which tasks, which heuristic set, how many evaluators. State plainly that these are expert findings, not user evidence.
2. **Summary** — issue counts by severity, and the three that matter most.
3. **Findings**, severity order. Each with: severity, confidence, the heuristic violated, where it occurs, what the user is likely to experience, the consequence, and the owning skill for the fix.
4. **Test these** — the Critical and Serious findings at Low or Medium confidence, framed as research questions for a five-person study. This is the most valuable section and it is usually missing.
5. **Strengths** — what works and should not be broken.
6. **Limits** — evaluator count, areas not covered, and the standing caveat that this method predicts rather than observes.

**Done when:** each finding names its heuristic, the reader can tell hypotheses from measurements, and the "test these" list gives a researcher a study they could run on Monday.
