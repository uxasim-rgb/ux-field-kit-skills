---
name: design-docs
description: Writes the document that carries a design decision to people who were not in the room, and records decisions so they survive the people who made them. Use when a choice needs to outlive the conversation.
when_to_use: Use when writing a design doc or design brief, documenting a decision or an architecture decision record, writing for asynchronous readers, recording why something was built a certain way, or when the same question keeps getting re-asked.
---

# Design docs

This skill produces the durable written record of a design decision. It opens the Practice band.

The governing idea: the value of a design doc is in the decisions it records and the alternatives it rejects, not in the description of what was built. Anyone can see what was built.

**Works with:** `problem-framing` supplies the problem and assumptions · `success-metrics` supplies how it will be judged · `design-handoff` is the build-facing spec, not this · `stakeholder-communication` owns presenting it live · `research-synthesis` supplies evidence · `case-studies` is this document with the tension left in, for an external reader.

## Start here

| The situation | Go to |
| --- | --- |
| A decision needs to outlive the conversation | **Write the decision, not the description** below |
| You need engineering to build it | `design-handoff` — that is a different document |
| One specific choice needs recording | **Decision records for single choices** below |
| The same question keeps being re-asked | You need decision records, not more meetings |
| Presenting to leadership | `stakeholder-communication` |
| Writing it up for a portfolio | `case-studies` |
| Nobody reads your docs | **Write for the reader who skims** below |

## Write the decision, not the description

A document describing the final design is redundant with the design. What is not recoverable from the artifact is why it is that way.

Every significant choice gets three things:

- **What was decided.**
- **What else was considered**, named specifically enough to be recognizable.
- **Why the alternatives lost** — the constraint, the evidence, or the tradeoff accepted.

The rejected alternatives are the most valuable content in the document. Six months later someone will propose one of them, and the record either answers in thirty seconds or costs the team a week rediscovering why it does not work.

Record the constraint that drove a decision, especially when it is unglamorous. "We split this into two steps because the pricing API cannot quote until the address is known" prevents a future redesign that would have merged them.

## Write for the reader who skims

Most readers will read the first paragraph, scan the headings, and stop. Design for that rather than resisting it.

- **Answer first.** Lead with what was decided and what it means for the reader. Never build to a conclusion; that is essay structure and it loses the audience.
- **Headings that carry the point.** "Billing moves under the profile menu" rather than "Navigation".
- **One page of substance.** A twenty-page document is read by nobody and approved by everybody.
- **Put detail in appendices**, linked from where it is needed.
- **Tables over paragraphs** for anything comparable.
- **Name the reader** at the top if the document has a specific one.

The test: can someone read the first paragraph and the headings and come away with the right understanding? If not, the structure is wrong.

## Say what you are asking for

A document with no ask produces silence, and silence gets read as agreement until it is not.

Be explicit at the top: are you informing, seeking input on a specific question, or asking for a decision? If a decision, name the decider and the date by which you need it.

Where you need a decision, present a recommendation rather than a menu. A document that lays out three options with equal weight and no recommendation pushes the work back onto the reader, who has less context than you do. Recommend, then show the alternatives and why they lost.

## Decision records for single choices

Not every decision needs a document. Many need three paragraphs, written once, findable later.

> **Decision.** Billing lives under the profile menu, not under Settings.
>
> **Date.** 2026-03-14. **Decider.** Priya (design lead). **Status.** Active.
>
> **Context.** Access-review completion sat at 38%. Tree testing showed 4 of 5 admins looking under the profile menu first; first-click accuracy on the current structure was 31%.
>
> **Alternatives.** (a) Keep under Settings and add a pointer — rejected, doubles the path for the common case. (b) Duplicate in both — rejected, two pages drift apart.
>
> **Consequences.** The profile menu grows to seven items and will need grouping. The old URL needs a permanent redirect.
>
> **Revisit if.** First-click accuracy does not improve above 60% in the next tree test, or the profile menu passes nine items.

The **revisit if** line is what distinguishes a decision record from a historical note. It states the condition under which the decision should be reopened, which means it can be reopened on evidence rather than on whoever complains loudest.

Mark superseded decisions as superseded, linked to the one that replaced them. Never delete — the history of how the understanding changed is itself useful, and a decision that silently vanishes gets re-made.

## Record the uncertainty

A document that presents every choice as confident is a document that will be quoted as certain. Mark what is known, what is inferred and what is a bet, in the text where the claim appears.

> The two-step split is well supported — 4 of 5 participants attempted it in that order. **The default of 30 days is a guess**; we have no data on typical review cadence and will learn from usage.

The marked guess is the part that gets checked later. An unmarked guess becomes organizational fact within a quarter.

## Write it while the decision is being made

A document written after the fact records the rationalization rather than the reasoning. The alternatives that were seriously considered are already forgotten, and what remains is a case for what was chosen.

Write as you go, in a working document. Tidy it at the end. This also surfaces disagreement early: a colleague who reads the draft and objects has saved you the work.

## Keep it findable or it does not exist

An unfindable document is one you will write again.

- One place for design docs, with a predictable naming scheme.
- Tag by product area, never by project name — project names are meaningless within a year.
- Link from the artifact to the document and back. A component in the system should reach its decision record.
- Date everything, and put a review date on anything expected to go stale.
- A quarterly pass to mark superseded decisions.

`design-ops` owns the repository's place in the team's operating rhythm.

## Evidence bar

Every factual claim carries its source. "Users find this confusing" needs the study, the count and the date. Without it, the sentence is an opinion that will be cited as research.

Mark confidence per claim rather than for the document. Documents mix evidence and judgement, and readers cannot separate them unless you do.

Do not write a decision record for a decision that was not made. A document that describes a discussion without a conclusion is a meeting note, and filing it as a decision means the question will resurface with a false sense that it was settled.

Where the decision was made on judgement with no evidence, say so plainly. That is a legitimate and common way to decide, and recording it honestly is what lets someone revisit it intelligently when evidence arrives.

## Before you ship

| Symptom | What it means | Fix |
| --- | --- | --- |
| The document describes the design | Redundant with the artifact | Record decisions and rejected alternatives |
| No alternatives recorded | The expensive content is missing | Name what lost and why |
| It builds to a conclusion | Essay structure; readers leave first | Answer first |
| Headings say "Navigation", "Layout" | The reader must read to find relevance | Headings that carry the point |
| Twenty pages | Read by nobody, approved by everybody | One page, detail in appendices |
| Three options, no recommendation | Work pushed to the less-informed reader | Recommend, then show what lost |
| No ask stated | Silence will be read as agreement | Inform / input / decide, with a decider and date |
| Every claim reads as confident | Guesses become facts | Mark the guesses in place |
| Written after the decision | Records rationalization, not reasoning | Write during |
| No revisit condition | Cannot be reopened on evidence | Add "revisit if" |
| A superseded decision was deleted | It will be re-made | Mark superseded; link forward |
| Filed by project name | Unfindable within a year | Tag by product area |
| A discussion filed as a decision | The question will resurface as settled | Do not file it as a decision |

## Reporting

**The deliverable is the document.** For a full design doc:

1. **The ask** — inform, input, or decide. With decider and date if the last.
2. **Answer** — one paragraph. What was decided and what it means for the reader.
3. **Problem** — from `problem-framing`, with evidence status per claim.
4. **Decisions** — each with what was chosen, what was considered, and why the alternatives lost.
5. **Uncertainty** — what is evidence, what is inference, what is a bet. Marked in place, summarized here.
6. **How we will know** — the metrics and failure condition from `success-metrics`.
7. **Consequences** — what this makes harder, what it commits the team to, what needs to change elsewhere.
8. **Revisit if** — the conditions that reopen this.
9. **Appendices** — research, explorations, detail.

For a decision record, the six fields shown above, on one screen.

**Done when:** a reader who was not there can say what was decided, what else was considered, and what would make the team change its mind — without asking anyone.
