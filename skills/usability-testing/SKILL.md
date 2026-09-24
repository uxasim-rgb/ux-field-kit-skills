---
name: usability-testing
description: Designs tasks and runs moderated or unmoderated usability sessions, then rates the problems found by severity. Use when the question is whether people can actually complete something in the interface.
when_to_use: Use when planning or running a usability test, writing test tasks, moderating a think-aloud session, testing a prototype with users, deciding moderated vs unmoderated, rating the severity of usability problems, or when someone asks "can we test this with users before we ship".
---

# Usability testing

This skill produces tasks, runs sessions and turns observed failures into rated problems. It sits in the Research band and is the only method that tells you whether an interface works, as opposed to whether people say it works.

The governing idea: you are testing the interface, not the participant, and the task wording is where most tests are won or lost.

**Works with:** `research-planning` owns method choice and recruiting · `user-interviews` owns asking about context rather than observing tasks · `heuristic-evaluation` is the no-participant substitute · `research-synthesis` owns combining results across studies · `accessibility` owns testing with assistive technology.

## Start here

| The situation | Go to |
| --- | --- |
| You need the tasks written | [Task design](task-design.md) |
| You have findings and need to rank them | [Severity rating](severity-rating.md) |
| Choosing moderated vs unmoderated | **Pick the mode by what you need to learn** below |
| No participants, no time | `heuristic-evaluation` |
| The question is why people behave a certain way | `user-interviews` |
| The question is which of two designs wins | `experimentation-and-analytics` |
| Testing with a screen reader or keyboard only | `accessibility`, then return here for protocol |
| Sessions are done and you need the report | **Reporting** below |

## Role lens

| Role | Takes from this skill |
| --- | --- |
| UX researcher | The full protocol, severity model and analysis approach |
| Product designer | Task design and the five-participant loop, enough to run it without a researcher |
| Design engineer | The state and edge-case coverage that tests expose, feeding `components-and-states` |

## Test the task, never the participant

Say it out loud at the start and mean it: "We're testing the software, not you. If something is confusing, that's a problem with the design."

Participants who believe they are being assessed will not report confusion, will push through failures silently, and will apologize instead of describing. Every one of those behaviors destroys the data you came for.

The moderator's tells matter more than the script. Reacting to success, sighing at a wrong turn, or saying "almost" all communicate assessment. Stay flat.

## Write tasks as goals with a reason, never as instructions

A task that names the interface element tests whether the participant can read. A task that states a goal tests whether the interface communicates the path.

| Instruction — tests nothing | Goal — tests the design |
| --- | --- |
| Click Settings, then Billing, then Change plan. | You've decided the team plan is too expensive for what you use. Sort that out. |
| Use the filter to find orders over $500. | Your manager wants to know which orders this month were unusually large. Find out. |
| Add a new user with admin permissions. | A new person joined your team today and needs the same access you have. |

Strip every word that appears in the interface. If the task says "archive" and the button says "Archive", the participant is pattern-matching, not navigating.

Give each task a reason. The reason supplies the context a real user would have and stops the participant from inventing their own, which is the main source of unrepeatable sessions. Full guidance in [task design](task-design.md).

## Pick the mode by what you need to learn

| | Moderated | Unmoderated |
| --- | --- | --- |
| Best for | Why a failure happened | How often it happens |
| Participants | 5 per segment | 20–50 |
| You get | Reasons, follow-ups, recovery from broken tasks | Completion rates, time on task, a clip pile |
| You lose | Frequency, and a day per five sessions | The ability to ask a single follow-up |
| Fails when | The sample is too small to quantify | The task is ambiguous, and you find out afterwards |

Run moderated first when the design is new: an ambiguous task in an unmoderated study wastes the whole study, and you will not know until analysis. Run unmoderated when the flow is stable and the question is rate rather than reason.

Five participants per segment surfaces the large majority of issues in that segment. It is not a statistical claim and it does not license a percentage. Two segments means ten sessions.

## Ask for think-aloud, then stop talking

Ask the participant to narrate what they are trying to do and what they expect. Prompt when they go quiet, with the same neutral phrase every time: "What are you thinking?" or "What were you expecting there?"

Do not prompt at the moment of difficulty. Asking "what are you thinking?" precisely when someone hesitates converts a silent struggle into a narrated one and changes the behavior you are measuring. Prompt on a timer, not on a stumble.

Think-aloud slows people down and makes time-on-task unusable as a metric. If time matters, run it silently and debrief afterwards using the recording.

## Never help until the task is over

The instinct to rescue a struggling participant is the single biggest threat to the data. A participant stuck for ninety seconds is producing the most valuable footage in the session.

The escalation ladder, in order, one step at a time:

1. Silence. Count to twenty.
2. "What are you trying to do right now?"
3. "What would you do if I weren't here?" — the highest-value question in a usability test. It reveals whether they would abandon, ask a colleague, call support, or try something else.
4. "Take as long as you need, or tell me if you'd like to stop."
5. End the task. Mark it failed. Move on.

Help only after step 5, if a later task depends on reaching this state. Then help minimally, note that the task was assisted, and exclude it from completion rates.

## Record what happened before what it meant

During the session capture observations: what the participant did, where they clicked, what they said verbatim, where they paused, where they backtracked. Interpretation comes later and elsewhere.

"Participant scrolled past the filter twice, then used browser search" is an observation. "Participant didn't see the filter" is an inference — plausible, but it is a conclusion and it belongs in analysis where it can be checked against the other four sessions.

Timestamp anything worth clipping. Finding a moment in a recording afterwards costs more than noting it at the time.

## Rate severity by consequence, not by annoyance

A problem's severity is a function of impact, frequency and persistence — not of how irritating it looked in the room. The model and the ladder are in [severity rating](severity-rating.md).

The short form: a problem is **Critical** if users cannot complete the task or lose data or money; **Serious** if they complete it slowly, with workarounds, or with errors they notice; **Moderate** if it causes hesitation that resolves; **Minor** if it is noticed and shrugged off.

Frequency modifies rather than sets it. A problem hit by one participant on a task every user performs daily outranks a problem hit by four on an edge-case flow.

## Evidence bar

Report counts, never percentages. "4 of 5 participants failed" is the finding; "80% of users fail" is a claim about a population five people cannot support.

One participant failing a task is a signal, not a finding — unless the failure is catastrophic, in which case one is enough, because the cost of ignoring it is asymmetric. Data loss, a charge the user did not intend, or a dead end with no recovery is reportable at n=1.

Separate observed failure from stated dissatisfaction. Someone who completed the task while complaining has not found a usability problem; they have expressed a preference. Both are worth knowing and they are different rows.

Where a problem was caused by the test rather than the design — an ambiguous task, a prototype dead end, a broken test account — say so and exclude it. A finding that is an artifact of the protocol will be discovered by an engineer later, at the cost of the study's credibility.

## Before you ship

| Symptom | What it means | Fix |
| --- | --- | --- |
| Every participant completed every task quickly | The tasks named the interface elements | Rewrite as goals; strip interface vocabulary |
| Participants apologize for struggling | They believe they are being assessed | Restate that the software is under test; flatten your reactions |
| The moderator answered a question mid-task | The data for that task is contaminated | Mark it assisted, exclude from rates |
| Findings are written as solutions | Analysis skipped the observation | Restate as what happened, then what it means, then the fix |
| The report contains a percentage from five sessions | Qualitative data is being quantified | Use counts |
| The same task failed for a different reason each time | The task is ambiguous, not the design | Rewrite the task and rerun it |
| Severity was assigned by how bad it felt | Annoyance is standing in for consequence | Re-rate against impact, frequency and persistence |
| Only the happy path was tested | The interface's error states are unobserved | Add a task that forces a wrong turn; see `components-and-states` |

## Reporting

**The deliverable is a rated problem list with evidence**, not a session-by-session narrative. Nobody acts on a narrative.

**Severity ladder:** `Critical` — task cannot be completed, or data, money or trust is lost · `Serious` — completed with errors, workarounds, or substantial delay · `Moderate` — hesitation or a wrong turn that the participant recovers from · `Minor` — noticed, mentioned, no effect on outcome.

**Verification before reporting:** every problem has at least one timestamped observation; every severity has a stated consequence; every task has a completion count; any assisted or excluded task is marked.

**Format:**

1. **What was tested** — build or prototype, date, tasks, and what was *not* covered.
2. **Participants** — segments and counts. No names.
3. **Task completion table** — task, completed unassisted, completed with difficulty, failed.
4. **Problems**, ordered by severity, each with: severity, what was observed, how many participants hit it, the consequence, a verbatim quote, and the owning skill for the fix (`information-architecture`, `content-design`, `forms-and-input`, `components-and-states`, `accessibility`).
5. **What worked** — short, and honest. A report with no positives will be read as an attack on the designer, and the team needs to know what not to break.
6. **Limits** — sample, segments not covered, anything the prototype could not do.
7. **Next step** — one. Usually: fix Critical and Serious, retest the same tasks.

**Done when:** every problem names a consequence rather than a feeling, and the team can start work from the list without rewatching a session.
