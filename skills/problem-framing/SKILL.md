---
name: problem-framing
description: Turns a requested solution back into the problem it was meant to solve, surfaces the assumptions underneath it, and writes a problem statement a team can build against. Use before committing to a feature.
when_to_use: Use when a stakeholder asks for a specific feature, when the team disagrees about what to build, when writing a problem statement or jobs-to-be-done, mapping assumptions and risks, or when someone says "we should build X" and nobody has said what X is for.
---

# Problem framing

This skill converts a solution request into a stated problem, then exposes the assumptions the solution depends on. It opens the Define band and is the cheapest intervention in the whole collection.

The governing idea: almost every request arrives as a solution, and the solution is a compressed guess about a problem nobody has written down. Decompress it before building.

**Works with:** `research-planning` supplies evidence when the problem is asserted rather than observed · `audience-and-journeys` owns who has the problem and where · `prioritization` owns whether to solve it now · `success-metrics` owns how you will know it was solved · `design-docs` owns writing the decision down.

## Start here

| The situation | Go to |
| --- | --- |
| Someone asked for a specific feature | **Work backwards from the solution** below |
| The problem is asserted, not observed | `research-planning` — but read **Assumption mapping** first to pick what to test |
| The team agrees on the problem but not the solution | You are past this skill; go to `user-flows` or `prototyping` |
| The team disagrees about the problem | **Write one problem statement** below, then circulate it |
| You have research findings and need a decision | `research-synthesis` output feeds directly into **Write one problem statement** |
| It is clear what to do and only when is in question | `prioritization` |

## Role lens

| Role | Takes from this skill |
| --- | --- |
| Product designer | The full framing chain, and the problem statement as the artifact that aligns a team |
| UX researcher | Assumption mapping, which turns a vague request into a testable research question |
| Design engineer | The five-whys walk, to find out whether a requested implementation is the only one that solves the thing |

## Work backwards from the solution

A request names a solution. Three questions recover the problem, and they work in almost every setting because they are not confrontational.

1. **What will be different once this exists?** Answers the outcome. If the answer is "we'll have the feature", there is no outcome behind it, and that is the finding.
2. **Who is having a bad time today, and what does that look like?** Answers the problem and the population. Vague answers here mean nobody has watched anyone.
3. **What happens if we do nothing?** Answers urgency and size. "Nothing much" is a legitimate answer and it should stop the project.

Ask them in that order and in the requester's language. The failure mode is asking them as a challenge — "why do you even want this" — which turns a framing conversation into a defence of the request.

Where the answers come back solid, stop. Framing is finished and the request was well-formed; say so and move on. Running the full ritual on a well-formed request is how this skill earns a reputation for obstruction.

## Name the problem without naming the mechanism

A problem statement that contains a solution has decided the design before anyone looked at alternatives.

| Contains the mechanism | States the problem |
| --- | --- |
| Users need a bulk-edit feature | Admins updating more than ten records abandon the task partway, leaving records inconsistent |
| We need better onboarding docs | New users cannot get their first successful result without contacting support |
| The dashboard needs filters | Managers cannot answer "what changed this week" without exporting to a spreadsheet |

The right-hand column leaves room for five designs. The left-hand column has one, and it may not be the best one — bulk edit is one answer to abandonment, and so is making the single-record edit fast enough that ten in a row is tolerable.

The test: can you think of two genuinely different solutions that would both satisfy the statement? If not, the statement contains a solution.

## Use jobs to be done to find the real competition

A job is what someone is trying to accomplish, described in a way that is stable across solutions. People do not want a drill; they want a hole; and what they actually want is the shelf up.

Written as a job: **when [situation], I want to [motivation], so I can [outcome]**.

> When I get back from a week off, I want to see what changed while I was away, so I can work out what needs me today.

Two things this buys. First, the competition becomes visible — the competitor here is not another dashboard, it is scrolling the team channel and asking a colleague. Second, the job stays true when the interface changes, so it survives the redesign that invalidates every screen-level requirement.

Jobs are recovered from research, not invented in a room. Where the job is invented, mark it as an assumption and treat it as one. `user-interviews` recovers jobs well because it asks about past events, which is where jobs live.

## Map assumptions by risk, then test the top-left

Every framing rests on assumptions. Write them down as declarative statements, then place each on two axes: **how confident are we**, and **how much damage if we are wrong**.

| | Low damage | High damage |
| --- | --- | --- |
| **High confidence** | Ignore | Note it; revisit if the project changes |
| **Low confidence** | Ignore | **Test this first** |

The low-confidence, high-damage quadrant is the research backlog, in priority order. Everything else is noise, and teams routinely spend research budget on the low-damage quadrant because those questions are easier to answer.

Four assumption types, and the order they usually fail in:

- **Value** — someone wants this solved. Fails most often, and is tested last most often.
- **Usability** — they can work out how to use the solution. `usability-testing` owns this.
- **Feasibility** — it can be built and operated. Ask engineering before framing hardens, not after.
- **Viability** — the business can sustain it. Pricing, support load, compliance.

Write each as something falsifiable: not "users want faster export" but "admins who export more than weekly will use a scheduled export instead of manual". The second can be wrong in a way you would notice.

## Five whys, with a stop rule

Walking the chain from a symptom to a cause is useful and gets abused. The abuse is walking until you reach something profound — "our culture doesn't value quality" — which is unactionable and ends the conversation.

Stop at the first cause your team can actually change. That is the level to frame at. Going deeper produces a truer statement and a less useful one.

Also stop when the next "why" would be a guess. A chain that leaves evidence behind partway is a chain of assumptions, and the ones past that point belong in the assumption map rather than the problem statement.

## Write one problem statement, and circulate it before designing

One paragraph. Everyone who will work on this reads it and can object to it. The objections are the point: a team that has not agreed on the problem will disagree about the solution forever, and the disagreement will be conducted in terms of design details where it cannot be resolved.

The five parts:

> **Who.** Admins managing more than 20 team members.
> **Situation.** Doing the quarterly access review, which happens in a two-week window.
> **Problem.** They cannot see who has access to what without opening each member individually, so most sample rather than review fully.
> **Evidence.** 4 of 5 admins in the March study; 62% of enterprise accounts have never completed a full review (product analytics, Q1).
> **Cost of not solving.** Access reviews are a compliance requirement for our enterprise tier; two deals last quarter raised it in security review.
> **What we are not solving.** Permission model changes. Delegated review. Anything below 20 members.

The last line does more work than the rest combined. An explicit non-goal is the only thing that reliably stops scope drift, because it gives everyone a shared sentence to point at when the fourth adjacent idea arrives.

## Evidence bar

Mark every claim in the statement as observed, inferred or assumed. A problem statement where all three are written flat reads as equally certain, and the assumed parts are where the project will fail.

Where the core claim — that this problem exists and matters — is assumed rather than observed, say so in the statement itself and name the cheapest study that would settle it. Do not block on it; teams do build on assumption, legitimately, when the cost of being wrong is affordable. Make the choice visible instead of implicit.

Do not frame toward a predetermined answer. When the framing keeps arriving at the solution that was originally requested, that is worth a second look — it may be right, and it is also what confirmation looks like from the inside. Check whether any assumption in the map, if false, would rule the solution out. If none would, the map is not doing its job.

When the honest conclusion is that the problem is small or already solved, write that. Killing a project at framing is the highest-return thing this skill does and the thing it will be least thanked for.

## Before you ship

| Symptom | What it means | Fix |
| --- | --- | --- |
| The problem statement names a mechanism | The design is already decided | Rewrite until two different solutions would satisfy it |
| Only one solution can satisfy the statement | Same as above, harder to see | Generate a second; if you cannot, the statement is a spec |
| "What happens if we do nothing" has no answer | Urgency is assumed | Find it or deprioritize; `prioritization` owns the call |
| The assumption map has 20 entries | Everything was listed, nothing was ranked | Keep only low-confidence and high-damage |
| Assumptions are not falsifiable | They cannot be tested, so they will not be | Rewrite each as a statement that could be shown wrong |
| No non-goals | Scope will drift and nobody will have a sentence to stop it with | Write what you are explicitly not solving |
| Evidence is a stakeholder's opinion | The problem is asserted | Mark it assumed; name the study that would settle it |
| Five whys ended at "culture" or "incentives" | Walked past the actionable level | Back up to the last cause this team can change |
| The framing confirmed the original request exactly | Possibly right, possibly circular | Check whether any assumption being false would rule it out |

## Reporting

**The deliverable is a one-page framing document.** It is read by everyone who touches the project and it is the thing `design-docs` builds on.

1. **The request as received** — verbatim, with who asked and when. This matters later when the work is questioned.
2. **Problem statement** — the six parts above.
3. **The job** — when / I want to / so I can, with its source.
4. **Assumptions** — the low-confidence, high-damage ones only, each marked value / usability / feasibility / viability, each falsifiable.
5. **What would change our mind** — the result that would make the team drop this.
6. **Evidence status** — observed, inferred or assumed, per claim.
7. **Recommended next step** — one. Usually either a study from `research-planning` or a decision from `prioritization`.

**Done when:** the requester recognizes their request in it, two people who disagreed can point at the same sentence, and at least one thing is written under non-goals.
