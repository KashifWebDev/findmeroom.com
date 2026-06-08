# FindMeRoom — Task Queue

> **Last updated:** 2026-06-08 (Stage 4C verified — ready to commit)  
> Read before every coding task. Reorder only with founder approval.

**Legend:** `[ ]` pending · `[~]` in progress · `[x]` done · `[!]` awaiting founder approval

---

## Now — Commit Stage 4C, then Stage 4D

**Branch:** `stage-4-account-lead-exchange`

| Step | # | Task | Owner | Notes |
|------|---|------|-------|-------|
| 4B | [x] | DB migration + model relations | Dev | Committed |
| 4C | [x] | **Owner response on public detail** | Dev | Verified (12 checks) — **ready to commit** |
| C4C | [!] | **Commit Stage 4C** | Founder/Dev | Awaiting commit |
| 4D | [ ] | Tenant account dashboard pages | Dev | After Stage 4C commit |
| 4E | [ ] | Guest manage token page (full) | Dev | Placeholder exists from 4B |
| 4F | [ ] | Report spam, mark found, admin moderation | Dev | |

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
| Stage 4D | Commit Stage 4C first |

---

## Completed

Stage 1 ✓ · Stage 2 ✓ · Stage 3 committed ✓ · Stage 4A ✓ · Stage 4B committed ✓ · Stage 4C verified ✓

See `current_state.md`.

---

## Workflow rules

**Before any task:** read sync docs + Stage 4 plan.

**After application code changes:** Cursor runs `migrate`, `cache:clear`, `route:clear`, `view:clear` when relevant; reports results in handoff.

**After coding:** update `current_state.md` and `cursor_log.md`.
