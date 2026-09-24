---
name: field-guide
description: Routes a UX request to the right skill in this collection, across research, definition, structure, interface craft, inclusive design, build, validation and practice. Use first when a request spans disciplines or the right starting point is unclear.
when_to_use: Use when someone asks what skills are available, where to start, which method fits, or asks a broad question like "how do I improve this product", "we need to redesign X", "what should I do next" — and when a request names a role (researcher, product designer, design engineer) rather than a task.
---

# The field guide

This is the map. It routes a request to the skill that owns it and, where a request spans several, names the order to work through them.

It sits in the Route band with `full-review`. The difference: `full-review` judges an interface that already exists, this one decides what work to do in the first place.

**Works with:** `full-review` owns cross-discipline review · `review-the-change` owns change-scoped review · every other skill owns its own domain.

## Start here

| The situation | Go to |
| --- | --- |
| A broad request with no obvious owner | Run **Intake** below before anything else |
| Someone named a role, not a task | Jump to **Role lens** |
| Something exists and needs judging | `full-review` for a screen or flow, `review-the-change` for a diff, branch or PR |
| A decision is stuck between two options | `prioritization` if the axis is cost, `problem-framing` if nobody agrees what the problem is |
| Nobody knows whether it worked | `success-metrics` to define it, `experimentation-and-analytics` to measure it |
| The request is for an artifact | `design-docs`, `design-handoff`, `case-studies` or `prototyping` depending on the reader |

## Intake

Four questions, in order. The first one that produces a clear answer decides the band, and the rest are context.

**1. Is the problem known?** If the answer is a solution rather than a problem — "add a dashboard", "make it look more modern" — the request has skipped the Define band. Go to `problem-framing`. Building the named solution without this step is the single most common way a project produces something nobody uses.

**2. Is there evidence?** If the problem is asserted rather than observed, go to the Research band. `research-planning` picks the method. Where there is no budget or time for participants, `heuristic-evaluation` produces defensible findings without them, at the cost of certainty about which ones actually bite.

**3. Does the structure hold?** Before styling anything, the structure has to carry the content: `information-architecture` for what goes where, `user-flows` for how someone moves through it, `content-design` for what it says. A polish pass on a broken structure is wasted work and the polish gets blamed.

**4. Then craft, then inclusion, then build.** Craft is the last 20% and it is worth doing well, but it is genuinely last. `accessibility` is not last — it is read alongside every band, because retrofitting it costs several times what building with it costs.

## Role lens

| Role | Core path | Reach for |
| --- | --- | --- |
| UX researcher | `research-planning` → `user-interviews` or `usability-testing` or `surveys-and-measurement` → `research-synthesis` | `heuristic-evaluation` when there is no time to recruit; `experimentation-and-analytics` to pair qual with quant |
| Product designer | `problem-framing` → `audience-and-journeys` → `prioritization` → `success-metrics` → `user-flows` | `design-docs` to write it down; `stakeholder-communication` to get it approved |
| UX designer | `information-architecture` → `user-flows` → `forms-and-input` → `content-design` | `usability-testing` to check the structure holds |
| UI designer | `layout-and-composition` → `typography` → `color-and-theming` → `components-and-states` → `motion-and-interaction` → `icons-and-imagery` | `accessibility` throughout, not at the end |
| UX/UI designer | Both rows above; run `full-review` to check the seam between them | `design-systems` once the same decision is being made twice |
| Design engineer | `design-engineering` → `design-systems` → `design-handoff` → `review-the-change` | `prototyping` to answer a question faster than a spec can |
| Content designer | `content-design` → `global-and-inclusive` | `information-architecture` for labels, which are content decisions wearing structural clothes |
| Design ops | `design-ops` → `design-critique` → `research-synthesis` | `prioritization` for intake triage |
| Job hunting | `case-studies` → `stakeholder-communication` | `design-docs`, because a case study is a design doc with the tension left in |

## The bands, in order of work

Read this as the default sequence. Real projects loop, skip and re-enter, but a project that never visits a band should be able to say why.

**Research** — `research-planning` `user-interviews` `usability-testing` `surveys-and-measurement` `research-synthesis` `heuristic-evaluation`
Turns assumptions into observations. Skipping it does not remove the assumptions, it only removes the chance to find out which were wrong.

**Define** — `problem-framing` `audience-and-journeys` `prioritization` `success-metrics`
Turns observations into a decision about what to build and how you will know it worked.

**Structure** — `information-architecture` `user-flows` `forms-and-input` `content-design`
Turns the decision into an organization of content, paths and words. Most problems people describe as visual are structural.

**Craft** — `layout-and-composition` `typography` `color-and-theming` `components-and-states` `motion-and-interaction` `icons-and-imagery`
Turns the structure into a surface that feels considered.

**Inclusive** — `accessibility` `global-and-inclusive`
Runs alongside Structure, Craft and Build rather than after them.

**Build** — `design-systems` `design-handoff` `design-engineering` `prototyping`
Turns the design into something that exists and keeps existing.

**Validate** — `review-the-change` `design-critique` `experimentation-and-analytics`
Checks what was built against what was intended and what users do.

**Practice** — `design-docs` `stakeholder-communication` `design-ops` `case-studies`
The work around the work. Underweighted by individuals and the main constraint on teams.

## Route to the narrowest skill that fully covers the request

A request that lands cleanly in one skill goes to that skill, not here. Routing to `field-guide` first is correct when the request is broad or ambiguous, and wasteful when it is not: "what line-height for body copy" goes to `typography` directly.

Where several skills apply, name them in working order rather than invoking all of them. Three skills invoked at once produce three reports and no decision.

## Name the band that was skipped

When a request arrives mid-process — a polish pass on a feature with no research, a metrics dashboard for a goal nobody wrote down — do the work asked for, and say plainly which band was skipped and what that costs. Do not refuse the work and do not silently insert the missing phase.

The useful form is one sentence: what is missing, what could go wrong because of it, and the smallest thing that would close the gap. "There is no evidence anyone wants this view; a five-person `usability-testing` round on the current build would tell you before the rebuild does."

## Evidence bar

This skill routes. It does not judge, and it produces no findings of its own.

Recommend a band only when the request gives a reason to. A broad request is not automatic grounds for sending someone to Research: if they already have evidence, saying so is their answer, not an invitation to gather more. When the right answer is "the skill you already named is correct", say that and stop.

Never name more than three skills in one route. A map that lists everything is not a map.

## Before you finish

| Symptom | What it means | Fix |
| --- | --- | --- |
| The route names five or more skills | The request was not decomposed, it was reflected back | Pick the one that unblocks the others and name only it |
| The route sends every request to Research | Intake is being run as a ritual rather than a question | If evidence exists, skip to Define and say why |
| A craft skill was recommended for a structural complaint | "Looks cluttered" was read as a styling problem | Check `information-architecture` and `layout-and-composition` before `typography` or `color-and-theming` |
| `accessibility` appears only in the last step | It was treated as a band rather than a constant | Name it alongside whichever band is active |
| The person asked a specific question and got a map | Routing fired when the answer was one skill deep | Answer from the owning skill directly |

## Reporting

This skill outputs a route, not a review.

**Format:** one paragraph naming the band and why, then a numbered list of at most three skills in working order, each with a single clause saying what it will produce. Close with the skipped-band sentence where one applies.

**Done when:** the person can take the first step without asking a follow-up question about which skill to open.
