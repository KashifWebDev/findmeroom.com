# FindMeRoom — Task Queue

> **Last updated:** 2026-06-08 (Stage 4E verified — ready to commit)  
> Read before every coding task. Reorder only with founder approval.

**Legend:** `[ ]` pending · `[~]` in progress · `[x]` done · `[!]` awaiting founder approval

---

## Now — Commit Stage 4E, then Stage 4F

**Branch:** `stage-4-account-lead-exchange`

| Step | # | Task | Owner | Notes |
|------|---|------|-------|-------|
| 4D | [x] | Tenant account dashboard pages | Dev | Committed |
| 4E | [x] | **Guest manage token page (full)** | Dev | Verified (9 checks) — **ready to commit** |
| C4E | [!] | **Commit Stage 4E** | Founder/Dev | Awaiting commit |
| 4F | [ ] | Report spam, mark found, admin moderation | Dev | After Stage 4E commit — do not start yet |

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

| Item | Blocker |
|------|---------|
| Stage 4F | Commit Stage 4E first; await founder build instruction |

---

## Completed

Stage 1 ✓ · Stage 2 ✓ · Stage 3 committed ✓ · Stage 4A ✓ · Stage 4B committed ✓ · Stage 4C committed ✓ · Stage 4D committed ✓ · Stage 4E verified ✓

See `current_state.md`.

---

## Workflow rules

**Before any task:** read sync docs + Stage 4 plan.

**After application code changes:** Cursor runs `migrate`, `cache:clear`, `route:clear`, `view:clear` when relevant; reports results in handoff.

**After coding:** update `current_state.md` and `cursor_log.md`.
