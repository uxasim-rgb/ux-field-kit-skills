---
name: case-studies
description: Structures portfolio case studies around the decisions you made and what they cost, rather than around process stages, and selects evidence a reviewer can verify. Use when writing up work for a portfolio or an interview.
when_to_use: Use when writing a portfolio case study, preparing work for a design interview or presentation, choosing which projects to show, deciding what to include when results were poor or the project was killed, or when a portfolio is getting no responses.
disable-model-invocation: true
---

# Case studies

This skill turns finished work into something a reviewer can evaluate. It closes the Practice band and is user-invoked, because writing up someone's work unprompted is not a thing to do on their behalf.

The governing idea: a case study is assessed on your judgement, not on your process. Reviewers are looking for evidence that you make good decisions under constraint, and a process narrative actively hides that.

**Works with:** `design-docs` is the internal version of this document · `stakeholder-communication` owns presenting it live · `problem-framing` supplies the problem · `success-metrics` supplies the outcome · `research-synthesis` supplies the evidence.

## Start here

| The situation | Go to |
| --- | --- |
| Writing a case study | **Structure around decisions** below |
| Choosing which projects to show | **Three projects, chosen for range** below |
| The project failed or was killed | **Write the failures** below — they are usually the strongest |
| You were one of twenty people on it | **Say exactly what you did** below |
| The work is under NDA | **Constraints are not an excuse to be vague** below |
| Nobody is responding to the portfolio | **What reviewers actually do** below |
| Preparing to present it live | `stakeholder-communication` |

## What reviewers actually do

A reviewer spends between thirty seconds and two minutes deciding whether to read further. In that time they are answering: what did this person work on, what did they decide, and is there any evidence it worked.

This has consequences for structure that most portfolios ignore:

- **The outcome goes near the top**, not at the end after the process.
- **The first screen carries the summary**: the problem, your role, what you decided, the result.
- **Depth goes below**, for the minority who continue.

A case study built as a chronological journey — discovery, personas, wireframes, final designs — puts everything a reviewer wants in the last 20% of the page, and most never reach it.

## Structure around decisions

Process stages are the same in every portfolio and communicate nothing about you. Decisions are specific to your project and are the only thing that distinguishes your judgement from anyone else's.

Two or three decisions, each with:

- **The decision.** What you chose.
- **The alternatives.** What else was on the table, named specifically.
- **The reasoning.** The constraint, the evidence, the tradeoff.
- **The cost.** What you gave up. This is the part almost nobody writes and the part that most demonstrates seniority.
- **What happened.** Whether it worked.

> **We split the review into two steps rather than one screen.**
> The alternative was a single long form, which tested faster in the prototype. We split it because the pricing API cannot quote until the address is known, and a single screen meant either a visible mid-form reload or a stale total. The cost is an extra step for the 30% of users who already have an address saved — we accepted that and added a skip path later when usage data showed it was more than 30%.

That paragraph tells a reviewer more than fifteen screens of process. It shows a constraint being handled, a tradeoff being named, and a decision being revised on evidence.

## Say exactly what you did

Most product work is collaborative, and claiming a team's output is the fastest way to fail an interview — the follow-up questions find it immediately.

Be specific and unembarrassed: "I owned the flow structure and the form design. The visual system was our design system, which I contributed two components to. Research was run by our researcher; I wrote the tasks and observed all five sessions."

Credit others. It reads as confidence rather than as diminishment, and a reviewer who has worked on a real team recognizes the honesty.

Work you contributed to in a small way can still be shown, as long as the contribution is stated accurately. Work you cannot describe your own decisions in should not be shown at all.

## Write the failures

A portfolio where everything succeeded is not credible to anyone who has shipped software. Real projects get cut, deprioritized, launched to no effect, or reversed.

What a reviewer wants from a failure is what you learned and whether you can diagnose honestly:

> Completion went from 38% to 44% — short of the 55% we had committed to as the success threshold. The navigation change worked; first-click accuracy rose from 31% to 74%. The remaining drop-off was in the review step itself, which we had not touched. In hindsight the framing was wrong: I treated a findability problem as the whole problem, when findability was only the first of two barriers.

That is a stronger section than a success, because it demonstrates measurement, honesty and diagnosis — three things a success story usually cannot show.

A killed project is also fine, if you say why and what you took from it.

## Show evidence, not artifacts

Wireframes, personas and journey maps are process artifacts. They prove you know the vocabulary, which is not in question for anyone you want to work with.

Show instead:

- **Before and after**, side by side, at readable size.
- **Numbers with their limits** — "completion rose from 38% to 44% over two quarters" with the caveat, not "improved usability".
- **A research finding that changed your direction**, with the count. This is the highest-value single item you can include.
- **A constraint you designed around**, named concretely.
- **Something you got wrong** and how you found out.

Where you have no numbers — common, and fine — say what you do have. "No post-launch instrumentation existed, so I cannot show the effect. What I can show is that the five usability sessions before and after went from 1 of 5 completing to 5 of 5." A stated limit is credible; a vague claim of success is not.

Never invent metrics. Reviewers ask how a number was measured, and an invented one collapses under one question along with everything else in the portfolio.

## Constraints are not an excuse to be vague

NDA, unshipped work and confidential data are all workable.

- **Genericize the domain.** "A B2B logistics platform" instead of the client name.
- **Change the numbers, and say you changed them.** "Figures are directionally accurate but altered."
- **Redact the interface**, not the reasoning. Blur data, keep the structure.
- **Show the thinking** — flows, decisions, tradeoffs — which is what is being assessed anyway.

What does not work is a vague case study that says nothing and blames confidentiality. Reviewers read that as having nothing to say.

## Three projects, chosen for range

Three well-written case studies beat eight thin ones. A reviewer will read one, maybe two.

Choose for range rather than for polish: one showing depth in a complex problem, one showing a different kind of work — research-led, systems, zero-to-one — and one showing collaboration or constraint. One should include something that did not work.

Lead with the one closest to the role you want.

Keep the rest as a list of thumbnails with one line each. They demonstrate volume without demanding reading time.

## Evidence bar

Every number carries its source and its limits. "Increased conversion by 40%" invites the question of how it was measured, over what period, and whether anything else changed. If you cannot answer, do not include it.

Qualitative counts, never percentages. "4 of 5 participants" — the same rule `research-synthesis` applies internally. A reviewer with research experience will notice a percentage from a five-person study, and it discredits the rest.

Attribute honestly. Being unable to say precisely what you did is the single most common failure in portfolio interviews.

Where you cannot show results, say so and show the decision quality instead. Design judgement is what is being hired, and it is demonstrable without outcomes — the decision, the alternatives, and the cost you accepted.

## Before you ship

| Symptom | What it means | Fix |
| --- | --- | --- |
| The structure is discovery → personas → wireframes → final | Same as every other portfolio; says nothing about you | Structure around two or three decisions |
| The outcome is at the bottom | Most readers never reach it | Summary on the first screen |
| No alternatives mentioned | Reads as though there were no decisions | Name what lost and why |
| No cost stated for any decision | The hardest thing to demonstrate is missing | Say what you gave up |
| "We" throughout | Contribution is unclear; interview will expose it | State exactly what you owned |
| Everything succeeded | Not credible to anyone who has shipped | Include one that did not |
| A percentage from five participants | Discredits the rest for a research-literate reader | Counts |
| "Increased conversion by 40%" with no method | Collapses under one question | Source, period, caveat — or cut it |
| Personas and journey maps as the main artifacts | Proves vocabulary, not judgement | Before/after, findings, constraints |
| Vague because of an NDA | Reads as having nothing to say | Genericize and redact; keep the reasoning |
| Eight case studies | None will be read properly | Three, chosen for range |
| No stated limits on any claim | Reads as overselling | State what you cannot show |

## Reporting

**The deliverable is the case study.** Structure:

1. **Summary, on the first screen** — one line on the problem, your role, the decision that mattered most, and the outcome with its limit.
2. **Context** — product, users, your role stated precisely, team composition, timeframe, constraints.
3. **The problem** — from `problem-framing`, with the evidence it rested on and its status.
4. **Decisions** — two or three, each with alternatives, reasoning, cost and what happened.
5. **Evidence** — before and after, a finding that changed direction with its count, numbers with their limits.
6. **Outcome** — the result against what was committed to, honestly, including shortfalls.
7. **What I would do differently** — specific and diagnostic, not a modesty formula.
8. **Credits** — who did what.

**Done when:** a reviewer can name your decisions and their costs after two minutes, every number could survive being asked how it was measured, and at least one section describes something that did not work.
