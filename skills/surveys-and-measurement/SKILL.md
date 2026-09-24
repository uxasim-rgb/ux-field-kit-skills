---
name: surveys-and-measurement
description: Writes survey questions that do not bias the answer, sizes the sample, and applies standardized instruments like SUS, UMUX-Lite, SEQ and NPS correctly. Use when the question is how many or how often across a population.
when_to_use: Use when writing a survey or questionnaire, designing rating scales, choosing sample size, running SUS or NPS or CSAT, benchmarking usability over time, analyzing survey results, or when someone says "let's send out a survey" or asks what our NPS should be.
---

# Surveys and measurement

This skill covers questionnaire design, sampling, and the standardized instruments teams use to track experience over time. It sits in the Research band and is the quantitative counterpart to `user-interviews`.

The governing idea: a survey measures what you asked, not what you meant, and it cannot ask a follow-up. Every defect in the wording becomes a defect in the data, permanently.

**Works with:** `research-planning` owns whether a survey is the right method · `user-interviews` supplies the vocabulary and answer options a survey needs · `research-synthesis` owns combining survey results with qualitative findings · `experimentation-and-analytics` owns behavioral measurement and A/B testing · `success-metrics` owns which metric the organization tracks.

## Start here

| The situation | Go to |
| --- | --- |
| You need a benchmark number for usability | [Instruments](instruments.md) — SUS, UMUX-Lite, SEQ |
| You need to know how many people to survey | [Sample size](sample-size.md) |
| You are writing the questions | **Write questions that cannot steer the answer** below |
| You want to know *why* people answered that way | `user-interviews` — a survey will not tell you |
| You want to know what people actually do | `experimentation-and-analytics` — behavior beats self-report |
| Someone asked for the NPS to go up | **NPS measures loyalty, badly, and diagnoses nothing** below |
| The population is under 100 people | Interview them instead; a survey will not reach significance |

## Role lens

| Role | Takes from this skill |
| --- | --- |
| UX researcher | Question construction, scale design, sampling, instrument selection and scoring |
| Product designer | SEQ after a task, and the rule that a survey sizes what interviews found |
| Design ops | A repeatable benchmark cadence that produces comparable numbers across quarters |

## Run interviews before writing the survey

A survey's answer options are a hypothesis about the range of possible answers. Writing them from imagination means the respondent picks the closest wrong option, and the data looks clean while being wrong.

Interview first, extract the vocabulary and the actual range of behavior, then write options that reflect it. Where that is impossible, include an "Other" with a text field and expect to code it — and treat a large Other share as evidence the options were invented.

The reverse order is legitimate in one case: a survey surfaces a segment behaving unexpectedly, and interviews go find out why.

## Write questions that cannot steer the answer

Six defects account for most bad survey data.

**Leading.** "How helpful was the new dashboard?" presupposes helpfulness. Ask "How would you rate the new dashboard?" with a scale that runs through neutral.

**Double-barrelled.** "How satisfied are you with the speed and reliability?" cannot be answered by someone who finds it fast and flaky. Split it.

**Loaded terms.** "Do you support our improved pricing?" Strip evaluative adjectives. If removing the adjective changes what you are asking, the adjective was doing the asking.

**Assumed behavior.** "How often do you use the export feature?" traps someone who has never used it. Gate it: ask whether they have, then branch.

**Recall beyond reach.** "How many times did you do this in the last six months?" returns a fabrication. Shorten the window to a fortnight, or ask about the last occurrence.

**Absolutes.** "always", "never", "all" push respondents to the middle regardless of what they think.

Then read every question aloud. Anything that makes you hesitate will make a respondent guess, and a guess is indistinguishable from an answer in the export.

## Build scales that mean the same thing to everyone

- **Label every point**, not just the ends. Unlabeled midpoints are interpreted differently by every respondent, and the resulting distribution is noise dressed as data.
- **Use 5 or 7 points.** Below 5 loses resolution; above 7 adds no discrimination and slows completion.
- **Keep it balanced** — as many negative points as positive, with a genuine neutral. A scale running Excellent / Very good / Good / Fair guarantees a positive mean.
- **Include an escape.** "Not applicable" and "Don't know" are real answers. Forcing a choice manufactures data.
- **Keep the direction constant** across the survey. Flipping polarity to "catch inattentive respondents" mostly catches attentive ones reading fast.
- **Never mix agreement and frequency scales** in one block. Respondents answer the previous scale's shape.

Avoid agree/disagree statements where a direct question exists. Agreement scales carry acquiescence bias — a measurable tendency to agree regardless of content — and "How easy was it to complete this?" outperforms "I found this easy to complete."

## Order questions so early ones do not contaminate late ones

Screening first, then the substance, then demographics last. Demographics up front increase drop-off and can trigger stereotype effects that shift later answers.

Put the most important question early, while attention is highest. Group related questions, and label each group so respondents know where they are.

Anything that reveals what you are hoping to hear goes last, for the same reason it does in `user-interviews`.

Keep the whole thing under five minutes. Completion rates fall sharply past that, and the people who persist are systematically different from the ones who abandon — which biases your sample in a way no sample-size calculation will fix.

## Sample size comes from the precision you need

The full calculation is in [sample size](sample-size.md). The short version for the common case — estimating a proportion in a large population at 95% confidence:

| Margin of error | Completed responses needed |
| --- | --- |
| ±10% | ~96 |
| ±5% | ~384 |
| ±3% | ~1,067 |
| ±1% | ~9,604 |

These are *completed* responses, not invitations. At a 10% response rate, ±5% needs roughly 3,800 invitations.

Two consequences teams routinely miss. First, comparing two segments needs enough in each segment, not overall — a 400-response survey split 370/30 cannot compare them. Second, precision improves with the square root, so halving the margin of error quadruples the cost.

Below about 100 responses, report counts rather than percentages. "31 of 84" is honest; "37%" implies a precision that is not there.

## Respect the non-response

The people who answer a survey are not a random sample of the people who received it. Satisfied and furious users answer; the indifferent middle does not. Users who churned are not in your product to receive an in-app prompt at all.

Mitigations that help: send to a random sample rather than to everyone who volunteers, keep it short, report response rate alongside every result, and compare respondent demographics against the population you know.

Mitigations that do not help: raising the incentive, which buys you people motivated by incentives.

State the response rate in the report, always. A result from a 4% response rate is a finding about that 4%.

## NPS measures loyalty, badly, and diagnoses nothing

The Net Promoter Score — 0–10 likelihood to recommend, collapsed into promoters minus detractors — is widely tracked and widely misused.

What it is legitimately good for: a single comparable number over time, and an open-text follow-up that generates qualitative leads.

What it cannot do: tell you *why* the number moved, identify which part of the experience caused it, or support a product decision on its own. It discards most of the information in the 0–10 response by bucketing it, and it is unstable at small samples because a few responses can swing the score by double digits.

If a stakeholder wants NPS to move, the useful response is to accept the metric and pair it with something diagnostic — SUS or UMUX-Lite for the interface, `usability-testing` for the reasons, and the open-text field coded through `research-synthesis`. Arguing the metric away rarely works; instrumenting around it does.

## Use a standardized instrument rather than inventing one

When the question is "how usable is this, compared to before or compared to others", a validated instrument gives a comparable number for almost no extra cost. Inventing a bespoke scale loses comparability and validity in exchange for nothing.

Details and scoring in [instruments](instruments.md):

- **SUS** — 10 items, score 0–100, general usability. An industry mean around 68 makes any score interpretable.
- **UMUX-Lite** — 2 items, correlates well with SUS at a fraction of the length. The right default when survey space is scarce.
- **SEQ** — single item after a task, 1–7. The cheapest useful measure in existence; add it to every usability session.
- **CSAT** — satisfaction with a specific interaction, not with the product.

Never reword a validated instrument. Changing the items breaks the norms and you no longer have a comparable score — you have a bespoke scale with a borrowed name.

## Evidence bar

Report a margin of error with every percentage, and a response rate with every survey. A percentage without either is not a measurement.

Never compare two numbers without checking whether the difference exceeds the margin of error on both. A move from 71 to 74 on a 200-response survey is not a move.

A survey cannot establish cause. It can establish that two things co-occur, and the temptation to write the causal sentence anyway is strongest exactly where the finding is most useful. Where cause matters, go to `experimentation-and-analytics`.

Open-text responses are qualitative data and get coded as such through `research-synthesis`. Counting how many mentioned a word is not analysis, and a word cloud is not a finding.

When the sample cannot support the question asked, say so and do not report the number. A number with a caveat travels without its caveat.

## Before you ship

| Symptom | What it means | Fix |
| --- | --- | --- |
| The answer options were written without talking to anyone | The range of answers is invented | Interview first, or expect a large Other |
| A question contains "and" | Double-barrelled | Split it |
| Only the scale endpoints are labelled | Midpoints mean different things to different people | Label every point |
| The scale has no neutral, or more positive points than negative | The mean is guaranteed positive | Rebalance |
| Demographics are on page one | Drop-off and priming | Move to the end |
| Percentages reported from 40 responses | Precision implied that is not there | Report counts |
| Two segments compared, one has 22 responses | The comparison is noise | Report the segment separately or not at all |
| Response rate is not in the report | Non-response bias is invisible | State it beside every headline number |
| NPS moved and a cause was asserted | NPS diagnoses nothing | Pair with a diagnostic instrument and qualitative follow-up |
| A validated instrument was reworded to fit the product | The norms no longer apply | Use it verbatim or call it something else |

## Reporting

**The deliverable is a results summary with uncertainty attached**, not a dashboard of percentages.

**Verification before reporting:** every percentage has n and a margin of error; response rate is stated; each segment comparison has adequate n in both; open text has been coded, not counted; no causal claim rests on correlation.

**Format:**

1. **What we asked and why** — the research question and the decision waiting on it.
2. **Fielding** — dates, invited, completed, response rate, how the sample was drawn.
3. **Headline results** — each with n, percentage, and margin of error. Most decision-relevant first.
4. **Segment differences** — only those exceeding the margin of error, with n for each segment shown.
5. **Instrument scores** — SUS, UMUX-Lite or SEQ with the comparison point (last quarter, industry mean) that makes them interpretable.
6. **Open text themes** — coded, with counts, handed through `research-synthesis`.
7. **Limits** — who is not represented, what the survey could not ask, what the non-response pattern probably is.
8. **Next step** — one, usually qualitative, because a survey tells you where to look and not what you are looking at.

**Done when:** no number appears without its n, and a reader could not accidentally quote a result without its uncertainty.
