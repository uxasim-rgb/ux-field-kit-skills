# Thresholds

The numbers other skills cite. All figures are WCAG 2.2 unless noted. CSS pixels throughout.

## Contrast

| What | AA | AAA |
| --- | --- | --- |
| Body text — under 18.66px regular, or under 14px bold | 4.5:1 | 7:1 |
| Large text — 18.66px+ regular, or 14px+ bold | 3:1 | 4.5:1 |
| UI components — control boundaries, input borders, icons that carry meaning | 3:1 | — |
| Focus indicators | 3:1 against adjacent colors | — |
| Graphical objects needed to understand content | 3:1 | — |
| Disabled controls | Exempt | — |
| Logotypes | Exempt | — |
| Decorative, purely aesthetic, or invisible | Exempt | — |

**Check the pair that actually renders.** Text on a card is measured against the card, not the page. Text over a gradient is measured at its worst point. Text on a translucent surface is measured against the composited result. Hover and active backgrounds are separate pairs.

**Disabled controls are exempt and should still be legible.** A user who cannot read a disabled field cannot tell what it is for. Aim for 3:1.

Contrast is computed from relative luminance. Never estimate it — `color-and-theming` owns the computation.

## Target size

| Standard | Minimum |
| --- | --- |
| WCAG 2.5.8 (AA, 2.2) | 24×24 — the conformance floor |
| WCAG 2.5.5 (AAA) | 44×44 |
| Apple HIG | 44×44pt |
| Material Design | 48×48dp |

Treat **44px** as the recommended size for primary touch targets and **40px** as a workable desktop target where density permits.

A target under 24×24 is not automatically a failure. The documented exceptions:

- **Spacing** — passes if a 24px-diameter circle centered on the target intersects no other target's circle. In practice, 20px targets need a 4px gap.
- **Equivalent** — another control on the same page does the same thing and meets the size.
- **Inline** — the target sits within a sentence or is constrained by the line height.
- **User agent** — the size is determined by the browser and not modified.
- **Essential** — a specific presentation is legally required or essential to the information, such as a point on a map.

The visible element may be smaller than the hit area. Put the extra size on whatever wraps the control, as padding or a pseudo-element. It cannot go on the `<input>` itself: replaced elements do not render `::before` and `::after` dependably.

Two expanded targets must never overlap. Where they would, reduce whichever can afford it until they do not touch — an overlap means one control is stealing taps meant for the other.

## Zoom and reflow

| Criterion | Requirement |
| --- | --- |
| 1.4.4 Resize text (AA) | Text resizable to 200% with no loss of content or function |
| 1.4.10 Reflow (AA) | At 320 CSS px wide (equivalent to 400% zoom at 1280px), no two-dimensional scrolling |
| 1.4.12 Text spacing (AA) | No loss of content when line-height is set to 1.5×, paragraph spacing 2×, letter-spacing 0.12×, word-spacing 0.16× |

Two-dimensional scrolling is permitted for content that genuinely requires it — data tables, maps, diagrams, code. A page requiring horizontal scroll to read a paragraph is a failure.

Never disable zoom. `user-scalable=no` and `maximum-scale=1` in the viewport meta tag are accessibility failures.

Test 1.4.12 by injecting the text-spacing values as a stylesheet. Fixed-height containers are where this fails, and it is invisible until tested.

## Timing

| Criterion | Requirement |
| --- | --- |
| 2.2.1 Timing adjustable (A) | Time limits must be adjustable, extendable, or turned off |
| 2.2.2 Pause, stop, hide (A) | Anything moving, blinking or auto-updating for more than 5 seconds needs a pause control |
| 2.3.1 Three flashes (A) | Nothing flashes more than 3 times per second |

The flash threshold is a seizure risk and has no exceptions. It applies to video content, animated transitions and rapidly updating interfaces alike.

Session timeouts need a warning with at least 20 seconds to respond, and an option to extend. A session that expires silently and discards a form is both a timing failure and a data-loss failure.

## Text size

WCAG sets no minimum font size, but two thresholds follow from other criteria:

- **Below ~12px**, the contrast requirement effectively tightens because thin strokes render poorly, and zoom becomes necessary rather than optional.
- **14px** is a practical floor for body text on the web; **16px** avoids automatic zoom on iOS form fields.

`typography` owns the scale; this is the constraint it works within.

## Motion

| Preference | Behavior |
| --- | --- |
| `prefers-reduced-motion: reduce` | Avoid large translations, scale changes, parallax, and auto-playing movement. Replace with cross-fades |
| 2.3.3 Animation from interactions (AAA) | Motion triggered by interaction can be disabled unless essential |

Reduced motion is not "no motion". Removing all transitions can make state changes harder to follow, which works against the users it is meant to help.

## Headings and structure

- One `<h1>` per page, describing the page.
- No skipped levels — an `<h3>` directly under an `<h1>` is a structural failure.
- Headings describe the section, not the styling. Never choose a level for its size; style it instead.
- Landmark regions — `<main>`, `<nav>`, `<header>`, `<footer>`, `<aside>` — present once each where applicable, with `aria-label` where a type repeats.

Screen reader users navigate by heading more than by any other method. A page with one heading and twelve styled divs is unnavigable.

## Forms

| Requirement | Criterion |
| --- | --- |
| Every control has a programmatic label | 3.3.2, 4.1.2 |
| Errors identified in text, not only by color or icon | 3.3.1 |
| Error suggestions provided where known | 3.3.3 |
| Reversible, checked or confirmed for legal, financial or data-deleting actions | 3.3.4 |
| Purpose of common inputs programmatically determined — `autocomplete` | 1.3.5 |
| Redundant entry avoided — do not ask for the same information twice in one process | 3.3.7 (2.2) |
| Accessible authentication — no cognitive function test without an alternative | 3.3.8 (2.2) |

3.3.8 is newer and frequently missed: requiring a user to transcribe, memorize or solve a puzzle to log in fails unless an alternative exists. Allowing paste into password fields is part of meeting it.

## Accessible names

Priority order for naming a control:

1. Visible text content.
2. `aria-labelledby` pointing at visible text.
3. `aria-label`, as a last resort.

`aria-label` is invisible, so it drifts from the visible label over time and cannot be spotted in review. Where visible text exists, use it.

The accessible name must contain the visible label text — WCAG 2.5.3 Label in Name. A button reading "Send" with `aria-label="Submit form"` breaks voice control, because the user says "click Send" and nothing matches.

## What automated tools catch

Roughly 30–40% of issues, and none of the ones that matter most: whether the keyboard path is sensible, whether the announcement makes sense, whether focus goes somewhere useful, whether the alt text is correct rather than merely present.

Use them as a first pass to clear the mechanical failures, then test by operating the interface. Never report conformance on the strength of a scan.
