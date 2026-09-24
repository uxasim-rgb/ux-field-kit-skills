---
name: prioritization
description: Ranks work using a scoring model sized to the decision, cuts scope without gutting the outcome, and declines work in a way that survives the conversation. Use when there is more to do than capacity.
when_to_use: Use when ranking a backlog, choosing what to build next, running RICE or ICE or effort-impact scoring, cutting scope to hit a date, deciding what to drop, or saying no to a request — and when someone asks "what should we work on" or "can we fit this in".
---

# Prioritization

This skill turns a list of possible work into an ordered one, and turns an over-committed scope into a shippable one. It sits in the Define band and is the place where research, framing and business constraint collide.

The governing idea: a prioritization model does not make the decision. It makes the reasoning visible, so that the decision can be argued with rather than asserted.

**Works with:** `problem-framing` supplies what is worth solving · `usability-testing` and `heuristic-evaluation` supply severity · `success-metrics` supplies what "impact" means here · `stakeholder-communication` owns defending the outcome · `design-ops` owns intake.

## Start here

| The situation | Go to |
| --- | --- |
| A backlog needs ordering | **Pick the lightest model that resolves it** below |
| The date is fixed and the scope is not | **Cut depth, not steps** below |
| You are being asked to add one more thing | **Declining well** below |
| Two options and a genuine tie | **Break ties with reversibility** below |
| The disagreement is about what the problem is | `problem-framing` — scoring will not resolve it |
| The disagreement is about what success means | `success-metrics` |
| Usability issues need ranking among themselves | `usability-testing` severity model, then bring the Criticals here |

## Role lens

| Role | Takes from this skill |
| --- | --- |
| Product designer | The scoring models and the scope-cutting method |
| UX researcher | How severity ratings enter a prioritization conversation without being flattened |
| Design ops | Intake triage, and a consistent model so requests are compared on one basis |

## Pick the lightest model that resolves the disagreement

Scoring models are tools for making an argument inspectable, not calculators. Use the smallest one that ends the disagreement.

| Situation | Model |
| --- | --- |
| Fewer than ten items, one team | Sort by hand. Argue about the order. Write down why |
| A pile with obvious cheap wins | **Effort / impact**, two axes, four quadrants |
| Competing bets with different audience sizes | **RICE** — Reach × Impact × Confidence ÷ Effort |
| Ranking within a fixed theme | **ICE** — Impact × Confidence × Ease |
| Requests from many stakeholders | **Weighted scoring** against agreed criteria, weights set before items are scored |
| Dates fixed, scope negotiable | Do not score. Go to **Cut depth, not steps** |

A model with more inputs is not more accurate. RICE has four estimates and therefore four places to be wrong, and its output is frequently decided by whoever supplies Reach. Use it when audience size genuinely differs between options, and not otherwise.

## Score the inputs honestly, especially confidence

**Reach** — how many people, in a stated period, on a stated path. "All users" is almost always false; get it from analytics, and where you cannot, say it is an estimate.

**Impact** — how much it moves the thing in `success-metrics`, on a fixed scale (3 massive / 2 high / 1 medium / 0.5 low / 0.25 minimal). Rate against the metric, not against how exciting it is.

**Confidence** — how good the evidence is, as a percentage. This is the input that does the real work and the one teams inflate. Anchor it:

| Confidence | Means |
| --- | --- |
| 100% | Measured. Analytics, a completed test, a shipped experiment |
| 80% | Strong research — `research-synthesis` rates it Strong |
| 50% | Moderate research, or a strong analogy from a comparable product |
| 20% | A well-argued opinion with no evidence |

Anything below 20% is not a candidate for building; it is a candidate for `research-planning`. Score it, see it sink, and put a study on the list instead.

**Effort** — person-months or t-shirt sizes, from the people who will do it. A designer's effort estimate for engineering work is a wish. Include design, engineering, QA, content and rollout, because a "small" build with a large migration is not small.

## Make the estimates arguable

The output of a scoring model is only as good as its inputs, and the inputs are guesses. Two habits stop the number acquiring false authority:

**Record the basis, not just the value.** "Reach 4,200/quarter — from Q1 analytics on the export path" is arguable. "Reach 4,200" is not, and it will be treated as a fact by the next person to open the sheet.

**Score independently, then compare.** Where several people score, have them do it separately first. Wide disagreement on one input is more informative than the final ranking — it usually means the item is understood differently, and that is worth resolving before the ranking is.

## Resist the tyranny of the small and certain

Every effort-weighted model systematically favours small, certain, low-value work. Divide by effort and a pile of one-week 20% improvements will outrank the six-month change the product needs.

Three counters:

- **Ring-fence capacity** for the large bet, outside the scored list. A percentage of each cycle that the model does not get to allocate.
- **Score strategic alignment** as its own criterion in weighted models, so a big bet is not competing purely on ratio.
- **Check the top ten for a theme.** If every item is a small fix in a different area, the quarter will produce no visible change, and users will not notice ten small improvements spread across ten places.

The mirror image is real too: a team that only does big bets ships nothing for two quarters. The point is that the model has a known bias and the bias needs correcting, not that the small work is worthless.

## Cut depth, not steps

When the date is fixed and the scope is not, the instinct is to remove steps from the flow. That produces a broken experience — a journey with a hole in it is worse than a shallow one.

Cut in this order:

1. **Depth before breadth.** One segment served properly beats three served partially.
2. **Automation before capability.** Ship the manual version. A human doing it behind the scenes proves the demand before the system is built; `audience-and-journeys` blueprints cover this.
3. **Configuration before defaults.** Ship one good default rather than settings. Settings are the most common thing to cut and the most commonly shipped anyway.
4. **Edge cases before the core path** — but only where the edge fails safely. An unhandled edge that loses data is not a cut, it is a defect.
5. **Polish before correctness.** Never the reverse.

What does not get cut: error states, empty states, and the recovery path. These are the first things proposed for removal and the fastest way to ship something that feels broken. `components-and-states` owns the full set, and a flow without them is not finished, it is unfinished and shipped.

Also do not cut accessibility. It is not a feature and retrofitting costs several times the original. `accessibility` owns why.

## Break ties with reversibility

When two items score within noise of each other, the score cannot resolve it. Use these, in order:

1. **Reversibility.** Prefer the one that is easier to undo. A cheap-to-reverse decision can be made fast and wrong; an expensive one deserves more evidence first.
2. **Learning.** Prefer the one that tells you more about the next decision.
3. **Unblocking.** Prefer the one other work is waiting on.
4. **Compounding.** Prefer the one that makes later work cheaper — a system, a pattern, a migration.

Stop treating it as a tie once one of these separates them. Re-running the scoring with adjusted inputs to break a tie is just choosing the answer and working backwards.

## Declining well

A prioritization decision is a series of noes, and how they are delivered determines whether the process survives contact with the organization.

Four parts, in one message:

1. **What you understood the request to be.** Demonstrates you engaged with it.
2. **What it is competing against**, named specifically. "We're prioritizing the access review work this quarter" beats "we're at capacity".
3. **What would change the decision.** A number, a customer count, a date. This converts a no into a condition.
4. **What they can do now.** A workaround, a manual process, a timeline for revisiting.

Never decline by silence, and never decline with "it's not a priority" alone — it communicates a ranking without the reasoning, which reads as dismissal and guarantees the request returns through a more senior route.

Keep the declined list visible. A request that disappears comes back; one that is publicly ranked 23rd is understood.

## Evidence bar

Every score carries its basis inline. A scoring sheet with bare numbers will be treated as analysis, and the numbers were guesses.

Never let a scoring model's output override a Critical finding from `usability-testing` without an explicit, recorded decision. Data loss, a charge the user did not intend, or an accessibility barrier are not line items to be out-competed by reach — they are blockers, and deciding to ship anyway is a decision someone should have to sign.

Confidence is the input to police hardest. When most items sit at 80% or higher, the scale is being used as decoration. Real backlogs are mostly 50% and below, and a sheet that admits it will route work toward `research-planning` correctly.

When the model's output contradicts the team's judgement, do not silently adjust the inputs until it agrees. Either the model is missing a criterion — add it explicitly — or the judgement is wrong. Both are findings; quietly re-scoring is neither.

## Before you ship

| Symptom | What it means | Fix |
| --- | --- | --- |
| Inputs were adjusted until the ranking looked right | The answer was chosen first | Add the missing criterion explicitly, or accept the ranking |
| Most items are scored 80%+ confidence | The scale is decoration | Re-anchor; expect most real items below 50% |
| Reach is "all users" | Nobody checked | Get it from analytics or mark it an estimate |
| Effort was estimated by the requester | It is a wish | Get it from whoever will build it, including QA and rollout |
| The top ten are all one-week fixes in ten areas | Small-and-certain bias | Ring-fence capacity for the large bet |
| Error and empty states were cut to hit the date | The flow will ship feeling broken | Cut depth instead; these are not optional |
| Accessibility is in the "phase two" column | It will cost several times more later | Move it back; it is not a feature |
| A Critical usability finding lost to a higher-reach item | Severity was flattened into score | Make the override explicit and have someone own it |
| A no was delivered as "not a priority" | Ranking without reasoning | Name what it lost to and what would change it |
| Declined requests vanished | They will return via a senior route | Keep the ranked list visible |

## Reporting

**The deliverable is a ranked list with reasoning attached**, plus an explicit cut line.

1. **What we are optimizing for** — the metric or outcome from `success-metrics`, and the period.
2. **The model used and why** — including what it was chosen over.
3. **Ranked items**, each with: score, every input with its basis, and the owning skill.
4. **The cut line** — what is in this cycle and what is not, drawn visibly.
5. **Overrides** — anything ranked against its score, with the reason and who decided.
6. **Blocked on evidence** — items below 20% confidence, routed to `research-planning` as studies rather than builds.
7. **Declined**, with the four-part reason and the condition that would reopen each.

**Done when:** every number has a basis, the cut line is visible, nothing Critical is below it without a named owner for that decision, and someone who disagrees with the ranking can point at the specific input they dispute.
