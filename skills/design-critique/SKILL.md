---
name: design-critique
description: Runs and receives critique on work in progress — framing the ask, separating reaction from reasoning, and capturing what was decided. Use for feedback between people, not for auditing a build.
when_to_use: Use when running or joining a design critique or review session, giving feedback on someone's design, asking for feedback on your own work, handling difficult critique conversations, or setting up a team critique practice.
disable-model-invocation: true
---

# Design critique

This skill covers feedback between people on work that is still moving. It sits in the Validate band and is user-invoked, because unsolicited critique of someone's work in progress is rarely welcome.

The governing idea: critique fails for social reasons, not analytical ones. The analysis is usually fine; the framing, the timing and the power dynamics are what determine whether anything improves.

**Works with:** `full-review` audits a finished surface against standards · `review-the-change` reviews a diff · `stakeholder-communication` handles presenting to people who are not peers · `design-docs` captures decisions durably · `design-ops` owns the team ritual.

## Start here

| The situation | Go to |
| --- | --- |
| You are presenting work | **Frame the ask before showing anything** below |
| You are giving feedback | **Describe, then ask, then suggest** below |
| Setting up a team practice | **Run it as a session with a shape** below |
| Feedback is going badly | **When critique goes wrong** below |
| You need an audit against standards | `full-review` — that is not critique |
| You need to review a diff | `review-the-change` |
| The audience is executives or clients | `stakeholder-communication` |

## Frame the ask before showing anything

The presenter's job is to make useful feedback possible, and most bad critique is caused by an unframed ask. Without one, everyone comments on what they notice, which is whatever is most visually salient — usually the least settled and least important thing.

Say four things, in under two minutes, before showing the work:

1. **The problem** — one sentence, from `problem-framing`.
2. **Where this is** — exploring, converging, or nearly done. This sets what feedback is useful.
3. **What is decided and why** — so people do not relitigate settled ground. "The nav pattern is fixed; it came out of last quarter's tree test."
4. **What you want feedback on** — specifically. "Does the second step make sense without the first?" not "what do you think?"

"What do you think?" is the question that produces the feedback nobody can use.

Where something is genuinely undecided, say so. Where something is fake — placeholder copy, grey boxes, stock data — say so, or the session will be about that.

## Describe, then ask, then suggest

The reviewer's sequence. Each step is cheaper than jumping ahead, and jumping ahead is what makes critique feel like an attack.

**Describe** what you observe, neutrally. "My eye goes to the illustration before the heading." "I read the second option as the default." This is information the presenter cannot get any other way — they cannot see their own work fresh.

**Ask** before assuming. "What led you to put the total at the bottom?" There is frequently a constraint you do not know about, and asking finds it without anyone defending anything.

**Suggest** last, and hold it lightly. "Have you tried X" is a contribution; "you should do X" is a decision you are not the one making.

Tie every point to something outside your preference: the problem statement, a research finding, a principle from an owning skill, a constraint. "This works against the finding that admins scan the left column first" is feedback. "I'd make it bigger" is a vote.

## Separate reaction from reasoning, and report both

A first reaction is real data — the presenter will never see the work fresh again — and it is not a conclusion.

Give it as what it is: "My first reaction is that this feels heavier than the old version." Then, separately, work out why, or say you cannot. An unexamined reaction stated as a judgement is what produces design-by-taste, and a reaction suppressed entirely loses information nobody else can supply.

The presenter's counterpart to this: hear a reaction as a symptom, not as a request. Someone saying a screen feels cluttered is reporting an experience; the cause may be spacing, hierarchy, content volume or contrast, and it is the presenter's job to diagnose rather than the reviewer's to prescribe.

## Run it as a session with a shape

An open-ended meeting produces the loudest person's opinion.

A shape that works for 45 minutes:

| Time | What |
| --- | --- |
| 2 min | Presenter frames: problem, stage, decided, the ask |
| 5 min | Silent looking. No talking. People write notes |
| 3 min | Clarifying questions only — facts, not opinions |
| 20 min | Feedback, one person at a time, against the stated ask |
| 10 min | Open discussion, including anything outside the ask |
| 5 min | Presenter summarizes what they heard and what they will act on |

The silent looking matters more than it sounds. Without it, the first person to speak anchors everyone, and the quieter people in the room produce nothing.

The final summary matters equally: the presenter says what they took away, which surfaces misunderstanding while everyone is still there, and makes clear that they own the decision.

Cap the group at six or seven. Larger groups produce performance rather than critique.

## The presenter decides

Critique is input, not a vote, and the person doing the work decides what to act on. This has to be stated, because otherwise every session ends with an implicit obligation to address every comment.

The presenter's responsibilities: listen without defending, ask for specifics when feedback is vague, say what they will and will not change, and say why for the ones they decline. A declined piece of feedback with a reason is a normal outcome and it keeps people contributing.

The reviewer's corresponding responsibility: not to relitigate. Say it once, well, and let it go. Where you believe something is genuinely serious rather than a preference, say that explicitly — "I think this one is a blocker, not a preference" — which is a claim you can then be held to.

Where the work is genuinely blocked on a standard rather than a preference — an accessibility barrier, a data-loss path — that is not critique, and it should be raised as a finding through `full-review` or `accessibility` rather than as an opinion in a room.

## When critique goes wrong

**Everyone comments on the visuals of an unfinished flow.** The frame did not land, or the fidelity invites it. Restate the ask; next time show it uglier — `prototyping` covers deliberate low fidelity.

**The most senior person speaks first.** Everything after is anchored. Have them speak last, deliberately, and expect to enforce it.

**Feedback is all preference.** Ask for the reason behind each one. Preferences that cannot name a reason can be set aside without argument.

**The presenter defends every point.** Usually because the stage was not framed, so feedback on an exploration landed as criticism of a proposal. Reframe, and separately: a presenter who defends everything gets less feedback next time, which is worth saying privately.

**Nothing changes afterwards.** Either the feedback was not usable or the decisions were not captured. Add the closing summary and write decisions down — `design-docs` owns the durable record.

**It becomes a status meeting.** Critique needs a specific ask and unfinished work. If the work is done, it is a review, not a critique.

## Evidence bar

Feedback tied to a problem statement, a research finding, or a rule from an owning skill is evidence. Feedback tied to nothing is a preference, and labelling it as one is not dismissive — preferences are legitimate input and are weighed differently.

Say which you are giving. "This is a preference, take it or leave it" is one of the most useful sentences in critique, because it frees the presenter from having to work out how much weight to give it.

Do not bring findings that belong to an audit into a critique of unfinished work. A contrast failure in an exploration is noise; the same failure in a build is a blocker. `accessibility` and `full-review` own those, and raising them at the exploration stage teaches people that showing early work is expensive.

Where research exists that settles a question, cite it rather than debating it. Where it does not and the question matters, the right output is a research question for `research-planning`, not a longer discussion.

## Before you ship

| Symptom | What it means | Fix |
| --- | --- | --- |
| The ask was "what do you think?" | Feedback will be unusable | Name the specific question |
| Feedback is all about placeholder copy | The fake parts were not flagged | Say what is fake before showing |
| People comment on visuals of a flow exploration | Fidelity invites it, or the stage was not framed | Restate; show it uglier |
| The senior person spoke first | Everything after is anchored | They speak last |
| No silent looking | The first speaker anchors the room | Five minutes, no talking |
| Feedback with no reason attached | Preference presented as judgement | Ask for the reason; set aside if none |
| The presenter defended every point | The stage was probably misframed | Reframe; raise the pattern privately |
| Suggestions arrive before questions | Constraints nobody knew about get missed | Describe, ask, then suggest |
| An accessibility blocker raised in an exploration critique | Wrong venue; teaches people not to show early work | Route to `accessibility` |
| Nothing changed after the session | Decisions were not captured | Closing summary; write it down |
| Ten people in the room | Performance, not critique | Cap at six |

## Reporting

**The deliverable is a short written summary**, produced by the presenter within a day. Verbal critique evaporates, and the same feedback arrives again a fortnight later.

1. **What was shown** — the work, and the stage it was at.
2. **The ask** — as framed.
3. **What we heard** — themes, not a transcript. Group repeated feedback; a point made by four people is different from a point made by one.
4. **Decisions** — what will change, and what will not, with a reason for each decline.
5. **Open questions** — anything the room could not settle, with how it will be settled: a decision owner, or a research question for `research-planning`.
6. **Blockers raised** — anything claimed as a standard rather than a preference, routed to the owning skill.

**Done when:** the presenter has said what they will act on, every decline has a reason, and anything unsettled has a route rather than a hope that it comes up again.
