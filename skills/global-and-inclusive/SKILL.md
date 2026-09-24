---
name: global-and-inclusive
description: Makes an interface survive other languages, scripts, names, dates, addresses and bandwidths, and reduces the cognitive load it demands. Use before translation and whenever a form assumes a Western default.
when_to_use: Use when internationalizing or localizing, supporting RTL languages, handling text expansion, designing name or address or phone or date fields, reducing cognitive load, supporting low bandwidth or old devices, or checking assumptions about users.
---

# Global and inclusive design

This skill covers everyone the default design forgets: people whose language reads right to left, whose name does not split into two fields, whose connection is slow, whose device is old, and whose attention is scarce. It closes the Inclusive band.

The governing idea: almost every default in interface design encodes an assumption about the user, and the assumptions are mostly Western, fast-connected and undistracted.

**Works with:** `accessibility` owns the measurable conformance requirements · `forms-and-input` owns field behavior · `typography` owns type rendering · `layout-and-composition` owns reflow · `content-design` owns the words being translated · `design-engineering` owns performance.

## Start here

| The situation | Go to |
| --- | --- |
| Preparing for translation | **Design for expansion before you translate** below |
| Supporting Arabic, Hebrew, Farsi, Urdu | **RTL is a mirror, with exceptions** below |
| Designing a name, address or phone field | **Personal data does not fit your schema** below |
| Formatting dates, numbers, currency | **Format from locale, never from assumption** below |
| The product is slow for some users | **Design for the slowest realistic conditions** below |
| The interface demands too much attention | **Reduce what the user must hold** below |
| Conformance thresholds | `accessibility` |

## Design for expansion before you translate

Translated text is rarely the same length. German, Finnish and Russian commonly run 30% longer than English; Japanese and Chinese are often shorter but need more vertical space per line. Short strings expand most — a 10-character English label can double.

- **Never size a container to its English content.** Buttons, tabs, nav items and table headers are where this breaks first.
- **Allow wrapping** in labels and buttons rather than truncating. A truncated action label is unusable.
- **Test with pseudo-localization** — machine-expand every string by 40% with accented characters — before translation, not after. It finds every fixed-width container in one pass.
- **Never concatenate sentences from fragments.** `"You have " + n + " items"` cannot be translated: word order, pluralization and grammatical gender all vary. Use full parameterized strings with plural rules.
- **Do not embed text in images.** It cannot be translated and cannot be read by assistive technology.
- **Give translators context.** A string that reads "Open" might be a verb or an adjective, and the translator cannot tell from the string alone.

Pluralization is not two cases. Several languages have three to six plural forms, and some have none. Use the platform's plural-rule support rather than an `if (n === 1)`.

## RTL is a mirror, with exceptions

For Arabic, Hebrew, Farsi and Urdu, the layout mirrors: reading order, alignment, navigation position, icon direction, progress direction.

Use logical CSS properties throughout — `margin-inline-start` rather than `margin-left`, `padding-inline-end`, `inset-inline-start`, `text-align: start`. A codebase using logical properties mirrors correctly by setting `dir="rtl"`; one using physical properties needs a parallel stylesheet that will drift.

What does **not** mirror:

- Numbers and their digits.
- Media playback controls — play still points in the direction of playback by convention.
- Clocks, and anything representing physical reality.
- Logos and brand marks.
- Code, and anything monospaced representing literal text.

Icons that imply direction — back, forward, next, undo, indentation, send — do mirror. A back arrow pointing left in an RTL layout points forward.

Test by switching `dir` and looking, not by reasoning about it. Mixed-direction content — an English product name inside an Arabic sentence — is where bidirectional rendering gets genuinely hard, and it needs real text to check.

## Personal data does not fit your schema

Most name, address and phone validation encodes assumptions that are wrong for a large share of the world.

**Names.** There is no guaranteed first and last name. People have one name, four names, names that change, names that do not have a family portion, and names in scripts your field may not accept.

- Prefer a single **full name** field. Where you need a display name, ask for it separately.
- Never require a surname, never require two words, never reject apostrophes, hyphens, spaces or non-Latin characters.
- Do not enforce a maximum length short enough to truncate real names.
- Ask how they want to be addressed rather than deriving it.
- Never derive gender from a name.

**Addresses.** Postcodes do not always exist and are not always numeric. States and counties are not universal. Street-number-then-name is not universal, and some addresses are not linear at all.

- Use a single multi-line address field, or switch the field set by country.
- Put country first, so the rest of the form can adapt.
- Never require a postcode or a state globally.

**Phone numbers.** Store in international format. Accept spaces, dashes, brackets and a leading `+`, and normalize rather than reject — `forms-and-input` owns that principle.

**Dates.** `03/04/2026` is ambiguous across locales and always will be. Use an unambiguous format in display — `3 Apr 2026` — or a locale-aware formatter. For input, use separate fields or a picker with the expected order made explicit.

## Format from locale, never from assumption

| Data | Varies by |
| --- | --- |
| Date order and separators | Locale |
| First day of the week | Locale — Sunday, Monday and Saturday are all common |
| Decimal and thousands separators | `1,234.56` and `1.234,56` and `1 234,56` |
| Currency symbol position and spacing | Locale, not currency |
| Time — 12 or 24 hour | Locale |
| Calendar system | Not universally Gregorian |
| Sorting order | Locale-specific collation, not code point order |
| Text case rules | Turkish dotless i, German ß |

Use the platform's internationalization API rather than formatting manually. `Intl.DateTimeFormat` and `Intl.NumberFormat` exist and handle cases you have not thought of.

Always show a timezone on a timestamp that matters, and store in UTC. "3pm" without a zone has caused more missed meetings than any other interface defect.

## Colour, iconography and imagery carry local meaning

Red means danger in many places and prosperity in others. A thumbs-up, an OK gesture, an owl and the colour white all carry meanings that differ by region.

Practical stance: lean on conventions that are near-universal in software — a red destructive action, a green confirmation — but never let colour carry the meaning alone, which `accessibility` already requires. Avoid gestures, animals and religious symbols as functional icons. Check that photography represents the audience you actually have.

## Design for the slowest realistic conditions

The development machine on a fast connection is not representative of the audience.

- **Test on a throttled connection** and a low-end device. Regularly, not once.
- **Set a performance budget** and hold to it — `design-engineering` owns the measurement.
- **Design the intermediate states.** What shows while the image loads, while the font swaps, while the data arrives. `components-and-states` owns the state set.
- **Use `font-display: swap`** so text renders in a fallback rather than invisibly.
- **Make the core task work without the optional parts.** A form that cannot submit until an analytics script loads is a broken form.
- **Consider data cost.** Autoplaying video and large images cost money on metered connections.

## Reduce what the user must hold

Cognitive load is an accessibility concern and a usability one, and it affects everyone under pressure — not only users with cognitive disabilities.

- **Do not make people remember across screens.** Show the value rather than asking them to recall it.
- **Keep instructions beside the thing they describe**, not in a paragraph above it.
- **Set safe defaults**, so the common case needs no decisions.
- **Break long processes into steps** with visible progress, and allow leaving and returning.
- **Write plainly.** `content-design` owns the reading level; domain jargon is vocabulary, unnecessary complexity is not.
- **Do not impose time limits** without an extension — `accessibility` owns the criterion.
- **Be consistent.** Every inconsistency is a thing to learn.
- **Make errors recoverable** rather than requiring care.

## Evidence bar

Text expansion is testable before translation with pseudo-localization. Report which containers broke and at what expansion, not a general concern.

RTL is testable by setting `dir` and looking. A claim that the layout mirrors correctly should come from having looked at it with real text, including mixed-direction text.

Performance is measurable on throttled hardware. Report the number and the conditions. A claim from the development machine is not evidence.

Do not assert what users in a region want without research from that region. Localization decisions made from assumption are how products acquire confidently wrong regional behavior. `research-planning` owns recruiting there.

Where the product genuinely serves one locale and has no plan to expand, say so and scope the review accordingly. Reviewing a domestic tax tool against global address formats wastes everyone's time.

## Before you ship

| Symptom | What it means | Fix |
| --- | --- | --- |
| A button was sized to its English label | It will break in German | Pseudo-localize at 40% and re-check |
| Sentences built by concatenation | Untranslatable — word order varies | Full parameterized strings |
| `if (n === 1)` pluralization | Several languages have more forms | Use the platform's plural rules |
| Text baked into images | Cannot be translated or read aloud | Real text |
| `margin-left` throughout | Will not mirror | Logical properties |
| A back arrow unmirrored in RTL | Now points forward | Mirror directional icons |
| Separate first and last name fields, both required | Excludes many real names | Single full-name field |
| Surname validation rejects an apostrophe | Rejects real names | Accept all characters |
| Postcode required globally | Not universal | Adapt the field set by country |
| `03/04/2026` shown to users | Ambiguous across locales | `3 Apr 2026` or locale-aware format |
| A timestamp with no timezone | Causes missed meetings | Show the zone, store UTC |
| Numbers formatted with a hardcoded separator | Wrong in most of Europe | `Intl.NumberFormat` |
| Performance confirmed on the dev machine | Not representative | Throttle and re-measure |
| Text invisible while the font loads | No swap behavior | `font-display: swap` |
| Instructions sit three paragraphs above the field | Must be held in memory | Move them beside it |

## Reporting

**Severity ladder:** `Critical` — a user cannot complete the task in their locale, name or address, or the core task fails on a slow connection · `Serious` — text truncated or clipped after expansion, RTL layout broken, ambiguous date or number format on a decision · `Moderate` — untranslatable construction, missing locale formatting, unnecessary cognitive load · `Minor` — cultural or imagery mismatch with no functional cost.

**Verification:** pseudo-localization run at 40%; RTL checked by setting `dir` with real mixed-direction text; name, address and phone fields tested with real-world edge cases; date and number formatting checked in at least two locales; performance measured on a throttled connection and a low-end device.

**Format:** findings by principle, severity order, each naming the locale or condition it fails under and the fix. Where the product serves a single locale by design, state the scope limit at the top rather than reporting global issues as findings.

**Done when:** the interface has been seen expanded and mirrored rather than reasoned about, no personal-data field rejects a legitimate real value, and the core task has been completed on a slow connection.
