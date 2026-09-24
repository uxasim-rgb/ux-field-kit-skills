---
name: forms-and-input
description: Designs fields, validation timing, error recovery and multi-step input so people can finish without fighting the form. Use when building or reviewing any data entry, from a single search box to a checkout.
when_to_use: Use when designing or reviewing a form, choosing input types, deciding when validation fires, writing field labels or error messages, handling required vs optional, building a multi-step or wizard flow, or fixing form abandonment.
---

# Forms and input

This skill covers everything between a user's intention and the data your system stores. It sits in the Structure band and is where the largest share of avoidable abandonment happens.

The governing idea: the form should adapt to what the user typed, not the other way round. Most validation failures are the system refusing data it could have accepted.

**Works with:** `accessibility` owns labels, focus and error announcement as requirements · `content-design` owns the wording of labels and errors · `user-flows` owns multi-step structure and recovery · `components-and-states` owns the visual states · `global-and-inclusive` owns names, addresses, dates and phone formats.

## Start here

| The situation | Go to |
| --- | --- |
| Designing a form from scratch | **Ask for less** below, then work down |
| People abandon partway | **Ask for less**, then **Validate at the right moment** |
| Errors are the problem | **Never reject what you could accept** below |
| The form is long | **Multi-step** below, and `user-flows` |
| Labels and messages need wording | `content-design` |
| Screen reader or keyboard behavior | `accessibility` — it owns the requirements |
| Names, addresses, dates, phone numbers | `global-and-inclusive` — assumptions there break internationally |
| It works but feels sluggish | `motion-and-interaction` for feedback timing |

## Ask for less

Every field costs completion. The highest-leverage form change is almost always removing a field rather than improving one.

For each field ask: what happens if we do not collect this? If the answer is "marketing would like it", cut it. If it is "we need it eventually", collect it later, in context, when the user has a reason to care.

Then ask what you can derive rather than request: country from a postal code, city from a postcode lookup, currency from the account, timezone from the browser. A field the system can fill is a field the user should not see.

Split required from optional honestly, and **mark whichever is rarer**. A form where three of twelve fields are optional should mark the optional three, not asterisk the nine.

## Give every field a persistent visible label

A placeholder is not a label. It disappears when typing starts, which removes the field's meaning exactly when the user is checking their work, it fails contrast requirements at typical styling, and it is unreliable for assistive technology.

Labels sit above the field for scannability in most layouts. Placeholders, where used *in addition*, show format: `name@company.com`, not "Enter your email".

`accessibility` owns the programmatic requirements — every control needs a `<label for>` or wrapping label, and a field with only a placeholder is a defect there, not a style preference.

## Match the input to the data

The control tells the user what kind of answer is expected and gets them the right keyboard on mobile:

| Data | Control |
| --- | --- |
| Email | `type="email"` `inputmode="email"` |
| Phone | `type="tel"` `inputmode="tel"` |
| Numeric that is not a quantity — card, PIN, postcode | `inputmode="numeric"` with `type="text"`, so leading zeros survive and spinners do not appear |
| Quantity | `type="number"` with sensible `min`, `max`, `step` |
| Date the user knows | Three separate fields or a masked text input, not a calendar picker |
| Date the user is choosing | Calendar picker with text entry as a fallback |
| 2–5 mutually exclusive options | Radios, all visible |
| More than ~7 options | Select |
| Many options with a known value | Combobox with type-ahead |

Use `autocomplete` attributes correctly — `given-name`, `family-name`, `email`, `street-address`, `postal-code`, `cc-number`. It is the single cheapest improvement to completion rate and it is usually missing.

Never disable paste. It breaks password managers, forces retyping of card numbers, and prevents nothing.

## Validate at the right moment

Timing matters more than the message.

| When | Use for |
| --- | --- |
| **As they type** | Only positive, non-blocking feedback: password strength, character count, a format hint resolving |
| **On blur** | Format checks — email shape, required-not-filled, out of range |
| **On submit** | Cross-field rules, server checks, anything needing a round trip |
| **Never** | Erroring on an incomplete value while the field still has focus |

The defining failure is marking an email invalid after the third character. The user has not finished. Validate on blur, and once a field has errored, re-validate as they type so the error clears the moment it is fixed — error-on-blur, clear-on-input is the pairing that feels right.

On submit with multiple errors: summarize at the top, link each summary item to its field, move focus to the summary, and mark each field inline as well. `accessibility` owns the announcement requirements.

## Never reject what you could accept

Most format errors are the system being pedantic about something it could normalize.

Accept and clean: spaces and dashes in card numbers, phone numbers and postcodes; leading and trailing whitespace anywhere; pasted values carrying formatting; varied capitalization in emails; dates in more than one order where unambiguous.

Where you must reject, say what a valid value looks like with a concrete example, and never just "invalid format".

Never silently truncate. A field with a length limit shows the limit and stops accepting input at it; quietly cutting a name to 32 characters on save is data loss the user finds out about later.

## Preserve everything, always

On any error — validation, server failure, session expiry, navigation away — the user's input survives.

This is the most common and most damaging form defect, and it is an implementation shortcut rather than a decision. A payment form that clears on a declined card is why people abandon checkouts.

For long forms, save drafts. For multi-step flows, persist between steps so the back button is safe. `user-flows` owns the recovery path.

## Multi-step, only when the form is genuinely long

Splitting is worth it past roughly ten fields, or where the fields fall into genuinely different topics, or where a later step depends on an earlier answer.

Rules once split:

- Say how many steps and which one this is.
- Group by the user's topic, not by which system stores the data.
- Back must work without loss.
- Validate each step as it is left, not everything at the end.
- Optional steps are skippable and labelled optional.
- Show a review before anything irreversible, with each section editable in place.

Do not split a short form to make it feel lighter. Four steps of two fields is slower than one screen of eight and it feels like bureaucracy.

## Say what the submit button does

"Submit" tells the user nothing. Use the outcome: `Create account`, `Pay £42.00`, `Send invitation`. On an irreversible or charging action, put the consequence in the label.

On submit, disable the control and show it is working — but only after the request starts, and always re-enable on failure. A button that disables and never returns is how duplicate-submission bugs get discovered by users.

Guard against double submission on the server as well. Users double-click.

## Evidence bar

Measure abandonment by field where instrumentation allows. Field-level drop-off points at the actual problem, which is frequently not the field the team suspects. `success-metrics` owns the instrumentation request.

Test with realistic data, not demo data: the longest name you actually see, a hyphenated surname, an address with no postcode, a number at the boundary. A form tested with "John Smith" has been tested on the case that was never going to fail.

Contrast, labelling and focus behavior are measurable and belong to `accessibility` — measure them rather than judging by eye.

Where a field is defended as required by a stakeholder, the evidence needed is what happens downstream when it is missing. Frequently the answer is nothing, and the field survives because nobody checked.

## Before you ship

| Symptom | What it means | Fix |
| --- | --- | --- |
| Placeholder is the only label | Meaning disappears on typing; fails assistive tech | Persistent visible label |
| Nine of twelve fields are asterisked | The rarer state should be marked | Mark the three optional ones |
| Email errors after three characters | Validating an incomplete value | Validate on blur, clear on input |
| "Invalid format" with no example | The user must guess | Show a valid example |
| Card number rejects spaces | Rejecting what you could normalize | Strip and accept |
| Paste is disabled | Breaks password managers, prevents nothing | Allow paste |
| Input is cleared after an error | Implementation shortcut shipped as behavior | Preserve, always |
| A name was silently truncated | Data loss the user discovers later | Show the limit, stop at it |
| Submit says "Submit" | No outcome stated | Name the outcome and cost |
| The button disables forever on failure | No re-enable path | Re-enable on error; guard server-side |
| Four steps of two fields | Splitting for its own sake | One screen |
| Back loses everything | State is not persisted between steps | Persist; `user-flows` owns recovery |
| Tested with "John Smith" | The failing cases were never exercised | Test with real-shaped data; `global-and-inclusive` |
| A field exists because someone asked for it | Nobody checked the downstream cost of removing it | Ask what breaks without it |

## Reporting

**The deliverable is a field-level review** with validation timing stated.

**Severity ladder:** `Critical` — data loss, unrecoverable error, a field that cannot be completed by a legitimate user · `Serious` — input discarded, rejection of valid data, missing label · `Moderate` — poor validation timing, unclear error, missing autocomplete · `Minor` — inconsistent styling or ordering.

**Verification:** every field has a persistent label; required/optional marked on the rarer state; input types and autocomplete checked; validation timing stated per field; error recovery preserves input; tested with boundary and international data.

**Format:**

1. **Scope** — which form, which flows reach it, which roles.
2. **Field inventory** — field, control type, required, autocomplete, validation timing, and whether it could be derived or dropped.
3. **Findings**, severity order, each naming the owning skill.
4. **Error catalogue** — each failure, its message, and the recovery available.
5. **Abandonment data** where it exists, by field.
6. **Cuts proposed** — fields that could be removed or deferred, with what breaks.

**Done when:** every field justifies its existence, no error discards input, validation timing is stated per field rather than assumed, and the form has been exercised with data that is shaped like real data.
