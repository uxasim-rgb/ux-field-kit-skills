---
name: research-planning
description: Chooses a research method that answers the actual question, then plans sampling, recruiting, consent and timeline around it. Use before any study is run, and when a stakeholder has requested a method by name.
when_to_use: Use when planning user research, choosing between interviews and usability tests and surveys, writing research questions, deciding how many participants, recruiting or screening people, handling consent and incentives, or when someone says "let's run a survey" or "can we do some user research on this".
---

# Planning research

This skill decides what study to run and how to set it up so the results mean something. It sits at the head of the Research band, and everything downstream inherits its choices.

The governing idea: the method follows the question, and most requests arrive with the method already chosen and the question missing.

**Works with:** `user-interviews`, `usability-testing` and `surveys-and-measurement` own the execution of each method · `research-synthesis` owns what happens to the data · `heuristic-evaluation` is the fallback when there are no participants · `problem-framing` owns what to do with the answer.

## Start here

| The situation | Go to |
| --- | --- |
| A method was requested by name | **Interrogate the method request** below, before planning it |
| You know the question but not the method | [Method selection](method-selection.md) |
| The method is settled and you need to run it | `user-interviews`, `usability-testing` or `surveys-and-measurement` |
| No budget, no participants, no time | `heuristic-evaluation` — weaker evidence, honest about it |
| Sessions already happened | `research-synthesis` |
| The question is really "did the change work" | `experimentation-and-analytics` |

## Role lens

| Role | Takes from this skill |
| --- | --- |
| UX researcher | The full planning chain: question, method, sample, recruit, consent, analysis plan written before data collection |
| Product designer | The four-question intake, enough to run a defensible five-person study without a researcher |
| Design ops | The recruiting and consent scaffolding that makes studies repeatable rather than heroic |

## Write the question before the method

A research question is answerable, specific to a behavior, and does not contain its own answer. "Do people want dark mode" is a preference poll. "How do people currently work around the lack of dark mode" is a research question, because the answer is an observation and it can surprise you.

Three tests. A question fails planning if it fails any of them:

- **Falsifiable.** You can state in advance what result would change the plan. If every possible answer leads to the same next step, do not run the study.
- **Behavioral.** It asks what people do, have done, or will be observed doing. Questions about what people would do, or want, or like, produce answers that do not predict behavior.
- **Owned.** Someone is waiting for the answer and will act on it. A question nobody is blocked on is a question that will be read once and filed.

Write between one and three. A study with seven research questions is several studies sharing a calendar invite, and it will answer none of them well.

## Interrogate the method request

Most research is requested as a method: "let's do a survey", "can you user-test this", "we should do some interviews". Treat the named method as a symptom and find the question underneath it.

Ask what decision is waiting, what the requester expects the answer to be, and what they would do if the opposite turned out to be true. That last question does most of the work. If there is no answer to it, the study is decoration and the honest move is to say so before spending anyone's time.

Then either confirm the method fits the question or propose the one that does, in a sentence that gives the swap a reason. Swapping a method without explaining why reads as obstruction.

## Match the method to the kind of answer

The full decision table is in [method selection](method-selection.md). The short form:

| You need to know | Method | Not |
| --- | --- | --- |
| Why people do something, what their context is | Interviews, contextual inquiry | Surveys — they cannot ask a follow-up |
| Whether people can complete a task in your interface | Usability testing | Interviews — people cannot report their own failures accurately |
| How common something is across a population | Survey, analytics | Interviews — five people cannot tell you a rate |
| Which of two designs performs better at scale | A/B test → `experimentation-and-analytics` | Preference test — stated preference and behavior diverge |
| What terms people use, how they group things | Card sorting, tree testing → `information-architecture` | Asking people to design the menu |
| Whether an interface violates known principles | `heuristic-evaluation` | Any of the above, when there is no time |

Qualitative methods tell you what and why. Quantitative methods tell you how many and how often. A study that needs both needs two methods, run in that order — qualitative first to learn what to count, quantitative second to count it.

## Size the sample by what saturates, not by what sounds rigorous

For qualitative studies, five participants per distinct user segment surfaces the large majority of issues in that segment. The number comes from diminishing returns, not from statistical power, and it applies per segment: two segments means ten sessions, not five.

Run in waves. Five sessions, synthesize, decide whether the next five would change anything. Most of the time they would not, and the budget is better spent on a second segment or a second round after a fix.

For quantitative studies the number comes from the effect you need to detect, and guessing produces studies that cannot conclude. `surveys-and-measurement` owns sample size for surveys; `experimentation-and-analytics` owns power for tests.

## Recruit for the behavior, not the demographic

Screen on what someone has done recently, not who they are. "Has filed an expense report in the last 30 days" recruits a useful participant. "Finance professional, 25–40" recruits someone who may never have touched the workflow.

Build the screener so the desirable answer is not obvious. Ask which of a list of activities someone did last month rather than asking whether they did the one you care about, and include plausible decoys. Professional participants learn to pass screeners, and a screener that telegraphs its target selects for them.

Two guards worth their cost: a question with a known-wrong option to catch inattentive responses, and a check on whether the person has taken part in research for you in the last three months. Repeat participants have learned your product and stop representing new users.

Recruit one more than you need per wave. No-show rates run high enough that planning for zero is planning to reschedule.

## Plan the analysis before collecting data

Decide, in writing, before the first session: what you will code for, what would count as a pattern, and what result would change the recommendation. This is the difference between analysis and storytelling. A plan written after seeing the data will find what the writer already believed.

For quantitative work this is not optional — the comparison and the threshold have to be fixed in advance, because choosing them after seeing the numbers manufactures significance. `experimentation-and-analytics` owns that discipline.

## Consent is a process, not a checkbox

Full detail in [ethics and consent](ethics-and-consent.md). The floor:

- Say what will be recorded, who will see it, how long it is kept and how to withdraw. In plain language, before recording starts, and again on the recording.
- Make withdrawal real. If someone can withdraw only by emailing a legal address, they cannot withdraw.
- Do not record more than the question needs. Screen sharing that captures a participant's real inbox, files or customer data is a data-handling problem you have created for yourself.
- Pay incentives regardless of whether the session completed, and regardless of what the participant said. Conditioning payment on outcome buys you the answers you paid for.
- Never treat research contact as a sales channel. It ends the relationship and poisons the panel.

Vulnerable participants, health or financial data, or anything involving minors raises the bar past this skill. Get a review.

## Evidence bar

Qualitative research does not produce rates. Never write a percentage from a study with fewer than thirty participants, and never let "4 of 5 participants" become "80% of users" — one is an observation, the other is a claim about a population you did not sample.

A pattern needs three independent observations before it is reported as a pattern. One striking observation is a hypothesis and is reported as one. Two is a coincidence worth watching.

Say what the study cannot tell you, in the plan, before it runs. A plan that claims to answer everything will be held to it.

When the honest answer is that the decision does not need research — the cost of being wrong is low, or the answer is already known — say that and do not run the study. Research that exists to justify a decision already made is the most expensive kind.

## Before you ship

| Symptom | What it means | Fix |
| --- | --- | --- |
| The plan lists more than three research questions | Several studies are wearing one plan | Pick the one blocking a decision, defer the rest |
| Every possible result leads to the same next step | The study cannot change anything | Cancel it, or find the decision it should inform |
| The screener asks directly about the target behavior | It telegraphs the right answer | Bury it in a list with decoys |
| Sample is "5 users" across three distinct segments | Five is per segment, not per study | Five each, or narrow to one segment and say so |
| The analysis approach is not written down | Findings will be shaped by whoever synthesizes | Fix the codes and the pattern threshold before session one |
| The requester cannot say what they would do if wrong | The study is decoration | Surface that before spending participant time |
| Incentive is conditional on completing or on "useful" feedback | The data is bought | Pay on showing up |

## Reporting

**The deliverable is a research plan.** One page. Any longer and nobody reads it, which defeats the purpose of writing it.

It contains, in this order:

1. **Decision** — what is waiting on this, and who owns it.
2. **Research questions** — one to three, each passing falsifiable, behavioral, owned.
3. **Method and why** — including what it was chosen over.
4. **Participants** — segments, screening criteria, number per segment, source.
5. **Protocol** — session length, tasks or topics, what gets recorded.
6. **Analysis plan** — codes, pattern threshold, what result changes the recommendation.
7. **Limits** — what this study cannot answer. Written before it runs.
8. **Timeline** — recruit, run, synthesize, share.

**Done when:** someone who was not in the planning conversation could run the study from the document, and the requester has agreed in writing to what the study will not answer.
