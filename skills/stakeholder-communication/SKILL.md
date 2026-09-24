---
name: stakeholder-communication
description: Frames design work for the person hearing it — executives, engineering, sales, clients — and handles pushback without either capitulating or digging in. Use when the work is right and the conversation is the risk.
when_to_use: Use when presenting design work to stakeholders or leadership, framing a recommendation for an executive or client, handling pushback or disagreement, negotiating scope, explaining why a design decision was made, or preparing for a review where the work may be challenged.
---

# Stakeholder communication

This skill covers getting good work accepted by people who did not do it. It sits in the Practice band.

The governing idea: your audience is not evaluating the design. They are evaluating whether the decision is sound and whether you have thought about what they are responsible for.

**Works with:** `design-critique` covers feedback among peers · `design-docs` owns the durable written record · `success-metrics` supplies the outcome language executives use · `prioritization` owns declining work · `research-synthesis` supplies the evidence.

## Start here

| The situation | Go to |
| --- | --- |
| Presenting to leadership | **Lead with the decision and the outcome** below |
| A stakeholder is pushing back | **Find out what is underneath it** below |
| Being asked to add scope | `prioritization` owns the decline; **Say no with a condition** below |
| Presenting to engineering | **Match the frame to what they own** below |
| Feedback among peers on unfinished work | `design-critique` |
| The decision needs writing down | `design-docs` |
| A specific design decision is being questioned | **Argue from the problem, never from craft** below |

## Lead with the decision and the outcome

Most design presentations are structured as a journey: here is the process, here is the research, here are the explorations, here is where we landed. That structure works for a team that shares your context and fails for everyone else, who spend the first ten minutes not knowing what they are being asked.

Invert it:

1. **What we are doing**, in one sentence.
2. **What changes as a result** — the outcome, in their terms.
3. **What we need from you** — a decision, a resource, an approval, or nothing.
4. *Then* the reasoning, the evidence and the alternatives, for whoever wants them.

If the meeting is cut to five minutes, the first three points are the whole meeting. If it runs full length, the rest is there.

Show the work, not the process. A senior audience does not need the exploration; they need to know the alternatives were considered, which is one sentence rather than fifteen slides.

## Match the frame to what they own

The same decision needs a different framing per audience. This is not spin — it is naming the consequence each person is accountable for.

| Audience | They are accountable for | Frame it as |
| --- | --- | --- |
| Executive | Outcomes, risk, cost | The business result, the risk of not doing it, what it costs |
| Product | Roadmap, scope, tradeoffs | What it displaces, what it unblocks, the size |
| Engineering | Feasibility, maintenance | Constraints respected, complexity, what it makes harder later |
| Sales / Success | Deals and renewals | Objections it removes, what they can now say |
| Support | Ticket volume | Which tickets stop arriving |
| Legal / Compliance | Exposure | Which obligation it satisfies, what data is involved |
| Client | Their goal and their budget | Their stated objective, delivered |

Prepare one sentence per audience in the room before the meeting. Being able to say "for support, this should remove the access-review tickets that were 12% of Q1 volume" is what turns an observer into an ally.

## Argue from the problem, never from craft

Craft arguments lose to people who do not share your craft, and they should — "it's better typography" is not a reason anyone outside design can evaluate or act on.

| Weak | Strong |
| --- | --- |
| The hierarchy is wrong | 4 of 5 admins missed the primary action in testing |
| This isn't accessible | This fails WCAG 2.2 AA, which our enterprise contracts require |
| It feels cluttered | Task completion drops from 71% to 44% on this screen |
| Users won't like it | Users who hit this step contact support 3× more often |
| This is bad design | This will produce the support volume we saw with the previous version |

Every strong version names a consequence the listener already cares about. Where you have research, cite it with counts. Where you do not, say so and name the cost of finding out — which is usually smaller than the cost of being wrong, and that comparison is the argument.

Accessibility and legal obligations are the one place to argue from the standard directly, because the standard is the consequence.

## Find out what is underneath the pushback

Stated objections are frequently not the real one. Someone saying "it looks too plain" may mean they are worried it does not look like enough work happened, or that a competitor looks flashier, or that they were not consulted.

Ask before defending. "What's the concern?" and "What would you expect to see instead?" cost nothing and find the real objection most of the time.

The common ones and what they usually mean:

| They say | It may mean |
| --- | --- |
| It looks too simple | I cannot tell what we paid for, or a competitor looks richer |
| Users will be confused | I would be confused, or I have been burned by a change before |
| Can we just add a toggle? | I do not want to lose an argument about the default |
| Let's do more research | I disagree and do not want to say so directly |
| Our users are different | I have specific knowledge you have not acknowledged |
| I don't like the color | Nothing else was offered as a way to participate |

The last one is worth designing around: an audience given no legitimate way to contribute will contribute on the most accessible surface, which is always the visuals. Give them a real question to answer and the color comments largely stop.

## Say no with a condition

`prioritization` owns the decision. This skill owns the delivery.

Four parts, every time:

1. **What you understood the request to be** — demonstrates you engaged.
2. **What it is competing against**, specifically. Not "we're at capacity".
3. **What would change the decision** — a number, a customer count, a date. This turns a refusal into a condition.
4. **What they can do now** — a workaround, a manual process, or when it will be reconsidered.

Never decline by going quiet, and never decline with "it's not a priority" alone — that communicates a ranking without its reasoning, reads as dismissal, and guarantees the request returns through someone more senior.

## Disagree with the argument, not the person, and know when to stop

When a decision goes against the evidence, say so once, clearly, in writing: what the evidence says, what the risk is, and what you recommend. Then implement the decision made.

Continuing to relitigate after a decision costs your credibility for the next one, and the next one may matter more. Record the disagreement in `design-docs` with a **revisit if** condition, so it can be reopened on evidence rather than on persistence.

The exception: where the decision creates a real harm — an accessibility barrier that excludes people, a dark pattern, a data-loss path, a legal exposure — escalating is appropriate, and it should be done in writing, once, to the person who owns the risk. Name the harm and the obligation, not your preference.

## Evidence bar

Bring counts and measurements, and bring their limits. A stakeholder who discovers that "80% of users" came from four participants will discount everything you present afterwards, including the parts that were solid.

Say which claims are evidence and which are judgement. "The structure change is supported by testing; the 30-day default is my judgement and we should watch it" is more persuasive than uniform confidence, because it tells the audience how much weight to give each part.

Do not manufacture certainty to win a room. The cost arrives later, and it arrives as a reputation rather than as a single correction.

Where you are asked for a prediction you cannot make, say what you would need to answer it and what it would cost. "I don't know, and here is the cheapest way to find out" is a stronger position than a confident guess, and it converts an argument into a plan.

## Before you ship

| Symptom | What it means | Fix |
| --- | --- | --- |
| The presentation opens with process | The audience does not know what is being asked | Decision and outcome first |
| Fifteen slides of exploration | Showing process, not work | One sentence that alternatives were considered |
| The argument is about craft | Cannot be evaluated by the audience | Name the consequence they own |
| No ask stated | Silence will be read as approval | Inform, input or decide — say which |
| Every stakeholder got the same framing | Nobody heard what they are accountable for | One sentence per audience, prepared |
| The objection was defended immediately | The real concern is still unknown | Ask what the concern is |
| Everyone comments on color | No legitimate way to contribute was offered | Give them a real question |
| A no was delivered as "not a priority" | Ranking without reasoning | Four parts: understood, competing, condition, workaround |
| The decision was relitigated for weeks | Credibility spent on one decision | Say it once in writing; record a revisit condition |
| A qualitative finding was quoted as a percentage | Will be discovered and discount everything | Counts, with n |
| Uniform confidence across evidence and guesses | The audience cannot weight it | Mark which is which |
| A confident answer to an unanswerable question | Costs arrive later as reputation | "I don't know, here is what it would take" |

## Reporting

**The deliverable is usually a short written follow-up**, sent within a day. Verbal agreement is not durable, and the same discussion recurs otherwise.

1. **What was decided** — or what remains open, with the decider and date.
2. **What we agreed the outcome would be** — the metric from `success-metrics`.
3. **Concerns raised, and how each was addressed** — including any not addressed, said plainly.
4. **Disagreements recorded** — where you advised differently, stated once, with the revisit condition.
5. **Next steps** — with owners and dates.

Where the meeting was a decision point, the record belongs in `design-docs` as a decision record rather than living in a thread.

**Done when:** the ask was explicit, every audience heard the consequence they own, the evidence carried its limits, and the outcome exists in writing where someone who was not in the room can find it.
