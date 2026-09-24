---
name: prototyping
description: Builds the smallest thing that answers a specific question, at the fidelity that question needs, and throws it away afterwards. Use when an argument would be settled faster by something people can try.
when_to_use: Use when building a prototype, choosing fidelity, deciding whether to prototype in code or in a design tool, testing an interaction before committing, or when a discussion is going in circles and something clickable would end it.
disable-model-invocation: true
---

# Prototyping

This skill builds something to answer a question, then deletes it. It sits in the Build band and is user-invoked, because writing throwaway code on someone's behalf produces work nobody asked for.

The governing idea: a prototype has one question and a disposal date. Without the first it explores nothing; without the second it becomes the product by accident.

**Works with:** `usability-testing` tests the prototype with people · `design-engineering` owns production implementation · `components-and-states` owns the states a real build needs · `design-handoff` takes over when the answer is known · `problem-framing` supplies the assumption worth testing.

## Start here

| The situation | Go to |
| --- | --- |
| A discussion is going in circles | **Write the question first** below |
| You need to choose fidelity | **Fidelity follows the question** below |
| Code or a design tool? | **Prototype where the question lives** below |
| Testing with users | Build to this skill's rules, then `usability-testing` |
| The prototype is becoming the product | **Decide the disposal route up front** below |
| You have the answer | `design-handoff` — and delete the prototype |
| You want three options compared | **Diverge on one axis** below |

## Write the question first

A prototype without a written question becomes a demo, and a demo gets evaluated on polish rather than on what it was supposed to settle.

The question is specific and answerable:

> ❌ What should the new editor be like?
> ✅ Can someone reorder sections by dragging without a visible handle, or do they need one?
> ✅ Does showing the running total during entry stop people submitting the wrong amount?
> ✅ Is a three-step wizard faster than one long form for this dataset?

Then write what each answer means. "If they need a handle, we add one and the layout has to accommodate it; if not, we save a column of space." A question where both answers lead to the same build is not worth prototyping.

Pull the question from the assumption map in `problem-framing` where one exists. The low-confidence, high-damage assumptions are exactly what prototypes are for.

## Fidelity follows the question

Higher fidelity costs more and biases feedback toward surface. Build the lowest fidelity that can answer the question.

| Question | Fidelity | Time |
| --- | --- | --- |
| Does this flow make sense? | Paper, boxes, or a linked wireframe | Under an hour |
| Do people understand this structure? | Text-only tree, no visual design | Under an hour |
| Can people find this? | Clickable wireframe, real labels | Half a day |
| Does this interaction feel right? | Coded, one screen, real motion | A day |
| Does this work with real data? | Coded, real API or realistic fixtures | Days |
| Would people pay for this? | Landing page or a manual concierge version | Varies |

The mismatch to avoid in both directions. A polished visual prototype used to test flow comprehension gets feedback about colors. A grey-box wireframe used to test whether an animation feels good cannot answer the question at all.

When testing structure or copy, **deliberately keep it ugly**. Participants comment on what looks unfinished, and unfinished visuals keep the conversation on the thing you are testing.

## Prototype where the question lives

| The question is about | Build it in |
| --- | --- |
| Layout, hierarchy, structure | A design tool — faster to iterate |
| Timing, physics, gesture, drag | Code — design tools approximate motion badly |
| Real data, edge cases, volume | Code with real or realistic data |
| Copy and comprehension | Text in a document, or a wireframe |
| Performance or feasibility | Code, against the real stack |
| Whether anyone wants it | Neither — a landing page or a manual version |

Code prototypes are frequently faster than expected for interaction questions, and design-tool prototypes are frequently slower than expected for anything involving real data or state.

The deciding factor is iteration speed on the question, not which tool you prefer.

## Diverge on one axis

When exploring alternatives, three versions that differ on a named axis teach more than three that differ everywhere.

Pick the axis: density, disclosure, guidance, layout direction, the amount shown by default. Hold everything else constant, and say in the artifact what the axis is.

Three versions that vary randomly produce a preference vote, which tells you nothing you can generalize. Three that vary on disclosure tell you how much this audience wants up front — which applies to the next twenty screens.

Build them behind a switch so people can flip between them in the same context. Comparing screenshots side by side compares compositions; flipping in place compares experiences.

## Fake everything that is not the question

A prototype is allowed to be a facade. Hardcode the data, fake the latency, ignore auth, support exactly one path.

What must be real: whatever the question is about. If the question is about performance with a thousand rows, the thousand rows are real and everything else is fake. If it is about comprehension, the copy is real and the data is fixtures.

Make the seams obvious to anyone using it — a banner, an obvious placeholder style — so nobody mistakes it for a build and nobody reports the fake parts as bugs.

Stub the dead ends visibly. A prototype that silently does nothing when clicked outside the tested path wastes session time working out whether it is broken.

## Decide the disposal route up front

Every prototype ends one of three ways. Choose before building, and write it down:

1. **Delete it.** The default, and correct for almost all of them. The answer is what you keep; the code was a means.
2. **Harvest it.** Take specific learnings — a timing value, a copy string, a layout decision — into the real build. Still delete the code.
3. **Grow it.** Only when it was built to production standards from the start, which means it was not a prototype.

The failure is a prototype drifting into production because it demoed well and a deadline arrived. It carries no error states, no accessibility, no tests, and no edge cases, and those absences surface as production bugs months later, attributed to engineering rather than to the decision to ship a facade.

Guard against it: keep prototypes in a separate directory or repository, mark them visibly, and give them an expiry date.

## Evidence bar

A prototype produces an answer to one question. It does not produce evidence about anything else, and the surrounding observations are anecdote.

Where it was tested with people, `usability-testing` rules apply: counts not percentages, observed not reported, and the task wording matters as much as the prototype.

Where it was demoed rather than tested, say so. A stakeholder liking a demo is not validation, and the gap between "the room reacted well" and "people can use it" is where a great many features have died.

Say what the prototype could not test. A facade with fake data cannot tell you about real data; a single-path prototype cannot tell you about recovery. These limits are known in advance and should be written in advance.

## Before you ship

| Symptom | What it means | Fix |
| --- | --- | --- |
| No written question | It is a demo and will be judged on polish | Write the question and what each answer changes |
| Both answers lead to the same build | Nothing is being decided | Do not build it |
| Feedback is all about colors | Fidelity is too high for the question | Rebuild uglier |
| The motion cannot be judged | Fidelity is too low, or the wrong tool | Code it |
| Three versions differ everywhere | Produces a preference vote | Diverge on one named axis |
| Versions compared as screenshots | Comparing compositions, not experiences | Put them behind a switch |
| Clicking outside the path does nothing | Session time wasted diagnosing | Stub dead ends visibly |
| Nobody can tell it is a prototype | It will be reported as buggy, or shipped | Mark it visibly |
| No disposal route decided | It will drift toward production | Decide before building |
| A stakeholder demo is being called validation | Liking is not using | Test it, or say it was a demo |
| The prototype is in the main repository | It will be found and reused | Separate location, expiry date |

## Reporting

**The deliverable is an answer, not an artifact.** The prototype is scaffolding; the write-up is what survives.

1. **The question** — as written before building.
2. **What was built** — fidelity, tool, what was real and what was faked.
3. **How it was evaluated** — tested with whom, or demoed to whom. Named honestly.
4. **The answer** — directly, in one paragraph.
5. **What changes as a result** — the decision this unblocks.
6. **What this could not tell us** — the limits, from the facade and the method.
7. **Disposal** — delete, harvest or grow, and what is being carried forward.

Where three variants were built, add a comparison table: variant, the axis position, what happened, and the recommendation with its reason.

**Done when:** the question has a one-paragraph answer, the limits are stated, and the prototype has a disposal decision recorded against it rather than an open-ended existence.
