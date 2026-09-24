# Coding qualitative data

The mechanics of getting from raw sessions to a codebook you can defend.

## The unit of analysis

One row per observation. An observation is a single thing that was said or done, with enough context to be understood on its own.

| Field | Content |
| --- | --- |
| ID | Participant ID, never a name |
| Timestamp | Where in the recording |
| Type | `Observed` (you watched it) or `Reported` (they told you) |
| Prompted | Yes if it surfaced only after you asked directly |
| Raw | Verbatim quote, or a factual description of the action |
| Codes | Filled in during passes 1 and 2 |

The `Type` and `Prompted` columns are what let you downgrade evidence honestly later. Adding them retrospectively is guesswork, so capture them at the row.

Keep the raw column literally raw. "Participant was frustrated by the filter" is already an interpretation; "Participant said 'ugh, where is this thing' and scrolled past the filter twice" is an observation. The second can be re-read by someone who disagrees with you; the first cannot.

## Pass one: descriptive codes

Tag each row with what it is *about*, using language close to the data. Aim for codes a stranger could apply consistently.

Good first-pass codes:

- `used-browser-find`
- `expected-billing-in-profile`
- `built-spreadsheet-workaround`
- `abandoned-after-error`
- `asked-if-it-saved`

Bad first-pass codes — these are conclusions, and they foreclose the analysis:

- `poor-discoverability`
- `confusing`
- `needs-better-ux`
- `pain-point`

The test: could two people apply this code to the same row without discussing it first? `used-browser-find` yes. `confusing` no.

Expect 30–80 distinct codes from five sessions. Fewer means you are coding at conclusion level; many more means you are transcribing rather than coding.

## Pass two: grouping codes

Once every row is coded, group the codes themselves. `used-browser-find`, `scrolled-past-filter` and `asked-where-filter-is` might group under `filter-not-found`.

This is where meaning enters, and it is the right place for it — after the descriptive layer exists and can be re-examined.

Keep the first-pass codes. The grouped code is a view, not a replacement. When someone challenges a theme six months later, the descriptive codes are what let you answer.

## The codebook

A codebook is the list of codes with a one-line definition and an example row each. It exists so that a second analyst codes the same way you do, and so that you code the same way in session five as in session one.

| Code | Definition | Example |
| --- | --- | --- |
| `built-spreadsheet-workaround` | Participant maintains data outside the product to accomplish something the product should do | P3: "I keep a sheet with the actual numbers because the report rounds" |

Write it as you go, not at the end. A codebook written at the end documents the drift rather than preventing it.

## Coding with more than one analyst

1. Both code the same two sessions independently.
2. Compare row by row. Count agreement — an informal percentage is enough for product work; formal inter-rater reliability statistics are for published research.
3. Where you disagree, the disagreement is about code *meaning*. Resolve by writing a sharper definition into the codebook.
4. Split the remaining sessions, coding against the agreed codebook.
5. Both review the final clusters.

Where agreement runs below roughly 70% on the first comparison, the codebook is too loose. Tighten definitions and redo the two sessions rather than proceeding.

## Coding alone

Two guards against drift, both cheap:

- **Re-code session one last.** If your codes have shifted, you will see it immediately, and you can re-run the early sessions against the final codebook.
- **Code a session out of order.** Working strictly chronologically means later sessions get coded through the lens of earlier ones.

Take a break between coding and clustering. Clustering immediately after coding carries the coding session's fatigue and its momentum toward whatever you were noticing that day.

## Coding open-text survey responses

Same procedure, with two differences. The volume is higher and the context is thinner, so:

- **Code a random 10% first** to build the codebook, then apply it to the rest. Building the codebook while coding all 800 responses means the first 200 were coded differently.
- **Keep an `unclear` code** and use it freely. Open-text responses are frequently uninterpretable, and forcing them into a category inflates whichever category you forced them into.
- **Never report a code frequency as a product statistic.** 40% of respondents *who chose to write something* mentioning speed tells you about the writers, not the users. Report as "the most common theme among the 212 who answered".

Word clouds and word-frequency counts are not coding. They count vocabulary, which is a property of how people write, not of what they mean.

## Clustering

Move from codes to themes.

1. Put every grouped code on its own card, physically or in a board tool.
2. Pair the two that obviously belong together. Then the next. Do not create category headers.
3. Continue until movement stops.
4. Only now, name each cluster — as a sentence, not a label. See [insight statements](insight-statements.md).
5. Keep an orphans pile and look at it last, deliberately. Orphans are disproportionately where surprises live.

Where a code belongs in two clusters, duplicate it. The overlap is usually a finding about the relationship between the two.

Photograph or snapshot the board before naming. The naming step compresses, and the pre-naming state is the thing you will want when someone challenges a theme.

## What to do with contradictions

When two participants behave in opposite ways, resist averaging. The contradiction is usually a segment boundary you had not identified.

Check: do the two differ by role, tenure, company size, device, or which version they use? A contradiction that resolves into a segment difference is a better finding than either observation alone, and it often reframes the study.

Where it does not resolve, report it as unresolved variance and say so. "Behavior split evenly with no segment explanation we could identify" is honest and occasionally the most important sentence in the report.
