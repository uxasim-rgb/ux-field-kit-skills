---
name: accessibility
description: Owns the measurable accessibility requirements — keyboard, focus, ARIA, screen readers, hit areas, contrast thresholds, zoom and motion safety — that every other skill cites. Use alongside any build, never as a final pass.
when_to_use: Use when checking or building for accessibility, a11y, WCAG compliance, keyboard navigation, focus management, ARIA roles and labels, screen reader support, color contrast thresholds, touch target size, zoom and reflow, or reduced motion requirements.
---

# Accessibility

This skill holds the thresholds and requirements the rest of the collection cites. It sits in the Inclusive band, which runs alongside Structure, Craft and Build rather than after them.

The governing idea: most accessibility defects are subtractions. Someone took away an outline, replaced a native control with a styled div, or deleted a label during a refactor. The baseline the browser hands you is largely correct, so the work is mostly about not undoing it.

**Works with:** every Craft skill cites the thresholds here · `forms-and-input` owns field behavior, this skill owns its requirements · `components-and-states` owns state design, this skill owns announcement · `global-and-inclusive` owns language, script and cognitive load · `design-engineering` owns implementation.

## Start here

| The situation | Go to |
| --- | --- |
| You need a specific threshold | [Thresholds](thresholds.md) — contrast, target size, zoom, timing |
| Running an audit | [Testing](testing.md) — the order to test in, and with what |
| Building a custom control | **Use the platform, or accept the whole job** below |
| Focus is going somewhere wrong | **Focus is the keyboard user's cursor** below |
| Deciding whether ARIA is needed | **The first rule of ARIA is not to use it** below |
| A modal, menu or drawer | **Manage focus across boundaries** below |
| Checking contrast | [Thresholds](thresholds.md); `color-and-theming` computes it |
| Motion and vestibular safety | **Motion safety is a requirement** below |

## Role lens

| Role | Takes from this skill |
| --- | --- |
| Design engineer | The implementation requirements and the testing order |
| UI designer | Contrast, target size, focus visibility and state-not-by-color-alone, at design time |
| UX researcher | How to include disabled participants, and what assistive-technology testing does and does not prove |
| Product designer | That this is a constraint on scope, not a phase — retrofitting costs several times more |

## Use the platform, or accept the whole job

A native `<button>` arrives with focus, Enter and Space handling, a role, and form semantics. A `<div onClick>` arrives with none of them, and rebuilding all four correctly is a day of work that will regress the next time someone refactors it.

| Element | Use for | You get free |
| --- | --- | --- |
| `<a href>` | Navigation that changes the URL | Focus, Enter, open-in-new-tab, copy link |
| `<button>` | An action | Focus, Enter and Space, disabled semantics |
| `<input>`, `<select>`, `<textarea>` | Data entry | Labels, validation hooks, mobile keyboards, autofill |
| `<dialog>` | Modals | Focus trapping, Escape, inert background |
| `<details>` | Disclosure | Keyboard, state announcement |
| `<table>` with headers | Tabular data | Row and column association |

Choosing a `<div>` because the native element is hard to style is the most expensive styling decision available. Nearly all native controls can be styled to any design; the cases that genuinely cannot are few and worth knowing before assuming.

If you build a custom control, you own the full behavior contract: role, accessible name, state, keyboard interaction matching platform convention, and focus management. Take the pattern from the ARIA Authoring Practices rather than inventing it — users have expectations for how a combobox responds to arrow keys.

## Everything works from the keyboard

Every interactive element must be reachable by Tab, operable by Enter or Space, and dismissible by Escape where it is transient.

- **Tab order follows visual order.** Where they diverge, fix the DOM order rather than adding `tabindex` values. Positive `tabindex` creates a separate tab sequence and is nearly always a bug.
- **No keyboard traps.** Focus must be able to leave anything it can enter. The exception is a modal, which traps deliberately and releases on close.
- **Skip links** on pages with substantial repeated navigation, so keyboard users are not tabbing through the same 30 links on every page.
- **Custom controls match platform conventions.** Arrow keys move within a composite widget; Tab moves between widgets. A menu that requires Tab to move between its items is wrong.
- **Drag-and-drop needs a keyboard equivalent.** This is a requirement, not an enhancement.

Test it by unplugging the mouse and completing the primary task. That is the whole method, and it finds more than any automated tool.

## Focus is the keyboard user's cursor

A keyboard user who cannot see focus cannot use the interface. This is the single most common regression in a design system.

- **Style `:focus-visible`, never bare `:focus`.** `:focus-visible` shows for keyboard and assistive technology and stays hidden on mouse click, which is the behavior people are usually trying to achieve when they remove the ring.
- **Never `outline: none` without a replacement** of at least equal visibility. If you take the ring away, you own providing another.
- **The indicator needs 3:1 contrast** against what is adjacent to it, and it must not be clipped or obscured by other content — an indicator hidden under a sticky header is a failure.
- **Give it room.** `outline-offset: 2px` keeps the ring from merging with the element's own border.

## Manage focus across boundaries

When the interface changes substantially, focus has to be moved deliberately, or the keyboard user is left somewhere that no longer exists.

| Event | Focus goes to |
| --- | --- |
| Modal opens | The dialog, or its first meaningful control — not the close button by default |
| Modal closes | The element that opened it |
| Content loads into a region | The region, or its heading, with an announcement |
| A form fails validation | The error summary, which links to each field |
| An item is deleted from a list | The next item, or the list itself — never nowhere |
| Route change in a single-page app | The new page's main heading |

The deletion case is the one most often missed: removing the focused element sends focus to `<body>`, and the user loses their place entirely.

While a modal is open, the background must be inert — not merely visually covered. Content behind an overlay that is still reachable by Tab is a common and confusing failure.

## The first rule of ARIA is not to use it

ARIA does not add behavior. It changes what assistive technology announces, and incorrect ARIA is worse than none because it actively misreports the interface.

The rules, in priority order:

1. If a native element does the job, use it. Do not add ARIA.
2. Do not change native semantics unless you must. `<button role="heading">` is almost always wrong.
3. Every interactive ARIA control must be keyboard-operable.
4. Never put `aria-hidden="true"` on a focusable element — it creates a control that can be focused but not announced.
5. Every interactive element needs an accessible name.

Accessible names come from visible text where possible, then `aria-labelledby` pointing at visible text, then `aria-label` as a last resort — it is invisible, so it silently drifts from the visible label over time.

`aria-live` regions announce changes: `polite` for status, `assertive` only for genuinely urgent interruptions. The region must exist in the DOM before the content arrives, or nothing is announced.

## Do not carry meaning by color alone

A status shown only by color is unavailable to a substantial share of users, and it disappears in grayscale and in bright sunlight.

Pair color with an icon, a label, a shape or a position. Check by viewing the interface in grayscale; anything that becomes ambiguous is a finding. `color-and-theming` owns generating the palette; the requirement is here.

## Hit areas, zoom and reflow have numbers

All in [thresholds](thresholds.md). The ones worth knowing without looking:

- **24×24 CSS pixels** is the WCAG 2.2 AA floor for a target, with documented exceptions. **44px** is the recommended size for primary touch targets.
- **200% zoom** must not lose content or function. **400% zoom** at 1280px wide must reflow without horizontal scrolling.
- **4.5:1** for body text, **3:1** for large text and for UI components and focus indicators.

Size the target independently of the graphic. A 16px glyph inside a 44px button is correct; a 44px glyph is not. Add the difference as padding on the control, or as a pseudo-element on whatever wraps it, and pull it back wherever it would touch a neighbouring target.

## Motion safety is a requirement

`prefers-reduced-motion: reduce` is a request to avoid large or unexpected movement, which can cause genuine nausea and dizziness. Replace large translations and scales with cross-fades rather than removing all feedback.

Anything that moves, blinks or scrolls automatically for more than five seconds needs a pause control. Content that flashes more than three times per second is a seizure risk and is a hard failure with no exceptions.

`motion-and-interaction` owns the craft; the requirement is here.

## Evidence bar

Accessibility findings are mostly measurable, which makes this the one review that should never be arguable.

**Measure, never estimate:** contrast ratios, target sizes in CSS pixels, zoom and reflow behavior, flash frequency. Report the number and the threshold it misses.

**State the method.** "Fails keyboard operation" means you tried it with the keyboard. "No accessible name" means you inspected the accessibility tree. A finding reported from reading the code is weaker than one reported from operating the interface, and should say which it is.

**Automated tools find a minority of issues.** They are a first pass, not an audit. A page that passes axe can be completely unusable by keyboard. Never report "no issues found" on the strength of a tool run.

**Do not speak for disabled users you did not talk to.** Conformance is not usability. Where the claim is about experience rather than about a criterion, it needs participants — `research-planning` covers recruiting them, and doing so is worth more than any audit.

Where a criterion genuinely does not apply, say why rather than marking it passed.

## Before you ship

| Symptom | What it means | Fix |
| --- | --- | --- |
| `outline: none` with no replacement | Keyboard users lose their cursor | `:focus-visible` with a visible indicator |
| A `<div onClick>` | No role, no focus, no keyboard | `<button>` |
| Focus jumps across the screen | Visual order differs from DOM order | Fix source order; never positive `tabindex` |
| Focus goes to `<body>` after delete | The user lost their place | Move to the next item or the list |
| The background is reachable behind a modal | Not inert, only covered | Make it inert |
| `aria-label` disagrees with the visible label | Invisible text drifted | Use visible text via `aria-labelledby` |
| `aria-hidden` on something focusable | Focusable but unannounced | Remove one or the other |
| A live region added at the same time as its content | Nothing is announced | Render the region first |
| Status shown only by color | Unavailable to many users | Add an icon or label |
| Contrast judged by eye | Unreliable | Compute it; report the ratio |
| A 16px icon button | Below the 24px floor | Expand the hit area, not the icon |
| Content lost at 200% zoom | Fixed sizing | Reflow; `layout-and-composition` |
| Drag-and-drop with no keyboard path | Requirement, not enhancement | Add one |
| Reduced motion strips all feedback | State changes become unfollowable | Cross-fade instead |
| "Passed the automated scan" | A minority of issues are detectable | Keyboard walk and screen-reader pass |

## Reporting

**Severity ladder:** `Critical` — content or function unreachable by keyboard or assistive technology, a keyboard trap, flashing above threshold, data loss with no accessible path · `Serious` — a WCAG A or AA criterion failed with a workaround available · `Moderate` — AA failure on a secondary path, or an AAA criterion the product claims · `Minor` — usability friction for assistive-technology users that violates no criterion.

**Verification before reporting:** keyboard walk completed on the primary task; screen-reader pass on at least one platform; contrast computed; target sizes measured; zoom checked at 200% and reflow at 400%; automated scan run *and* named as insufficient.

**Format:**

1. **Scope** — what was tested, with what assistive technology and version, and what was not covered.
2. **Method** — operated, inspected, or read. Per finding where they differ.
3. **Findings**, severity order, each with: the WCAG criterion, the measured value against the threshold, where it occurs, who it affects and how, and the fix.
4. **Not applicable** — criteria that do not apply, with the reason.
5. **Limits** — the standing note that conformance is not usability, and whether disabled participants were involved.

**Done when:** every finding cites a criterion and a measured value, the method is stated, and no conformance claim rests on an automated scan alone.
