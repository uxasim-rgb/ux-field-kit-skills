---
name: motion-and-interaction
description: Sets duration, easing and enter/exit behavior so motion explains what changed instead of decorating it, and handles gestures, interruption and reduced-motion. Use when animation feels sluggish, distracting or arbitrary.
when_to_use: Use when adding animation or transitions, choosing easing curves or durations, designing enter and exit behavior, building gestures or drag interactions, handling prefers-reduced-motion, or when motion feels slow, janky or gratuitous.
---

# Motion and interaction

This skill decides what moves, how fast, and why. It sits in the Craft band.

The governing idea: motion exists to explain a change — where something came from, what it became, what is still loading. Motion that explains nothing is a delay you added on purpose.

**Works with:** `components-and-states` owns the states motion moves between · `accessibility` owns reduced-motion and vestibular safety as requirements · `design-engineering` owns performance and what the compositor can animate · `design-systems` owns duration and easing as tokens.

## Start here

| The situation | Go to |
| --- | --- |
| Adding animation to something | **Ask what it explains** below |
| It feels sluggish | **Duration by distance and size** below — usually too long |
| It feels janky | `design-engineering` — likely animating a non-composited property |
| Designing a modal, drawer or toast | **Enter and exit are not symmetrical** below |
| Building a gesture | **Gestures need a visible alternative** below |
| Handling reduced motion | **Reduced motion is not no motion** below |
| The transition between two states | `components-and-states` owns the states |

## Ask what it explains

Before animating, name what the motion tells the user. Legitimate jobs:

- **Continuity** — this thing came from there, or became this. A card expanding into a detail view.
- **Causality** — your action caused this. A button depressing, a row sliding out on delete.
- **Status** — something is happening. A progress indicator.
- **Direction** — you moved forward, or back. A page transition that respects the direction of travel.
- **Attention**, sparingly — something changed that you would otherwise miss.

If none apply, the animation is decoration on a path the user walks many times a day, and it should be cut. The tenth time a user sees an entrance animation, it is a wait.

Motion on the most frequent path should be the shortest or absent. Motion on a rare, significant moment can afford more.

## Duration by distance and size

Short. Almost always shorter than it feels like it should be when you are the one building it.

| What | Duration |
| --- | --- |
| Micro-feedback — hover, press, focus, checkbox | 80–120ms |
| Small element entering or leaving — tooltip, dropdown, toast | 150–200ms |
| Medium — modal, drawer, expanding panel | 200–300ms |
| Large — full-screen or page transition | 300–400ms |
| Anything above | Reconsider; you are adding a wait |

Two adjustments:

- **Distance scales duration**, but sub-linearly. Something travelling twice as far does not need twice the time.
- **Exits are faster than entrances**, typically 0.7–0.8×. The user has decided; getting out of the way promptly feels responsive, while a slow dismissal feels like the interface is arguing.

Anything under ~100ms reads as instant. Anything over ~400ms on a routine interaction reads as slow, however elegant.

## Easing describes physics

| Curve | Use for | Why |
| --- | --- | --- |
| `ease-out` (fast start, slow end) | Entrances, things appearing, anything responding to input | Feels immediate; the user sees the response instantly |
| `ease-in` (slow start, fast end) | Exits, things leaving | Accelerating away reads as departure |
| `ease-in-out` | Things moving between two on-screen positions | Symmetrical movement |
| `linear` | Continuous, mechanical motion — spinners, progress, marquee | Anything eased looks like it is stalling |
| Spring | Direct manipulation, drag release, playful products | Carries momentum; needs testing for overshoot |

**`ease-out` is the correct default for interface motion.** The dominant perception of responsiveness comes from how fast the motion starts, and `ease-out` starts fast.

Avoid the browser default `ease` for anything meaningful; it is a compromise curve and it makes entrances feel hesitant. Define a small set of named curves as tokens — `design-systems` owns them — rather than writing bezier values per component.

## Enter and exit are not symmetrical

The reverse of an entrance is rarely the right exit.

A modal that scales up from 0.95 with a fade on entry should usually fade out faster without scaling down — the scale communicates arrival, and on the way out it reads as the interface retreating. A toast that slides in from the edge can simply fade out, because the user is no longer tracking where it went.

Decide four things for every transient surface: how it enters, how it exits, what happens if it is dismissed during the entrance, and whether it can be interrupted.

That third one is where bugs live. An element mid-entrance that is dismissed must reverse from where it is, not jump to its end state and then leave.

## Everything is interruptible

Users change their mind mid-animation, and an interface that refuses input until a transition finishes feels unresponsive and slow regardless of duration.

- Never block input during a transition.
- Reverse from the current position rather than completing and then reversing.
- Queueing animations is almost always wrong; the user only cares about the final state.
- A rapidly toggled control should not build a backlog.

The test: click something on, then immediately off, three times fast. If the interface lags behind, animations are queuing.

## Animate only what the compositor can handle

`transform` and `opacity` animate on the compositor and stay smooth. Animating layout properties — `width`, `height`, `top`, `left`, `margin` — forces layout recalculation on every frame and produces jank on anything but a fast machine.

Where a size change is genuinely needed, prefer `transform: scale()`, or use the modern layout-animation APIs the project already depends on. `will-change` is a last resort applied narrowly, and left on permanently it costs memory rather than helping.

Test on a throttled CPU, not on the development machine. `design-engineering` owns the performance budget and the measurement.

## Gestures need a visible alternative

A gesture is invisible. Swipe-to-delete, long-press menus, pinch-to-zoom and drag-to-reorder are all fine as accelerators and none are acceptable as the only route.

- Every gesture has an equivalent visible control.
- Destructive gestures are undoable — a swipe that deletes without undo will delete things accidentally, because swipes happen while scrolling.
- Drag targets need adequate hit area; `accessibility` owns the thresholds.
- `touch-action: none` only on the specific surface implementing a custom gesture, never at page level, where it removes scrolling.
- Drag-and-drop needs a keyboard equivalent, and that is a requirement rather than a nicety.

## Reduced motion is not no motion

`prefers-reduced-motion: reduce` is a request to avoid large, unexpected or vestibular-triggering movement. It is not a request for a static interface, and stripping all transitions can make state changes harder to follow.

Replace rather than remove: large translations and scales become cross-fades; parallax and auto-playing movement stop; essential feedback stays.

Write motion as opt-in so the default is safe:

```css
.panel { /* static styles */ }
@media (prefers-reduced-motion: no-preference) {
  .panel { transition: transform 200ms cubic-bezier(0, 0, 0.2, 1); }
}
```

Anything that auto-plays, loops, flashes or moves for more than five seconds needs a pause control. Content flashing more than three times per second is a seizure risk and is a hard failure — `accessibility` owns that threshold.

## Evidence bar

Duration, frame rate and the property being animated are all measurable. "Feels slow" becomes "the drawer transition is 450ms on a 280px travel" — one is a finding, the other is an impression.

Jank is measurable: record a performance profile on a throttled CPU and report dropped frames. Do not report smoothness from the development machine, which is not representative of anything.

Whether motion should exist at all is answerable by naming its job. A finding is "this entrance explains nothing and sits on the most frequent path", not "I would not have animated this".

Reduced-motion behavior, pause controls and the flash threshold are requirements, not preferences, and belong to `accessibility`. Test with the preference enabled rather than assuming the media query is wired up.

## Before you ship

| Symptom | What it means | Fix |
| --- | --- | --- |
| The animation explains nothing | Decoration on a frequent path | Cut it |
| It feels sluggish at 400ms | Duration is above the routine threshold | Shorten; check against the table |
| The entrance feels hesitant | Browser default `ease` | `ease-out` |
| A spinner speeds up and slows down | Eased continuous motion | `linear` |
| The exit mirrors the entrance exactly | Symmetry applied where it does not belong | Faster exit, usually simpler |
| Clicking twice fast lags | Animations are queuing | Interrupt and reverse from current position |
| Input is blocked during a transition | The interface feels unresponsive | Never block input |
| It janks on a mid-range phone | A layout property is being animated | `transform` and `opacity` |
| Smoothness confirmed on the dev machine | Not representative | Throttle the CPU and re-measure |
| Swipe-to-delete with no undo | It will fire during scrolling | Undo, always |
| A gesture is the only route to an action | Invisible and inaccessible | Add a visible control |
| Reduced motion strips everything | State changes become hard to follow | Replace movement with cross-fades |
| An auto-playing loop has no pause | Requirement, not preference | Add a control |

## Reporting

**Severity ladder:** `Critical` — content flashing above the seizure threshold, motion with no reduced-motion alternative, a gesture that is the only path to an action, a destructive gesture with no undo · `Serious` — input blocked during transition, jank on target hardware, auto-playing motion with no pause · `Moderate` — duration outside range, wrong easing for the job, symmetrical exit · `Minor` — inconsistent curve between similar components.

**Verification:** durations measured; the animated property checked; profile recorded on throttled CPU; reduced-motion tested with the preference enabled; gesture alternatives confirmed; rapid-toggle test performed.

**Format:** findings by principle, severity order, each with the measured duration and property, what the motion was supposed to explain, and the fix as a token change where the project has motion tokens.

**Done when:** every animation can name what it explains, durations were measured rather than felt, the interface was profiled on hardware it will actually run on, and the reduced-motion path was tested rather than assumed.
