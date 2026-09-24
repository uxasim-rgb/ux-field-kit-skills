# Method selection

The full decision table, the tradeoffs behind it, and the methods people reach for when a different one would serve better.

## The two axes

Every method sits somewhere on two axes, and naming the position resolves most arguments about which to use.

**Attitudinal ↔ behavioral.** What people say versus what people do. Interviews, surveys and preference tests are attitudinal. Usability tests, analytics and A/B tests are behavioral. The gap between the two is not dishonesty — people genuinely cannot introspect on habit, and they answer the question they think you are asking.

**Qualitative ↔ quantitative.** Why and how versus how many and how much. Qualitative methods observe a few people closely and generate hypotheses. Quantitative methods observe many people thinly and test them.

A study that needs both quadrants needs two studies. Run qualitative first: it tells you what is worth counting. Counting first means counting the wrong things precisely.

## The table

| Question shape | Method | Gives you | Costs | Fails at |
| --- | --- | --- | --- | --- |
| What is going on in this domain | Semi-structured interviews | Context, vocabulary, mental models | 5–8 sessions, 45–60 min each | Rates, prediction of behavior |
| How does work actually happen | Contextual inquiry, diary study | Environment, interruptions, workarounds | High; travel or multi-week | Anything fast |
| Can people complete this task | Moderated usability test | Observed failure points with reasons | 5 per segment, 30–60 min | Frequency across population |
| Can people complete this task, at scale | Unmoderated usability test | Completion rates, time on task | 20–50 participants, tooling | Why a failure happened |
| How common is this | Survey | Distribution, rates, segment comparison | Sample size math, careful writing | Why, and anything about behavior |
| How usable is it, comparably | SUS / UMUX-Lite / SEQ | A benchmark number over time | Bolted onto another study cheaply | Diagnosis — a low score says nothing about cause |
| Which version performs better | A/B test | Causal effect on a metric | Traffic, duration, instrumentation | Small effects, low-traffic surfaces |
| How do people group and name things | Card sort | Their taxonomy and vocabulary | 15–30 participants, unmoderated | Whether the resulting structure works |
| Can people find things in this structure | Tree test | Findability per task, first-click accuracy | 30+ participants | Anything visual |
| Where do people drop off | Funnel analysis | Location of the problem | Existing instrumentation | The reason for the drop |
| What does the interface get wrong on principle | `heuristic-evaluation` | Defensible issue list, no recruiting | 2–3 evaluators, hours | Which issues actually bite real users |

## Common mis-selections

**Survey chosen for a "why" question.** A survey cannot ask a follow-up. Open-text answers to "why did you cancel" produce a shallow pile that has to be coded anyway, without the ability to probe the interesting ones. Interview eight churned users instead, then survey to size what you found.

**Interviews chosen to validate a design.** Showing someone a design and asking what they think produces politeness and speculation. If the question is whether the design works, give them a task and watch: `usability-testing`.

**Usability test chosen to choose between concepts.** A usability test finds problems in one thing. Running it on two designs produces a comparison with no statistical basis and an outcome decided by whichever went first. Use it to fix each, and `experimentation-and-analytics` to choose between them in production.

**Preference test chosen for anything.** "Which do you prefer" correlates poorly with which performs better. Its one legitimate use is checking that a brand direction does not actively repel people.

**A/B test chosen for a low-traffic surface.** Below a few thousand exposures per variant the test will not conclude, and a test that runs until it shows something is a test that will eventually show noise. Fix the obvious problems qualitatively instead.

**Focus groups chosen for individual behavior.** Groups produce group opinion: the loudest participant anchors the rest, and the output tells you about the group dynamic rather than about any individual's experience. They are legitimate for reactions to shared concepts, and almost never for how someone uses software.

## Choosing when constrained

**No budget.** `heuristic-evaluation` with two or three evaluators, plus whatever analytics already exist. Say that it produces hypotheses rather than validated problems.

**No time.** Five unmoderated usability sessions on an existing tool can return within a day. Narrow to one task.

**No access to real users.** Recruit the closest proxy and name the gap explicitly in the report. Internal colleagues are the worst proxy for an unfamiliar product and an acceptable one for an internal tool.

**Legal or compliance blocks recording.** Run the session with a dedicated notetaker, and shorten it — notes without recording degrade fast past 45 minutes.

## Mixing methods well

The reliable combinations:

- **Interviews → survey.** Learn the vocabulary and the range of answers, then size them. Writing survey options without this step means inventing the options.
- **Analytics → usability test.** Find where people drop, then watch people at that step to find out why. This is the highest-yield pairing in product work and the most underused.
- **Usability test → A/B test.** Fix the observable problems, then test the remaining judgement call at scale.
- **Survey → interviews.** Legitimate in reverse when the survey surfaces a segment behaving unexpectedly and you need to understand them.

Avoid running two methods simultaneously on the same question. Where they disagree you will have no basis for deciding which to believe, and they will disagree.
