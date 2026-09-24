---
name: design-engineering
description: Implements design in code with a CSS architecture that survives, a performance budget that is measured, and browser behavior accounted for rather than assumed. Use when building the interface or diagnosing why it feels wrong.
when_to_use: Use when implementing a design in code, structuring CSS or styling architecture, setting or checking a performance budget, diagnosing jank or layout shift or slow loads, handling browser and device differences, or bridging what the design says and what the platform does.
---

# Design engineering

This skill is where design becomes running code. It sits in the Build band, between `design-handoff` and `review-the-change`.

The governing idea: the browser already does most of this well. Most interface bugs come from fighting the platform — reimplementing scrolling, focus, form behavior or layout that already existed and worked.

**Works with:** `design-handoff` supplies the spec · `design-systems` supplies tokens and component contracts · `accessibility` supplies the requirements to implement · `motion-and-interaction` supplies what can be animated cheaply · `components-and-states` supplies the state set · `review-the-change` reviews the result.

## Start here

| The situation | Go to |
| --- | --- |
| Starting an implementation | **Use the platform first** below |
| CSS is becoming unmanageable | **Architecture that survives** below |
| The page feels slow | **Measure before optimizing** below |
| Animation janks | **What the compositor can do** below |
| Content jumps while loading | **Reserve space for everything async** below |
| It works here and breaks elsewhere | **Test the conditions users have** below |
| Implementing accessibility requirements | `accessibility` owns them; this skill implements them |
| Reviewing the diff | `review-the-change` |

## Use the platform first

Before building a behavior, check whether the browser already provides it. The list of things routinely reimplemented worse:

| Instead of building | Use |
| --- | --- |
| A custom modal with focus trapping | `<dialog>` |
| An accordion | `<details>` / `<summary>` |
| A custom select | `<select>`, or a combobox built on the ARIA pattern |
| Scroll position tracking for a sticky header | `position: sticky` |
| Intersection detection in a scroll handler | `IntersectionObserver` |
| Element resize detection | `ResizeObserver` |
| Popover positioning | Popover API and CSS anchor positioning where supported |
| Form validation from scratch | Constraint Validation API, styled |
| Lazy loading images | `loading="lazy"` |
| Aspect ratio boxes with padding hacks | `aspect-ratio` |
| A media-query mess for component width | Container queries |
| Focus-on-click suppression | `:focus-visible` |

Each platform feature arrives with keyboard support, assistive-technology semantics and behavior that matches user expectation. A reimplementation starts at zero on all three and regresses.

The legitimate reasons to build your own: the native element genuinely cannot be styled to the design, browser support does not reach your audience, or the behavior needed differs from the standard. All three are checkable claims rather than assumptions.

## Architecture that survives

Whatever the styling system, the properties that matter are the same: a change should be safe, the location of a style should be predictable, and deleting a component should delete its styles.

- **Colocate styles with the component.** Styles that live far from their markup are never deleted, and a stylesheet accumulates dead rules nobody dares remove.
- **Keep specificity flat.** Deep selectors and `!important` are the beginning of an arms race. A single class per element is enough in almost every case.
- **Use tokens, never raw values.** A hex or a pixel value in a component is a drift point. `design-systems` owns the token set.
- **Prefer composition over overrides.** Reaching into a component from outside to restyle it couples the two permanently.
- **Use logical properties** — `margin-inline-start` rather than `margin-left` — so the layout mirrors for RTL without a parallel stylesheet. `global-and-inclusive` owns why.
- **Use container queries** for component-level responsiveness. A component that responds to its container works wherever it is placed; one responding to the viewport only works where it was designed.
- **Let the browser do layout.** Grid and flexbox with intrinsic sizing need fewer breakpoints than fixed columns, and fail more gracefully.

## Measure before optimizing

Performance work done by intuition optimizes the wrong thing. Measure, fix the largest item, measure again.

Metrics worth holding a budget against:

| Metric | Target | Usually caused by |
| --- | --- | --- |
| Largest Contentful Paint | under 2.5s | Unoptimized hero image, render-blocking resources, lazy-loading what is above the fold |
| Interaction to Next Paint | under 200ms | Long tasks on the main thread, expensive re-renders |
| Cumulative Layout Shift | under 0.1 | Images and embeds without dimensions, fonts swapping, content injected above existing content |
| JavaScript transferred | Set a number and hold it | Dependencies added without measurement |

Set the budget as a number in CI so a regression fails a build rather than being noticed a quarter later. A budget nobody enforces is a preference.

Measure on hardware users have — a throttled CPU, a mid-range phone, a slow connection — not on the development machine, which is not representative of anything.

## What the compositor can do

`transform` and `opacity` animate on the compositor and stay smooth. Animating `width`, `height`, `top`, `left` or `margin` forces layout on every frame and produces jank on anything but a fast machine.

Where a size change is needed, prefer `transform: scale()` or the layout-animation APIs the project already uses. `will-change` is a narrow, temporary hint — left on permanently it costs memory and can make things worse.

Long tasks on the main thread block input, which is what most "it feels slow" reports actually are. Break them up, move work off the main thread, or do less. `motion-and-interaction` owns the durations and curves; this skill owns whether the browser can hit them.

## Reserve space for everything async

Layout shift is the most user-hostile and most preventable performance defect: content moves while someone is reading or reaching for a control.

- `width` and `height` attributes or `aspect-ratio` on every image, video and embed.
- Skeletons that match the dimensions of what arrives — `components-and-states` owns the pattern.
- `font-display: swap` with a fallback metric-matched closely enough that the swap does not reflow.
- Never insert content above existing content after load. Banners, notices and ad slots are the usual culprits; reserve the space or insert below.

## Test the conditions users have

"Works on my machine" covers a fraction of the audience.

- **Throttled CPU and network**, every time performance is claimed.
- **A real phone**, not a resized desktop window. Touch behavior, keyboard overlay, safe areas and viewport units all differ.
- **Keyboard only**, for the primary task. `accessibility` owns the walkthrough.
- **200% zoom and 320px width.**
- **Both themes**, if the product has them.
- **RTL**, if it is supported or will be.
- **Reduced motion enabled.**
- **Slow or failed responses** — throttle the API, not only the network, and see what the interface does.

Mobile viewport units are worth knowing specifically: `100vh` does not account for browser chrome that appears and disappears. Use `100dvh` where the intent is the visible area, and `svh`/`lvh` where stable sizing matters more than accuracy.

## Handle the failure path in code, not only in design

The spec says what should happen when a request fails. The implementation is where it usually does not.

- Every request has a timeout, a failure branch and a retry path where retry is safe.
- Failure preserves user input. Always.
- Idempotent handling of double submission, server-side as well as in the UI.
- Partial success reported as partial, not as total failure.
- Optimistic updates roll back visibly when the server disagrees, rather than silently diverging.

`user-flows` owns which failures exist; this skill owns that each one has code behind it.

## Evidence bar

Performance claims require a measurement and the conditions it was taken under. "It's fast" is not a finding and neither is "it feels slow" — report the metric, the number and the device.

Browser support claims are checkable. State the feature and the baseline rather than asserting a feature is unusable; support data changes, and decisions made on stale assumptions cost more than the feature would have.

Accessibility implementation is verified by operating the interface, not by reading the markup. `accessibility` owns the method.

Architectural preferences — a styling library, a state approach, a file layout — are preferences unless you can name the cost. A finding is "this component cannot be deleted without hunting styles in four files", not "I would have used a different approach".

Where the design cannot be implemented as specified, say so with the cost and an alternative, and route it back through `design-handoff`. Silently approximating the design is how a build ends up wrong in ways nobody decided on.

## Before you ship

| Symptom | What it means | Fix |
| --- | --- | --- |
| A custom modal, select or accordion | Rebuilding platform behavior at zero | Use the native element or the standard pattern |
| `!important` appearing | Specificity arms race started | Flatten selectors |
| Hex and pixel values in components | Drift points | Tokens |
| `margin-left` throughout | Will not mirror for RTL | Logical properties |
| Viewport media queries for a component | Only works where it was designed | Container queries |
| Animation janks on a phone | A layout property is animating | `transform` and `opacity` |
| `will-change` left on permanently | Costs memory, may slow things | Apply narrowly and remove |
| Content jumps as it loads | Space not reserved | Dimensions or `aspect-ratio` |
| A banner inserts above content after load | Everything moves under the reader | Reserve space or insert below |
| `100vh` on mobile | Browser chrome is not accounted for | `100dvh` |
| Performance verified on the dev machine | Not representative | Throttle CPU and network |
| No performance budget in CI | Regressions surface a quarter late | Set a number, fail the build |
| Input lost when a request fails | The failure path was not implemented | Preserve input; add the branch |
| Double submission creates duplicates | No idempotency | Guard client and server |
| The design was approximated silently | Nobody decided on the result | Route back through `design-handoff` |

## Reporting

**Severity ladder:** `Critical` — data loss, a control unreachable by keyboard, a failure path with no code behind it, a budget breach that makes the product unusable on target hardware · `Serious` — jank on target devices, layout shift above threshold, reimplemented platform behavior missing keyboard or assistive support · `Moderate` — architectural coupling that makes change unsafe, raw values bypassing tokens, missing container-query scoping · `Minor` — style inconsistency with no functional cost.

**Verification:** measured on throttled CPU and network with the device named; keyboard walk completed; both themes and RTL checked where supported; failure paths exercised by throttling the API; budget numbers recorded.

**Format:** findings by principle, severity order, each with the measurement and the conditions, the file and line, and the fix in the project's own system. Where the finding is that the design cannot be built as specified, state the cost and propose the alternative rather than reporting it as a defect.

**Done when:** every performance claim carries a number and a device, the failure paths have been exercised rather than read, and nothing reimplements a platform behavior without a stated reason.
