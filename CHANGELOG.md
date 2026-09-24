# Changelog

Notable changes to this collection. Versions follow [semantic versioning](https://semver.org/):

- **Major** — a skill is removed or renamed, a rule moves from one skill to another, or a reference file a skill linked to disappears.
- **Minor** — a new skill, or a new section in an existing one.
- **Patch** — wording, examples, fixed links, eval cases.

The version in `.claude-plugin/plugin.json` must be bumped in the same commit as any change under `skills/`. `claude plugin update` compares that number and nothing else, so an unbumped change reports "already at the latest version" and never reaches anyone.

## 1.0.0

First release. 35 skills across nine bands.

**Route** — `field-guide`, `full-review`

**Research** — `research-planning`, `user-interviews`, `usability-testing`, `surveys-and-measurement`, `research-synthesis`, `heuristic-evaluation`

**Define** — `problem-framing`, `audience-and-journeys`, `prioritization`, `success-metrics`

**Structure** — `information-architecture`, `user-flows`, `forms-and-input`, `content-design`

**Craft** — `layout-and-composition`, `typography`, `color-and-theming`, `components-and-states`, `motion-and-interaction`, `icons-and-imagery`

**Inclusive** — `accessibility`, `global-and-inclusive`

**Build** — `design-systems`, `design-handoff`, `design-engineering`, `prototyping`

**Validate** — `review-the-change`, `design-critique`, `experimentation-and-analytics`

**Practice** — `design-docs`, `stakeholder-communication`, `design-ops`, `case-studies`

Also in this release:

- 13 reference files carrying depth beyond the principle statements.
- 46 eval cases: 35 trigger, 8 routing, 3 negative. Statically validated; not yet executed against live models.
- `agents/openai.yaml` per skill for Codex, with `allow_implicit_invocation: false` on the four user-invoked skills.
- `scripts/validate.sh` — structure checks, run identically by CI and locally.
- `scripts/check-evals.js` — free static validation of the eval suite.
- `scripts/new-skill.sh` — scaffolds a skill to the house shape.
