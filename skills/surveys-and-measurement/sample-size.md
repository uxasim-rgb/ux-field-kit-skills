# Sample size

How many responses you need, where the numbers come from, and the mistakes that make a technically adequate sample useless.

## Estimating a proportion

The common case: you want to know what share of users do or think something, within a stated margin of error.

For a large population at 95% confidence, using the conservative p = 0.5:

```
n = 1.96² × 0.5 × (1 − 0.5) / e²
  = 0.9604 / e²
```

| Margin of error (e) | Completed responses |
| --- | --- |
| ±15% | 43 |
| ±10% | 96 |
| ±7% | 196 |
| ±5% | 384 |
| ±3% | 1,067 |
| ±1% | 9,604 |

Note the shape: precision improves with the square root of n. Going from ±10% to ±5% costs four times as many responses; ±5% to ±1% costs twenty-five times as many. Decide what precision the decision actually needs before paying for it. Most product decisions are made fine at ±10%.

## Finite population correction

When your whole population is small — a B2B product with 800 accounts, an internal tool with 200 users — you need fewer responses than the table suggests:

```
n_adjusted = n / (1 + (n − 1) / N)
```

where N is the total population.

For N = 800 and a target of ±5% (n = 384):

```
384 / (1 + 383/800) = 384 / 1.479 ≈ 260
```

For populations under roughly 100, the correction gets you close to needing everyone, which is the signal to stop surveying and start interviewing. Thirty conversations with an 80-person population tells you more than a survey ever will.

## Responses, not invitations

Every number above is *completed* responses. Work backwards through your expected response rate:

```
invitations = target_n / expected_response_rate
```

Rough rates to plan against, then measure your own:

| Channel | Typical rate |
| --- | --- |
| In-product prompt, well-targeted | 2–10% |
| Email to engaged users | 5–15% |
| Email to full list | 1–5% |
| Panel with incentive | 30–60% |
| Post-interaction (support, checkout) | 10–25% |

At 5%, a ±5% margin needs roughly 7,700 invitations. Teams discover this after fielding, which is how a survey ends up reported at ±12% and described as if it were ±5%.

## Segment comparison is the trap

The most common sample-size failure is not the headline number — it is comparing two groups inside it.

A survey with 400 responses split 370 enterprise / 30 small-business cannot compare them. The small-business estimate carries a margin of error around ±18%, so any difference under about 20 points is unreadable.

**Plan segment sizes before fielding.** If you need to compare three segments at ±10% each, you need roughly 96 in each segment — about 290 completed responses, distributed. Getting that distribution usually requires quota sampling rather than an open invitation, because the segments do not volunteer at equal rates.

**Comparing two proportions** needs more than estimating one. As a working rule, to detect a 10-point difference between two groups at 95% confidence you need roughly 400 per group; to detect 20 points, roughly 100 per group. Smaller differences than that are rarely worth designing a survey around.

When a segment comes back under about 30, report it as a count with its n visible — "7 of 24 small-business respondents" — or leave it out. Converting it to a percentage manufactures precision that will be quoted without the caveat.

## Checking a difference before reporting it

Before writing that segment A is higher than segment B, check whether the difference exceeds the uncertainty. The quick check: compute the margin of error for each group and see whether the intervals overlap substantially.

Margin of error for a single proportion:

```
e = 1.96 × √( p(1−p) / n )
```

For p = 0.62 and n = 150: `1.96 × √(0.62 × 0.38 / 150)` = `1.96 × 0.0396` ≈ ±7.8%.

Two groups at 62% ±7.8% and 55% ±9% are not different. Reporting them as different is the single most common way a survey produces a wrong decision, and it happens because the numbers look different in a table.

## Qualitative sample sizes do not come from this page

Interview and usability-test sample sizes are not calculated from margins of error. They come from saturation — the point where new sessions stop producing new findings — and run about five per distinct segment. See `research-planning`.

Mixing the two logics produces both classic errors: running 50 interviews because it felt more rigorous, and reporting "80% of users" from 5 sessions.

## A worked plan

> **Question.** What share of our users export data to a spreadsheet at least monthly, and does it differ between admins and members?
>
> **Precision needed.** ±10% overall is enough to decide whether to build an integration. The segment comparison matters, so both segments need to be readable.
>
> **Segments.** Admins and members, compared. Target 96 completed per segment → 192 completed.
>
> **Population.** 6,400 active users, roughly 20% admins. The finite population correction is negligible at this size.
>
> **Response rate.** Last in-product survey returned 7%. Admins historically respond at roughly double the rate of members.
>
> **Invitations.** Members: 96 / 0.05 ≈ 1,920. Admins: 96 / 0.14 ≈ 690, against a population of ~1,280 — feasible but tight, so invite all admins and accept a higher-than-usual rate.
>
> **Stop rule.** Close after 14 days or when both segments pass 96, whichever comes first. Report actual n per segment regardless.
>
> **Reporting floor.** Any segment closing under 30 is reported as a count, not a percentage.

The stop rule matters. A survey left open until the numbers look convincing is a survey that will eventually look convincing.
