---
name: full-review
description: Runs a cross-discipline review of a screen, flow or feature by routing it to each domain skill, then consolidates one ranked verdict. Owns the shared severity ladder every other skill reports against.
when_to_use: Use when reviewing a whole screen, flow or feature across disciplines, auditing an interface end to end, asking whether something is ready to ship, or when a review needs to cover structure, craft, content and accessibility together rather than one at a time.
---

# Full review

This skill reviews a surface as one system. It sits in the Route band with `field-guide`, and owns the severity ladder, the consolidation rules and the verdict that every other skill reports against.

The governing idea: a strong interface is not nine independent audits stapled together. Route to each domain, then resolve the conflicts and rank the whole.

**Works with:** every domain skill owns its own rules and reports here · `review-the-change` owns change-scoped review and hands its findings to this ladder · `field-guide` decides what work to do rather than judging what exists · `design-critique` handles feedback to a person on unfinished work.

## Start here

| The situation | Go to |
| --- | --- |
| Reviewing a finished screen or flow | Run the five steps below |
| Reviewing a diff, branch or PR | `review-the-change` — it hands findings back here |
| Giving feedback on work in progress | `design-critique` |
| Deciding what work to do next | `field-guide` |
| You only need one domain checked | That skill directly. Routing to all nine is waste |
| You need the output format | [How to report](how-to-report.md) |

## 1. Establish the scope and the standard

Before reviewing, state what is under review and what it is being judged against.

- **Scope** — which screens, which states, which roles, which breakpoints. And what is excluded.
- **The project's own conventions** — spacing scale, token set, component library, density, motion language, voice. Review against these, not against defaults. A dense professional tool judged by consumer-app spacing produces a review that gets dismissed entirely, and correctly.
- **The intent** — what this surface is for, and who uses it. From `problem-framing` or `design-docs` where they exist.

Where the project has an established system, a deviation from it is a finding. Where it does not, the defaults in each domain skill apply and should be named as defaults rather than as rules.

## 2. Route to each domain

Each domain skill owns its rules. This skill never restates or overrides them.

| Domain | Skill |
| --- | --- |
| What belongs here and where it sits | `information-architecture` |
| Paths, edge cases, recovery | `user-flows` |
| Data entry | `forms-and-input` |
| Words | `content-design` |
| Arrangement, hierarchy, responsive | `layout-and-composition` |
| Text | `typography` |
| Color and theming | `color-and-theming` |
| Component anatomy and states | `components-and-states` |
| Motion | `motion-and-interaction` |
| Icons and images | `icons-and-imagery` |
| Keyboard, focus, ARIA, thresholds | `accessibility` |
| Locale, script, bandwidth, cognitive load | `global-and-inclusive` |
| System conformance | `design-systems` |
| Implementation | `design-engineering` |

Not every surface needs all fourteen. A static content page does not need `forms-and-input`. State which domains you covered and which you did not — implied completeness is the most common dishonesty in a review.

`accessibility` is never skipped. Its findings are measured rather than judged, and skipping it is how a review passes something unusable.

## 3. Apply one severity ladder

Every finding, from every domain, is rated on this ladder. Domain skills carry their own examples of each level; the definitions are here so that a typography finding and an accessibility finding can sit in one ranked list.

| Severity | Definition |
| --- | --- |
| **Critical** | A user cannot complete the task, loses data or money, or is excluded entirely. Ship-blocking without exception |
| **Serious** | The task completes with errors, workarounds or substantial delay; or a standard the product is obliged to meet is failed with a workaround available |
| **Moderate** | Friction that resolves — hesitation, a wrong turn recovered, an inconsistency with a nameable cost |
| **Minor** | Noticed, no measurable cost. Fix if free |

**Escalation triggers.** These raise a finding to Critical regardless of how it first appears:

- Data loss, or work discarded without consent.
- A charge, transfer or irreversible action the user did not intend.
- Content or function unreachable by keyboard or assistive technology.
- A dead end with no recovery path.
- Content flashing above the seizure threshold.
- A user unable to complete the task in their own locale, name or address.

These exist because each is routinely reported as Moderate by a reviewer who did not hit its consequence. They are not negotiable by discussion in the review; deferring one is a `prioritization` decision made by a named owner in the open.

## 4. Consolidate before ranking

Nine domains reviewing one surface produce overlapping findings. Merge before you rank.

- **One root cause, one finding.** A screen that is cluttered, has poor hierarchy and long measure may be one content-volume problem. Report it once, at the root, naming the owning skill — usually `information-architecture` rather than the three craft skills that observed the symptom.
- **Resolve conflicts explicitly.** Domains disagree: density from `layout-and-composition` against target size from `accessibility`, brevity from `content-design` against clarity from `global-and-inclusive`. Where they conflict, `accessibility` wins on anything it measures, and everything else is a tradeoff to be named rather than silently resolved.
- **Attribute to the owner, not the observer.** A contrast failure found while reviewing typography belongs to `accessibility`.
- **Separate findings from preferences.** Every finding names a consequence. Anything that cannot is cut, not downgraded.

## 5. Cap the list and give a verdict

**Cap at twenty findings.** Beyond that nobody acts on any of them. Report the top twenty by severity and put the rest in an appendix. A review that returns sixty findings has produced a document, not a change.

**The verdict:**

| Verdict | When |
| --- | --- |
| **Block** | Any Critical finding remains |
| **Needs changes** | Serious findings remain, no Criticals |
| **Approve with notes** | Only Moderate and Minor remain |
| **Approve** | Nothing actionable remains |

The verdict is mechanical from the severity list. It is not a judgement about overall quality and should not be softened because the work is good in other respects — a single Critical blocks a surface that is otherwise excellent, and saying so plainly is what makes the ladder worth having.

Include what works. A review with no positives reads as an attack on whoever built it, and the team needs to know what not to break in the fix.

## Evidence bar

Every finding names a consequence for a user. "Inconsistent spacing" is not a finding; "the two card variants use different internal spacing, so a scanning user reads them as different types of object" is.

Measurable things are measured. Contrast ratios computed, target sizes in CSS pixels, durations in milliseconds, measure in characters. A review reporting "contrast looks low" has not done the work, and `accessibility` owns the thresholds.

State coverage honestly. Which domains, which states, which breakpoints, which roles — and which were not checked. A review implying completeness it did not have is worse than a narrow one stated accurately.

Say which findings are hypotheses. Expert review predicts; it does not observe. Where a finding would be settled by five participants, say so and route it to `usability-testing` rather than asserting the user impact.

When a surface is genuinely sound, say so and stop. Manufacturing findings to justify the review is how teams learn to route around it.

## Before you ship

| Symptom | What it means | Fix |
| --- | --- | --- |
| Reviewed against defaults, not the project's system | Will be dismissed, correctly | Establish the conventions first |
| A dense professional tool marked as too tight | Density judged without the task | Name the task; re-review |
| Sixty findings | None will be acted on | Cap at twenty; appendix the rest |
| The same root cause reported by four domains | Symptom-level reporting | Merge to the root; name the owning skill |
| A domain conflict resolved silently | The tradeoff is invisible | Name it; `accessibility` wins what it measures |
| A finding with no consequence | It is a preference | Cut it |
| "Contrast looks low" | Measurable, unmeasured | Compute it |
| Coverage implied, not stated | The review claims more than it did | List domains and states covered and skipped |
| `accessibility` skipped for time | The unusable ships | Never skip it |
| A Critical softened because the work is good | The ladder stops meaning anything | Verdict is mechanical |
| An expert prediction stated as observed | Hypothesis presented as evidence | Mark it; route to `usability-testing` |
| No positives | Reads as an attack; the fix may break what works | Name what works |

## Reporting

Full structure in [how to report](how-to-report.md). The shape:

1. **Scope and standard** — what was reviewed, against which conventions, which domains and states covered, and what was not.
2. **Verdict** — Block, Needs changes, Approve with notes, or Approve. At the top, with the count of findings by severity.
3. **Findings** — at most twenty, severity order, each with: severity, the owning skill, where it occurs, the measured value where one applies, the consequence for a user, and the fix.
4. **Conflicts resolved** — where domains disagreed, what was chosen and why.
5. **Worth keeping** — what works and should survive the fix.
6. **Test these** — findings that are hypotheses, framed as research questions for `usability-testing`.
7. **Appendix** — findings beyond the cap.

**Done when:** the verdict follows mechanically from the ladder, every finding names a consequence and an owner, coverage is stated including its gaps, and nothing measurable was estimated.
