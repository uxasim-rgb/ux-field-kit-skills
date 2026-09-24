---
name: information-architecture
description: Organizes content into a structure people can navigate, using labels drawn from their vocabulary and validated by card sorting and tree testing. Use when things exist but cannot be found.
when_to_use: Use when structuring navigation or a menu, naming sections and labels, running a card sort or tree test, deciding what goes where, designing search versus browse, fixing "users can't find X", or when a settings page or dashboard has grown unmanageable.
---

# Information architecture

This skill decides what goes where and what it is called. It opens the Structure band, and most problems people describe as visual clutter are resolved here rather than in `layout-and-composition`.

The governing idea: structure is a hypothesis about how people expect things to be grouped, and it is testable. Stop arguing about the menu and run a tree test.

**Works with:** `user-flows` owns movement through the structure · `content-design` owns the words once the structure is settled · `layout-and-composition` owns how a level is presented · `research-synthesis` supplies the vocabulary · `usability-testing` validates findability in context.

## Start here

| The situation | Go to |
| --- | --- |
| People cannot find something that exists | **Test findability before restructuring** below |
| You do not know how people group things | Run a card sort — **Card sorting** below |
| You have a proposed structure and want to check it | Run a tree test — **Tree testing** below |
| The label is the problem, not the placement | `content-design`, then return here |
| The structure is fine but the path is long | `user-flows` |
| There is too much on one screen | Check grouping here first, then `layout-and-composition` |
| Settings or admin has grown unmanageable | **Organize by task, not by system** below |
| You need a menu pattern for a given breadth and depth | **Navigation models** below |

## Role lens

| Role | Takes from this skill |
| --- | --- |
| UX designer | The full method: audit, group, label, test |
| Content designer | Labelling rules, and why labels are content decisions |
| Product designer | The task-versus-system principle, which resolves most settings arguments |
| Design engineer | Route structure and URL design, which outlive every visual redesign |

## Test findability before restructuring

A restructure is expensive and frequently unnecessary. Before moving anything, find out whether the problem is placement, label or visibility.

Run a tree test on the current structure with the real tasks people fail at. Three outcomes, three different fixes:

- **People go to the right place but slowly** — the label is ambiguous. `content-design` fixes it.
- **People confidently go to the wrong place** — the grouping contradicts their model. Restructure.
- **People wander with no confident first click** — the top level does not describe the domain. Restructure the top level only.

First-click accuracy is the number that matters. People who get the first click right complete the task far more often than those who do not, so the top level of a structure carries most of its value.

## Group by the user's task, not by your system

The most common structural defect is a menu that mirrors the org chart, the database schema or the order features were built in.

| System-shaped | Task-shaped |
| --- | --- |
| Account / Billing / Subscription / Payments | Your plan · Invoices · Payment method |
| Integrations / API / Webhooks / Tokens | Connect another tool · Developer access |
| Admin / Config / Preferences / Settings | One settings area, grouped by what you are changing |
| Reports / Analytics / Insights / Dashboards | One place, filtered by question |

Four menu items that all mean "settings" is the signature of a structure grown by accretion: each team added their own top-level entry. The fix is a single area with internal grouping, and it is almost always resisted by whoever owns one of the four.

The test for a group: can you name it in one word your users already use, without "and"? A group called "Account and billing and team" is three groups.

## Take labels from users, never from the team

Labels are where research pays off most directly. The vocabulary recovered in `user-interviews` and `research-synthesis` is the label set — using it costs nothing and removes an entire class of failure.

Rules that hold across products:

- **Use the word people use, even when it is less precise.** If users say "folder" and your model says "collection", the menu says folder.
- **No internal jargon.** Entity names from the data model, project codenames and team names are invisible to the team and opaque to everyone else.
- **Avoid clever.** A section called "Mission Control" cannot be searched for or guessed.
- **Be specific over short.** "Export data" beats "Data". Single-word nav items are frequently ambiguous and the space saved is not worth it.
- **Keep one term per concept.** If it is "member" in the nav, it is "member" in the empty state, the error and the email. `design-systems` owns the term list.
- **Front-load the distinguishing word.** "Payment methods" and "Payment history" scan poorly as a pair; "Cards and accounts" / "Invoices" scan instantly.

## Choose a navigation model that fits breadth and depth

| Structure | Model | Breaks when |
| --- | --- | --- |
| Few sections, shallow | Top nav or tab bar | Beyond ~7 items |
| Many sections, shallow | Sidebar with groups | Beyond ~20 without sub-grouping |
| Deep hierarchy | Sidebar with expandable sections, plus breadcrumbs | Depth beyond 4 levels |
| Large, flat, unpredictable | Search-first, with browse as backup | Search quality is poor |
| Task-based, sequential | Wizard or stepper — see `user-flows` | The user needs to move non-linearly |

Prefer breadth over depth. Each level of depth loses people, and a wide menu is scannable in a way a deep one is not. Four levels is the practical limit for a product; past that, reconsider whether the deepest level is a filter rather than a location.

Keep the hierarchy the same everywhere. A sidebar whose contents change between sections destroys the user's mental map, and they will stop trusting it.

## Card sorting tells you how people group; tree testing tells you whether it works

Two different methods, frequently confused, and both cheap.

**Card sorting** — participants group your content and name the groups. Use it when you do not yet know how people think about the domain. Open sorts let them name the groups, which produces vocabulary; closed sorts test whether your existing groups are usable. 15–30 participants, unmoderated, under 20 minutes.

Look for cards that most people place together, cards that split evenly (genuinely ambiguous — these need to appear in two places or be renamed), and the group names participants invented.

**Tree testing** — participants navigate a text-only version of your structure to complete a task. No visual design, no search: just the labels and the hierarchy. This is the measurement, and it is the one teams skip.

30+ participants, 8–12 tasks. Measure success rate, **first-click accuracy**, and directness (did they go straight there or backtrack). Run it on the current structure to get a baseline and on the proposal to prove the change is an improvement — a restructure that ships without this is a bet.

Neither method tells you about the visual design. That is `layout-and-composition` and `usability-testing`.

## Let things live in more than one place

Hierarchies force a single parent; people's mental models do not. A card that half your participants put under Billing and half under Account belongs in both.

Cross-linking, related items, and the same destination reachable from two paths are not structural failures. The failure is the same content existing as two separate pages that drift apart. One canonical location, multiple routes to it.

Search is the escape hatch from every hierarchy, and a product past moderate size needs it. But search cannot rescue a broken structure: people search with the vocabulary the structure taught them, so bad labels produce bad queries.

## Design URLs and routes as part of the structure

For anything on the web, the route is the most durable expression of the architecture. It outlives every visual redesign, it is what gets shared and bookmarked, and changing it breaks links.

- Readable, lowercase, hyphenated, no internal IDs where a slug will do.
- Hierarchical where the content is: `/teams/acme/members`.
- Stable. Where a route must change, redirect permanently rather than breaking it.
- Every meaningful state addressable. A filtered view someone cannot link to will be screenshotted instead.

`design-engineering` owns the implementation; the structure is decided here.

## Evidence bar

A structure is a hypothesis. Do not ship a restructure without a tree test against the old structure — "it feels more logical" is the opinion the previous structure was also built on.

Report first-click accuracy and success rate with participant counts, never percentages from small samples. 30+ participants makes percentages defensible; below that use counts. `surveys-and-measurement` owns the sampling logic.

Where a card sort splits evenly, that is a finding, not a tie to be broken by the analyst. Report the split and design for it — two locations or a clearer label.

Where the current structure tests fine and the complaint is real, the problem is elsewhere: visibility, labelling, or the content not existing. Say so rather than restructuring because a restructure was requested.

## Before you ship

| Symptom | What it means | Fix |
| --- | --- | --- |
| The menu mirrors the org chart or schema | Structure grown by accretion | Re-cut by user task |
| Four top-level items all mean "settings" | Each team added their own | Consolidate; group internally |
| A group name contains "and" | It is two groups | Split or rename |
| Labels came from a team workshop | Internal vocabulary shipped | Take them from research |
| The same concept has two names across screens | No term list | One term per concept; `design-systems` owns it |
| The hierarchy is five levels deep | People will not reach the bottom | Flatten; ask whether the deepest level is a filter |
| The sidebar changes between sections | The mental map is destroyed | Keep it stable |
| A restructure shipped with no tree test | It is a bet | Test old and new; compare first-click accuracy |
| A card sort split evenly and one option was chosen | A real ambiguity was resolved by fiat | Design for both locations |
| Search was added to fix findability | Bad labels produce bad queries | Fix the labels; keep search as the escape hatch |
| A filtered view has no URL | It will be screenshotted, not shared | Make every meaningful state addressable |

## Reporting

**The deliverable is a structure with evidence**, not a diagram.

**Severity ladder:** `Critical` — content people need cannot be found at all, or a confident wrong click leads to a dead end · `Serious` — found slowly or via backtracking on a common task · `Moderate` — ambiguous label that resolves on the second attempt · `Minor` — inconsistent term with no observed cost.

**Verification:** tree test run on old and new; first-click accuracy reported for both; labels traced to a research source; every term checked against the product's term list; every meaningful state addressable.

**Format:**

1. **Scope** — what was audited, which tasks were tested.
2. **Baseline** — current structure's success and first-click accuracy per task.
3. **Findings**, severity order, each naming whether the cause is placement, label or visibility.
4. **Proposed structure**, with the evidence for each grouping decision.
5. **Test results** — the proposal's numbers beside the baseline.
6. **Term list** — the canonical word for each concept, handed to `content-design` and `design-systems`.
7. **Migration** — redirects needed, and what breaks.

**Done when:** the proposal beats the baseline on first-click accuracy, every label traces to a user's word rather than the team's, and nothing meaningful is unaddressable.
