# Testing

The order to test in, what each pass catches, and how to include disabled participants.

Test in this order. Each pass is cheaper than the one after it and clears noise that would otherwise swamp the next.

## 1. Automated scan — minutes

Run axe, Lighthouse or the equivalent. It catches missing alt attributes, missing form labels, obvious contrast failures, duplicate IDs, empty links and buttons, and invalid ARIA.

It catches roughly a third of real issues and none of the important ones. Clear what it finds so the later passes are not distracted, then continue. **Never report conformance from a scan.**

## 2. Keyboard walk — 15 minutes

Unplug the mouse. Complete the primary task.

- Tab through the whole page. Can you reach every interactive element?
- Is focus visible at every single step? This is where most failures are.
- Does tab order match visual order?
- Can you operate everything — Enter, Space, arrow keys where the pattern calls for them?
- Can you escape everything you can enter? Modals, menus, date pickers, embedded content.
- Open a modal: is focus moved into it, trapped, and returned on close?
- Delete an item from a list: where does focus go?
- Submit a form with errors: where does focus go?

This pass finds more than any other, and it needs no tooling.

## 3. Zoom and reflow — 10 minutes

- Browser zoom to 200%. Is anything lost or unusable?
- Narrow the window to 320px, or zoom to 400% at 1280px. Two-dimensional scrolling?
- Inject the text-spacing values from `thresholds.md`. Does anything clip?

Fixed-height containers are where this fails, and nothing reveals it except doing it.

## 4. Screen reader pass — 30 minutes

You do not need to be an expert. You need to find out whether the interface makes sense when read aloud.

| Platform | Reader | Basics |
| --- | --- | --- |
| macOS | VoiceOver | Cmd+F5 · VO = Ctrl+Option · VO+→ next · VO+U rotor |
| Windows | NVDA (free) | Insert = NVDA key · ↓ next · Insert+F7 elements list |
| iOS | VoiceOver | Settings → Accessibility · swipe right for next · double-tap to activate |
| Android | TalkBack | Settings → Accessibility · swipe right · double-tap |

What to check:

- Navigate by heading. Do the headings describe the page structure, or is there only one?
- Navigate by landmark. Are main, navigation and footer present?
- Does every control announce a **name**, a **role** and its **state**? A button that announces "button" with no name is unusable.
- Do images announce something useful, or the file name?
- When something changes — an error appears, a filter applies, content loads — is it announced at all?
- Does the reading order match what you see?

Test on at least one platform. Two is better, because behavior differs, and the combination of Windows and NVDA is the most common in practice.

## 5. Manual inspection — as needed

- Compute contrast on every text and UI pair, in both themes, at the pair that actually renders.
- Measure target sizes in CSS pixels.
- View the interface in grayscale. Anything ambiguous is a color-alone failure.
- Enable `prefers-reduced-motion` at the OS level and re-walk anything animated.
- Inspect the accessibility tree for names and roles rather than assuming from the markup.

## 6. Testing with disabled participants

Everything above tests conformance. Conformance is not usability, and the gap between them is where the real problems live.

A technically conformant interface can still be exhausting: forty tab stops before the main content, verbose announcements, a focus order that is legal but nonsensical. Only participants find these.

Recruiting, through `research-planning`:

- Recruit for assistive technology use and for the task, not for a diagnosis. "Uses a screen reader daily for work" is the screening criterion.
- Participants use **their own** setup — their reader, their settings, their speech rate. An interface tested at default speech rate has been tested at a rate no regular user uses.
- Pay the standard incentive. Do not treat participation as advocacy.
- Allow more time. Sessions run longer, and rushing produces a moderator who helps.
- Ask about workarounds. Experienced assistive-technology users have routes around broken interfaces, and the workaround is the finding.

Do not use a disabled participant as an accessibility consultant. They are reporting their experience, not auditing your code, and asking them to do both is unpaid work.

## Testing at design time

Most of this can be checked before anything is built:

| Check | When |
| --- | --- |
| Contrast on every text and UI pair | As the palette is built — `color-and-theming` |
| Target sizes | As components are specified — `components-and-states` |
| Focus indicator designed, not an afterthought | In the component's state set |
| Heading hierarchy | In the wireframe |
| State not carried by color alone | As states are designed |
| Reading order | In the layout, before implementation |
| Copy for errors, empty and loading states | With the happy-path copy — `content-design` |

Each of these costs minutes at design time and hours after implementation. That asymmetry is the entire argument for why this band runs alongside the others rather than after them.

## A minimum viable audit

Where there is one hour:

1. Keyboard walk of the primary task. 15 min.
2. Contrast check on every text pair in both themes. 15 min.
3. Screen reader pass of the primary task on one platform. 20 min.
4. 200% zoom and 320px width. 10 min.

That finds the large majority of blocking issues. Report it as a partial audit and say what was not covered — a partial audit reported honestly is useful; one reported as complete is misleading.
