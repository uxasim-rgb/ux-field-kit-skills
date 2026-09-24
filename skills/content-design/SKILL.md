---
name: content-design
description: Writes and reviews the words in an interface — labels, buttons, errors, empty states, onboarding — so they carry the user forward instead of describing the system. Use for any user-facing text.
when_to_use: Use when writing UX copy or microcopy, naming a button, wording an error message, filling an empty state, setting voice and tone, reviewing interface text, writing onboarding or confirmation copy, or when someone asks what a label should say.
---

# Content design

This skill owns every word a user reads in the product. It sits in the Structure band, because copy is structure: a label is a navigation decision and an error message is a recovery path.

The governing idea: interface copy is not writing for its own sake. The best sentence is frequently the one that lets you delete the sentence.

**Works with:** `information-architecture` owns navigation labels and the canonical term list · `forms-and-input` owns field behavior · `components-and-states` owns which states need copy · `accessibility` owns announcements and accessible names · `global-and-inclusive` owns translation readiness · `typography` owns how the text renders.

## Start here

| The situation | Go to |
| --- | --- |
| Naming a button or action | **Name the outcome** below |
| Writing an error | **Errors: what happened, why, what now** below |
| Filling an empty state | **Empty states are the best teaching moment** below |
| Deciding on voice | **Read the product before writing for it** below |
| A navigation label | `information-architecture` owns the term, then return here for wording |
| The text will be translated | `global-and-inclusive` |
| The copy is fine but unreadable | `typography` |
| Screen reader announcements | `accessibility` |

## Role lens

| Role | Takes from this skill |
| --- | --- |
| Content designer | All of it, plus the term list handoff to `design-systems` |
| Product / UX designer | Buttons, errors and empty states — the three that carry most of the cost |
| Design engineer | The rule that copy is not a string to be filled in later, and the term list as a source of truth |

## Read the product before writing for it

Before proposing copy for an existing product, read what is already there: ten screens, the errors, the onboarding, the emails. Write down how it addresses the user, whether it uses contractions, how formal it is, whether it uses humor, and how it handles blame.

Then write to that voice, not to your preferred one. A single button in a different register is more jarring than a whole product in a register you would not have chosen. Where the existing voice is genuinely bad, that is a separate, explicit proposal — not something to fix one string at a time.

Where a voice guide exists, it wins. Where one does not and the product is large enough to need one, say so.

## Name the outcome, not the mechanism

A button label says what will happen, in the user's terms.

| Mechanism | Outcome |
| --- | --- |
| Submit | Create account |
| OK | Delete 47 records |
| Confirm | Pay £42.00 |
| Save changes | Publish |
| Yes / No | Discard draft / Keep editing |

On destructive or charging actions, put the consequence in the label. A dialog asking "Are you sure?" with OK and Cancel makes the user reconstruct what OK means; `Delete project` and `Keep project` do not.

Avoid Yes/No pairs entirely. They force the user to re-read the question to find out what they are agreeing to, and they translate badly.

## Errors: what happened, why, what now

Three parts. Most error messages have one.

> ❌ Invalid input.
> ❌ Error 4021.
> ❌ Something went wrong.
>
> ✅ That email is already registered. Sign in instead, or use a different address.
> ✅ We couldn't save your changes — the connection dropped. We kept your work; try again.

Rules:

- **Never blame the user.** "You entered an invalid date" becomes "That date is in the past". The passive construction is worth it here.
- **Say what survived.** Users assume the worst about their data. "We kept your work" removes the main fear.
- **Give one clear next action**, and make sure it works.
- **No error codes alone.** A code is fine appended for support, never as the message.
- **No apology theatre.** "We're so sorry for the inconvenience" costs a line and helps nobody. Fix it and say what to do.

Every error worth writing well is an error worth removing instead. Before wording one, check whether the input could simply have been accepted — `forms-and-input` owns normalizing rather than rejecting.

## Empty states are the best teaching moment you get

An empty state has the user's full attention and no competing content. Wasting it on "No items found" is the most common miss in a product.

Three kinds, three jobs:

| Kind | Job |
| --- | --- |
| **First use** — nothing yet | Say what will be here, why it is useful, and give one action to create the first one |
| **No results** — filter or search | Say what was searched, why nothing matched, and offer a way to widen |
| **Cleared** — user finished everything | Acknowledge it briefly and offer what is next |

The no-results case should echo the query. "No results for 'invoic'" tells the user it was a typo; "No results" does not.

Do not fill an empty state with marketing. The user is already in the product.

## Front-load, and cut ruthlessly

People scan. The first two words of a label, heading or message carry most of the meaning.

> ❌ In order to continue, you will need to verify your email address.
> ✅ Verify your email to continue.

Cut: "please", "simply", "just", "easily", "in order to", "you can now", "we're excited to". "Simply" and "just" are actively harmful — they tell a user struggling with something that it should have been easy.

Write at the shortest length that is still clear. Shorter is not automatically better: a three-word label that is ambiguous costs more than a five-word one that is not.

## Use one term for one concept, everywhere

If it is a "member" in the navigation, it is a member in the invitation, the error, the confirmation email and the API docs. Synonyms that read as elegant variation in prose read as two different things in an interface.

Keep a term list: the canonical word, what it means, and the words it replaces. `information-architecture` derives the terms from research; `design-systems` stores the list so it survives staff changes.

Check the term against what users actually say — `research-synthesis` output — not against what the data model calls it.

## Write for the state, not the screen

Every component has more states than the default, and each needs its words decided rather than defaulted. `components-and-states` owns the state list; this skill owns what each one says.

The reliably forgotten ones: loading (what is happening), partial success (what worked, what did not), permission denied (why, and who to ask), offline, expired, and the confirmation *after* an action. A flow that never confirms success leaves the user checking.

Write the unhappy copy at the same time as the happy copy. Copy written later, under deadline, is where "Something went wrong" comes from.

## Evidence bar

Label decisions come from user vocabulary where research exists. Where it does not, say the label is a hypothesis and name the cheapest way to check it — a tree test for navigation labels, a five-person task for action labels.

Reading level is measurable. Aim around grade 8 for general audiences, and treat a domain audience's jargon as vocabulary rather than complexity — a tax product saying "withholding" is being precise, not obscure.

Do not review copy against personal taste. A finding needs a reason: it is ambiguous, it blames the user, it uses a term the product uses differently elsewhere, it will not translate, it hides the consequence. "I'd phrase it differently" is not a finding, and a review full of them is why content review gets dropped.

Where the copy cannot fix the problem, say so. "Confusing" copy on a screen with a broken structure is a symptom, and rewording it is how a structural problem gets papered over for another six months.

## Before you ship

| Symptom | What it means | Fix |
| --- | --- | --- |
| Button says Submit, OK or Confirm | Mechanism, not outcome | Name what happens |
| A dialog offers Yes / No | The user must re-read the question | Label both actions with their outcome |
| Error says "Something went wrong" | No cause, no action, no reassurance | What happened, why, what now, what survived |
| Error blames the user | Unnecessary and it lands badly | Rewrite to describe the data, not the person |
| No mention of what happened to their work | Users assume the worst | Say what was kept |
| Empty state says "No items" | The best teaching moment wasted | Say what goes here and how to start |
| No-results state does not echo the query | Typos are invisible | Show what was searched |
| Copy contains "simply" or "just" | Tells a struggling user it should be easy | Cut |
| Two words for one concept | Reads as two different things | One term; add it to the term list |
| Loading and partial-success copy is missing | Written later, under deadline | Write unhappy copy alongside happy copy |
| A review full of "I'd say it differently" | Taste, not findings | Every finding names a reason |
| Copy is being rewritten to fix confusion | Possibly a structural problem | Check `information-architecture` first |

## Reporting

**The deliverable is a copy review or a copy deck**, with the term list attached.

**Severity ladder:** `Critical` — copy that misleads about a consequence, hides a cost, or blocks completion · `Serious` — an error with no next action, a missing state, a term collision · `Moderate` — mechanism-named action, wordiness that obscures, unechoed query · `Minor` — inconsistent capitalization or punctuation.

**Verification:** every action names its outcome; every error has cause, action and data reassurance; every state in the component's state list has copy; every term checked against the term list; reading level checked; destructive and charging actions state the consequence.

**Format:**

1. **Scope** — screens and states covered, and the voice being written to.
2. **Findings**, severity order, each with the current text, the proposed text, and the reason — not the preference.
3. **State coverage table** — state by component, marking any with no copy written.
4. **Term list** — canonical terms, what each replaces, handed to `design-systems`.
5. **Open questions** — labels that are hypotheses, with the cheapest way to check each.

**Done when:** no action is named after its mechanism, no error ends without a next step, every state has words, and every finding has a reason that is not taste.
