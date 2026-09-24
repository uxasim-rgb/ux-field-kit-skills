---
name: icons-and-imagery
description: Sets icon grid, optical sizing and semantics so icons read correctly, and handles image treatment, alt text strategy and loading performance. Use when icons feel inconsistent or images slow the page.
when_to_use: Use when choosing or drawing icons, sizing and aligning them, deciding whether an icon needs a label, writing alt text, optimizing images, handling avatars and thumbnails and aspect ratios, or fixing layout shift from images.
---

# Icons and imagery

This skill covers the non-text visual elements: icons, illustrations, photography, avatars and thumbnails. It closes the Craft band.

The governing idea: an icon is a word with worse recall. It earns its place by being faster to recognize than the label it replaces, and very few icons clear that bar alone.

**Works with:** `accessibility` owns alt text requirements and accessible names · `content-design` owns the label an icon sits beside · `layout-and-composition` owns optical alignment · `design-engineering` owns loading strategy and performance budget · `design-systems` owns the icon set as a versioned asset.

## Start here

| The situation | Go to |
| --- | --- |
| An icon-only button | **Almost no icon works alone** below |
| Icons look inconsistent | **One grid, one stroke, one source** below |
| An icon looks off-center | **Size optically, not mathematically** below |
| Writing alt text | **Alt text depends on the job** below |
| Images are slowing the page | **Ship the smallest thing that looks right** below |
| Layout jumps as images load | **Reserve the space** below |
| Choosing between icon and label | **Almost no icon works alone** below |

## Almost no icon works alone

A small number of icons have genuinely universal recognition: close, search, play, pause, plus, back arrow, and — only within their own platform conventions — share and menu. Everything else is learned, and learned from *your* product.

Everything else gets a visible text label. Not a tooltip: a tooltip requires hover, which does not exist on touch, and requires the user to already suspect the icon means something.

| Icon-only is acceptable | Icon-only fails |
| --- | --- |
| Close on a dialog | A gear meaning "workspace configuration" |
| Search in a search field | Three dots meaning different things in different places |
| Play and pause on a player | A cloud meaning sync, backup or upload |
| Back on a navigation bar | Any icon in a toolbar of eight |
| An icon *with* its label beside it | An icon whose meaning you had to explain in review |

The test: show the icon to someone unfamiliar with the product and ask what it does. If they hesitate, it needs a label. This takes two minutes and settles most icon arguments.

Every icon-only control needs an accessible name regardless — `accessibility` owns that requirement, and a decorative icon beside a text label must be hidden from assistive technology so the label is not announced twice.

## One grid, one stroke, one source

Consistency across an icon set matters more than the quality of any individual icon.

- **One grid.** 24×24 is the common base, with a 20×20 or 16×16 set drawn separately rather than scaled down.
- **One stroke width**, expressed at the base size — 1.5px or 2px on a 24px grid. Stroke width should not scale proportionally when the icon is used smaller; a 2px stroke at 24px becomes a hairline at 16px, which is why a separate small set exists.
- **One source.** Mixing two icon libraries is visible immediately, and the mismatch reads as unfinished even to people who cannot say why. Where a needed icon is missing from the set, draw it on the set's grid rather than importing one.
- **Consistent corner radius, terminals and optical weight** across the set.

Keep the set small. An icon library with 400 icons in a product that uses 30 is a maintenance surface and an invitation to inconsistency.

## Size optically, not mathematically

Icons are irregular shapes inside square boxes, and centering the box does not center the shape.

- A triangular play icon centered by its bounding box reads left-heavy; nudge it right by a small amount.
- Round shapes need to slightly overshoot a flat edge to look the same size as a square one.
- An icon beside text aligns to the text's optical center, which is usually not its bounding-box center — cap height and x-height matter more than the em box.

Trust the eye over the number here. This is one of the few places in interface work where measurement gives the wrong answer, and `layout-and-composition` owns the general principle.

Icon size relative to text: roughly 1em to 1.25em for an inline icon, sized to match cap height rather than line-height.

## Icons in buttons need real hit areas

The visible icon can stay 16 or 20px; the hit area cannot. `accessibility` owns the thresholds and they are not negotiable at any density.

Expand the target using padding on the control, or a pseudo-element on the wrapping button, rather than growing the icon. Where two expanded targets would overlap, reduce whichever can afford it until they no longer touch; an overlap means one control steals taps meant for its neighbour.

## Alt text depends on the job

Alt text is not a description of the image. It is a replacement for the image's *function*.

| Image job | Alt text |
| --- | --- |
| Decorative — pattern, glow, background texture | `alt=""` so it is skipped entirely |
| Icon beside a text label | Hidden from assistive tech; the label is the name |
| Icon-only control | The action, not the picture: "Delete", not "Trash can icon" |
| Informative — a chart, a diagram, a screenshot | What it shows and what it means, not what it looks like |
| A link's only content | Where the link goes |
| A photo where the content matters — a product, a person | What matters about it in this context |

Never start with "Image of" or "Picture of" — assistive technology already says so.

The same image gets different alt text in different contexts. A product photo on a listing page might be the product name; the same photo in a gallery with the name beside it might be `alt=""`.

Complex images — charts, data visualizations, diagrams — need a text alternative nearby rather than a long alt string. `dataviz` covers chart accessibility conventions.

## Ship the smallest thing that looks right

| Content | Format |
| --- | --- |
| Icons, logos, line art | Inline SVG, so it inherits `currentColor` and can be styled |
| Photography | AVIF with WebP fallback; JPEG as the last resort |
| Screenshots, UI captures | WebP or PNG where sharpness matters |
| Anything animated | Video (`<video>` with muted autoplay attributes), never an animated GIF |

Animated GIFs are frequently an order of magnitude larger than an equivalent video and cannot be paused, which makes them both a performance and an accessibility problem.

Serve responsive sources with `srcset` and `sizes` so a phone does not download a 2000px image. Use `loading="lazy"` on anything below the fold and `fetchpriority="high"` on the one image that matters above it — lazy-loading the hero image delays the largest paint and makes the page feel slower.

`design-engineering` owns the performance budget these decisions are measured against.

## Reserve the space

An image without dimensions causes layout shift as it loads: content jumps, and a user who was reading or about to tap gets moved.

Always set `width` and `height` attributes, or an `aspect-ratio` in CSS, so the space is held before the bytes arrive. This is the single most common cause of layout instability and it is trivially preventable.

Decide what shows while loading — a neutral placeholder, a blurred low-resolution version, or a solid tone from the image. And decide what shows when loading *fails*, which is the state nobody designs: a broken image icon with alt text overflowing its container is what ships by default.

## Design avatars for the missing case

Avatars are missing more often than teams assume. Decide the fallback chain: image → initials → generic placeholder. Generate initials from the name you have, handle single-word and non-Latin names without breaking, and never show a broken image.

Where avatars stack or overlap in a group, cap the visible count and show a remainder ("+4"), and make the full list reachable.

`global-and-inclusive` owns name handling, which is where initial-generation breaks first.

## Evidence bar

Icon recognition is testable in two minutes with someone unfamiliar with the product. A finding is "3 of 4 people could not name this icon", not "this icon is unclear to me".

Image weight, format and layout shift are measurable. Report the number: file size, the shift score, the largest contentful paint. Do not report performance from a fast connection on a development machine.

Alt text correctness is checkable against the image's job, and it is a requirement rather than a preference — `accessibility` owns it.

Illustration style, photographic direction and brand expression are preference. Report them only where they cost something nameable: legibility at the size used, a file that delays first paint, contrast that fails, or an image carrying information available nowhere else.

## Before you ship

| Symptom | What it means | Fix |
| --- | --- | --- |
| An icon needed explaining in review | Users will need it too | Add a visible label |
| Meaning lives in a tooltip | Tooltips do not exist on touch | Visible label |
| Two icon libraries in one product | Visible immediately as unfinished | One source; draw missing icons on its grid |
| A 2px stroke looks like a hairline at 16px | Stroke scaled proportionally | Separate small-size set |
| A play icon looks left-heavy though centered | Mathematical centering on an irregular shape | Nudge optically |
| A 16px icon button is the whole hit target | Below the threshold | Expand the target, not the icon |
| Alt text reads "Trash can icon" | Describes the picture, not the function | Name the action |
| Alt text starts with "Image of" | Assistive tech already says so | Remove |
| A decorative image has descriptive alt | Adds noise for screen reader users | `alt=""` |
| An animated GIF | Large, unpausable | Video |
| Content jumps as images load | No dimensions reserved | `width`/`height` or `aspect-ratio` |
| The hero image is lazy-loaded | Delays the largest paint | `fetchpriority="high"`, no lazy |
| One image is served to every viewport | Phones download desktop assets | `srcset` and `sizes` |
| A broken avatar shows a broken image | The fallback chain was not designed | image → initials → placeholder |

## Reporting

**Severity ladder:** `Critical` — an icon-only control with no accessible name, information available only in an image with no text alternative, alt text absent on informative images · `Serious` — ambiguous icon on a primary action, layout shift from unreserved images, hit area below threshold · `Moderate` — set inconsistency, oversized assets, missing responsive sources · `Minor` — optical alignment, style variance.

**Verification:** icon recognition tested with someone unfamiliar; accessible names confirmed on every icon-only control; alt text checked against each image's job; file sizes and layout shift measured on a throttled connection; hit areas measured.

**Format:** findings by principle, severity order, each with the measurement where one applies, and the fix in the project's own asset pipeline.

**Done when:** no icon carries meaning alone without having been tested, every image's alt text matches its job rather than its appearance, and nothing shifts as the page loads.
