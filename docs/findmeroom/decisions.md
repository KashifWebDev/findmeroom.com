# FindMeRoom — Founder Decisions

> **Last updated:** 2026-06-08 (Stage 4B verified — ready to commit)

---

## Stage 4 — Account lead exchange (locked)

| # | Decision |
|---|----------|
| 1 | Guest posting stays allowed |
| 2 | Logged-in tenant requests attach to `account_id` |
| 3 | Guest requests get `manage_token` |
| 4 | Owner responses visible to tenant immediately after validation |
| 5 | Owners do not need to login to respond |
| 6 | Account sidebar always shows **My Room Requests** (menu in Stage 4D) |
| 7 | Mark found hides request from public board and blocks new owner responses |
| 8 | Report response hides that response from tenant view immediately and marks for admin review |
| 9 | No email notifications in MVP |
| 10 | Guest manage token shown on success page only (for now) |
| 11 | Admin should not manually connect tenants and owners |

---

## Stage 4B — Implementation notes

| Topic | Decision |
|-------|----------|
| Owner location on responses | Use existing `area_text` column; no separate `location` column |
| Response status default | Keep existing `pending` default; add `visible` and `reported` enum values for later phases |
| Old requests | No backfill of `manage_token`; existing approved requests remain on public board |
| Account attach | `attachByEmail` runs on `Login` (account guard) and `Registered` (Account model) via plugin listener |
| Guest manage URL | `GET /my-room-request/{token}` (`public.room-request.manage`) — placeholder from 4B; full responses page in 4E |

---

## Cursor workflow (permanent)

After every application code change, Cursor runs by default when relevant:

```bash
php artisan migrate
php artisan cache:clear
php artisan route:clear
php artisan view:clear
```

Cursor reports command results in the handoff. Do not ask the founder to run these manually unless Cursor cannot run them or there is a production safety concern.
