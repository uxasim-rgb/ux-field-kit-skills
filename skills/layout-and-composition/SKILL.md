---
name: layout-and-composition
description: Arranges a screen so hierarchy, grouping and reading order are readable before any word is. Covers spacing scales, alignment, density and responsive behavior. Use when a screen feels cluttered or the eye does not know where to go.
when_to_use: Use when laying out a page or component, setting a spacing scale, fixing cluttered or busy screens, deciding what collapses on small screens, aligning controls, establishing visual hierarchy, or when someone says a design feels cramped, unbalanced or hard to scan.
---

# Layout and composition

This skill arranges things on a surface so their relationships are visible without reading. It opens the Craft band.

The governing idea: proximity is the strongest grouping signal available, and most cluttered screens are not too dense — they are evenly spaced, so nothing looks related to anything.

**Works with:** `information-architecture` owns what belongs on the screen at all · `typography` owns text measure and line-height · `components-and-states` owns the internals of a component · `accessibility` owns reading order, zoom and hit areas · `global-and-inclusive` owns RTL and text expansion · `design-systems` owns the scale as a token set.

## Start here

| The situation | Go to |
| --- | --- |
| The screen feels cluttered | **Space unevenly on purpose** below — usually the cause |
| The eye does not know where to start | **Give one thing primacy** below |
| Too much is on the screen | `information-architecture` first — layout cannot fix a content problem |
| Controls look subtly misaligned | **Align to one edge, optically** below |
| Deciding what happens on mobile | **Change the layout, not just the width** below |
| A professional tool feels too sparse | **Density is a decision, not a default** below |
| Text is hard to read | `typography` |
| The order is wrong for a screen reader | `accessibility` — DOM order owns it |

## Space unevenly on purpose

Even spacing is the most common cause of a screen that reads as cluttered. When the gap between a label and its field equals the gap between two unrelated sections, the eye gets no grouping information and has to read everything to find structure.

The rule: **space within a group is smaller than space around it**, and the difference should be obvious rather than subtle. A 1.5× difference reads as a mistake; 2× or more reads as intent.

| Relationship | Typical gap |
| --- | --- |
| Label to its control | 4–8px |
| Items inside one group | 8–12px |
| Between groups in a section | 24–32px |
| Between sections | 48–64px |
| Page top and bottom padding | 48–96px |

These are starting points for a product with no established density system. Where a project has a scale, use it as written.

Proximity beats borders, backgrounds and dividers. Reach for space first; add a card or a rule only when space alone cannot carry the grouping — typically when two groups must sit side by side.

## Use a spacing scale and never a value outside it

Pick a base unit — 4px is the common choice, 8px for lower-density products — and derive everything from it: 4, 8, 12, 16, 24, 32, 48, 64, 96.

A scale does two things. It removes a decision from every layout choice, and it makes inconsistency visible: a 13px gap in a 4px system stands out in review in a way that "slightly too tight" never does.

One-off values are the beginning of the end of a system. Where a value outside the scale is genuinely needed — optical correction on an icon, a fixed asset size — mark it as an exception in the code with a reason, rather than leaving it to look like drift. `design-systems` owns the scale as tokens.

## Give one thing primacy

Every screen answers one primary question or supports one primary action. If everything is emphasized, nothing is, and the user has to read the whole screen to find the point.

Rank the content, then let the ranking show through size, weight, color and position — but not all four at once. One or two signals is usually enough, and using all of them on the same element makes everything else look broken.

The squint test remains the fastest check: blur the screen until words are unreadable and see what still stands out. If the primary action is not among the first things visible, the hierarchy is not working.

Emphasis is relative. A screen with four "primary" buttons has none. Where several actions are genuinely equal, that is usually a sign the screen is doing too much — back to `information-architecture`.

## Align to one edge, optically

Shared alignment edges are what make a layout feel deliberate. Every element should align to something; an element aligned to nothing reads as an accident.

Prefer a small number of alignment edges over many. Two or three vertical edges on a screen is coherent; seven is noise.

Left-align text in left-to-right languages. Centered text is acceptable for short headings and empty states; a centered paragraph forces the eye to find a new start position on every line.

Optical alignment beats mathematical alignment where the shape is irregular. A triangular play icon centered by its bounding box looks left-heavy and needs nudging right; round shapes need to overshoot a flat edge slightly to look aligned. Trust the eye over the number here — this is one of the few places where measurement is wrong.

## Density is a decision, not a default

Generous space is not universally better. A trading terminal, a code editor, an admin table and a logging tool are used for hours by people who want more on screen, and applying marketing-page spacing to them makes the product worse.

Decide density from the task:

| Task | Density |
| --- | --- |
| Reading, deciding, first-time use | Generous |
| Comparing many items | Medium, with strong alignment |
| Scanning and operating all day | Dense, with grouping carried by alignment rather than space |

Where density is high, grouping has to come from alignment, rules and subtle background shifts instead of large gaps. Density does not excuse losing hit-area minimums — `accessibility` owns those and they are not negotiable at any density.

## Change the layout, not just the width

Responsive design is not one layout getting narrower. At some point the arrangement itself has to change: columns stack, a sidebar becomes a sheet, a table becomes a list of cards, a toolbar collapses into a menu.

- **Set breakpoints where the content breaks**, not at device names. Resize until the layout looks wrong; that is a breakpoint.
- **Reflow rather than shrink.** Text that scales down to fit fails at the extremes and fails accessibility zoom.
- **Nothing horizontal below 320px.** Horizontal scroll on a page is a defect; horizontal scroll inside a deliberately scrollable region such as a wide table is fine, and should be discoverable.
- **Test at 200% zoom**, which is a WCAG requirement and behaves like a narrow viewport. `accessibility` owns the threshold.
- **Prefer intrinsic sizing.** Layouts built on content-driven wrapping need fewer breakpoints than layouts built on fixed columns.

Mobile is not a reduced desktop. Decide what the primary action is at small sizes and give it room; the thing that was a secondary link on desktop may be the main action on a phone.

## Keep DOM order and visual order the same

Visual reordering that does not match source order breaks keyboard navigation and screen reader flow: focus jumps across the screen unpredictably, and content is announced in an order that does not match what is seen.

Where the design requires a different visual order at some breakpoint, change the source order rather than reordering visually, or reconsider the design. `accessibility` owns the requirement; it is named here because layout is where it gets broken.

## Evidence bar

Spacing decisions are checkable against a scale. A value outside the scale is a finding, not a preference, and can be reported as one.

Hierarchy is checkable by the squint test and by asking someone unfamiliar what the screen is for and what they would do. Where they hesitate, that is evidence; where you simply prefer a different arrangement, that is not.

Contrast, hit area, zoom behavior and reading order are measurable and belong to `accessibility`. Measure them rather than judging by eye, and report the measurement.

Do not report density as a problem without naming the task. A dense professional tool is not a finding, and reviewing one against consumer-app spacing is the fastest way for a review to be dismissed entirely.

## Before you ship

| Symptom | What it means | Fix |
| --- | --- | --- |
| The screen reads as cluttered but is not full | Spacing is even, so nothing groups | Make within-group gaps at least 2× smaller than around-group |
| Gaps are 13px, 18px, 22px | No scale, or a scale being ignored | Adopt one; mark genuine exceptions with a reason |
| Four buttons look primary | Emphasis is relative and has been spent | One primary; check whether the screen does too much |
| Nothing stands out when squinted | No hierarchy | Rank the content, apply one or two emphasis signals |
| Borders and cards everywhere | Space was not tried first | Remove containers, increase separation |
| Seven alignment edges | Reads as accidental | Reduce to two or three |
| An icon looks off-center though the box is centered | Mathematical alignment on an irregular shape | Align optically |
| Breakpoints are named after devices | They will not match where content breaks | Resize until it looks wrong; break there |
| Text shrinks to fit on mobile | Fails at the extremes and at zoom | Reflow instead |
| Horizontal scroll at 320px | Layout does not reflow | Fix; only deliberate scroll regions may scroll |
| Visual order differs from DOM order | Keyboard and screen reader order is now wrong | Change source order instead |
| A dense admin tool was reviewed as too tight | Density judged without the task | Name the task; re-review |

## Reporting

**Severity ladder:** `Critical` — content unreachable, horizontal scroll at 320px, layout breaking at 200% zoom, focus order scrambled by visual reordering · `Serious` — hierarchy that hides the primary action, grouping that contradicts the content structure · `Moderate` — off-scale spacing, inconsistent alignment, density mismatched to the task · `Minor` — optical alignment, single-instance inconsistency.

**Verification:** squint test performed; spacing values checked against the scale; layout checked at 320px and at 200% zoom; DOM order compared with visual order; density checked against the task.

**Format:** findings grouped by the principle they violate, severity order, each with where it occurs, what it costs the reader, and the fix in the project's own styling system. Where the fix belongs elsewhere — too much content, unreadable text, insufficient contrast — name `information-architecture`, `typography` or `accessibility` rather than solving it here.

**Done when:** the primary action survives the squint test, every spacing value is on the scale or marked as a deliberate exception, and the layout has been checked at both extremes rather than at the design width.
