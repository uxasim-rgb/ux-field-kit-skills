---
name: user-interviews
description: Writes interview guides and runs semi-structured interviews that surface what people actually do, rather than what they say they would do. Use when the question is about context, motivation or current workarounds.
when_to_use: Use when writing an interview guide or discussion guide, preparing to talk to users or customers, moderating a research session, deciding what to ask, worried about leading questions, or when someone asks "what should I ask them" before a call with a user.
---

# User interviews

This skill produces an interview guide and governs how the conversation is run. It sits in the Research band, downstream of `research-planning`, which decides whether an interview is the right method at all.

The governing idea: people are reliable reporters of what happened and unreliable reporters of what they want, why they did something, and what they would do. Build every question around a past event.

**Works with:** `research-planning` owns method choice, recruiting and consent · `usability-testing` owns watching people attempt tasks · `research-synthesis` owns what happens to the transcripts · `surveys-and-measurement` sizes what interviews surface.

## Start here

| The situation | Go to |
| --- | --- |
| You need the guide itself | [Guide structure](guide-structure.md) |
| You need to know if an interview is even right | `research-planning` |
| The question is "can they use this" | `usability-testing` — an interview will not tell you |
| You want to show a design and get reactions | Reframe it as a task, or accept you are collecting speculation |
| Sessions are done | `research-synthesis` |
| You want to know how many people feel this way | `surveys-and-measurement` |

## Ask about the last time, not about usually

"Usually" invites a summary, and summaries are reconstructions built to sound coherent. "The last time" invites a memory, and memories contain the mess that the research is looking for.

| Instead of | Ask |
| --- | --- |
| How do you usually handle invoices? | Walk me through the last invoice you sent. |
| Would you use a feature that did X? | When was the last time you needed something like that? What did you do? |
| What do you look for in a tool like this? | How did you end up choosing the one you use now? |
| Do you find this confusing? | Tell me what you were expecting to happen there. |
| How often does that happen? | How many times has that happened this month? |

When someone answers "usually", they have slipped into summary. Bring them back: "Can you think of a specific time that happened?"

## Never ask people to predict or design

Stated intent does not predict behavior, and participants are not obliged to be right about themselves. "Would you pay for this" returns a number that means nothing. "Would you use it" returns yes, because saying no to an enthusiastic stranger is awkward.

Participants are also not designers, and asking them to be one wastes the access. "What would you change about this screen" gets you a feature request untethered from the problem. Ask what went wrong and design the fix yourself.

The legitimate forward-looking question is about commitment already made: what they have budgeted for, what they have already tried, what is on their roadmap.

## Let the silence do the work

The most productive interviewing move is saying nothing for three seconds after the participant stops. Most people are not finished — they have given the tidy answer and are deciding whether to give the real one. Filling that gap with the next question buys the tidy answer.

Second most productive: "Say more about that." It is content-free, so it cannot lead, and it signals that the thread is worth continuing.

Silence feels much longer to the moderator than to the participant. Count it.

## Probe the behavior, not the opinion

When something interesting surfaces, go down rather than on. The useful probes, roughly in order of yield:

- **Sequence.** "What happened right before that?" / "And then what did you do?"
- **Consequence.** "What happens if you get that wrong?"
- **Workaround.** "How do you handle it when that fails?" Workarounds are the highest-value finding in an interview — someone built a solution at their own expense, which measures the problem.
- **Frequency, anchored.** "How many times last month?" not "how often?"
- **Contrast.** "Is that how it went the time before, too?"
- **The echo.** Repeat their last three words as a question. Content-free, reliably productive.

Avoid "why" as an opener — it asks for a justification and people supply a rational-sounding one. "What made you do that?" gets the cause; "why did you do that?" gets the defense.

## Do not correct, sell or teach

When a participant misuses the product, misunderstands a feature or describes a workaround for something already solved, the correct response is curiosity, not instruction. Their wrong model is the finding. Explaining the right one destroys the rest of the session, because they will now perform understanding.

If they ask directly, defer: "I want to see how you'd approach it first — I'll show you at the end." Then actually show them at the end. That is a fair trade and it costs nothing.

The same applies to the product's roadmap. Do not confirm or deny what is coming.

## Write the guide as a structure, not a script

A guide is a spine with room to move. Full structure in [guide structure](guide-structure.md); the shape:

- **Warm-up** (5 min) — their role and the last time they did the thing, asked in a way that cannot fail.
- **Context** (10 min) — the surrounding workflow, who else is involved, what happens before and after.
- **The core** (25 min) — two or three main topics, each opened with a past-event question and then probed.
- **Specifics** (10 min) — targeted questions the study needs answered, asked late so they do not frame the earlier conversation.
- **Close** (5 min) — anything they expected to be asked, anything they want to add, referrals.

Order matters: broad before narrow, and anything that reveals what you are interested in goes last. A guide that asks about the new feature in minute three has told the participant what to talk about for the remaining fifty-five.

Mark questions as must-ask or optional. A sixty-minute guide with forty questions will be rushed, and rushing is how leading questions get asked.

## Interview in pairs where you can

One moderator, one notetaker. The moderator holds the conversation and does not take notes; the notetaker captures observations, timestamps and things to follow up, and asks their questions in the last five minutes.

A moderator taking their own notes will miss follow-ups, because writing and listening compete. If you must run solo, record and take timestamps only.

## Evidence bar

An interview produces observations about individuals. It does not produce rates, and a single interview never produces a finding.

Three independent participants describing the same behavior is the threshold for reporting a pattern. Below that, report it as a signal with the count attached: "Two of six described building a spreadsheet to work around this."

Separate what you watched from what you were told. A participant describing their process and a participant performing their process routinely diverge, and the report should mark which it is.

Quote verbatim. Cleaning up a quote to make the point clearer moves it from evidence toward argument, and the specific words people use are often the finding — especially their vocabulary for the domain, which belongs to `content-design` and `information-architecture`.

When the interviews did not answer the research question, say so. A guide that was too broad or a sample that was wrong produces an honest null result, and reporting one is cheaper than acting on a manufactured pattern.

## Before you ship

| Symptom | What it means | Fix |
| --- | --- | --- |
| Participants keep agreeing with you | Questions contain their own answer | Strip every adjective; ask about a past event instead |
| Answers are all "usually" and "generally" | The participant is summarizing | "Can you think of a specific time?" |
| The guide has more than 20 questions for 60 minutes | It will be rushed or abandoned | Mark must-ask, cut the rest |
| The interesting thread was dropped to stay on the guide | The guide is being read as a script | Follow the thread; the guide is a checklist for the end |
| You explained how the feature works mid-session | The rest of the session is now performance | Defer explanations to the close |
| Notes are conclusions, not observations | Synthesis happened during the session | Record what they said and did; interpret in `research-synthesis` |
| Every participant came from the same team or company | One context is being read as the market | Say so in the report, or recruit wider |
| You asked whether they would use or pay for it | The answer is worthless and now anchors the session | Ask what they have already tried or bought |

## Reporting

**The deliverable is a set of session notes plus a short readout**, not a transcript dump. Transcripts are evidence; nobody reads them.

Per session, capture: participant ID (never the name), segment, date, the tasks or topics covered, verbatim quotes with timestamps, observed behaviors distinct from reported ones, and open questions raised.

The readout, one page:

1. **What we asked** — the research questions, restated.
2. **Who we talked to** — segments and counts, no names.
3. **Patterns** — each with the count of participants supporting it, most-supported first.
4. **Signals** — single or double observations worth watching, labeled as such.
5. **Surprises** — anything that contradicted the team's assumption, called out on its own. This section is why anyone reads the document.
6. **What this does not tell you** — the limits from the plan, restated honestly.
7. **Recommended next step** — one.

Hand the patterns to `research-synthesis` if there is more than one study to combine, and to `problem-framing` if the output is a decision about what to build.

**Done when:** every pattern has a participant count, every quote has an ID, and a reader who attended no sessions could name the top three findings without asking a question.
