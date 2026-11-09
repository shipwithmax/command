# inbox/

**Everything lands here first.** When you're not sure where something goes, it goes here.

The inbox is your capture zone — the "just get it out of my head and into the folder" pile. You drop things in; your AI helps you process them into the right place (usually a `wiki/` page) later.

## What goes here

- Meeting transcripts and voice notes
- PDFs, articles, research, web clips
- Screenshots and images
- CSVs, data exports, datasets
- Half-formed thoughts you'll sort out later

Optional subfolders if you want them (don't bother until you do):

- `articles/` — PDFs, web clips, research docs
- `meeting-logs/` — transcripts, voice notes (`YYYY-MM-DD-topic.md`)
- `uploads/` — files dropped here for AI context
- `screenshots/` — your screenshot tool's destination
- `data/` — CSVs, JSON, datasets

## How to process the inbox

Tell your AI: **"Process my inbox."** The `process-inbox` skill reads what's new, shows you where each capture should go, and after your OK updates or creates the right `wiki/` pages, turns action items into missions, and logs what it did. Then the original can stay here as a record or move to `archive/`.

A few habits that keep it clean:

- **Meetings need consent.** Only record or transcribe when everyone knows. If part of it was off the record, leave that part out.
- **A transcript is not a to-do list.** Commitments in it become missions with an owner and a date.
- **Let files finish.** A recording or sync that's still running shouldn't be processed yet.

## Naming convention

Date-prefix anything with a date: `2026-05-01-call-with-sam.md`. Your AI uses filename dates when it stitches a timeline together.

## One rule: don't rewrite source material in place

A transcript or a PDF is a record of what was actually said or written. If you need to revise or summarize it, do that in a `wiki/` page that *cites* the inbox item — leave the original untouched. That way your AI's references stay trustworthy over time.
