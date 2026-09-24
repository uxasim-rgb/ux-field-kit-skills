# Insight statements

How to name a theme so that it survives the meeting, and how to write up findings people act on.

## A label is not a finding

The most common failure in research write-ups is naming a cluster rather than stating what it found.

| Label — says nothing | Statement — says something |
| --- | --- |
| Navigation | People look for billing under their profile, not under settings |
| Onboarding friction | Users abandon setup at the team-invite step because they do not yet know who to invite |
| Trust | People check the total three times before submitting because the fee appears late |
| Performance | The two-second save delay makes people click save twice, creating duplicates |
| Mobile issues | On phones, the filter panel covers the results it filters, so people cannot see the effect of a change |

A label forces the reader to open the section to find out whether it matters. A statement lets them decide from the contents page, which is where most readers make that decision.

## The shape of a good statement

**Who + does what + in what situation + because what.** Not all four are always available; the first two are mandatory.

> New admins abandon the invite step because they have not yet decided who is joining.

Who: new admins. Does what: abandon the invite step. Situation: during setup. Because: the decision has not been made yet.

Three properties to check:

- **Falsifiable.** Someone could design a study that shows it is wrong. "Users want a better experience" cannot be falsified and is therefore not a finding.
- **Specific to a behavior.** Not a state of mind you inferred. "Users are frustrated" is an attribution; "users retried the action three times then left" is a behavior.
- **Surprising to someone.** If every reader already knew it, it is context, and it goes in the background section rather than in the findings.

## Keep observation, interpretation and recommendation apart

Three separable claims. Writing them as one sentence means a reader who disagrees with the fix rejects the whole thing.

> **Observation.** 4 of 5 participants opened the profile menu when asked to change their plan. Mean time before finding billing: 41s.
>
> **Interpretation.** Billing is filed mentally under "my account", not under system configuration. Two participants said outright that settings felt like it was "for the app, not for me".
>
> **Implication.** Any billing change is preceded by a failed search, which is where the support tickets about "where do I upgrade" are coming from.
>
> **Recommendation.** Surface billing from the profile menu. Structure owned by `information-architecture`.

The implication line is the one most often missing, and it is the one that makes the finding matter to someone who does not care about navigation. Connect the observed behavior to a cost the organization already recognizes — support volume, churn, failed conversions, engineering rework.

## Attach evidence inline

Every statement carries its count and rating where the reader will see them, not in a methods appendix.

> **People look for billing under their profile, not under settings.**
> *Strong — 4 of 5 participants, observed, unprompted. Consistent with 18 support tickets tagged `billing-location` in Q2.*

Inline evidence does two things. It stops a weak finding being quoted as a strong one, and it pre-empts the "how do you know" question that otherwise consumes the meeting.

For a single-participant observation, the label does the work:

> **Hypothesis (1 participant):** Finance approvers may not need edit access at all.

## Write the answer first

Put a one-paragraph answer to the research question at the top of the document. Most readers will stop there, and that is the correct outcome — they got what they needed.

Burying the answer under methodology is a habit from academic writing and it costs research its audience. Method belongs in section two, where the people who want to challenge the finding will look for it.

## Order by evidence, not by narrative

Strongest-evidence themes first, not the ones that tell the best story. A document ordered for narrative tension buries the reliable findings under the interesting ones, and the interesting ones are disproportionately the weak ones.

Exception: a surprise that contradicts a team assumption goes early regardless of rating, flagged as a surprise with its rating visible. It is the thing most likely to change a decision, and it is the thing most likely to be dismissed if it appears on page nine.

## Quotes

One quote per theme, verbatim, with a participant ID. More than one is padding, and quotes are the most persuasive and least representative element in the document — a vivid quote from one participant will be repeated in meetings for years while the count is forgotten.

Never clean up a quote to make it clearer. Trim with an ellipsis, do not rewrite. The participant's actual vocabulary is frequently the finding, and it feeds `content-design` and `information-architecture` directly.

Strip identifying detail. Role plus company size plus a distinctive phrase identifies someone in a small market.

## What does not belong in findings

**Feature requests.** "Participants asked for a bulk edit" is a request, not a finding. The finding is what they were trying to do and what it cost them. Record requests separately; they feed `prioritization`, not the research record.

**Design specifications.** Naming the fix in detail takes the decision away from the skill that owns it. "Move billing into the profile menu" is a recommendation; a spec for the menu is `information-architecture`'s job.

**Participant demographics as explanation.** "Older users struggled" is almost always a proxy for something else — unfamiliarity with a pattern, a different device, a different tenure. Find the real variable.

**Anything with no implication.** If you cannot say what it changes, it is context. Move it to the background section or cut it.

## The one-line version

Every theme should compress to a single line that survives being copied into a ticket, a Slack message or a slide without its context:

> Billing is filed under "my account" in users' heads, not under settings — 4/5, observed.

If the one-line version is misleading without the full section, the statement is not finished. That compressed line is what will actually travel.
