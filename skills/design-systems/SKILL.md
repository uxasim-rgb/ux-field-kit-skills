---
name: design-systems
description: Structures tokens, component APIs, naming, versioning and governance so a system stays usable as it grows. Use when the same decision is being made twice, or when a library has become a place components go to be abandoned.
when_to_use: Use when building or auditing a design system or component library, naming design tokens, defining component APIs, setting up versioning or deprecation, writing component documentation, governing contributions, or when the system and the product have drifted apart.
---

# Design systems

This skill covers the architecture and governance of a shared system. It opens the Build band.

The governing idea: a design system is a product whose users are the people building your product, and it fails for product reasons — it was not adopted, not maintained, or not worth the constraint it imposed.

**Works with:** `color-and-theming` and `typography` own their token values · `components-and-states` owns a component's anatomy and state set · `design-handoff` owns delivery to engineering · `design-engineering` owns implementation · `content-design` owns the term list · `design-ops` owns the team rituals around it.

## Start here

| The situation | Go to |
| --- | --- |
| Starting a system | **Extract, do not invent** below |
| Naming tokens | **Three token layers** below |
| A component API is growing unmanageable | **Decide what a component refuses to do** below |
| Nobody is using the system | **Adoption is the only metric that matters** below |
| The system and product have drifted | **Adoption**, then **Govern contribution** below |
| Changing something people depend on | **Version and deprecate rather than break** below |
| Writing documentation | **Document the decision, not the API** below |
| Values for a specific token | `color-and-theming`, `typography`, `layout-and-composition` |

## Role lens

| Role | Takes from this skill |
| --- | --- |
| Design engineer | Token architecture, component API design, versioning |
| UI designer | Why a component refuses a use case, and how to propose one that is needed |
| Design ops | Governance, contribution, deprecation and the adoption metric |
| Product designer | The constraint the system imposes and when it is right to break it |

## Extract, do not invent

A system built up front from imagination encodes guesses. A system extracted from shipped interfaces encodes what was actually needed.

Start with an audit: every button, every input, every card currently in production. Screenshot them all. The duplicates and near-duplicates are the system — nine button variants usually collapse to three, and the collapse is the work.

Build only what has appeared at least twice. A component with one consumer is not shared infrastructure; it is that team's component and should live with them until a second need appears.

The audit also produces the argument for the system, which is usually needed before it will be funded. "We have 23 shades of grey and 9 button styles" is a sentence that gets budget.

## Three token layers, and components only touch the third

| Layer | Example | Who uses it |
| --- | --- | --- |
| **Primitive** — the raw value | `--blue-600: oklch(0.55 0.18 250)` | Only the semantic layer |
| **Semantic** — the role | `--color-action: var(--blue-600)` | Components |
| **Component** — the specific use, only when needed | `--button-primary-bg: var(--color-action)` | One component |

Most systems need only the first two. Add the third layer only where a component genuinely needs to diverge from the semantic value, and expect to justify each one — a component layer added by default triples the token count for nothing.

The rule that makes theming work: **no component ever references a primitive directly.** A component using `--blue-600` cannot be themed, and it will be found later one file at a time.

Naming conventions that survive:

- Name by **role**, not by value or appearance. `--color-border-subtle`, never `--color-light-grey`.
- Use a consistent pattern — `category-property-variant-state` — and apply it everywhere.
- Avoid names encoding a single use case: `--color-signup-button-bg` will be used elsewhere within a month.
- Keep the semantic set small enough to memorize. If people have to search for a token name, they will use a raw value instead.

## Decide what a component refuses to do

The most important API decision is what a component will not support. A component that accommodates every request becomes a configuration language, and at that point it is harder to use than the raw markup.

Signals the API has gone wrong:

- A prop that only makes sense in combination with another prop.
- A prop named after a specific screen or feature.
- A prop that changes the component's semantic meaning — `variant="link"` on a button.
- More than roughly five props on a simple component.
- Booleans multiplying: four booleans is sixteen combinations nobody has rendered.

Prefer composition over configuration. Slots and children let consumers assemble what they need without the component predicting it. Reserve props for genuinely enumerable variation: size, tone, one variant axis.

When a request does not fit, the answers in order of preference are: compose it from existing parts, make it a separate component, or accept it into the core with a stated reason. "Add another prop" is the default answer and usually the worst one.

Write down the component's **contract**: what it guarantees about accessibility, states, keyboard behavior and responsive behavior. A consumer needs to know what they get for free and what remains theirs.

## Version and deprecate rather than break

A shared system with consumers cannot make silent breaking changes.

- **Semantic versioning**, honestly. Removing a prop, renaming a token or changing a default is a major change even when it looks small.
- **Deprecate before removing.** Mark it deprecated, say what to use instead, warn in development, and give a real window — at least one release cycle, longer for a large organization.
- **Provide a migration path.** A codemod where possible, a documented before-and-after where not. A deprecation with no migration is a request for other teams to do your work.
- **Never change a token's meaning.** Changing `--color-action` from blue to green is fine. Repurposing `--spacing-md` from 16px to 12px silently breaks every layout using it — add a new token instead.

Bump the version in the same commit as the change. In a Claude Code plugin, `claude plugin update` compares that number and nothing else, and an unbumped change never reaches anyone.

## Document the decision, not the API

Generated prop tables tell people what exists. They do not tell people which component to use, or why the one they want does not exist.

Each component's documentation carries:

- **When to use it, and when to use something else.** The most-read section, and the one usually missing.
- **A live example** they can copy.
- **Every state rendered** — `components-and-states` owns the list.
- **The accessibility contract** — what is handled, what the consumer must still do.
- **Content guidance** — what the label should say, handed from `content-design`.
- **What it deliberately does not do**, and what to do instead.

Documentation lives beside the code and is updated in the same change. A documentation site that lags the library is worse than none, because people trust it and are wrong.

## Adoption is the only metric that matters

A system nobody uses is a cost with no return, and the failure is nearly always a product failure rather than a design one.

Measure: percentage of components in production coming from the system, count of local overrides, count of raw values where tokens exist, and time from a designer's request to a shipped component.

Diagnose low adoption honestly. The usual causes, in rough order of frequency:

- **It does not do what teams need**, so they fork it.
- **It is harder to use** than writing it from scratch.
- **It is slower to change** than the product needs — the governance is the bottleneck.
- **Nobody knows it exists**, or the documentation is not findable.
- **It was imposed** rather than built with the people expected to use it.

Mandating adoption without fixing the cause produces compliance and resentment, and teams will wrap your components in their own to get what they need anyway.

## Govern contribution so the system can change

A system that only a central team can change becomes a bottleneck and then gets bypassed. One that anyone can change without review becomes inconsistent within two quarters.

What works in the middle: anyone can propose, a named owner reviews against written criteria, and the criteria are public. Criteria worth having — does it appear at least twice, does it fit existing patterns, does it meet the accessibility contract, is it documented, does it have a migration path if it changes something.

Have a fast path for additive changes and a slow path for breaking ones. Most contributions are additive, and making every change take the slow path is how the bottleneck forms.

Name an owner. Systems with no owner do not get maintained; they get worked around.

## Evidence bar

Adoption, override count and raw-value count are measurable. Report the numbers. "Adoption is low" is not a finding; "41% of buttons in production are local implementations" is.

Inconsistency is checkable against the token set. A raw hex where a token exists is a finding with a file and a line.

Component API problems are demonstrable: name the prop combination nobody has rendered, or the consumer that had to fork.

Do not report a missing component without two consumers needing it. Speculative components are permanent maintenance, and a system grows by them.

Do not review a product against a system it has not adopted as though the gaps were defects. Where adoption is the problem, the finding is about adoption — reporting 200 token violations in a codebase that predates the system is noise.

## Before you ship

| Symptom | What it means | Fix |
| --- | --- | --- |
| The system was designed before the audit | It encodes guesses | Audit production; build what appeared twice |
| A component has one consumer | Not shared infrastructure yet | Leave it with that team |
| Components reference `--blue-600` | Cannot be themed | Route through semantic tokens |
| A token is named `--color-light-grey` | Meaningless in dark mode | Name by role |
| A token is named after one screen | It will be reused wrongly | Rename by role |
| Four boolean props | Sixteen unrendered combinations | Compose instead |
| A prop only makes sense with another prop | The API is encoding a use case | Separate component |
| A token's meaning was changed | Silently breaks consumers | Add a new token |
| A prop was removed in a minor version | Breaking change mislabelled | Major; deprecate first |
| A deprecation with no migration path | Other teams inherit your work | Provide a codemod or a documented mapping |
| Docs are generated prop tables only | Nobody learns which component to use | Add when-to-use and when-not-to |
| Teams fork components | The system does not do what they need | Diagnose before mandating |
| The central team is the bottleneck | Contribution has one path | Fast path for additive changes |
| Nobody owns it | It will not be maintained | Name an owner |

## Reporting

**Severity ladder:** `Critical` — a component violating the accessibility contract it claims, a breaking change shipped without a version bump, a token whose meaning changed · `Serious` — components bypassing the semantic layer, an API that cannot be used correctly, deprecation with no path · `Moderate` — naming inconsistency, missing documentation, undocumented states · `Minor` — cosmetic drift with no functional cost.

**Verification:** production audited rather than assumed; adoption and override counts measured; every component traced to semantic tokens; version history checked against the nature of each change; documentation checked against the current API.

**Format:**

1. **Scope** — what was audited, at what version, and what adoption looks like numerically.
2. **Token architecture** — layers present, violations counted with locations.
3. **Component findings**, severity order, each naming the API problem or the contract gap.
4. **Adoption diagnosis** — the measured numbers and the most likely cause, stated as a cause rather than a complaint.
5. **Governance** — owner, contribution path, deprecation policy, and which are missing.
6. **Proposed additions** — only those with two or more existing consumers.

**Done when:** adoption is stated as a number, no component reaches past the semantic layer, every breaking change in the history carries a matching version bump, and nothing is proposed that only one team needs.
