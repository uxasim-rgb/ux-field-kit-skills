# Review format

The output structure for an orchestrated cross-discipline review, and the rules for writing a finding.

`review-the-change` uses its own structure for change-scoped review and applies the ladder and verdict from here. Domain skills use a smaller standalone format, grouped by principle, when reviewing alone.

## The document

### 1. Scope and standard

Opens the review. Four things:

> **Reviewed.** Access review flow — list, member detail, confirmation. Admin and owner roles. Desktop and mobile, light and dark.
>
> **Against.** The project's 4px spacing scale, the `ds-*` token set, the existing component library. Density target: professional tool, daily use.
>
> **Domains covered.** information-architecture, user-flows, content-design, layout-and-composition, typography, color-and-theming, components-and-states, accessibility.
>
> **Not covered.** motion-and-interaction (no animation present), global-and-inclusive (single-locale product by design), forms-and-input (no data entry in scope), design-engineering (design review, not implementation).

Stating what was not covered is not a weakness. It is what makes the covered parts trustworthy.

### 2. Verdict

At the top, never the end.

> **Verdict: Needs changes.** 0 Critical · 3 Serious · 6 Moderate · 2 Minor.

### 3. Findings

At most twenty, severity order. Each finding as a block, not a table row — a table cannot hold a measurement, a consequence and a fix legibly.

> **Serious — `accessibility`**
> **Where.** Member list, bulk-select checkbox, all breakpoints.
> **Measured.** Target is 16×16 CSS px. Adjacent targets 8px apart, so the spacing exception does not apply. WCAG 2.5.8 requires 24×24.
> **Consequence.** Selecting members on touch requires repeated attempts, and the adjacent row link is hit instead — which navigates away and loses the selection.
> **Fix.** Expand the hit area to 24px minimum with padding on the wrapping label. Visible checkbox can stay 16px.

The five fields do specific work:

- **Severity and owner** — so it can be ranked and routed without discussion.
- **Where** — so it can be found. Screen, state, breakpoint, role.
- **Measured** — the number and the threshold, where one exists. Omit only where nothing is measurable.
- **Consequence** — what it costs a user. **This field is what separates a finding from a preference.** If you cannot fill it, cut the finding.
- **Fix** — in the project's own system. A token, a component, a class. Not a rewrite.

### 4. Conflicts resolved

Where domains disagreed, say what was chosen and why. Silent resolution hides a tradeoff the team may want to make differently.

> **Density vs target size.** `layout-and-composition` supports the 32px row height for a daily-use tool. `accessibility` requires 24px targets with spacing. Resolved in favour of accessibility: row height stays, hit areas expand into the existing padding. No density cost.

### 5. Worth keeping

Two or three specific things. Not a compliment — a warning about what the fix might break.

> The error path on bulk actions reports partial success with a per-row retry, which is usually missing. Preserve it through the checkbox change.

### 6. Test these

Findings that are hypotheses rather than observations, framed as research questions.

> **Is the two-column member layout scannable at 200+ members?** Expert review suggests the eye loses the row, but this is a prediction. Five-person `usability-testing` on a seeded 300-member account would settle it.

This section is the most useful one in most reviews and the one most often absent. It converts the weakest findings into cheap research instead of expensive rebuilds.

### 7. Appendix

Findings beyond the cap, listed in one line each. Present so they are not lost, absent from the main list so it stays actionable.

## Writing a finding

**Name a consequence, always.** The test for whether something is a finding at all.

| Not a finding | Finding |
| --- | --- |
| Spacing is inconsistent | The two card variants use 12px and 16px internal spacing, so a scanning user reads them as different object types |
| The copy could be better | The error says "Invalid input" with no indication of which field or what a valid value is, so the user must guess |
| Contrast looks low | Body text `#767676` on `#FFFFFF` computes to 4.54:1 — passes AA at 4.5:1 but fails at 14px bold, which this is |
| I'd use a different icon | The gear icon is used for workspace settings here and for row-level actions on the previous screen |

**Measure what is measurable.** Contrast, target size, duration, measure in characters, bundle size, layout shift. A finding that could carry a number and does not is incomplete.

**Attribute to the owner, not the observer.** A contrast failure spotted while reviewing typography belongs to `accessibility`.

**One root cause, one finding.** Four domains observing one content-volume problem produce one finding at `information-architecture`, not four symptoms.

**Propose a fix in the project's system.** "Use `--space-3`" beats "increase the spacing". "Wrap in the existing `<Field>` component" beats "add a label".

**Mark hypotheses.** Expert review predicts. "Likely to cause users to miss the action" is honest; "users cannot find the action" claims an observation you did not make.

## The severity ladder

Defined in `full-review`. Repeated here because a finding is written against it:

| Severity | Definition |
| --- | --- |
| **Critical** | Task cannot be completed, data or money lost, or a user excluded entirely |
| **Serious** | Completed with errors, workarounds or substantial delay; or an obligated standard failed with a workaround |
| **Moderate** | Friction that resolves |
| **Minor** | Noticed, no measurable cost |

**Escalation triggers** raise a finding to Critical regardless of how it first presents: data loss, an unintended charge or irreversible action, content unreachable by keyboard or assistive technology, a dead end with no recovery, flashing above the seizure threshold, or a user unable to complete the task in their own locale, name or address.

## The verdict

Mechanical:

| Verdict | When |
| --- | --- |
| **Block** | Any Critical remains |
| **Needs changes** | Serious remain, no Criticals |
| **Approve with notes** | Only Moderate and Minor remain |
| **Approve** | Nothing actionable |

Do not soften a verdict because the work is good elsewhere. The ladder is only worth having if it survives a surface you like.

Do not inflate one because the review felt thin. A short review with an Approve is a legitimate outcome and reporting it honestly is what makes the Blocks credible.

## Length

A review that takes longer to read than to act on has failed. Target: scope and verdict on the first screen, findings scannable by severity, each finding readable in under thirty seconds.

If the review runs past three pages, the cap is being ignored or findings are being reported at symptom level rather than root level.
