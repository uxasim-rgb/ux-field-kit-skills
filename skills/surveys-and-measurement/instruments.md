# Standardized instruments

The validated questionnaires worth using, their exact items, how to score them, and what the score means.

Use these verbatim. Rewording an instrument to fit your product breaks its norms, and a score with broken norms cannot be compared to anything — which was the only reason to use a standard instrument.

## SEQ — Single Ease Question

The cheapest useful measurement in research. One item, asked immediately after a task.

> **Overall, how difficult or easy was it to complete this task?**
> 1 Very difficult · 2 · 3 · 4 · 5 · 6 · 7 Very easy

**Scoring.** The mean across participants. Report the mean and the individual scores — with small samples the distribution matters more than the average.

**Interpretation.** A mean around 5.5 is roughly typical across tasks and products. Below 5 signals a task worth investigating. A score of 3 or below from any single participant is worth a look at that session regardless of the mean.

**Use it.** Add SEQ to every task in every usability session. It costs ten seconds, it makes tasks comparable across rounds, and it gives you a number to put next to qualitative findings when a stakeholder asks how bad something is.

Ask it before discussing the task. Discussion changes the rating.

## SUS — System Usability Scale

Ten items, alternating positive and negative, on a 1–5 agreement scale. The most widely used usability instrument, which is its main value: the comparison data exists.

1. I think that I would like to use this system frequently.
2. I found the system unnecessarily complex.
3. I thought the system was easy to use.
4. I think that I would need the support of a technical person to be able to use this system.
5. I found the various functions in this system were well integrated.
6. I thought there was too much inconsistency in this system.
7. I would imagine that most people would learn to use this system very quickly.
8. I found the system very cumbersome to use.
9. I felt very confident using the system.
10. I needed to learn a lot of things before I could get going with this system.

Scale: 1 Strongly disagree → 5 Strongly agree.

**Scoring.**

1. Odd-numbered items: subtract 1 from the response. (Range 0–4.)
2. Even-numbered items: subtract the response from 5. (Range 0–4.)
3. Sum all ten adjusted scores. (Range 0–40.)
4. Multiply by 2.5. (Range 0–100.)

The result is **not a percentage**. A SUS of 68 does not mean 68% of anything; it means the score is at roughly the historical average.

**Interpretation.**

| SUS | Reads as |
| --- | --- |
| Above 80 | Good to excellent |
| 68–80 | Above average |
| ~68 | The historical mean across studies |
| 51–68 | Below average, worth attention |
| Below 51 | Poor; expect to find serious problems |

**Cautions.** SUS is a summary, not a diagnosis — a low score tells you something is wrong and nothing about what. Pair it with `usability-testing`. It is also unstable below about 12 respondents; with 5 participants, report the individual scores and treat the mean as directional.

Substituting "website" or the product name for "system" is the one accepted modification. Changing anything else is not.

## UMUX-Lite

Two items. Correlates closely with SUS at a fifth of the length, which makes it the right default when survey space is scarce.

> 1. **This system's capabilities meet my requirements.**
> 2. **This system is easy to use.**

Scale: 1 Strongly disagree → 7 Strongly agree.

**Scoring.** For each item, subtract 1 and divide by 6 to get 0–1. Average the two, multiply by 100. The raw result runs low relative to SUS; where you need SUS-comparable numbers, apply the published regression adjustment rather than comparing raw to raw.

**Use it.** In-product surveys, post-release checks, anywhere ten items will not be tolerated. The two items map usefully onto the two things that actually matter — does it do what I need, and is it painful — which makes even the raw item scores interpretable.

## CSAT — Customer Satisfaction

> **How satisfied were you with [specific interaction]?**
> Very dissatisfied · Dissatisfied · Neutral · Satisfied · Very satisfied

**Scoring.** Usually the percentage selecting the top two options. State which convention you used; the "top two box" and "mean score" conventions give different numbers and teams silently switch between them.

**Use it.** For a specific, bounded interaction — a support conversation, a checkout, an onboarding step. It is meaningless applied to a whole product, where different respondents will answer about different things.

Ask it immediately after the interaction. CSAT collected a week later measures memory.

## NPS — Net Promoter Score

> **How likely are you to recommend [product] to a friend or colleague?**
> 0 Not at all likely → 10 Extremely likely
>
> **What is the main reason for your score?** *(open text)*

**Scoring.** Promoters (9–10) minus Detractors (0–6), as a percentage of all respondents. Passives (7–8) are counted in the denominator and nowhere else. Range −100 to +100.

**What it is good for.** One comparable number over time, and the open-text follow-up, which is the genuinely valuable part and the part most teams ignore.

**What it cannot do.** Diagnose. Explain a movement. Support a product decision alone. It throws away most of the information in an 11-point scale by bucketing, and bucketing makes it volatile — at n=100, a handful of responses moves the score by several points, so a quarterly "improvement" is frequently noise.

**If you must report it:** always with n, always with the previous score and its n, and always with the coded open text beside it. Code the verbatims through `research-synthesis`; that is where the actionable content lives.

## Choosing between them

| You need | Use |
| --- | --- |
| A number for one task, in a session | SEQ |
| A benchmark for a whole interface, with comparison data | SUS |
| A benchmark with almost no survey budget | UMUX-Lite |
| Satisfaction with one bounded interaction | CSAT |
| A single loyalty number leadership already tracks | NPS, paired with something diagnostic |
| To know *why* any of the above moved | None of them — `usability-testing` or `user-interviews` |

## Benchmarking over time

A benchmark is only worth running if it is comparable. That means holding constant, every round: the instrument wording, the scale, the sampling method, the point in the user journey where it is asked, and the time of quarter.

Change any of those and note it prominently in the report, because the next person to read the trend line will not know. A score that jumped because the survey moved from post-purchase to post-signup is a measurement artifact that will be celebrated as a win.

Report the trend with error bars, or report it as a table of score plus n. A line chart of four quarterly scores with no uncertainty shown invites the reader to interpret noise as direction — see `dataviz` conventions if the chart is being built.
