# FindMeRoom — Task Queue

> **Last updated:** 2026-06-08 (Stage 4B verified — ready to commit)  
> Read before every coding task. Reorder only with founder approval.

**Legend:** `[ ]` pending · `[~]` in progress · `[x]` done · `[!]` awaiting founder approval

---

## Now — Commit Stage 4B, then Stage 4C

**Branch:** `stage-4-account-lead-exchange`

| Step | # | Task | Owner | Notes |
|------|---|------|-------|-------|
| C3g | [x] | Commit Stage 3 | Founder/Dev | Done |
| 4A | [x] | Stage 4 plan — account lead exchange | Dev | `.cursor/plans/stage_4_account_lead_exchange.md` |
| 4B | [x] | **DB migration + model relations** | Dev | Verified (12 checks) — **ready to commit** |
| C4B | [!] | **Commit Stage 4B** | Founder/Dev | Awaiting commit |
| 4C | [ ] | Owner response on public detail | Dev | After Stage 4B commit |
| 4D | [ ] | Tenant account dashboard pages | Dev | Includes My Room Requests sidebar |
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
| Stage 4C | Commit Stage 4B first |

---

## Completed

Stage 1 ✓ · Stage 2A ✓ · Stage 2B ✓ · Stage 2C Phase 1 ✓ · Stage 3 committed ✓ · Stage 4A plan ✓ · Stage 4B verified ✓ · Branch `stage-4-account-lead-exchange` ✓

See `current_state.md`.

---

## Workflow rules

**Before any task:** read sync docs + Stage 4 plan.

**After application code changes:** Cursor runs by default when relevant:

```bash
php artisan migrate
php artisan cache:clear
php artisan route:clear
php artisan view:clear
```

Report results in handoff. Do not ask founder to run manually unless Cursor cannot or production safety applies.

**After coding:** update `current_state.md` and `cursor_log.md`.
