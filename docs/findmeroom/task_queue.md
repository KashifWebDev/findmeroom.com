# FindMeRoom — Task Queue

> **Last updated:** 2026-06-06 (Stage 5A — header/hero overlap dropped; docs sync)  
> Read before every coding task. Reorder only with founder approval.

**Legend:** `[ ]` pending · `[~]` in progress · `[x]` done · `[!]` awaiting founder approval

---

## Now — Stage 5A Homepage and Navigation Cleanup

**Branch:** `stage-5a`

| Step | # | Task | Owner | Notes |
|------|---|------|-------|-------|
| 5A-P | [x] | **Planning** | Dev | `.cursor/plans/stage_5a_homepage_navigation_cleanup.md` |
| 5A-A | [ ] | **Admin cleanup** (pages, menu, widgets, theme options) | Founder/Dev | Admin first — see plan §2 |
| 5A-C | [x] | **Header CTA code fix** | Dev | `header.blade.php` → List Your Room |
| 5A-H | [—] | **Header/hero overlap CSS fix** | — | **Dropped** — founder reverted; do not reopen unless asked |
| 5A-Q | [ ] | **Mobile QA** | Founder | Checklist in plan §9 — next after admin cleanup |

---

## Next — After Stage 5A

| Step | # | Task | Notes |
|------|---|------|-------|
| C4 | [ ] | Schedule `room-request:expire` cron | Optional |
| 5B | [ ] | Optional `[room-requests]` homepage shortcode | Only if founder wants preview grid |
| E | [ ] | Email notifications + WhatsApp + sitemap | Out of scope |
| G | [ ] | First 20 SEO pages | Out of scope |
| H | [ ] | First 10 blog posts | Out of scope |

---

## Blocked / waiting

_None._

---

## Completed

Stage 1 ✓ · Stage 2 ✓ · Stage 3 committed ✓ · Stage 4A–4F ✓ · **Stage 4 MVP complete** ✓ · Stage 5A planned ✓

See `current_state.md`.

---

## Workflow rules

**Before any task:** read sync docs + Stage 4 plan.

**After application code changes:** Cursor runs `migrate`, `cache:clear`, `route:clear`, `view:clear` when relevant; reports results in handoff.

**After coding:** update `current_state.md` and `cursor_log.md`.
