---
name: typography
description: Sets type scales, measure, line-height and wrapping so text is comfortable to read at every size, and handles truncation, variable fonts and OpenType features. Use when text feels cramped, hard to scan or wraps badly.
when_to_use: Use when choosing fonts, building a type scale, setting line-height or letter-spacing, fixing heading hierarchy, handling text wrapping or truncation or widows, using variable fonts or OpenType features, or when text feels hard to read.
---

# Typography

This skill governs how text is sized, spaced and broken. It sits in the Craft band.

The governing idea: text does different jobs, and each job has its own settings. The most common failure is one scale and one line-height applied to everything — a column header, a paragraph of running prose and a hero headline each need different treatment, and giving them the same treatment makes at least two of them wrong.

**Works with:** `layout-and-composition` owns the space around text blocks · `content-design` owns the words · `accessibility` owns minimum sizes, contrast and zoom · `global-and-inclusive` owns scripts, text expansion and language-specific rules · `design-systems` owns the scale as tokens · `color-and-theming` owns text color.

## Start here

| The situation | Go to |
| --- | --- |
| Building a scale from nothing | **Build a scale with real steps** below |
| Long text is tiring to read | **Measure first, then line-height** below |
| Headings do not read as a hierarchy | **Separate steps by more than one notch** below |
| Text wraps badly or leaves a single word | **Control the breaks** below |
| Something needs truncating | **Truncate last** below |
| Choosing a typeface | **Choose for the job** below |
| Text is too small or low contrast | `accessibility` — it owns the thresholds |
| The text will be translated | `global-and-inclusive` |

## Choose for the job, and default to fewer families

One typeface, used across several weights and sizes, will outperform two chosen for contrast in most products. A second family earns its place only when it does a job the first cannot — a monospace for code and data, or a display face for a marketing surface that the product UI does not share.

What to check before committing:

- **The weights and styles you need actually exist**, including italic if you will use it. Synthesized bold and oblique look wrong and render inconsistently.
- **The numerals suit the job.** Interfaces with tables or changing figures need tabular figures; proportional numerals in a table make columns jitter.
- **The character set covers your languages.** `global-and-inclusive` owns this and it disqualifies fonts late in the process if unchecked.
- **The file size is acceptable.** Subset to the characters you use, serve WOFF2, and preload only what renders above the fold.
- **It is legible at your smallest size**, checked on a real screen rather than in the specimen.

For body text at small sizes, generous x-height and open apertures matter more than personality. A face that looks characterful at 48px can be unreadable at 13px.

## Build a scale with real steps

Pick a base size — 16px is the web default and a reasonable body size — and build steps that are distinguishable.

A ratio between 1.2 and 1.25 suits dense interfaces; 1.25 to 1.333 suits content-led pages. Round to whole pixels and adjust by eye rather than shipping the raw geometric output.

A workable interface scale:

| Role | Size | Line-height |
| --- | --- | --- |
| Caption, metadata | 12–13px | 1.4 |
| Body small, dense UI | 14px | 1.5 |
| Body | 16px | 1.5–1.6 |
| Lead, large body | 18–20px | 1.5 |
| Heading small | 20–24px | 1.3 |
| Heading medium | 28–32px | 1.2 |
| Heading large | 40–48px | 1.1 |
| Display | 56px+ | 1.0–1.1 |

Note the inverse relationship: **as size goes up, line-height comes down**. A 48px heading at 1.5 line-height looks like separate lines rather than one heading. A 14px body at 1.2 is cramped.

Never go below 12px for anything a user must read, and 14px is a better floor for body text on the web. `accessibility` owns the requirement that text can be zoomed to 200% without loss.

## Separate steps by more than one notch

Adjacent scale steps do not read as a hierarchy. A 16px body under an 18px heading looks like an inconsistency rather than a level.

When a heading and its body need to be distinguishable, skip a step — or carry the distinction with weight and color rather than size alone. Size, weight and color together on the same element is usually one signal too many; two is enough.

Use no more than three or four levels on a single screen. More than that and the reader stops perceiving them as ranked.

## Measure first, then line-height

**Measure** — the number of characters per line — is the strongest determinant of reading comfort, and it is the one most often left unconstrained.

| Content | Characters per line |
| --- | --- |
| Long-form reading | 60–75 |
| Interface body text | 50–75 |
| Captions, short blocks | 40–60 |
| Absolute maximum | ~90 |

Constrain with `max-width` in `ch` units, which tracks the font rather than guessing: `max-width: 70ch`. A full-width paragraph on a wide screen is the single most common typographic failure in interfaces, and it is one line of CSS.

Line-height then adapts to measure: longer lines need more leading so the eye can find the next line. A 75-character line at 1.4 is harder to read than the same line at 1.6.

Unitless line-height (`1.5`) rather than a fixed value, so it scales with inherited size.

## Adjust letter-spacing only at the extremes

Body text at body size needs no tracking; the typeface was drawn for it. Two legitimate exceptions:

- **Large display sizes** — tighten slightly, roughly −0.01em to −0.03em. Type drawn for text looks loose at 48px and above.
- **Uppercase and small caps** — loosen, roughly +0.05em to +0.1em. Capitals were not designed to sit together at text spacing.

Never letter-space to fill a space or to create an effect in body copy. It reduces reading speed measurably.

## Control the breaks

Bad wrapping is what separates typography that has been set from typography that has been left alone.

- **Headings:** `text-wrap: balance` distributes lines evenly and prevents a single trailing word. Use on headings and short blocks; it is capped at a handful of lines and is not for body copy.
- **Body:** `text-wrap: pretty` prevents widows and improves the last few lines without the cost of balancing a long paragraph.
- **Never break a unit:** use a non-breaking space between a number and its unit, a name and its title, and inside anything that should read as one token — `10&nbsp;MB`, `Figure&nbsp;3`.
- **Long unbroken strings** — URLs, tokens, IDs — need `overflow-wrap: break-word` or they will force horizontal scroll. `word-break: break-all` is too aggressive for prose.
- **Hyphenation** is worth enabling in narrow columns with justified or long text; it needs the correct `lang` attribute to hyphenate correctly, which `global-and-inclusive` owns.

Avoid justified text in interfaces. Without proper hyphenation and justification control it produces rivers of white space, and browser justification is not good enough to be worth it.

## Truncate last, and never mid-meaning

Truncation is a failure of layout, applied when nothing better is available. Before truncating: allow wrapping, shorten the source text, widen the container, or reduce what is shown.

Where truncation is unavoidable:

- Truncate at the end, not the middle, unless the distinguishing part is at the end — file names and IDs frequently are, and middle truncation preserves both ends.
- Make the full value available: a `title` attribute is not enough on its own because it is unreachable by keyboard and touch; pair it with a tooltip or an expandable row.
- Never truncate something the user must read to make a decision — a price, an error, a destructive action's target.
- Clamp multi-line text with `-webkit-line-clamp` rather than by fixed height, so it does not cut a line in half.

A truncated label that the user cannot expand is missing information, and `accessibility` treats it as one.

## Use the font's own features

Variable fonts let you ship one file covering a weight range, which usually costs less than two static weights and gives you intermediate weights for free. Use `font-variation-settings` only where a named property does not exist; prefer `font-weight` and `font-stretch`, which browsers optimize.

OpenType features worth turning on deliberately:

| Feature | Use for |
| --- | --- |
| `font-variant-numeric: tabular-nums` | Any column of numbers, any figure that updates in place |
| `font-variant-numeric: oldstyle-nums` | Numerals inside running prose, where lining figures look loud |
| `font-feature-settings: "ss01"` | Stylistic alternates — a single-storey `a`, a straight-tailed `l` — where the default is ambiguous |
| `font-variant-ligatures: none` | Code, IDs, anything where character identity matters more than smoothness |

Tabular figures in tables and on updating values is the highest-value one and it is nearly always missing.

## Evidence bar

Measure, size and contrast are measurable. Report the number: "measure runs to 118 characters at 1440px" is a finding; "lines feel long" is not.

Minimum size, contrast ratio, and behavior at 200% zoom belong to `accessibility` and must be measured rather than judged. A contrast ratio is computed, never estimated.

Font-pairing and personality choices are largely preference, and preference is not a finding. Report them only where they cost something nameable: legibility at the sizes used, missing weights forcing synthesis, a character set that will not cover the languages, or a file size that delays first paint.

Where a project has an established scale, review against that scale rather than against the defaults here. A house scale that differs from this one is not a finding.

## Before you ship

| Symptom | What it means | Fix |
| --- | --- | --- |
| A paragraph runs the full width of a wide screen | Measure is unconstrained | `max-width` in `ch`, 50–75 |
| A 48px heading looks like separate lines | Line-height did not come down with size | 1.0–1.2 at display sizes |
| 14px body text at 1.2 line-height | Cramped | 1.5–1.6 at body sizes |
| Heading and body are one step apart | Reads as an inconsistency, not a level | Skip a step, or carry it with weight |
| Six type sizes on one screen | Hierarchy stops being perceived | Three or four levels |
| A heading leaves one word on the last line | No wrap control | `text-wrap: balance` |
| Numbers jitter as they update | Proportional figures | `tabular-nums` |
| A URL forces horizontal scroll | Long string with no wrap rule | `overflow-wrap: break-word` |
| A label is truncated with no way to see it | Information is missing, not shortened | Expand, wrap, or shorten the source |
| A price or error is truncated | The user cannot make the decision | Never truncate decision-critical text |
| Body text is letter-spaced | Reduces reading speed | Remove; track only display and uppercase |
| Text shrinks instead of reflowing on mobile | Fails at extremes and at zoom | Reflow; `layout-and-composition` |
| Bold is synthesized | The weight was not loaded | Load it, or use a weight that exists |

## Reporting

**Severity ladder:** `Critical` — text below the accessible minimum, contrast failing threshold, layout breaking at 200% zoom, decision-critical text truncated · `Serious` — measure far outside range on long text, unreadable hierarchy, information lost to truncation · `Moderate` — line-height mismatched to size, missing tabular figures, uncontrolled wrapping · `Minor` — tracking, optical nits, single inconsistencies.

**Verification:** measure counted at the widest viewport; sizes and line-heights checked against the scale; contrast computed, not estimated; behavior checked at 200% zoom; wrapping checked at the longest realistic string; numerals checked in any table.

**Format:** findings grouped by the principle violated, severity order, each with the measured value, where it occurs, what it costs the reader, and the fix expressed in the project's own system — Tailwind classes where the project uses Tailwind, CSS custom properties where it uses those.

**Done when:** every finding carries a number rather than an impression, the scale has been checked rather than assumed, and nothing decision-critical is cut off.
