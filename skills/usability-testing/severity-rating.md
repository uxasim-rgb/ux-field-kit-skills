# Severity rating

How to turn a pile of observed problems into a ranked list a team can work from, and how to defend the ranking when someone disagrees.

## The three factors

Severity is a function of three things. Rate each, then combine.

**Impact — what it costs the user when it happens.**

| Level | Meaning |
| --- | --- |
| 4 | Task cannot be completed. Data, money or trust is lost. |
| 3 | Task completed, but with errors, a workaround, or substantial delay. |
| 2 | Hesitation or a wrong turn, recovered without help. |
| 1 | Noticed and mentioned, no effect on the outcome. |

**Frequency — how many users meet it, how often.**

| Level | Meaning |
| --- | --- |
| 4 | On a core path every user takes, every time. |
| 3 | On a common path, or a core path under common conditions. |
| 2 | On a secondary path, or under conditions a minority meet. |
| 1 | Edge case, rare configuration, or one-off. |

**Persistence — whether it gets better with exposure.**

| Level | Meaning |
| --- | --- |
| 3 | Never learnable. Trips experienced users as reliably as new ones. |
| 2 | Learnable but costly — users build a workaround and keep it. |
| 1 | First-run only. Disappears once the user knows. |

## Combining them

Take the highest of impact and frequency, then adjust by persistence.

| Result | Severity | Means |
| --- | --- | --- |
| Impact 4, any frequency | **Critical** | Fix before ship. No exceptions for a data-loss or money problem. |
| Impact 3 with frequency 3–4 | **Critical** | A costly problem on a path everyone takes is a blocker even though each instance is survivable. |
| Impact 3 with frequency 1–2 | **Serious** | Fix this release. |
| Impact 2 with frequency 3–4 and persistence 2–3 | **Serious** | Small friction on a daily path compounds into real cost. |
| Impact 2 with frequency 1–2 | **Moderate** | Fix when the area is touched. |
| Impact 1, any | **Minor** | Log it. Fix if free. |

Persistence 3 raises the rating one step. A problem that trips experts forever is qualitatively different from one that disappears after the first use, and teams systematically under-rate it because the team themselves have long since learned around it.

Persistence 1 lowers it one step, unless impact is 4. A first-run-only problem that loses data is still Critical.

## Frequency is not participant count

The most common rating error is treating "4 of 5 participants hit this" as frequency 4. Participant count is evidence of *existence*; frequency is a property of the *product*, and you estimate it from where in the product the problem lives.

A problem one participant hit on the account-creation path has frequency 4: every user creates an account. A problem four participants hit on a bulk-export flow that 3% of accounts use has frequency 1.

When analytics exist, use them for frequency rather than guessing. `experimentation-and-analytics` owns that. When they do not, state the estimate and its basis in the report: "frequency estimated 3 — this is the default path from the dashboard."

## Rate the problem, not the fix

Severity describes the user's experience. It says nothing about how hard the fix is, and mixing the two produces a list where cheap problems float to the top because they are cheap.

Keep effort in a separate column and let `prioritization` combine them. A Critical problem with a large fix is still Critical; the decision to defer it is a prioritization decision made in the open, not a severity decision made quietly.

## Calibrating with more than one rater

Where two or more people rate, rate independently first, then compare. Discussion before rating produces the first speaker's opinion wearing three names.

Where ratings differ by one step, take the higher. Where they differ by two or more, the disagreement is usually about frequency, and usually because the raters are imagining different users. Resolve it by naming the user and the path explicitly, then re-rate.

Keep the disagreement in the report where it survives discussion. "Rated Serious; one evaluator rated this Critical on the grounds that exports are the primary workflow for enterprise accounts" is more useful to a decision-maker than a clean consensus that hid the argument.

## What does not go on the list

**Preferences.** A participant who completed the task while saying they disliked the colour has not found a usability problem. Record it separately as feedback; it may matter to `design-critique` or `content-design`, and it does not belong in a severity-rated list.

**Problems caused by the test.** An ambiguous task, a prototype dead end, a broken seed account. Exclude, and say you excluded it. These get discovered later by an engineer, and a report containing one loses the benefit of the doubt on everything else.

**Moderator-caused failures.** If you helped, prompted at the wrong moment, or answered a question mid-task, that task is contaminated. Mark it and exclude it from rates.

**Solutions.** "Add a tooltip" is not a finding. The finding is what happened and what it cost; the fix belongs in a separate column and is owned by the relevant domain skill.

## Writing a rated problem

Six fields. Every one earns its place:

> **Severity.** Serious (impact 3, frequency 3, persistence 2)
>
> **Observed.** 3 of 5 participants opened the Filters panel, scrolled past the date range twice, and used the browser's find-in-page instead. Mean time to locate: 48s.
>
> **Consequence.** Users reach the right answer but roughly a minute late, every time they need it, and two of the three said they would normally export to a spreadsheet instead — abandoning the feature.
>
> **Quote.** "I know it's in here somewhere. I usually just dump it into Sheets." — P4
>
> **Frequency basis.** Filtering is the default action from the orders list; estimated frequency 3 from placement, not measured.
>
> **Owning skill.** `information-architecture` for panel grouping; `layout-and-composition` for the scroll length.

The frequency basis line is what makes the rating arguable rather than assertable, and arguable ratings survive stakeholder review. A rating nobody can check is a rating that gets overridden by whoever is most senior in the room.
