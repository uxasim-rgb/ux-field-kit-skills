---
name: design-handoff
description: Produces the spec engineering actually needs — states, edge cases, behavior, acceptance criteria and instrumentation — rather than redlines of things a token already answers. Use when a design is ready to build.
when_to_use: Use when handing a design to engineering, writing a spec or acceptance criteria, documenting states and edge cases for a build, preparing developer annotations, or when engineers keep asking questions the design should have answered.
---

# Design handoff

This skill produces the document that lets engineering build what was designed without guessing. It sits in the Build band.

The governing idea: handoff is not a file transfer. The spec exists to answer the questions the design file cannot, and measurements are the least of them.

**Works with:** `components-and-states` supplies the state set · `user-flows` supplies the edge cases · `content-design` supplies every string · `accessibility` supplies the contract · `success-metrics` supplies the instrumentation request · `design-systems` supplies the tokens that replace most redlines · `design-engineering` is the other side of this conversation.

## Start here

| The situation | Go to |
| --- | --- |
| Preparing a spec | **Specify behavior, not measurements** below |
| Engineers keep asking questions | **The questions a spec must answer** below |
| Writing acceptance criteria | **Write criteria someone can test** below |
| The design uses system components | Reference the component; do not respecify it |
| The design breaks from the system | **Flag divergence explicitly** below |
| Handing over analytics needs | `success-metrics` owns the event list; carry it here |
| The build came back wrong | **Review the build against the spec** below |

## Specify behavior, not measurements

Where a design system exists, most measurements are already answered by tokens. Annotating a 16px gap that comes from `--space-4` adds noise and creates a second source of truth that will drift.

Spend the effort on what the file cannot show:

| The file shows | The spec must say |
| --- | --- |
| A button | What happens on click, during the request, on failure, on double-click |
| A list | What happens at zero, one, and the realistic maximum; whether it paginates or scrolls |
| A form | Validation timing per field, what survives an error, what happens on submit |
| A modal | What dismisses it, where focus goes, what happens to unsaved input |
| A text field | The maximum length, what happens when exceeded, whether it trims |
| A number | Rounding, formatting, what shows when it is null |
| A chart | What shows with no data, one point, or a thousand |
| A layout | What changes at each breakpoint and why |

A spec that specifies pixel values and omits these is the one that produces a build that looks right and behaves wrongly.

## The questions a spec must answer

Run this list before handing over. Each unanswered question becomes an interruption later, or a decision an engineer makes alone under deadline.

**States.** Every state from `components-and-states`: default, hover, focus, active, disabled, loading, empty, partial, error, success. Each rendered or explicitly marked impossible with a reason.

**Content limits.** Longest realistic string per field, what happens past it, and whether it wraps, truncates or is rejected. Zero, one and many for every collection.

**Behavior.** What each control does, what it does while working, what it does on failure, and whether it is idempotent when pressed twice.

**Transitions.** Duration and easing where they matter — `motion-and-interaction` owns the values; a token reference is enough.

**Responsive.** What changes at each breakpoint and what triggers it, expressed as content-driven rather than device-named.

**Accessibility contract.** Focus order, accessible names, what gets announced on state change, keyboard interaction for anything custom. `accessibility` owns the requirements and they belong in the spec rather than in a separate document nobody opens.

**Copy.** Every string, final, including errors and empty states. A spec with placeholder copy produces shipped placeholder copy.

**Data.** Where each value comes from, what happens when it is missing, null, or stale, and what precision or rounding applies.

**Permissions.** What each role sees and can do. Frequently missing, and the source of a whole class of late rework.

**Instrumentation.** The event list from `success-metrics`, including whether a pre-change baseline is needed. Requested at handoff, not after launch, because after launch there is no baseline.

## Write criteria someone can test

Acceptance criteria are how both sides agree the build is done. They are testable statements, not descriptions.

> ❌ The form should be easy to use and match the design.
> ❌ Errors are handled gracefully.
>
> ✅ Submitting with an empty required field shows an inline error beside that field, moves focus to the error summary, and preserves every other entered value.
> ✅ With zero saved reports, the list area shows the empty state with a working "Create report" action.
> ✅ At 320px width the toolbar collapses to a menu and no horizontal scroll occurs.
> ✅ Every interactive element is reachable by Tab and shows a visible focus indicator at 3:1 contrast.

Write them from the unhappy paths first. The happy path is what gets built and demonstrated regardless; the criteria earn their keep on the cases that would otherwise be discovered in QA or production.

## Flag divergence explicitly

Where the design departs from the system — a one-off spacing, a new variant, a color outside the palette — say so, and say why, in the spec.

Undeclared divergence gets implemented as a local override, and local overrides are how a system erodes. Declared divergence gets either accepted with a reason or routed into `design-systems` as a proposed addition.

Where the divergence exists because the system lacks something, that is a contribution, not a workaround. Say which it is.

## Hand over early and in conversation

A spec delivered as a finished document at the end of design is the most expensive way to do this. Engineering finds the infeasible parts, the parts that cost ten times what an alternative would, and the parts that conflict with existing architecture — and by then the design is committed and the conversation is adversarial.

Involve engineering while the design is still movable: a rough flow, a question about what the data can actually supply, a check on whether a pattern is expensive. Most of the value is in this conversation rather than in the document.

The document still matters, because conversations are not durable and the person who builds it in three months was not in the room.

## Review the build against the spec

Handoff is not finished when the spec is delivered. Review the implementation before it ships, against the criteria, and treat the review as collaborative rather than as an inspection.

Check the unhappy paths first — they are the ones most likely to have been skipped, and the ones the spec spent its effort on. Check on real data, at real volume, on a throttled connection.

Findings go through `review-the-change` for a diff or branch, or `full-review` for a whole surface. Where the build diverges because the spec was wrong or infeasible, fix the spec rather than pretending the design was right.

## Evidence bar

A spec is complete or it is not, and completeness is checkable: every state accounted for, every string final, every edge case answered or explicitly deferred. Incompleteness is a finding against the spec, not a judgement about the designer.

Where something is deliberately left to engineering judgement, say so explicitly. Silence is read as an omission, and the engineer will either interrupt you or guess.

Do not specify implementation. Saying how to build it in code oversteps `design-engineering` and is frequently wrong about cost. Specify the behavior and the constraint; let the implementation be chosen by the people who own it.

Where a measurement is already answered by a token, do not restate it. A duplicated value is a value that will drift.

## Before you ship

| Symptom | What it means | Fix |
| --- | --- | --- |
| The spec is mostly redlines | Tokens already answer these | Spend the effort on behavior |
| Only the default state is specified | The expensive states were skipped | Walk the state set |
| Copy is placeholder | Placeholder copy will ship | Final strings, including errors |
| No content limits given | Engineers will pick arbitrary ones | Longest realistic string, and behavior past it |
| Permissions not covered | A late class of rework | Specify per role |
| Instrumentation requested after launch | The baseline is gone | Include the event list at handoff |
| Acceptance criteria describe rather than test | Nobody can verify them | Rewrite as testable statements |
| Criteria cover only the happy path | The happy path was always going to work | Write the unhappy ones first |
| A one-off value with no explanation | Implemented as a permanent local override | Declare divergence and its reason |
| Engineering saw it first at handoff | Infeasibility found too late to change | Involve them while it is still movable |
| The spec says how to implement it | Oversteps, and is often wrong about cost | Specify behavior and constraint |
| Handoff ended at delivery | Nobody checked the build matched | Review against the criteria before ship |

## Reporting

**The deliverable is the spec itself.** Its structure:

1. **What this is and who it is for** — the flow, the roles, the entry points.
2. **Component references** — which system components are used, with a link. Not respecified.
3. **Divergences** — anything departing from the system, with a reason and whether it is a proposal.
4. **State matrix** — state by component, each rendered or marked impossible with a reason.
5. **Behavior** — per control: action, in-flight, failure, repeat-press.
6. **Content** — every string final; limits and overflow behavior per field.
7. **Data** — source, null handling, precision, staleness.
8. **Permissions** — per role.
9. **Responsive** — what changes where, and what triggers it.
10. **Accessibility contract** — focus order, names, announcements, keyboard behavior.
11. **Instrumentation** — events, triggers, properties, baseline requirement.
12. **Acceptance criteria** — testable, unhappy paths first.
13. **Open questions** — with an owner and a date, rather than left implicit.

**Done when:** an engineer who was not in the design conversation could build it without asking a question that the spec should have answered, and every open question has a name and a date against it.
