# Heuristic sets

The principle sets to evaluate against, what each one catches, and how to apply them without turning a checklist into a verdict.

Pick one set for a review and use it throughout. Mixing sets mid-review produces findings with no consistent basis, and makes round-to-round comparison impossible.

## Nielsen's ten usability heuristics

The general-purpose set. Broad enough for most interfaces, old enough that stakeholders recognize the names.

**1. Visibility of system status.** The system keeps the user informed about what is happening, through appropriate feedback within reasonable time.
*Catches:* actions with no acknowledgement, saves with no confirmation, long operations with no progress, state changes that happen silently.
*Ask:* after every action, how does the user know it worked?

**2. Match between the system and the real world.** Speak the user's language, with familiar words and concepts, rather than system-oriented terms. Follow real-world conventions.
*Catches:* internal jargon in the interface, database terms surfaced as labels, sort orders that make sense to the schema and not the reader.
*Ask:* did a participant in research ever use this word? See `content-design`.

**3. User control and freedom.** Users need a clearly marked emergency exit when they choose a function by mistake. Support undo and redo.
*Catches:* flows with no back, destructive actions with no undo, modals that trap, wizards that cannot be abandoned without losing work.
*Ask:* at every step, how do I get out, and what happens to what I entered?

**4. Consistency and standards.** Users should not have to wonder whether different words, situations or actions mean the same thing. Follow platform conventions.
*Catches:* the same action named three ways, controls that look alike and behave differently, platform gestures overridden.
*Ask:* does this pattern appear elsewhere in the product, and does it behave the same? See `design-systems`.

**5. Error prevention.** Better than good error messages is a design that prevents the problem from occurring.
*Catches:* free-text where a constrained input would do, destructive actions adjacent to routine ones, formats that could be parsed but are rejected.
*Ask:* could this error have been made impossible? See `forms-and-input`.

**6. Recognition rather than recall.** Minimize memory load. Make objects, actions and options visible.
*Catches:* codes the user must remember between screens, settings whose current value is not shown, instructions that disappear before they are needed.
*Ask:* does the user have to hold anything in their head between two screens?

**7. Flexibility and efficiency of use.** Accelerators, unseen by novices, speed up the expert. Allow tailoring of frequent actions.
*Catches:* no keyboard shortcuts on a daily-use tool, no bulk actions where the task is repetitive, no saved views.
*Ask:* what does the hundredth use look like, not the first?

**8. Aesthetic and minimalist design.** Interfaces should not contain information which is irrelevant or rarely needed. Every extra unit competes with the relevant units.
*Catches:* dashboards showing everything, empty states full of marketing, settings pages with no hierarchy.
*Ask:* what could be removed without loss? See `layout-and-composition`.

**9. Help users recognize, diagnose and recover from errors.** Error messages in plain language, precisely indicating the problem, and constructively suggesting a solution.
*Catches:* error codes without explanation, "something went wrong", validation that says invalid without saying why, errors that clear the form.
*Ask:* does the message say what happened, why, and what to do? See `content-design`.

**10. Help and documentation.** Better if the system needs no documentation, but help should be searchable, task-focused and concrete.
*Catches:* help that documents the interface rather than the task, no help at the point of confusion, documentation that is a feature list.
*Ask:* is help available where the user gets stuck, or only in a separate site?

## Forms and data entry

Use when the interface is predominantly input. Narrower and higher-yield than the general set for this case. `forms-and-input` owns the rules; these are the inspection prompts.

1. Every field has a persistent visible label, not a placeholder standing in for one.
2. Required and optional are marked, and the less common of the two is what gets marked.
3. Input type matches the data — the right keyboard appears on mobile, dates use a date control.
4. Validation fires at a helpful moment: on blur for format, on submit for cross-field rules, never on every keystroke for an incomplete value.
5. Error messages appear beside the field, name the problem, and say what a valid value looks like.
6. Nothing the user typed is discarded on error.
7. Formats the system could accept are accepted — spaces in card numbers, varied phone formats, pasted values with whitespace.
8. Autocomplete attributes are present and correct.
9. Multi-step flows show progress and allow going back without loss.
10. The submit action says what it does, not "Submit".

## Data-dense interfaces

Tables, dashboards, admin tools, anything where the primary job is reading.

1. The default view answers the most common question without configuration.
2. Sorting and filtering state is visible and removable.
3. Empty results explain why and offer a way back.
4. Numbers are aligned for comparison and formatted consistently — see `dataviz` for chart conventions.
5. Density is appropriate to the task; a professional tool used daily is allowed to be dense.
6. Bulk actions exist where the task is repetitive, and say how many items they will affect.
7. Destructive bulk actions confirm with a count, and are undoable.
8. Column meaning is available without leaving the screen.
9. The table works at the real row count, not at the demo row count.
10. Loading states preserve layout rather than collapsing and reflowing.

## Mobile and touch

1. Targets meet the size and spacing thresholds in `accessibility`.
2. Primary actions sit within thumb reach on a large phone.
3. Nothing depends on hover.
4. Gestures have a visible alternative.
5. The keyboard does not cover the field being typed into.
6. Content reflows rather than requiring horizontal scroll at 320px.
7. Destructive gestures — swipe to delete — are undoable.
8. The interface survives an interruption: a call, an app switch, a rotation.
9. Text remains legible without zoom, and zoom is not disabled.
10. The flow works on a slow connection with the images not yet loaded.

## Applying a set without producing a checklist verdict

A heuristic set is a lens for noticing, not a scoring rubric. Three rules keep it honest:

**Do not report conformance as a score.** "8/10 heuristics passed" is meaningless — the ten are not equally weighted and a single Critical violation of one outweighs conformance with nine.

**Do not report a violation with no consequence.** If you cannot say what it costs the user, it is a pattern difference and not a finding. Inconsistency that nobody notices is not a usability problem.

**Do not treat a deliberate exception as a violation.** Professional tools break minimalism on purpose. Platform-specific products break cross-platform consistency on purpose. Ask whether the deviation is serving a user the design is for, and where the answer is yes, leave it.

The corresponding trap in the other direction: "it's intentional" is not a defense on its own. An intentional decision that costs users something is still a finding — it is just one the team may choose to accept, which is `prioritization`'s call rather than yours.
