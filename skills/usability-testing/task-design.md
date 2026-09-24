# Task design

How to write tasks that test the interface, sequence them so they do not contaminate each other, and set up the environment they run in.

## Anatomy of a task

A usable task has four parts. Three are written down; the fourth is what you watch for.

1. **A scenario** — the situation the participant is in. One or two sentences, concrete, with a reason to act.
2. **A goal** — what they are trying to achieve, stated as an outcome.
3. **A stopping condition** — how the participant knows they are done, and how you know. Without it, participants keep going or stop early, and completion becomes a judgement call.
4. **A success definition** — written before the session, for your own use. What state must the system be in?

Example:

> **Scenario.** You manage a team of eight. Someone told you the bill went up this month and you don't know why.
>
> **Goal.** Find out what changed, and tell me what you'd do about it.
>
> **Stopping condition.** Tell me when you've found the answer or when you'd give up.
>
> **Success (internal).** Participant reaches the billing history view and identifies the seat count change. Partial: reaches billing but attributes it to the wrong cause.

The stopping condition doing double duty — "or when you'd give up" — matters. It gives the participant permission to fail, which is the only way you learn where the abandonment point is.

## Strip the interface vocabulary

Read the task and the screen side by side. Every word that appears in both is a hint.

> ❌ "Use the **Filters** panel to **sort** the **orders** by **value**."
> ✅ "Your manager wants to know which orders this month were unusually large."

This is the most common single defect in test tasks, and it inflates completion rates enough to make a test worthless. The participant is matching strings, and string matching is not navigation.

The check: could a participant complete this task by scanning the page for words in the task text? If yes, rewrite.

## Do not give the path

> ❌ "Go to Settings and change your notification preferences so you only get a daily summary."
> ✅ "You're getting too many emails from us. Fix it."

The second version tests whether the participant can find the setting, whether they expect it in Settings, whether they try the unsubscribe link in an email instead, and whether the option they want exists. The first tests nothing.

Where a later task depends on reaching a particular state, do not give the path in the earlier task — help after failure, and mark it assisted.

## Give a reason, not just an instruction

Tasks without motivation produce compliance behavior: the participant does the minimum to satisfy you and stops. Tasks with a reason produce something closer to real use, including the judgement calls.

> ❌ "Add a user to the account."
> ✅ "Someone joined your team this morning and needs to start work today. Set them up."

"Needs to start work today" is doing real work: it tells you whether the participant looks for a way to skip the invitation flow, whether they worry about permissions, and whether they check that it worked.

Avoid reasons that are more interesting than the task. A vivid scenario invites the participant to role-play rather than behave.

## Keep tasks independent, or sequence them deliberately

Two options, and mixing them causes trouble:

**Independent tasks.** Each starts from a known state. Reset between tasks. Order can be randomized, which removes learning effects, and a failure early does not block everything after.

**A sequenced scenario.** Tasks build, as a real session would. More realistic, and the only way to test a genuine multi-step flow. The cost is that a failure at step two invalidates steps three through six, so you must be prepared to hand the participant the state and mark the rest assisted.

Decide which you are doing and say so in the plan. An unstated mixture produces results nobody can interpret.

Where tasks are independent, counter-balance the order across participants — first task gets the freshest attention and the least product knowledge, and if every participant does the same one first, that difference is baked into the results.

## Order tasks from broad to specific

Early tasks should not reveal what the study is about. A first task that goes straight to the new feature tells the participant where to look for the rest of the session.

A workable order:

1. **Orientation** — something ordinary that establishes how they read the interface. Often "tell me what you think this is and what you'd do first," before any task.
2. **Core flow** — the main thing under test.
3. **Edge and error** — force a wrong turn, an empty state, an invalid input. This is where `components-and-states` and `forms-and-input` findings come from, and it is the most-skipped section of most tests.
4. **Targeted** — the specific questions the team asked for.

## Test the unhappy path on purpose

Most tests only exercise the happy path, and most real failures happen off it. Deliberately include at least one task that produces:

- An empty state — a new account, a filter with no matches, a first-run view.
- An error — an invalid input, a duplicate, an expired link, a permission denial.
- A recovery — undo something, cancel mid-flow, go back after a mistake.
- A boundary — the longest realistic name, the largest number, a decimal where an integer is expected.

These tasks feel artificial to write and consistently return the highest-severity problems.

## Set up the environment before the session, not during it

- **Data.** Seed the account with realistic content. An empty account tests an empty account; a demo account with three perfect records tests nothing. Realistic means enough rows to require scrolling or filtering, and messy enough to resemble real use.
- **Names.** Use synthetic but plausible data. Participants disengage from "Test User 1" and "asdf".
- **State.** Know exactly what state the account is in, and have a reset procedure that takes under a minute. A reset that takes five minutes will not get done between sessions.
- **Prototype limits.** Write down what the prototype cannot do before the session. When a participant hits a dead end, say "that's not built in this version" immediately and neutrally — pausing to work out whether it is a bug wastes session time and signals that something went wrong.
- **Accounts.** Never test on a participant's real account with real data. If the task requires their data, see `research-planning` on recording limits.

## Timing

| Session length | Realistic task count |
| --- | --- |
| 30 min | 2–3 |
| 45 min | 3–4 |
| 60 min | 4–6 |

These assume think-aloud, which roughly doubles task duration. Budget five minutes for setup and consent, five for warm-up, and five for debrief, and cut tasks rather than rushing them. A rushed task produces a moderator who helps.

Pilot with one person — a colleague is fine — before the first real session. The pilot catches ambiguous wording, broken test data and tasks that run twice as long as expected. Skipping the pilot is how a five-session study becomes a four-session study.

## Task wording checklist

Before the session, for each task:

- [ ] Contains no word that appears in the interface as a label
- [ ] States a goal, not a path
- [ ] Has a reason the participant would care about
- [ ] Has a stopping condition that permits giving up
- [ ] Has a written success definition with a partial-credit case
- [ ] Can be completed in the prototype as built
- [ ] Does not depend on a previous task, or is explicitly marked as sequenced
- [ ] Was read aloud to someone who has not seen the interface, who then restated it correctly
