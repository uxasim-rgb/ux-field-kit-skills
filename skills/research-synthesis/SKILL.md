---
name: research-synthesis
description: Turns raw sessions, notes and open-text responses into coded themes, evidence-rated insights and a findable research record. Use after data collection, and when combining several studies into one answer.
when_to_use: Use when analyzing interview or usability session notes, doing affinity mapping, coding qualitative data, writing up findings, turning research into insights or recommendations, building a research repository, or when someone asks "what did we learn" or "didn't we already research this".
---

# Research synthesis

This skill takes raw material — transcripts, notes, open text, session recordings — and produces themes, rated insights and a record that can be found again. It sits at the end of the Research band and feeds the Define band.

The governing idea: synthesis is a procedure with a defined order, and every shortcut in it replaces evidence with the analyst's prior beliefs.

**Works with:** `user-interviews`, `usability-testing` and `surveys-and-measurement` supply the raw material · `heuristic-evaluation` findings get synthesized here too · `problem-framing` consumes the output · `stakeholder-communication` owns presenting it · `design-ops` owns the repository's place in team operations.

## Start here

| The situation | Go to |
| --- | --- |
| You have notes and do not know where to begin | Run the six steps below in order |
| You need the coding procedure in detail | [Coding](coding.md) |
| You have themes and need to write them up | [Insight statements](insight-statements.md) |
| You are combining several studies | **Step 6** below, plus the evidence ladder |
| Someone asks whether this was researched before | You need a repository — see **Make it findable** |
| The output needs to become a product decision | `problem-framing` |
| The output needs to be presented to leadership | `stakeholder-communication` |

## Role lens

| Role | Takes from this skill |
| --- | --- |
| UX researcher | The full coding procedure, evidence rating and repository structure |
| Product designer | The six steps, run lightly on a five-session study, in an afternoon |
| Design ops | Repository structure, tagging discipline and the deduplication habit that stops the team re-running studies |

## The six steps, in order

The order is the method. Running them out of order — particularly writing recommendations before coding — produces a document that argues rather than reports.

**1. Capture.** Get every observation into one place, one observation per row. Session ID, timestamp, what was said or done, verbatim where possible. Do not summarize yet, and do not interpret. A row that already contains a conclusion cannot be re-examined later.

**2. Code.** Tag each observation with what it is about. First pass is descriptive and close to the data; later passes group codes into families. Detail in [coding](coding.md).

**3. Cluster.** Group coded observations by what they have in common. This is affinity work, and it goes bottom-up: let the groups emerge from the observations rather than sorting observations into categories you brought with you.

**4. Name.** Give each cluster a statement, not a label. "Navigation" is a label and says nothing. "People look for billing under their profile, not under settings" is a finding. Detail in [insight statements](insight-statements.md).

**5. Rate.** Attach evidence strength to each theme: how many participants, whether observed or reported, whether it was volunteered or prompted, whether other studies agree. See **Rate evidence** below.

**6. Decide.** Turn rated themes into implications and one recommendation each. A theme with no implication is a fact, not a finding, and belongs in the appendix.

## Code close to the data before you code for meaning

The first coding pass uses the participants' words and observable actions. "Used browser find instead of the filter" is a first-pass code. "Poor discoverability" is a second-pass code, and starting there loses the detail that would have let you notice the filter was fine but its label was wrong.

Two or more analysts code the same two sessions independently, then compare. Where the codes diverge, the disagreement is usually about what the code *means*, and resolving it produces the codebook. Where a single analyst codes alone, re-code the first session last — drift between session one and session five is normal and invisible from inside.

## Let the clusters form bottom-up

The failure mode in affinity work is bringing the categories with you. A team that starts with "Onboarding / Navigation / Performance / Pricing" columns will sort every observation into one and discover nothing.

Start with the observations spread out, group the two that obviously belong together, then the next, and let the groups accrete. Name them only after they stop moving. Where an observation fits two groups, duplicate it rather than choosing — the overlap is often the finding.

Expect an "orphans" pile and do not force it. Orphans are where the surprises live, and a synthesis with no orphans has been tidied rather than analyzed.

## Rate evidence before anyone acts on it

Not all themes are equally supported, and a write-up that presents them at equal weight invites the team to act on the weakest. Attach a rating to each:

| Rating | Means |
| --- | --- |
| **Strong** | 5+ participants, observed behavior, consistent across segments, or corroborated by a second method |
| **Moderate** | 3–4 participants, or observed in fewer but consistent with analytics or a prior study |
| **Weak** | 2 participants, or reported rather than observed, or confined to one segment |
| **Single** | 1 participant. Reported as a hypothesis with the count visible, never as a finding |

Three modifiers, each of which downgrades:

- **Reported, not observed.** What someone said they do, without you watching. One step down.
- **Prompted, not volunteered.** Surfaced only after you asked about it directly. One step down.
- **Single segment.** Observed in one segment and untested elsewhere. Flag rather than downgrade, and say which segment.

A Strong theme that is reported-only and prompted is Weak. Write that out rather than hiding it, because the team will otherwise treat a leading question's answer as a validated need.

## Separate what happened from what it means from what to do

Three distinct claims, and collapsing them is the most common defect in research write-ups:

> **Observation.** 4 of 5 participants opened the profile menu when asked to change their plan.
> **Interpretation.** Billing is mentally filed under "me and my account", not under system configuration.
> **Recommendation.** Move billing into the profile menu, or add a pointer from profile to settings.

Each is independently arguable. Someone can accept the observation and reject the interpretation, or accept both and propose a different fix. A write-up that fuses them into "users can't find billing, so move it" gives the reader nothing to disagree with except the conclusion, which is how research gets rejected wholesale.

Keep the recommendation to one per theme and hand the design decision to the owning skill — `information-architecture` here — rather than specifying the solution in detail.

## Count participants, never percentages

"4 of 5" is the unit. Percentages from qualitative work are a category error, and they travel: a "80% of users" written once will be quoted in a deck for two years.

Where a number is needed for a population claim, that is a survey, and it belongs to `surveys-and-measurement`.

## Make it findable or it will be re-run

A synthesis nobody can find is a study the team will pay for again in eighteen months. The repository is not administrative overhead; it is the only thing that makes research compound.

The minimum that works:

- **One entry per study**, with: the research question, method, dates, participant segments and counts, the rated themes, and a link to raw material with access controls intact.
- **Tag by product area and by question type**, not by project name. Project names are meaningless a year later; "checkout" and "pricing comprehension" are not.
- **A one-line answer** to the original question at the top. Most lookups need only that.
- **A contradiction log.** When a new study disagrees with an old one, record both and the likely reason — the product changed, the segment differed, the method differed. Silently superseding the old finding destroys the record of how the understanding developed.
- **A quarterly pass** to mark stale entries. A finding about a screen that no longer exists is worse than no finding.

Before planning any new study, search the repository. `research-planning` should not start until this has been done and the answer is recorded.

## Evidence bar

Every theme carries a participant count and an evidence rating, in the document, not in a footnote.

Never promote a single observation to a finding, however vivid. A striking quote from one participant is the most persuasive and least reliable artifact in research, and it will be repeated in meetings long after the study is forgotten. Label it a hypothesis and give it the count.

Where the data does not support a conclusion, say so explicitly. "We could not tell from this study whether X" is a real result, and writing it is what buys credibility for the themes that are supported.

Where a theme contradicts what the team expected, lead with it. Research that only confirms existing beliefs is either unusually lucky or badly analyzed, and the surprise is the part that changes decisions.

Do not synthesize toward a recommendation someone has already asked for. If the analysis is landing on a pre-agreed conclusion, re-read the orphans pile.

## Before you ship

| Symptom | What it means | Fix |
| --- | --- | --- |
| Themes match the categories the team already used | Clusters were imposed, not formed | Re-cluster bottom-up from the observations |
| A theme has no participant count | Evidence strength is invisible | Attach counts and a rating to every theme |
| Observations, interpretations and fixes are one sentence | The reader cannot disagree with any one part | Split into three lines |
| There is no orphans pile | The data was tidied | Look again for what did not fit |
| A percentage appears from qualitative data | Category error that will outlive the study | Use counts |
| Recommendations were drafted before coding finished | The analysis was working backwards | Re-code, then re-derive |
| Nothing contradicted the team's assumptions | Either lucky or filtered | Re-read the sessions that felt unproductive |
| The write-up exists only in a deck | It will not be findable in six months | Create a repository entry; link the deck from it |
| A finding from 2 participants is stated flatly | Weak evidence presented as strong | Rate it and show the count inline |

## Reporting

**The deliverable is a findings document plus a repository entry.** The document is read once; the entry is what makes the work compound.

**Format of the findings document:**

1. **The question and the decision** — what was asked, who is waiting.
2. **What we did** — method, dates, participants by segment and count, and what was not covered.
3. **Answer in one paragraph** — the top of the document, not the end. Most readers stop here and that is fine.
4. **Themes**, strongest evidence first. Each with: the statement as a sentence, evidence rating and count, two or three supporting observations with participant IDs, one verbatim quote, the interpretation, and one recommendation naming the owning skill.
5. **Contradictions and surprises** — what disagreed with prior studies or team assumptions, and the likely reason.
6. **Open questions** — what this study could not answer, and what would answer it.
7. **Appendix** — unclustered observations, the codebook, links to raw material.

**Done when:** every theme has a count and a rating, observation and interpretation are visibly separate, the surprises are near the top, and a repository entry exists that someone searching a year from now would actually find.
