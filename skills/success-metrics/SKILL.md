---
name: success-metrics
description: Chooses metrics that would actually move if the design worked, pairs them with guardrails, and writes the instrumentation request engineering needs. Use before building, not after launch.
when_to_use: Use when defining success for a feature, choosing a north star metric, applying the HEART framework, setting guardrail metrics, writing an instrumentation or tracking plan, or when someone asks "how will we know if this worked" or wants a KPI for a design change.
---

# Success metrics

This skill decides what would have to change for the work to have succeeded, and makes sure it can be observed. It closes the Define band and is the contract the Validate band is judged against.

The governing idea: a metric chosen after launch describes whatever happened. Choose it before, and commit to what a failure would look like.

**Works with:** `problem-framing` supplies the outcome · `prioritization` uses these metrics as its impact axis · `experimentation-and-analytics` owns measuring and testing · `surveys-and-measurement` owns attitudinal instruments · `design-handoff` carries the instrumentation request to engineering.

## Start here

| The situation | Go to |
| --- | --- |
| A feature is being scoped | Define metrics now, before build. **Write the failure condition** below |
| Leadership wants a north star | **One north star, several signals** below |
| You need a framework to structure it | **HEART** below |
| The metric exists but the data does not | **Write the instrumentation request** below |
| You need to run a test on it | `experimentation-and-analytics` |
| The metric is attitudinal — satisfaction, ease | `surveys-and-measurement` |
| It already shipped and nobody defined success | **Retrofitting** below, honestly |

## Role lens

| Role | Takes from this skill |
| --- | --- |
| Product designer | The full chain: outcome, metric, guardrail, failure condition, instrumentation |
| UX researcher | How behavioral metrics pair with attitudinal ones, and where each misleads |
| Design engineer | The instrumentation request — what events, what properties, and why they are needed at build time not after |

## Measure the outcome, not the output

Output is what you shipped. Outcome is what changed because of it. Teams measure output because it is available on the day of launch.

| Output — always goes up | Outcome — might not |
| --- | --- |
| Feature adoption | Task completion rate for the job the feature serves |
| Page views on the new page | Time from start to a correct result |
| Number of exports | Reduction in support tickets about getting the data out |
| Users who opened the wizard | Users who finished setup without contacting support |
| Clicks on the recommendation | Whether the recommended thing was kept |

Adoption metrics are the most common trap: a newly launched feature gets used because it is new and prominent, and the number rises regardless of whether it helped. If the only metric is usage of the thing you built, you have guaranteed a successful-looking launch.

The test: could this number go up while users are worse off? If yes, it is an output metric and it needs an outcome beside it.

## Write the failure condition before launch

For every metric, state the number that would mean this did not work — in writing, before the work ships, with a date.

> **Success.** Access review completion rate rises from 38% to above 55% within two full quarterly cycles.
> **Failure.** Below 45% after two cycles, or support contacts about access review rise at all.
> **Decision if it fails.** Revert the navigation change and run a five-person study on the review flow.

The third line is what makes it real. Metrics without a pre-committed response produce a launch review where the number is reinterpreted, and there is always a reading under which things went fine.

Set the date too. "Eventually" means the review never happens, and a metric with no review date is a metric nobody is accountable for.

## One north star, several signals, and guardrails on both

A north star is a single metric the organization steers by. It should describe value delivered to users, not revenue collected — revenue is the consequence, and steering directly at it produces dark patterns fast.

Good north stars share three properties: they move when users get value, they are hard to game without actually delivering value, and everyone can name them.

Beneath it sit **signal metrics** — the things a specific team can actually move, which roll up. A design team cannot move "weekly active teams"; it can move "proportion of new teams reaching their first shared report within a week".

Beside both sit **guardrails**: things that must not get worse. Guardrails are what stop a metric being achieved by damage.

| Driving metric | Guardrail |
| --- | --- |
| Signups | Day-30 retention, support contacts per new account |
| Time on task down | Error rate, undo rate, task success |
| Engagement up | Unsubscribes, notification opt-outs, session length in the *wrong* place |
| Conversion up | Refund rate, chargebacks, complaints |
| Feature adoption | Completion rate of the job it serves |

Every driving metric gets at least one guardrail. A metric with no guardrail is an instruction to optimize it by any means, and teams do.

## HEART, used as a checklist rather than a scorecard

HEART structures the question "what could we measure" into five categories. Pick one or two, not five — a team tracking all five tracks none.

| Category | Measures | Typical signal |
| --- | --- | --- |
| **Happiness** | Attitude | SUS, UMUX-Lite, CSAT — `surveys-and-measurement` owns these |
| **Engagement** | Depth of interaction | Actions per active user, sessions with a completed task |
| **Adoption** | New users of a feature | First-time completion, not first-time opening |
| **Retention** | Users returning | Cohort return rate at a period that matches the natural usage cycle |
| **Task success** | Efficiency and effectiveness | Completion rate, time to complete, error rate |

For most interface work, **task success** is the category that matters and the one most often skipped in favour of engagement, which is easier to instrument.

Engagement is the most dangerous category. More time in a product can mean it is compelling or that it is slow and confusing. Always pair an engagement metric with a task-success metric so the ambiguity is resolved.

For each category you pick, run it down the **Goal → Signal → Metric** chain: what are we trying to achieve, what behavior would show it, and what number captures that behavior. Skipping to the metric is how teams end up with a number nobody can connect to an outcome.

## Choose a rate over a count, and a percentile over a mean

**Counts grow with the user base.** "2,400 completed setups this month" says nothing about whether setup got better. Use rates: completed setups per new account.

**Means hide the tail.** Average load time, average time on task and average session length are dominated by the middle and conceal the users having the worst experience. Report p50 and p95, or a distribution. The p95 user is usually the one who leaves.

**Segment before believing an aggregate.** A flat overall number frequently contains one segment improving and another degrading. Check the segments named in `audience-and-journeys` before concluding nothing happened.

## Write the instrumentation request at design time

The commonest cause of an unmeasurable launch is that nobody asked for the events until after the build. Instrumentation is cheap during development and expensive afterwards, and retrofitting means waiting another cycle for data.

The request, delivered through `design-handoff`:

| Field | Example |
| --- | --- |
| Event name | `access_review_completed` |
| Trigger | Fires when the final member row is confirmed and the summary saves |
| Properties | `member_count`, `duration_seconds`, `entry_point`, `partial` (bool) |
| Why | Completion rate is the primary success metric; `entry_point` tests the navigation hypothesis |
| Baseline needed | Yes — instrument before the change ships, so there is a before |

That last row is the one teams miss. A metric with no pre-change baseline cannot show improvement, and the fix — shipping instrumentation one cycle ahead of the change — costs nothing if it is planned and is impossible afterwards.

Name events consistently: `object_action`, past tense, snake_case. Inconsistent event names make analysis a data-cleaning exercise a year later. `design-systems` conventions apply to event vocabulary as much as to component names.

## Pair behavioral with attitudinal when the two can diverge

Behavioral data says what happened; attitudinal data says how it felt. They diverge in informative ways: a flow that completes faster but scores worse on ease has usually become opaque rather than simple.

Cheapest useful pairing: a task-success rate from analytics, plus SEQ after the task or UMUX-Lite quarterly. `surveys-and-measurement` owns both instruments.

Do not resolve a disagreement between them by picking the one you prefer. A disagreement is a finding, and it usually means the metric is measuring a different thing than you assumed.

## Retrofitting, honestly

Sometimes it has already shipped and nobody defined success. The honest move is to say what can and cannot be recovered.

- **Can be recovered:** anything already instrumented, anything visible in support volume or sales objections, and attitudinal measures you can collect now.
- **Cannot be recovered:** the before-state of anything not previously instrumented. There is no baseline and there will not be one.

Write both lists. Then instrument now, so the next change is measurable, and treat the current one as a learning cost rather than pretending the numbers mean more than they do.

## Evidence bar

State the baseline, the target and the measurement window for every metric, before launch. A metric without a baseline cannot show change, and one without a window will be evaluated whenever the number looks best.

Never report a movement smaller than the noise. Where the metric varies week to week by 4 points, a 3-point rise is not a result. `experimentation-and-analytics` owns significance; the discipline starts here, by recording the historical variance alongside the baseline.

Distinguish correlation from cause explicitly. A number that moved after a launch moved after a launch. Where the causal claim matters — and it usually does, because the next decision depends on it — that requires a test, not a before-and-after.

Where the honest answer is that the effect cannot be isolated — the change shipped alongside a marketing push and a pricing change — say so rather than claiming the credit. The claim survives one meeting; the credibility loss lasts longer.

## Before you ship

| Symptom | What it means | Fix |
| --- | --- | --- |
| The metric is adoption of the thing you built | It will go up regardless | Add the outcome the feature is supposed to serve |
| No failure condition is written | The launch review will reinterpret whatever happened | Write the number, the date and the response |
| A driving metric has no guardrail | It can be achieved by damage | Add one; name what must not get worse |
| All five HEART categories are tracked | None are | Pick one or two |
| Engagement is the only metric | Up could mean compelling or confusing | Pair with task success |
| The metric is a count | It grows with the user base | Convert to a rate |
| Only the mean is reported | The worst-served users are invisible | Add p95 or a distribution |
| Instrumentation was requested after the build | The baseline is gone | Request at design time; ship instrumentation a cycle early |
| Events are named inconsistently | Analysis becomes data cleaning | `object_action`, past tense, snake_case |
| A 3-point move is being celebrated on a metric that swings 4 | Noise read as signal | Record historical variance with the baseline |
| Cause is claimed from a before-and-after | Several things changed | State it as correlation, or run a test |

## Reporting

**The deliverable is a measurement plan, written before build**, and carried into `design-handoff`.

1. **Outcome** — from `problem-framing`, in one sentence.
2. **Primary metric** — definition, current baseline with date, historical variance, target, measurement window.
3. **Supporting metrics** — at most two.
4. **Guardrails** — what must not get worse, with thresholds.
5. **Failure condition** — the number that means it did not work, the review date, and the pre-committed response.
6. **Segments** — which cuts will be checked before any aggregate is believed.
7. **Instrumentation request** — events, triggers, properties, and whether a pre-change baseline is needed.
8. **What we will not be able to tell** — the confounds known in advance.

**Done when:** every metric has a baseline and a date, a failure condition with a committed response exists, every driving metric has a guardrail, and engineering has the event list before the build starts rather than after.
