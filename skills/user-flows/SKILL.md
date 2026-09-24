---
name: user-flows
description: Maps how someone moves through a task including entry points, edge cases, errors and recovery, so the paths that actually break get designed rather than discovered in QA. Use when designing or auditing a multi-step task.
when_to_use: Use when mapping a user flow or task flow, designing a multi-step process, listing edge cases and error paths, working out entry points, deciding what happens when something fails, or when a flow works in the demo and breaks in production.
---

# User flows

This skill maps the paths through a task and forces the unhappy ones into the open. It sits in the Structure band between `information-architecture` and `forms-and-input`.

The governing idea: the happy path is the smallest part of a flow and the only part most teams design. Everything expensive happens off it.

**Works with:** `information-architecture` owns where things live · `forms-and-input` owns the steps that collect data · `components-and-states` owns what each state looks like · `content-design` owns what the flow says · `usability-testing` validates it · `audience-and-journeys` covers the wider experience this flow sits inside.

## Start here

| The situation | Go to |
| --- | --- |
| Designing a new multi-step task | **Map entry points first** below |
| Auditing an existing flow | **The coverage checklist** below — run it as an audit |
| The flow is fine but people cannot find it | `information-architecture` |
| The flow is one long form | `forms-and-input` |
| You need to design what each state looks like | `components-and-states` |
| The problem spans channels and staff | `audience-and-journeys` — blueprint it |
| The flow works for you and breaks for users | `usability-testing` with a forced-error task |

## Map entry points first, and expect more than one

Flows are usually designed from a single assumed starting point — the user sitting at the dashboard, unhurried, with everything ready. Real entry is messier and the entry point changes what the flow must do.

List every way someone arrives:

- From the main navigation, deliberately.
- From a notification or email, mid-context, possibly on a phone.
- From a deep link someone else sent them, with no surrounding context.
- From a search result, landing mid-flow.
- Returning after abandoning halfway.
- Arriving without permission to complete it.
- Arriving as the wrong role entirely.

Each of those needs an answer. The deep-link case is the most commonly broken: a user landing on step three with no state has to be either bounced to step one with an explanation or given enough context to continue. Silently rendering a broken step three is the default behavior and it is always wrong.

## Design the exits as deliberately as the entrances

For every step, answer three questions:

1. **How do I leave without finishing?** There must be a way out, and it must say what happens to the work.
2. **What happens to what I entered?** Saved as a draft, discarded, or held — pick one and say so. Silence here is what makes people distrust a product.
3. **How do I get back in?** If work was saved, the return path must exist and be findable.

A flow with no exit is a trap, and people escape traps by closing the tab — which loses their work and teaches them not to start next time.

## Enumerate the unhappy paths before designing the happy one

For each step, ask what can go wrong. The recurring categories, worth walking every time:

| Category | Examples |
| --- | --- |
| **Empty** | No items yet, no results, nothing to select from |
| **Partial** | Some data present, some missing; a half-finished draft |
| **Invalid** | Bad input, wrong format, out of range, duplicate |
| **Permission** | Not allowed, allowed but needs approval, allowed for some items |
| **Conflict** | Someone else changed it, the item was deleted, the version is stale |
| **System** | Request failed, timed out, offline, rate-limited, partially succeeded |
| **Boundary** | One item, a thousand items, longest realistic name, zero, negative |
| **Interruption** | Tab closed, session expired, phone call, back button, refresh |

**Partial success is the most under-designed state in software.** A bulk action that processes 47 of 50 records needs a specific answer: what happened to the three, can they be retried, and is the operation resumable. The default — a generic error implying nothing worked — makes users redo work that already succeeded.

## Every failure needs a recovery path, not just a message

An error state that tells the user what went wrong and leaves them stuck is half a design. For each failure, specify:

- **What they see** — plain language, specific. `content-design` owns the wording.
- **What they can do** — retry, edit, go back, skip, contact support. At least one must actually work.
- **What happened to their data** — preserved, always, unless there is a reason it cannot be.
- **Whether it self-recovers** — a retry on a transient network failure is better than asking the user to press a button.

Never discard user input on error. It is the single most common and most infuriating flow defect, and it is nearly always an implementation shortcut rather than a decision.

## Make destructive actions reversible instead of confirmed

A confirmation dialog is a weak protection: people click through them reflexively, and the dialog interrupts the correct action as often as the incorrect one.

Preference order:

1. **Undo.** Do the thing, show a brief undo affordance. Best for most cases, and fastest for the common path.
2. **Soft delete.** Move to a recoverable state for a period.
3. **Confirmation with a consequence stated** — "Delete 47 records permanently?" with the count. Use where the action genuinely cannot be undone.
4. **Type-to-confirm.** Reserve for the truly irreversible: deleting an account, dropping a production database.

Any bulk destructive action states the count. "Delete selected?" is not an acceptable prompt when the selection is 200 items the user cannot see.

## Keep the back button and the URL honest

On the web, the browser back button is part of your flow whether you designed for it or not.

- Back should undo the last step, not exit the flow or resubmit.
- Each meaningful step gets a URL, so it can be linked and returned to.
- A refresh mid-flow should not lose state or duplicate a submission.
- After a successful submission, redirect rather than leaving the form re-submittable.

`design-engineering` owns the implementation; the requirement is a flow decision.

## Show progress honestly in multi-step flows

Where a flow has discrete steps, say how many and where the user is. Where it does not have a knowable length, do not invent one — a progress bar that stalls at 90% is worse than a spinner.

Let people move backwards without losing what they entered. Let them skip what is genuinely optional, and mark it as optional rather than making them discover it.

Where a step can be deferred, allow deferral. Forcing a decision the user cannot make yet — "invite your team" during setup, before they know who is joining — is the most common cause of abandonment in onboarding, and `problem-framing` calls it correctly: the blocker is not the interface, it is the sequencing.

## Evidence bar

A flow diagram that contains only the happy path is not finished. Coverage is checkable: every step should have an answer for empty, invalid, permission, conflict, system failure and interruption, or an explicit note that the case cannot occur and why.

Do not assert that a case cannot occur without checking. "Users will always have at least one project" is the kind of claim that is false in production on day one.

Where a flow was validated, say how — a tree test covers findability, `usability-testing` with a forced-error task covers recovery, and neither covers the other. A flow tested only on the happy path has been tested on the part that was already working.

When the honest answer is that a state is not yet designed, mark it as an open item in the flow rather than leaving a gap. Gaps get implemented as whatever the framework does by default.

## Before you ship

| Symptom | What it means | Fix |
| --- | --- | --- |
| The diagram has one path | Only the happy path was designed | Walk the eight failure categories per step |
| A deep link to step three renders broken | Entry points were not enumerated | Bounce with context, or hydrate enough to continue |
| Error states have a message and no action | Half a design | Give every failure a working way forward |
| Input is cleared on validation error | An implementation shortcut shipped as behavior | Preserve input, always |
| A bulk action says "Delete selected?" | The user cannot see what they are deleting | State the count |
| Everything destructive has a confirm dialog | Protection theatre; people click through | Prefer undo |
| Partial success shows a generic error | The 47 that worked are invisible | Report what succeeded, what failed, and how to retry the rest |
| Back exits the flow or resubmits | The browser was not treated as part of the flow | One URL per step; back undoes |
| A progress bar sits at 90% | Fake progress | Use an indeterminate indicator |
| Setup forces a decision the user cannot make yet | Sequencing problem, not an interface one | Allow deferral |
| "That case can't happen" | Usually false | Check, or design it anyway |

## Reporting

**The deliverable is a flow with its unhappy paths enumerated**, not a diagram of the demo.

**Severity ladder:** `Critical` — a path that loses data, traps the user, or cannot be completed · `Serious` — a failure with no recovery, or work discarded on error · `Moderate` — a missing state that degrades gracefully · `Minor` — cosmetic inconsistency between steps.

**Verification:** every step has entry points listed; every step answers empty / invalid / permission / conflict / system / interruption or says why not; every failure has a recovery; input preservation confirmed; back and refresh behavior stated.

**Format:**

1. **Scope** — the task, the roles, the entry points covered.
2. **Happy path** — steps, with the URL or state for each.
3. **Coverage table** — step by failure category, each cell either a designed state or a stated reason it cannot occur.
4. **Findings**, severity order, each naming the owning skill for the fix.
5. **Destructive actions** — each with its protection mechanism and the reasoning.
6. **Open items** — states not yet designed, named explicitly so they are not implemented by default.

**Done when:** the coverage table has no blank cells, every failure has a way forward, and no step discards what the user typed.
