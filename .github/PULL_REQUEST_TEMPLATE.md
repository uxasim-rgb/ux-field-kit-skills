## What changed

<!-- One or two sentences. What does this change, and for whom? -->

## Checklist

Run `npm run validate` — it checks most of this for you.

- [ ] Frontmatter `name` matches the directory name
- [ ] `description` and `when_to_use` both present, together under 1,536 characters
- [ ] `## Start here` and `## Evidence bar` present
- [ ] Siblings referenced by name in backticks, never by relative path
- [ ] `version` bumped in `.claude-plugin/plugin.json`
- [ ] `CHANGELOG.md` updated
- [ ] If user-invoked, **both** halves set: `disable-model-invocation` and `allow_implicit_invocation`
- [ ] Eval case added or updated, and `npm run check:evals` passes

## Rule ownership

<!-- If this adds or moves a rule, say which skill owns it now and whether
     the table in AGENTS.md changed. Restated rules drift; keep one home. -->

## Evidence

<!-- If this changes a threshold, a number or a claim about user behaviour,
     link the standard or the research. Preferences are not shipped as rules. -->
