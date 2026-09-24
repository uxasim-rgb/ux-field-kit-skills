---
name: audience-and-journeys
description: Defines segments from behavior, builds personas only where they earn their keep, and maps journeys and service blueprints that show where an experience actually breaks. Use when the team cannot agree who this is for.
when_to_use: Use when creating personas or user segments, mapping a customer journey, building a service blueprint, identifying pain points across a flow, working out who the primary user is, or when someone asks "who are we designing this for" or wants an as-is vs to-be journey.
---

# Audience and journeys

This skill answers who has the problem and where in their experience it happens. It sits in the Define band between `problem-framing` and `prioritization`.

The governing idea: a segment is a group that behaves differently and therefore needs a different decision. Any grouping that does not change a decision is decoration.

**Works with:** `research-synthesis` supplies the evidence · `problem-framing` owns the problem itself · `information-architecture` and `user-flows` own the structure once the audience is settled · `success-metrics` owns measuring the journey · `content-design` inherits the vocabulary found here.

## Start here

| The situation | Go to |
| --- | --- |
| You need to decide who the primary user is | **Segment by behavior** below |
| Someone asked for personas | **Personas are a communication device** — check they will be used first |
| You need to find where the experience breaks | **Map the journey as it is** below |
| The breakage is internal — handoffs, systems, staff | **Service blueprints** below |
| You have the journey and need to fix a step | `user-flows` for the path, `content-design` for the words |
| You want to measure the journey | `success-metrics` |
| You have no research at all | `research-planning` — personas from imagination are worse than none |

## Role lens

| Role | Takes from this skill |
| --- | --- |
| Product designer | Segmentation that decides the primary user, and non-goals for the rest |
| UX researcher | The evidence standard for personas, and the as-is journey as a synthesis output |
| Design ops / service design | Service blueprints, and the backstage view of where handoffs fail |
| Content designer | Segment vocabulary, and the moments where tone has to change |

## Segment by behavior, not by demographic

Age, job title, company size and industry are convenient because they are in the CRM. They are rarely why someone behaves differently.

Segment on something that changes what the product must do:

| Weak axis | Strong axis |
| --- | --- |
| Company size | Whether they have a dedicated admin or the founder does everything |
| Job title | Whether they use the product daily or monthly |
| Industry | Whether their data arrives clean or needs reconciling |
| Age | Whether they learned the domain on this product or on a previous one |
| Region | Whether they work alone or need someone else to approve |

The test for a segment: **name the decision it changes.** If admins and members would get the same interface, the same defaults and the same copy, they are not two segments for this project — they are two labels.

Two or three segments is usually the useful maximum. Beyond that, nobody remembers them and the team silently reverts to designing for themselves.

## Name the primary segment and accept the cost

Designing for everyone produces an interface optimized for nobody. Name one primary segment, and write down what the others lose.

> **Primary.** Admins doing quarterly access review.
> **Secondary.** Members checking their own access — supported, not optimized.
> **Not served.** Auditors needing export for external review; they will continue to use the API.

The "not served" line is what makes this real. A ranking with no consequences attached is a preference; a ranking that says what the third group gives up is a decision.

Revisit the ranking when the product's usage changes, not when a loud customer appears.

## Personas are a communication device, and they expire

A persona is a compression of research into something a team will remember in a meeting. That is a real job. It is also the only job — a persona is not evidence, and it cannot answer a question that the underlying research did not.

Build one only when all three hold:

1. **The research exists.** Personas assembled from imagination, sales anecdote or stock photos actively mislead, because they get treated as facts.
2. **The team will use it.** Personas are made far more often than they are consulted. If nobody will reference it in a design discussion, write a segment description instead and save the effort.
3. **The segment behaves distinctly.** Otherwise you are giving one audience two names.

What belongs in one: the behavior that defines the segment, their goal, their context and constraints, what they currently do instead, their vocabulary, and the evidence it rests on with counts. What does not belong: a name and photo that invite the team to reason about a fictional individual, invented hobbies, and any demographic that does not change a decision.

Put the evidence line on the persona itself — "from 12 interviews, Mar 2026; 4 admins, 8 members" — and a review date. A persona with no date will be quoted in three years.

Where the team wants personas mainly as a shared shorthand, a lighter artifact usually works better: one line per segment, stating the behavior and the decision it changes.

## Map the journey as it is before mapping how it should be

An as-is journey documents what actually happens, including the parts outside your product. A to-be journey is a design proposal. Teams routinely build the second and call it the first, which produces a map that confirms the plan.

The as-is map is built from `research-synthesis` output, session recordings, support tickets and analytics — not from a workshop where the team recalls what they think users do.

Per stage, capture five rows:

| Row | Content |
| --- | --- |
| **Doing** | The action, in the user's terms |
| **Thinking** | What they are trying to work out, from research not inference |
| **Feeling** | Only where it changes a decision. Most emotion rows are decoration |
| **Touchpoints** | Where it happens — your product, email, a spreadsheet, a colleague, support |
| **Evidence** | What this row is based on, with counts |

The evidence row is what separates a journey map from a wall decoration, and it is the row that gets dropped first.

## Map the whole journey, including the parts you do not own

The most valuable stages are usually outside the product: deciding to act, getting approval, finding the information elsewhere, what happens after the task ends.

Two stages teams reliably omit:

- **Before.** What triggered this, what they tried first, who told them to. Frequently the real problem lives here — a user who arrives already frustrated by a failed search is not having a product problem you can see in the product.
- **After.** What they do with the result, who else touches it, what happens when it is wrong. The rework loop is invisible in-product and expensive.

Mark stage boundaries where the user's goal changes, not where your product's navigation changes. A journey mapped to your information architecture will find problems only in your information architecture.

## Mark the moments that matter, and count them

Not all stages are equal. Three kinds earn attention:

- **Points of no return** — where a mistake becomes expensive or irreversible. Payment, submission, deletion, sending.
- **Drop-off points** — where people leave. Take these from analytics where they exist; guessing produces a map that agrees with whoever drew it.
- **Trust moments** — where the user decides whether the system is competent. Usually the first error, the first wait, and the first time a number has to match something they already know.

Attach a count to each pain point — participants, tickets, or a funnel rate — and rank by it. A journey map with fifteen equally-sized sad faces gives a team no way to choose, so they will choose the one that is easiest to fix.

## Service blueprints, when the break is behind the counter

A blueprint extends the journey downward into what the organization does. Use it when the failure is organizational rather than interface-level: slow responses, inconsistent answers, things that work in one channel and not another.

Four layers below the user's actions:

1. **Frontstage** — what the user sees: interface, emails, a support agent.
2. **Backstage** — what staff do out of sight: reviewing, approving, correcting.
3. **Support processes** — systems, integrations, third parties.
4. **Evidence** — the artifacts the user ends up holding: receipts, confirmations, records.

Draw the **lines of interaction and visibility** explicitly. Most service failures sit exactly on a handoff across one of those lines, and a blueprint that does not mark them cannot show that.

A blueprint is the right tool when the answer to "why is this slow" is "it goes to a person on Tuesdays". No interface change fixes that, and a journey map alone will keep suggesting one.

## Evidence bar

Every stage, pain point and persona attribute carries its source. A journey map is the artifact most likely to be built in a workshop from collective memory and then treated as research for years afterwards.

Mark inferred rows visibly. Where you do not know what someone was thinking at a stage, write "unknown — not researched" rather than a plausible sentence. The blank is more useful than the guess, because it shows where to look next.

Never present a to-be journey without the as-is beside it. The gap between them is the work, and a to-be alone hides both the size of the change and whether anyone verified the starting point.

Where segments were assumed rather than derived from data, say so on the artifact. Segmentation invented in a room becomes organizational truth remarkably fast.

## Before you ship

| Symptom | What it means | Fix |
| --- | --- | --- |
| Segments are demographic | Convenience data stood in for behavior | Re-cut on something that changes a decision |
| A segment changes no decision | It is a label, not a segment | Merge it |
| There are six personas | Nobody will remember them | Collapse to two or three, or use one-line segment descriptions |
| A persona has a photo and a hobby but no evidence line | It will be reasoned about as a person | Add source and counts, or cut the fiction |
| The journey starts at the product and ends at task completion | The expensive stages are missing | Add before and after |
| Every pain point is the same size | The team will fix the cheapest | Attach counts, rank |
| Stage boundaries match your navigation | Only in-product problems will be found | Re-cut where the user's goal changes |
| The as-is map was drawn in a workshop | It records team belief | Rebuild from research, tickets and analytics |
| Only a to-be journey exists | The gap and its starting point are hidden | Draw the as-is beside it |
| The break is a Tuesday approval queue | This is a service problem, not an interface one | Blueprint it; mark the handoff |

## Reporting

**The deliverable is a segment definition plus a journey artifact**, both carrying evidence inline.

**Segment definition**, per segment: the behavior that defines it, size estimate with source, the decision it changes, and whether it is primary, secondary or not served.

**Journey map**, per stage: doing, thinking, feeling where relevant, touchpoints, evidence with counts. Points of no return, drop-offs and trust moments marked. Pain points ranked by count, each naming the skill that owns the fix.

**Blueprint**, where used: the four layers, with lines of interaction and visibility drawn, and each handoff failure named.

**Every artifact carries:** the date built, the research it draws on, and a review date. Undated journey maps outlive the product they describe.

**Done when:** every row names its source, at least one stage sits outside your product, pain points are ranked by something countable, and the team can name the primary segment and what the others give up.
