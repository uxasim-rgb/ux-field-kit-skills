---
name: components-and-states
description: Defines a component's anatomy, variants and the full set of states it must handle including loading, empty, error and partial. Use when building a component or when something works in the demo and breaks with real data.
when_to_use: Use when designing or building a UI component, defining variants and props, covering loading and empty and error states, designing skeletons or spinners, handling long content or zero items, or when a component breaks with real data.
---

# Components and states

This skill defines what a component is made of and every condition it has to survive. It sits in the Craft band and is where most "it worked in the mockup" failures are prevented.

The governing idea: a component is its state set, not its default appearance. The default is the state you will spend the least time in.

**Works with:** `design-systems` owns the component API, versioning and governance · `user-flows` owns which states a flow can reach · `content-design` owns the words in each state · `accessibility` owns state announcement and focus · `motion-and-interaction` owns transitions between states · `layout-and-composition` owns the space around it.

## Start here

| The situation | Go to |
| --- | --- |
| Building a new component | **Define the anatomy first** below |
| Something broke with real data | **Stress the content** below |
| Deciding which states to design | **The state set** below — run it as a checklist |
| Loading feels wrong | **Match the waiting pattern to the wait** below |
| Variants are multiplying | `design-systems` — it owns the API |
| The words in a state | `content-design` |
| The transition between states | `motion-and-interaction` |
| Screen reader behavior on state change | `accessibility` |

## Define the anatomy first

Before variants, name the parts and say which are required. A component with an unclear anatomy grows props until nobody can use it.

> **Card.** Container (required) · media (optional) · eyebrow (optional) · title (required) · description (optional) · metadata (optional) · actions (0–2).

Then decide what is configurable and what is fixed. Everything configurable is a decision the consumer has to make and a way the component can be used wrongly. Fixed is cheaper, and a component with three props that covers 90% of uses beats one with fifteen that covers 100%.

Where a use case falls outside, the answer is frequently a second component rather than another variant. `design-systems` owns that call.

## The state set

Every interactive component has more states than a mockup shows. Walk this list for each one; mark any that genuinely cannot occur and say why.

**Interaction states** — default, hover, focus, focus-visible, active/pressed, disabled, selected, read-only.

**Data states** — loading, empty, partial, error, success, stale.

**Content states** — one item, many items, longest realistic string, shortest, missing optional fields, overflowing.

The four that get skipped and cost the most:

| State | Why it is skipped | What it costs |
| --- | --- | --- |
| **Empty** | Demo data is never empty | New users see a blank screen at the exact moment they need guidance |
| **Error** | Written under deadline | "Something went wrong" with no recovery |
| **Partial** | Nobody considers half-success | A bulk action reports total failure when 47 of 50 worked |
| **Loading** | Development is on localhost | The interface appears frozen or jumps as content arrives |

`content-design` owns the words for each; this skill owns that each exists.

## Separate focus from hover, and never remove the ring

`:hover` and `:focus` are different states for different input methods and they should not share styling. Keyboard users need a visible focus indicator; mouse users get hover.

Style `:focus-visible` rather than bare `:focus`, so the indicator appears for keyboard and assistive technology and not on a mouse click.

Never write `outline: none` without a replacement of at least equal visibility. This is the single most common accessibility regression in a component library, and it is usually added to remove a ring the author saw on click — which `:focus-visible` already solves.

`accessibility` owns the contrast requirement for the indicator (3:1 against adjacent colors) and the rule that it must not be obscured by other content.

Gate hover-only styling behind `@media (hover: hover)`. Touch devices fire `:hover` on tap and leave it applied until something else is tapped, so an item the user merely pressed stays looking selected.

## Disabled hides the reason; prefer alternatives

A disabled control tells the user they cannot do something and not why. It is also frequently low-contrast and skipped by some assistive technology, so the user may not find it at all.

Order of preference:

1. **Leave it enabled** and explain on attempt. A submit button that validates and points at the problem is more useful than one that was greyed out for reasons the user has to deduce.
2. **Enabled with an explanation attached** — a tooltip or inline note saying what would unlock it.
3. **Disabled, with the reason visible nearby.** Never disabled alone.
4. **Hidden**, where the user genuinely has no path to it — a permission they do not hold. Hiding is better than disabling when the answer is permanent.

Where a control is disabled during an in-flight action, that is a loading state, not a disabled one, and it must re-enable on failure.

## Match the waiting pattern to the wait

| Duration | Pattern |
| --- | --- |
| Under ~100ms | Nothing. A spinner that flashes is worse than no spinner |
| 100ms–1s | In-place indicator on the control that was pressed |
| 1s–5s | Skeleton matching the incoming layout, or a progress indicator |
| Over 5s | Progress with a sense of stage, and a way to cancel or leave |
| Unknown length | Indeterminate indicator. Never a fake progress bar |

Skeletons should match the shape of what arrives, so the layout does not jump. A skeleton that differs from the loaded content causes a reflow, which is worse than a spinner.

Reserve the space. The most common loading defect is content shifting as it arrives, and it is caused by not sizing the container until the data lands.

Add a small delay before showing a loading indicator — around 200–300ms — so fast responses never flash one.

## Stress the content

A component that works with demo data is untested. Before it ships, run it against:

- **Zero.** No items, no value, no avatar, no optional fields.
- **One.** Singular grammar, and layouts that assume a grid.
- **Many.** The realistic maximum, not three. A list that works at 5 and breaks at 500 will break in production.
- **Longest.** The longest name, title and label you actually see. German compounds and untruncated email addresses find most of these.
- **Shortest.** A single character, a one-word title.
- **Missing.** Every optional field absent at once.
- **Wrong.** A broken image, a null where a string was expected, a date in the past that should be future.

This is the highest-yield hour in component work, and it is the one skipped under deadline.

## Compose rather than configure

When a component accumulates boolean props — `isCompact`, `hasIcon`, `showBorder`, `variant`, `size`, `tone` — the combinations multiply past the point anyone can test them. Four booleans is sixteen states nobody has looked at.

Prefer composition: a component that accepts children or slots, so the consumer assembles what they need. Reserve props for genuinely enumerable variation — size, tone, one variant axis.

Signals it has gone wrong: a prop that only makes sense with another prop, a prop named after a specific use case, a prop that changes the component's semantic meaning. `design-systems` owns the API conventions.

## Evidence bar

State coverage is checkable. A component ships with a list of its states and a rendered example of each, or it ships untested — there is no middle position, and "we'll add the empty state later" reliably means never.

Focus visibility, contrast and announcement are measurable and belong to `accessibility`. Measure them rather than judging by eye.

Do not report a variant as missing without a use case that needs it. Component libraries grow by speculative variants, and each one is permanent maintenance.

Where a component has been stressed, say with what. "Tested with 500 rows and a 94-character title" is evidence; "handles long content" is a claim.

## Before you ship

| Symptom | What it means | Fix |
| --- | --- | --- |
| Only the default state exists in the design | The state set was not walked | Render every state; mark impossible ones with a reason |
| Empty state is a blank area | The best guidance moment wasted | Design it; `content-design` writes it |
| Error state has no recovery | Half a design | Give a working next action |
| A bulk action reports total failure | Partial success was never considered | Report what succeeded and how to retry the rest |
| `outline: none` with no replacement | Keyboard users lose the interface | `:focus-visible` with a visible indicator |
| Hover and focus share styling | Two input methods conflated | Separate them |
| A tapped item stays highlighted | `:hover` latched on touch | `@media (hover: hover)` |
| A disabled button with no explanation | The user cannot deduce why | Enable and explain, or show the reason |
| Layout jumps as content loads | Space not reserved | Size the container; match the skeleton |
| A spinner flashes on fast responses | No delay threshold | 200–300ms before showing |
| A progress bar sits at 90% | Fake progress | Indeterminate indicator |
| Tested with three items | The realistic maximum was never tried | Stress with zero, one, many, longest |
| Four boolean props | Sixteen untested combinations | Compose instead |

## Reporting

**Severity ladder:** `Critical` — a reachable state with no design, focus indicator removed, data loss on error · `Serious` — missing empty or error state, partial success unhandled, layout shift on load, disabled with no reason · `Moderate` — waiting pattern mismatched to duration, content stress failure at realistic limits · `Minor` — variant inconsistency with no functional cost.

**Verification:** the state set walked with each state either rendered or marked impossible with a reason; focus indicator present and measured; content stressed at zero, one, many, longest; hover behavior checked on touch; loading checked on a throttled connection.

**Format:**

1. **Anatomy** — parts, required and optional.
2. **API** — props, with the reason each is configurable.
3. **State matrix** — state by variant, each cell rendered, impossible, or a finding.
4. **Findings**, severity order, each naming the owning skill.
5. **Stress results** — what it was tested with, and where it broke.

**Done when:** every state in the matrix is either rendered or explained, the focus indicator survives, and the component has met data shaped like production data rather than like a mockup.
