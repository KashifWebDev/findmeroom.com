# FindMeRoom — Task Queue

> **Last updated:** 2026-06-06 (Stage 4F verified — Stage 4 MVP complete)  
> Read before every coding task. Reorder only with founder approval.

**Legend:** `[ ]` pending · `[~]` in progress · `[x]` done · `[!]` awaiting founder approval

---

## Now — Commit Stage 4F

**Branch:** `stage-4-account-lead-exchange`

| Step | # | Task | Owner | Notes |
|------|---|------|-------|-------|
| 4F | [x] | **Report, mark found, admin moderation** | Dev | Verified ✓ (16 manual checks) |
| C4F | [!] | **Commit Stage 4F** | Founder/Dev | Ready — Stage 4 MVP complete |

---

## Next — After Stage 4 MVP

| Step | # | Task | Notes |
|------|---|------|-------|
| C4 | [ ] | Schedule `room-request:expire` cron | Optional |
| E | [ ] | Email notifications + WhatsApp + sitemap | |
| G | [ ] | First 20 SEO pages | |
| H | [ ] | First 10 blog posts | |

---

## Blocked / waiting

_None — Stage 4F verified; awaiting commit only._

---

## Completed

Stage 1 ✓ · Stage 2 ✓ · Stage 3 committed ✓ · Stage 4A ✓ · Stage 4B–4E committed ✓ · Stage 4F verified ✓ · **Stage 4 MVP lead exchange complete** ✓

See `current_state.md`.

---

## Workflow rules

**Before any task:** read sync docs + Stage 4 plan.

**After application code changes:** Cursor runs `migrate`, `cache:clear`, `route:clear`, `view:clear` when relevant; reports results in handoff.

**After coding:** update `current_state.md` and `cursor_log.md`.
