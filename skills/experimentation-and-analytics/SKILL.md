---
name: experimentation-and-analytics
description: Designs A/B tests that can actually conclude, reads funnels and cohorts without fooling yourself, and pairs behavioral data with qualitative evidence. Use when the question is whether a change caused an effect.
when_to_use: Use when planning an A/B test or experiment, calculating sample size or test duration, analyzing funnels or cohorts or retention, interpreting analytics, using session replay, or when someone wants to test a change or asks why a metric moved.
---

# Experimentation and analytics

This skill covers behavioral measurement: what people actually did, and whether your change caused it. It closes the Validate band.

The governing idea: analytics tells you where something happened; it never tells you why. The pairing with qualitative work is not a nice-to-have — it is what makes the numbers actionable.

**Works with:** `success-metrics` defines what to measure and supplies the instrumentation request · `surveys-and-measurement` owns attitudinal measurement and its sampling · `usability-testing` explains the why behind a drop-off · `research-synthesis` combines the two · `prioritization` consumes the result.

## Start here

| The situation | Go to |
| --- | --- |
| Planning an A/B test | **Fix everything before you look** below |
| Working out how long to run it | **Duration comes from the effect you need to detect** below |
| A metric moved and nobody knows why | **Analytics locates, qualitative explains** below |
| Reading a funnel | **Funnels lie about order** below |
| Low traffic | **When not to test** below |
| Using session replay | **Replay is research and carries research ethics** below |
| Defining the metric itself | `success-metrics` |
| Measuring how it felt | `surveys-and-measurement` |

## Fix everything before you look

An experiment's credibility comes entirely from what was decided in advance. Write these down before the test starts:

- **The hypothesis**, with a direction. "Moving the total above the fold will increase checkout completion" — not "we'll see what happens".
- **The primary metric**, one. Several primary metrics means whichever moves will be reported as the result.
- **Guardrail metrics** that must not get worse.
- **The minimum effect worth acting on.** Not the effect you hope for — the smallest one that would change the decision.
- **Sample size and end date**, computed from that effect.
- **The stopping rule**, and a commitment not to peek and stop early.
- **What you will do for each outcome**, including no effect.

Choosing any of these after seeing data manufactures a result. The most common version is running until significance appears, which will eventually happen by chance on any metric.

## Duration comes from the effect you need to detect

Sample size depends on the baseline rate, the smallest effect worth detecting, and the confidence and power you want. The relationship that matters in practice: **halving the detectable effect roughly quadruples the sample needed.**

Rough shape at 95% confidence, 80% power, for a baseline conversion around 10%:

| Relative effect to detect | Approximate sample per variant |
| --- | --- |
| 20% | ~4,000 |
| 10% | ~15,000 |
| 5% | ~58,000 |
| 2% | ~360,000 |

Use a proper calculator with your own baseline rather than these figures. The point they make is structural: small effects are enormously expensive to detect, and most teams planning to detect a 2% change do not have the traffic.

Then convert to duration, and apply two rules:

- **Run at least one full week**, and preferably two. Behavior varies by day; a test run Monday to Thursday measures weekday users.
- **Run in whole weeks.** Ending mid-week weights the result toward whichever days were double-counted.

Do not stop early because the result looks good. Sequential peeking inflates the false-positive rate substantially — if you need to monitor continuously, use a method designed for it rather than repeatedly checking a fixed-horizon test.

## When not to test

A/B testing is the wrong tool more often than it is used.

- **Traffic is too low.** Below a few thousand exposures per variant, most realistic effects cannot be detected. Fix the obvious problems qualitatively instead.
- **The change is obviously correct.** Do not test whether removing a broken step helps. Ship it.
- **The change is a fix for a Critical usability finding.** Testing whether to fix an accessibility barrier or a data-loss path is not a legitimate experiment.
- **The effect is long-term.** A/B tests measure short horizons well. Retention, trust and habit changes frequently do not appear inside a test window, and a change that wins on a two-week test can lose over a quarter.
- **You cannot act on either result.** If the change ships regardless, the test is decoration.
- **The two variants differ in many ways.** You will learn that one bundle beat another, and nothing about why. Split it, or accept the limit explicitly.

Where you cannot test, say the decision is being made on judgement and evidence rather than on a measured causal effect. That is a normal way to decide things and it should be stated rather than dressed up.

## Funnels lie about order

A funnel imposes a linear sequence on behavior that is not linear. Before reading one:

- **Check that the steps are actually sequential.** People arrive mid-funnel from search, email and deep links, and a funnel that assumes they entered at step one will show a phantom drop.
- **Check the window.** A funnel measured over a session misses everyone who came back the next day, and in considered purchases that is most people.
- **Segment before concluding.** A flat overall rate frequently contains one segment improving and another degrading. Check the segments named in `audience-and-journeys`.
- **Distinguish drop-off from completion elsewhere.** People who abandon a form and call support completed the job; your funnel records a failure.

The biggest drop is not automatically the biggest opportunity. A step that loses 60% may be a legitimate qualification step, and a step losing 8% on ten times the volume may be worth more.

## Analytics locates, qualitative explains

This is the highest-yield pairing in product work and the most under-used.

Analytics tells you 43% abandon at step three. It cannot tell you whether that is because the copy is confusing, the field rejects valid input, the page is slow, or people genuinely changed their mind. Each has a different fix, and choosing among them by inspection is guessing.

The loop: find the drop in analytics → watch five people at that step through `usability-testing` → fix → measure again. Running it in reverse, or running only one half, is what produces months of redesign with no movement.

Cohort analysis is the version of this for changes over time: group users by when they joined, and compare their behavior at the same age. Comparing this month's users against last month's at different lifecycle stages produces conclusions that are artifacts of growth rather than of your change.

## Replay is research and carries research ethics

Session replay and heatmaps are qualitative data collected without consent conversations, and they deserve the same care as a research session.

- **Mask everything sensitive by default** — form inputs, personal data, financial values. Opt in to recording a field, never out.
- **Do not watch identifiable individuals** to investigate a person. Watch to understand a behavior.
- **Set retention and honor it.** An indefinite archive of user sessions is a liability.
- **Disclose it** in the privacy policy, and respect the jurisdiction's consent requirements.
- **Do not treat replay as usability testing.** There is no task, no think-aloud and no ability to ask why. It is good for finding *where* something goes wrong and poor at establishing why.

Heatmaps are frequently misread: they show where people clicked, including where they clicked on things that are not interactive — which is a finding about affordance, not about interest.

## Evidence bar

Report the effect size with a confidence interval, never a bare percentage. "Completion rose 3.2% (95% CI: −0.4% to 6.8%)" is honest; "completion rose 3.2%" implies a precision the test did not have.

Never report a result from a test that did not reach its planned sample, without saying so. An underpowered test that shows no effect has not shown there is no effect.

State multiple comparisons. Testing ten metrics at 95% confidence means roughly one will look significant by chance; if you looked at ten, say you looked at ten.

Correlation is not cause outside a controlled test. A metric that moved after a launch moved after a launch — and if marketing ran a campaign in the same window, the honest answer is that the effect cannot be isolated. `success-metrics` owns naming known confounds in advance.

Where the result is "no detectable effect", report it as that rather than as failure. A null result is information, and re-analyzing until something appears is how a null result becomes a false positive.

## Before you ship

| Symptom | What it means | Fix |
| --- | --- | --- |
| The metric was chosen after seeing data | The result is manufactured | Fix everything in advance |
| Several primary metrics | Whichever moves will be reported | One primary; the rest are secondary |
| The test was stopped when it looked good | Peeking inflates false positives | Fix the end date and hold it |
| The test ran Monday to Thursday | Weekday users only | Whole weeks, minimum one |
| The minimum detectable effect was never computed | The test may be unable to conclude | Compute sample from the effect that matters |
| Below a few thousand per variant | Cannot detect realistic effects | Do not test; fix qualitatively |
| The two variants differ in five ways | You learn bundle A beat bundle B | Split, or state the limit |
| An accessibility fix is being A/B tested | Not a legitimate experiment | Ship it |
| A bare percentage with no interval | Implies precision that is not there | Report the confidence interval |
| Ten metrics checked, one significant | Multiple comparisons | Say how many you looked at |
| A funnel assumes everyone entered at step one | Phantom drop from mid-funnel entries | Check entry points |
| The overall rate is flat | Segments may be moving in opposite directions | Segment before concluding |
| Cause claimed from a before-and-after | Confounded | State as correlation, or test |
| Replay used to investigate a named user | Research ethics violation | Watch behaviors, not people |
| A null result is being re-analyzed | Fishing | Report the null |

## Reporting

**The deliverable is a result with its uncertainty and its limits**, written against the plan that preceded it.

1. **The hypothesis and the plan** — as written before the test, including the minimum detectable effect and the stopping rule.
2. **What ran** — variants, allocation, dates, sample achieved against sample planned.
3. **Primary result** — effect size with confidence interval, and whether it met the pre-committed threshold.
4. **Guardrails** — each, with its movement.
5. **Segments** — where the effect differs, with n for each.
6. **What this does not establish** — confounds, the short horizon, anything bundled in the variant.
7. **Decision** — the pre-committed response, applied. If you are departing from it, say so and why.
8. **What to do next** — usually a qualitative follow-up on the why.

**Done when:** every number carries its interval, the sample achieved is stated against the sample planned, no causal claim rests on a correlation, and the pre-committed decision is either applied or explicitly overridden in writing.
