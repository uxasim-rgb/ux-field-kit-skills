---
name: design-ops
description: Sets up the operating layer of a design team — intake, file and naming hygiene, rituals, the research and decision repositories — so the work does not depend on individual memory. Use when the team is the bottleneck.
when_to_use: Use when setting up design team process, handling work intake and triage, organizing files and naming conventions, establishing critique or review rituals, building a research or decision repository, onboarding designers, or when the team keeps redoing work it has already done.
---

# Design ops

This skill covers the operating layer that lets a design team work at more than one person's pace. It sits in the Practice band.

The governing idea: most design team problems that look like capacity problems are actually retrieval problems. The work was done; nobody can find it.

**Works with:** `research-synthesis` owns the research repository's contents · `design-docs` owns decision records · `design-systems` owns the component library's governance · `design-critique` owns the critique session itself · `prioritization` owns the ranking that intake feeds.

## Start here

| The situation | Go to |
| --- | --- |
| Requests arrive from everywhere | **Give intake one door** below |
| The team redoes work it has done | **Repositories are the highest-return investment** below |
| Files cannot be found | **Name for the person who did not make it** below |
| Meetings are not producing anything | **Rituals need an output** below |
| New designers take months to be useful | **Onboarding is a process problem** below |
| Ranking the intake | `prioritization` |
| The component library's governance | `design-systems` |

## Give intake one door

Requests arriving through direct messages, hallway conversations, meeting asides and tickets cannot be ranked, because nobody can see them all at once. The result is that the loudest request wins and the team feels permanently behind.

One door, whatever it is. A form, a ticket queue, a channel — the mechanism matters far less than the exclusivity.

The intake form asks four things and no more:

1. **What problem are you trying to solve?** Not what you want built — `problem-framing` explains why this is the question.
2. **Who has this problem, and how do you know?**
3. **What happens if we do nothing?**
4. **When do you need it, and what drives that date?**

Four questions filter more than any triage meeting. A meaningful share of requests are withdrawn or reframed at question one, and the ones that come through arrive already useful.

Then triage on a fixed cadence — weekly is usually right — with a visible outcome for every request: accepted with a rough slot, declined with a reason, or needs-more-information. A request that disappears comes back through a more senior route, and the person who submitted it stops using the door.

Make the queue visible. A requester who can see they are 14th complains less than one who has heard nothing, and visibility does more for the team's reputation than throughput does.

## Repositories are the highest-return investment

Three, and they compound:

**Research.** One entry per study: question, method, dates, segments and counts, rated findings, link to raw material with access controls intact. Tagged by product area and question type, never by project name. `research-synthesis` owns the contents and the contradiction log.

**Decisions.** One record per significant choice: what, when, who, alternatives, consequences, revisit condition. `design-docs` owns the format.

**Components and patterns.** What exists, when to use it, what it deliberately does not do. `design-systems` owns it.

The test for all three is retrieval, not storage. Someone who joined last month should be able to answer "have we researched this?" and "why is it like this?" in under five minutes. If they cannot, the repository exists in the sense that a filing cabinet exists.

Two habits that keep them alive: **search before starting** — a required step before any new study or design doc, with the result recorded — and a **quarterly staleness pass** marking superseded findings and decisions rather than deleting them.

## Name for the person who did not make it

File and project naming is unglamorous and it is most of the retrieval problem.

- **A consistent scheme**, applied everywhere: `area-thing-stage-date` or similar. Any scheme beats no scheme; inconsistency is the actual cost.
- **Dates as `YYYY-MM-DD`**, so they sort correctly.
- **No personal shorthand.** `final-v3-REAL-final` is a real cost, paid by whoever inherits it.
- **Product area, not project codename.** Codenames are meaningless within a year, and they are the single most common reason old work is unfindable.
- **One canonical location per artifact**, with links to it rather than copies of it. Copies drift, and then nobody knows which is current.
- **Archive rather than delete**, with a visible archive so people know where things went.

Write the convention down in one short page and put it where files are made. A convention that lives in people's heads is one convention per person.

## Rituals need an output

A recurring meeting with no artifact is a status update with extra steps.

| Ritual | Cadence | Output |
| --- | --- | --- |
| Critique | Weekly | A written summary and decisions — `design-critique` owns the session |
| Intake triage | Weekly | Every request accepted, declined or parked, visibly |
| Design and engineering sync | Weekly | Feasibility flags raised before designs harden |
| Research readout | Per study | A repository entry, not just a presentation |
| System review | Monthly | Contributions accepted, deprecations scheduled |
| Retrospective | Quarterly | Two or three changes with owners |

If a ritual has produced no artifact for a month, cancel it. A cancelled meeting that turns out to be necessary is easy to restart; a meeting nobody values is a permanent tax on everyone's calendar.

Default to asynchronous where the ritual is informational. Reserve synchronous time for things that genuinely need discussion — critique, disagreement, and anything where the answer is not yet known.

## Onboarding is a process problem

A new designer taking months to become useful is usually not a hiring problem. It is that the context lives in people's heads.

A working first-week path:

1. The product, used as a user, with a real account and real tasks.
2. The research repository — the five most important studies, listed by name rather than left to be discovered.
3. The decision records for the area they will own.
4. The design system, including what it refuses to do and why.
5. A small, real, shippable piece of work in the first week.
6. A named person to ask anything, explicitly assigned.

The first-week ship matters more than the reading. It surfaces every broken piece of the process at exactly the moment someone can see it fresh — and a new joiner's confusion is the most accurate audit of the operating layer you will ever get. Write it down before it fades.

## Measure the operating layer, not the output

Design output is hard to measure and measuring it produces bad incentives. The operating layer is measurable and safe to measure:

- Time from intake to triage decision.
- Percentage of requests arriving through the door.
- Time from research question to answer.
- Repository retrieval: can a new joiner answer a question in five minutes?
- Percentage of production components coming from the system — `design-systems` owns it.
- Rework rate: how often does work get redone because context was missing?

Rework is the one that matters most and gets measured least. It is the direct cost of a failing operating layer, and it is the number that justifies fixing it.

## Evidence bar

Process changes need a stated problem, like any other design work. "We should have a weekly sync" is a solution; "feasibility problems are being found after designs are committed, three times last quarter" is the problem — and the sync may not be the best answer to it.

Measure before and after. A process change that nobody measures cannot be evaluated and will never be removed.

Prefer removing process to adding it. Teams accumulate rituals and conventions and almost never retire them, and the accumulated weight is frequently the bottleneck being blamed on capacity.

Do not import a process from another organization because it worked there. Their constraints are not yours, and the visible ritual is usually not what made it work.

Where the honest diagnosis is that the team is under-resourced rather than badly organized, say so. Process cannot fix headcount, and pretending otherwise burns the team.

## Before you ship

| Symptom | What it means | Fix |
| --- | --- | --- |
| Requests arrive through five channels | Nothing can be ranked | One door, exclusively |
| The intake form asks what to build | It collects solutions, not problems | Ask the four problem questions |
| Requests disappear after submission | People route around the door | Visible outcome for every request |
| Studies are re-run | Retrieval failure, not capacity | Search-before-starting, recorded |
| Files named `final-v3-REAL` | Cost paid by whoever inherits it | One written convention |
| Work filed under a project codename | Unfindable within a year | Product area |
| Several copies of the same artifact | Nobody knows which is current | One canonical location, links not copies |
| A recurring meeting with no artifact | Status update with extra steps | Give it an output or cancel it |
| A new designer takes three months | Context lives in heads | Documented path plus a first-week ship |
| A process was copied from another company | Their constraints, not yours | Diagnose your own problem first |
| Rituals only ever get added | Accumulated weight is the bottleneck | Retire something each quarter |
| Output is being measured | Bad incentives | Measure the operating layer |
| Process is proposed for a resourcing problem | It will not work and will burn people | Say it plainly |

## Reporting

**The deliverable is an operating review** with measurements, not a process proposal.

1. **The problem** — what is failing, with numbers: rework incidents, time-to-triage, requests arriving off-channel.
2. **Current state** — intake, repositories, conventions, rituals, as they actually are rather than as documented.
3. **Findings**, ordered by cost to the team, each naming which of the four areas it sits in — intake, retrieval, conventions, rituals.
4. **Proposed changes**, each with the problem it addresses and how you will know it worked.
5. **What to remove** — at least one thing. A proposal that only adds is incomplete.
6. **What process cannot fix** — stated plainly where resourcing or organizational structure is the real constraint.

**Done when:** every proposed change names the problem it solves and its measurement, something is being retired as well as added, and a new joiner could answer "have we researched this?" and "why is it like this?" from the repositories alone.
