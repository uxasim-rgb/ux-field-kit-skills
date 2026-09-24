---
name: review-the-change
description: Reviews a change rather than a screen — uncommitted work, a branch or a pull request — by expanding the diff to the surfaces it affects and labelling each defect by where it came from. Use before pushing or merging.
when_to_use: Use when reviewing a diff, a branch or a pull request for interface quality, checking work before pushing, looking for regressions a change introduced, or when someone asks for a design review of their changes rather than of a whole screen.
disable-model-invocation: true
---

# Review the change

This skill reviews what a change did, not what a screen looks like. It opens the Validate band and is user-invoked, because reviewing someone's work uninvited is not a thing to do on their behalf.

The governing idea: a diff is not a surface. What a change removes matters as much as what it adds, and the files it touches are rarely the whole of what it affects.

**Works with:** `full-review` owns cross-discipline review of a whole surface, the shared severity ladder and the verdict — this skill hands its findings there · every domain skill owns its own rules · `design-critique` owns reviewing work in progress with a person rather than reviewing code.

## Start here

| The situation | Go to |
| --- | --- |
| Reviewing uncommitted work | **Resolve the target** below, option 1 |
| Reviewing a branch or PR | **Resolve the target**, options 2 and 3 |
| Reviewing a whole screen, not a change | `full-review` |
| Giving feedback to a person on unfinished work | `design-critique` |
| The change is a design file, not code | `design-critique`, or `full-review` on the rendered result |
| You found defects and need them ranked | **Label every defect by origin** below, then `full-review`'s ladder |

## 1. Resolve the target

Work out what is being reviewed before reading anything. In order of preference:

1. **Uncommitted work** — the working tree against its base. The default when nothing is specified.
2. **A branch** — every commit since it diverged, not only the latest.
3. **A pull request** — the same, plus the description, which frequently states intent the diff cannot.
4. **A path** — a directory or file set, reviewed as it stands.

Where the scope resolves to nothing — a clean tree, a branch with no divergence — say so and offer the alternatives rather than silently reviewing the whole repository. An empty diff reviewed as a full audit produces a hundred findings about code the person did not touch, which is the fastest way for this skill to be switched off.

State the resolved scope at the top of the review. A reviewer and an author disagreeing about what was under review is the most common way a review conversation goes wrong.

## 2. Expand the diff to the surfaces it affects

The changed files are the starting point, not the boundary. A change to a shared component affects every screen using it; a token change affects everything.

Expand outward:

- **A component changed** → every consumer of that component.
- **A token or variable changed** → everything referencing it, in both themes.
- **A layout or container changed** → the children, at every breakpoint.
- **A shared utility or hook changed** → every call site.
- **A route or navigation entry changed** → the paths that reach it, and anything linking to it.
- **A string changed** → wherever it renders, including any place it is reused.

Then decide how far to follow. A change to a base button used in four hundred places cannot have every consumer reviewed; pick the highest-traffic and the most-different consumers, and say which you looked at. A review that claims complete coverage it did not have is worse than one that states its sample.

## 3. Read both sides of the diff

The removed lines carry information the added lines do not. Things worth noticing in the `-` column:

- **A focus style removed.** The most common accessibility regression there is.
- **An ARIA attribute, label or `alt` removed**, usually during a refactor.
- **A state removed** — an empty, error or loading branch deleted because it looked unused.
- **A guard removed** — a null check, a permission check, a length check.
- **A token replaced with a raw value**, which is a system regression even when it looks identical.
- **A comment removed** that explained why something odd was correct.

Removals are systematically under-reviewed because attention goes to the new code. Reading the `-` column deliberately is what distinguishes a change review from a code read.

## 4. Label every defect by origin

The same defect means different things depending on whether this change caused it. Three labels:

| Label | Means | How to treat it |
| --- | --- | --- |
| **New** | This change introduced it | Block on it if severity warrants |
| **Reintroduced** | It was fixed before and this change brought it back | Block, and note the earlier fix — a repeat means a missing test or a lost convention |
| **Inherited** | It was already there; the change merely touched nearby code | Report separately. Never block a change on it |

This distinction is the whole discipline of change review. Blocking a small change on pre-existing problems it happens to sit beside is how reviews become adversarial, and how people learn to make changes as small and as unreviewable as possible.

Report inherited defects in their own section, clearly marked, framed as "worth a separate change" rather than as feedback on this one. Where an inherited defect is Critical — data loss, an accessibility barrier — say so plainly and suggest raising it, but still do not gate the current change on it.

**Reintroduced** is worth calling out specifically. It means a fix did not stick, and the useful response is usually a test or a lint rule rather than another fix.

## 5. Route each finding to the skill that owns it

This skill owns scope, expansion, the before-and-after read and origin labelling. It owns no domain rules.

A contrast failure belongs to `accessibility`. A spacing value off the scale belongs to `layout-and-composition`. A missing empty state belongs to `components-and-states`. Name the owner on every finding, so the author knows where to read the rule rather than having to take the reviewer's word.

Severity, the finding cap and the verdict come from `full-review`, which this skill hands the assembled findings to.

## Review what the change was for

A pull request description or a commit message states intent. Check the change against it.

Two findings only this check produces: the change does not do what it says, and the change does substantially more than it says. The second is more common and more costly — an unrelated refactor bundled into a bug fix is how regressions arrive unnoticed, and it is legitimate feedback even when every individual line is fine.

Where the change has no stated intent, that is worth one sentence. A diff with no description is a diff that will be hard to revert intelligently in six months.

## Evidence bar

Every finding names a file and a line where one exists, and a screen or state where it does not.

Every finding carries its origin label. An unlabelled finding will be read as New, and the author will push back correctly.

Measurable things are measured — contrast, target size, duration, bundle size. `accessibility` and the craft skills own the thresholds; a review that reports "contrast looks low" has not done the work.

Coverage is stated honestly. Say which consumers of a changed component you actually looked at, and which you did not. A stated sample is credible; implied completeness is not.

Where the change is good, say so briefly and specifically. A review that only ever produces defects trains people to avoid review, and the specific positive — "the error path here covers partial success, which is usually missed" — is also how conventions spread.

When there is nothing to report, report nothing. A review that manufactures three minor findings to look thorough costs more attention than it returns.

## Before you ship

| Symptom | What it means | Fix |
| --- | --- | --- |
| The scope was not stated | Author and reviewer will disagree about what was reviewed | State the resolved target at the top |
| An empty diff produced a full audit | Scope resolution failed silently | Say the scope is empty; offer alternatives |
| Only changed files were reviewed | Consumers of shared code are unreviewed | Expand to affected surfaces |
| Only the `+` column was read | Removed focus styles and guards are invisible | Read removals deliberately |
| Findings have no origin label | Everything reads as introduced | Label New / Reintroduced / Inherited |
| The change was blocked on pre-existing issues | Reviews become adversarial | Separate section; never gate on inherited |
| A repeat defect was fixed again with no note | The fix will not stick either | Label Reintroduced; propose a test or lint rule |
| Findings state rules without an owner | The author must take your word | Name the owning skill |
| Coverage was implied, not stated | The review claims more than it did | Say which consumers were checked |
| "Contrast looks low" | Measurable thing left unmeasured | Compute it |
| Only defects, no positives | People learn to avoid review | One specific positive where warranted |
| Three minor findings on a clean change | Thoroughness theatre | Report nothing |

## Reporting

**The deliverable is a change review.** Severity, the cap and the verdict come from `full-review`; the structure below is this skill's.

1. **Scope** — the resolved target, the commit range or working tree, and the surfaces expanded to. Including what was not checked.
2. **Intent** — what the change says it does, and whether it does that and only that.
3. **Introduced** — findings labelled New, severity order, each with file and line, the owning skill, and the measurement where one applies.
4. **Reintroduced** — findings that came back, each noting when it was previously fixed if that is discoverable, with a suggested guard.
5. **Inherited** — pre-existing, clearly marked as not blocking this change, framed as separate work.
6. **Worth keeping** — one or two specific things the change does well.
7. **Verdict** — from `full-review`'s ladder, applied only to New and Reintroduced findings.

**Done when:** every finding has an origin label and an owning skill, the scope is stated including its gaps, the verdict ignores inherited defects, and a clean change is allowed to be clean.
