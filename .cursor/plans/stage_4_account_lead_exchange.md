# Stage 4 — Account Lead Exchange (Planning)

> **Branch:** `stage-4-account-lead-exchange`  
> **Status:** Planning only — no code, migrations, routes, or views yet  
> **Prerequisite:** Stage 3 verified on `stage-3-room-request-board` (public form, board, detail, location, admin approval)

---

## Goal

Automated lead exchange between tenants who post room needs and owners who respond — **without admin manually connecting people**. Tenants track responses in the **existing Homzen account dashboard** (same layout/sidebar as `/account/dashboard`). Guests can post without signup and manage via a private token URL.

---

## 1. Existing Homzen account system map

### Account model

| Item | Value |
|------|--------|
| Class | `Botble\RealEstate\Models\Account` |
| Table | `re_accounts` |
| Guard | `account` |
| Auth config | Real Estate plugin (not Laravel default `users`) |

**File:** `platform/plugins/real-estate/src/Models/Account.php`

### Public account routes

**File:** `platform/plugins/real-estate/routes/fronts.php`

Guest routes (middleware `account.guest`):

| Method | Path | Route name | Controller |
|--------|------|------------|------------|
| GET | `{login-slug}` | `public.account.login` | `LoginController@showLoginForm` |
| POST | `login` | `public.account.login.post` | `LoginController@login` |
| GET | `{register-slug}` | `public.account.register` | `RegisterController@showRegistrationForm` |
| POST | `register` | `public.account.register.post` | `RegisterController@register` |

Authenticated routes (middleware stack below), prefix `account`, name prefix `public.account.`:

| Method | Path | Route name | Controller |
|--------|------|------------|------------|
| GET | `dashboard` | `public.account.dashboard` | `PublicAccountController@getDashboard` |
| GET | `settings` | `public.account.settings` | `PublicAccountController@getSettings` |
| GET | `properties` | `public.account.properties.index` | `AccountPropertyController@index` (resource) |
| GET | `consults` | `public.account.consults.index` | `ConsultController@index` |
| GET | `consults/{id}` | `public.account.consults.show` | `ConsultController@show` |
| GET | `reviews` | `public.account.reviews.index` | `AccountReviewController@index` |
| GET | `invoices` | `public.account.invoices.index` | `InvoiceController@index` |
| POST | `logout` | `public.account.logout` | `LoginController@logout` |

**Middleware group (account area):**

```php
['web', 'core', 'account', EnsureAccountIsApproved::class, 'account.not_blocked', LocaleMiddleware::class]
```

**Middleware aliases** (registered in `RealEstateServiceProvider`):

| Alias | Class |
|-------|--------|
| `account` | `RedirectIfNotAccount` |
| `account.guest` | `RedirectIfAccount` |
| `account.not_blocked` | `EnsureAccountIsNotBlocked` |
| + | `EnsureAccountIsApproved` |

**Files:**

- `platform/plugins/real-estate/src/Http/Middleware/RedirectIfNotAccount.php`
- `platform/plugins/real-estate/src/Http/Middleware/RedirectIfAccount.php`
- `platform/plugins/real-estate/src/Http/Middleware/EnsureAccountIsNotBlocked.php`
- `platform/plugins/real-estate/src/Http/Middleware/EnsureAccountIsApproved.php`

### Dashboard controller

**File:** `platform/plugins/real-estate/src/Http/Controllers/Fronts/PublicAccountController.php`

- `getDashboard()` → view `plugins/real-estate::themes.dashboard.index`
- Sets `Theme::addBodyAttributes(['id' => 'page-account-dashboard'])`
- `getViewFileName()` checks Homzen theme override: `Theme::getThemeNamespace('views.real-estate.{view}')` then falls back to plugin view

### Layout & sidebar (reuse these — do not redesign)

| Purpose | Blade path |
|---------|------------|
| Master layout | `plugins/real-estate::themes.dashboard.layouts.master` |
| Body + sidebar shell | `plugins/real-estate::themes.dashboard.layouts.body` |
| Left nav menu | `plugins/real-estate::themes.dashboard.layouts.menu` |
| Sidebar top (avatar, credits) | `plugins/real-estate::themes.dashboard.layouts.sidebar-top` |
| Dashboard home | `plugins/real-estate::themes.dashboard.index` |
| Account table wrapper | `plugins/real-estate::account.table.base` |
| Detail card example | `plugins/real-estate::account.consults.show` |

**Homzen theme:** No `platform/themes/homzen/views/real-estate/dashboard/*` overrides found — account UI comes from Real Estate plugin views + `vendor/core/plugins/real-estate/css/dashboard/style.css`.

**Sidebar structure:**

- `.ps-main` → `.ps-main__sidebar` → `.ps-sidebar` → `.menu` (ul/li/a with Tabler icons)
- Content: `.ps-main__wrapper` → `#app` → `@yield('content')`

### Account menu registration (integration point)

**File:** `platform/plugins/real-estate/src/Providers/RealEstateServiceProvider.php` (~line 436)

```php
DashboardMenu::for('account')->beforeRetrieving(function (DashboardMenuSupport $dashboardMenu): void {
    $dashboardMenu->registerItem([...]); // dashboard, properties, consults, reviews, invoices, settings
});
```

**Rendered in:** `menu.blade.php` via `DashboardMenu::getAll('account')`

**Extension hooks (no real-estate source edit required):**

- `real_estate_account_dashboard_sidebar_menu_before`
- `real_estate_account_dashboard_sidebar_menu_after`
- `DashboardMenu::for('account')->beforeRetrieving()` from **findmeroom-room-request** `RoomRequestServiceProvider`

### Account page patterns to copy

**List (table):** `ConsultTable` → `plugins/real-estate::account.table.base`  
**File:** `platform/plugins/real-estate/src/Tables/Fronts/ConsultTable.php`

- Extends master via table base layout
- Scopes query: `->whereAccount(auth('account')->user())`
- View action → detail route

**Detail:** `@extends('plugins/real-estate::themes.dashboard.layouts.master')` + `<x-core::card>`

**Properties list:** `AccountPropertyController@index` → `AccountPropertyTable` → same table base

### CSS / styling (reuse as-is)

Loaded in dashboard header:

- `vendor/core/plugins/real-estate/css/dashboard/style.css`
- Optional RTL: `style-rtl.css`

Common classes on account pages:

- Layout: `ps-main`, `ps-sidebar`, `menu`, `header--mobile`, `ps-drawer--mobile`
- Content: `card`, `card-header`, `card-body`, `card-title`, `card-footer`
- Widgets: `row row-cards`, `dashboard-widget-item`
- Lists: `list-group`, `list-group-item`, `list-group-flush`
- Empty states: `empty`, `empty-icon`, `empty-title`, `empty-subtitle`
- Bootstrap utilities: `mb-3`, `d-flex`, `fs-1`, `fw-medium`

### Existing Room Request plugin (Stage 3 — merge from `stage-3-room-request-board`)

**Plugin:** `platform/plugins/findmeroom-room-request/` (`findMeRoom/room-request`)

Public routes (pattern):

- GET/POST `/post-room-need`
- GET `/room-requests` (board)
- GET `/room-requests/{slug}` (detail by `share_slug`)

Admin: `/admin/room-requests` (approve/reject/spam)

**Models:** `RoomRequest`, `RoomRequestResponse` (responses table exists; owner flow not built)

**Enums:** `RoomRequestStatusEnum`, `RoomRequestResponseStatusEnum`

---

## 2. Recommended integration approach

### Sidebar: “My Room Requests”

**Do not edit** `RealEstateServiceProvider.php`.

**Do** register in `FindMeRoom\RoomRequest\Providers\RoomRequestServiceProvider::boot()`:

```php
use Botble\Base\Facades\DashboardMenu;
use Botble\Base\Supports\DashboardMenu as DashboardMenuSupport;

DashboardMenu::for('account')->beforeRetrieving(function (DashboardMenuSupport $menu): void {
    $menu->registerItem([
        'id' => 'cms-account-room-requests',
        'priority' => 2.5, // after Properties (2), before packages/consults (3)
        'name' => 'plugins/findmeroom-room-request::room-request.account.menu',
        'url' => fn () => route('public.account.room-requests.index'),
        'icon' => 'ti ti-home-search',
    ]);
});
```

Menu item uses same `menu.blade.php` loop → identical icon + label styling as “Properties” / “Consults”.

**Optional:** Show menu only when user has ≥1 linked request (filter in `beforeRetrieving` or hide empty state on index). **Founder decision:** always show vs. show when relevant.

### Account controllers & views (plugin-only)

New in `findmeroom-room-request`:

- `AccountRoomRequestController` — index + show
- `AccountRoomRequestTable` — list scoped to `account_id`
- Views under `resources/views/account/` extending **`plugins/real-estate::themes.dashboard.layouts.master`**

Mirror `ConsultController` + `ConsultTable` + `account/consults/show.blade.php` — **not** Homzen public theme layout.

### Why no real-estate source edits

All account chrome lives in real-estate views but is consumed via `@extends` and `DashboardMenu::for('account')` from our plugin. No fork required.

---

## 3. Tenant request ownership model

### `room_requests` additions (planned migration)

| Column | Type | Purpose |
|--------|------|---------|
| `account_id` | nullable FK → `re_accounts.id` | Logged-in tenant ownership |
| `manage_token` | nullable, unique, 64 chars | Guest private manage URL |

**Existing fields used:** `email` (required for guest linking), `phone`, `name`, `status`, `share_slug`, etc.

### Ownership rules

1. **Logged-in submit:** set `account_id = auth('account')->id()` on create; still store `email` from form/account.
2. **Guest submit:** `account_id = null`; generate `manage_token` (e.g. `Str::random(64)` or UUID); show token URL once on success page (and optional email later).
3. **Later account link by email:** on login/register success, run `RoomRequestOwnershipService::attachByEmail(Account $account)`:
   - `UPDATE room_requests SET account_id = ? WHERE account_id IS NULL AND LOWER(email) = LOWER(?)`
   - Do not overwrite requests already owned by another account
   - Idempotent for same account
4. **Authorization:**
   - Account dashboard: `account_id` matches current user AND user owns request
   - Guest manage: valid `manage_token` only (no auth)
   - Never expose `manage_token` on public board/detail

### Relations (model)

```php
// RoomRequest
public function account(): BelongsTo // Account::class
public function responses(): HasMany // visible to tenant only via scope
```

```php
// Account (optional inverse in plugin via macro or document only)
public function roomRequests(): HasMany
```

Do **not** modify `Account.php` unless unavoidable — query from `RoomRequest::where('account_id', ...)`.

---

## 4. Signup strategy

**No forced signup** before posting (unchanged).

### After successful guest submit (`success.blade.php` enhancement)

Show three paths (Homzen public theme styling, not dashboard):

1. **Create account to track responses** → `route('public.account.register')` with email prefilled query param if safe
2. **Login if already registered** → `route('public.account.login')`
3. **Private manage link** → `/my-room-request/{manage_token}` with copy-to-clipboard + “save this link” warning

**Logged-in submit:** success page notes responses will appear under **My Room Requests** in dashboard.

**No auto-redirect to register.**

---

## 5. Owner response flow

### Public detail page (`/room-requests/{slug}`)

Add section (approved + public + not expired/found only):

- Heading: “I have a matching room”
- Form fields:
  - `owner_name` (required)
  - `owner_phone` (required)
  - `owner_email` (optional)
  - `location` (area/city text, required)
  - `rent` (required, numeric)
  - `room_type` (single/shared/any — align with request enums)
  - `message` (required, max length)

**Owner must NOT see:** tenant phone, tenant email, full tenant name (only `public_name` on public page as today).

**Optional:** If owner is logged in as `account`, prefill name/phone/email from account; store `responder_account_id` nullable for audit (planned column).

### Submission

- POST `public.room-request.respond` → validate → create `room_request_responses` row
- Status: `pending` or `visible` per founder decision (see §17)
- Simple auto-validation: required fields, phone format, honeypot, throttle (e.g. 5/hour/IP/request)
- No admin approval required for tenant to see response (automated exchange)

---

## 6. Automated lead exchange

```
Owner submits on public detail
        ↓
Validation + throttle + honeypot
        ↓
room_request_responses row created (status: visible or pending→visible)
        ↓
Tenant sees in:
  • GET /account/room-requests/{id}  (if account_id linked)
  • GET /my-room-request/{token}     (if guest)
        ↓
Tenant sees owner_phone, owner_name, location, rent, message
        ↓
Admin can mark spam/rejected later (hidden from tenant)
```

**Admin is not in the loop** for normal leads. Admin queue = moderation/exceptions only.

---

## 7. Tenant dashboard pages

All extend `plugins/real-estate::themes.dashboard.layouts.master`.

| Page | Route | Content |
|------|-------|---------|
| List | `GET /account/room-requests` | Table: public name, city, status, response count, date |
| Detail | `GET /account/room-requests/{id}` | Request summary + list of responses (owner contact visible) |

**Actions on detail:**

- **Mark as found** → set request status `found`, `found_at` (disable new owner responses)
- **Report response** → flag response, optional reason; hide from tenant pending admin (or immediately — founder decision)

**Response card UI:** reuse `x-core::card`, `list-group`, same as consult detail / dashboard activity log rows.

**Scope:** Only requests where `room_requests.account_id = auth('account')->id()`.

---

## 8. Guest manage page

| Item | Plan |
|------|------|
| URL | `GET /my-room-request/{manage_token}` |
| Route name | `public.room-request.manage` |
| Auth | None — token is secret |
| Layout | **Public Homzen theme** (`Theme::scope` like board/show) — not account dashboard |
| Content | Same information as account detail (request + responses + owner phone) |
| Security | 404 on bad token; `noindex` meta; rate limit; never link from public board |

Token: cryptographically random, unique index, never derived from slug/email.

---

## 9. Admin side

Extend existing admin room-request area (plugin only):

| Feature | Location |
|---------|----------|
| All responses list | New admin table or tab on request detail |
| Response detail | View owner fields + linked request |
| Mark spam / rejected | Update `room_request_responses.status` |
| View reports | Filter `reported_at IS NOT NULL` |

**No manual “connect tenant to owner” UI.**

---

## 10. Privacy rules

| Data | Public board/detail | Owner response form | Tenant dashboard / guest manage |
|------|---------------------|---------------------|--------------------------------|
| Tenant phone | Hidden unless `allow_public_phone` | Hidden | Full (tenant’s own) |
| Tenant email | Hidden | Hidden | Shown to tenant only |
| Tenant real name | Hidden (use `public_name`) | Hidden | Shown to tenant |
| Owner phone | N/A | N/A (they enter it) | **Visible to tenant** |
| Owner email | N/A | N/A | Visible to tenant |
| Responses | Not listed | N/A | Private |
| manage_token | Never public | Never | URL only |

Responses are **never** public on `/room-requests/{slug}`.

---

## 11. Database changes needed (plan only — do not run yet)

### Migration A: `room_requests` — ownership

- `account_id` unsignedBigInteger nullable, FK `re_accounts.id`, nullOnDelete
- `manage_token` string(64) nullable unique
- Index: `(account_id)`, `(email)` for linking

### Migration B: `room_request_responses` — extend existing table

Stage 3 created stub table; extend with:

| Column | Notes |
|--------|--------|
| `owner_name` | string |
| `owner_phone` | string |
| `owner_email` | nullable |
| `location` | string |
| `rent` | unsignedInteger |
| `room_type` | string nullable |
| `message` | text |
| `status` | enum/string: pending, visible, spam, rejected |
| `responder_account_id` | nullable FK re_accounts |
| `reported_at` | nullable timestamp |
| `report_reason` | nullable string |
| `ip_address` | nullable (spam audit) |

Confirm existing columns (`room_request_id`, timestamps) from Stage 3 migration before implementing.

### No changes to `re_accounts` table required.

---

## 12. Routes plan

### Public (Theme::registerRoutes in plugin — same as Stage 3)

| Method | Path | Name | Middleware |
|--------|------|------|------------|
| POST | `room-requests/{slug}/respond` | `public.room-request.respond` | web, throttle |
| GET | `my-room-request/{token}` | `public.room-request.manage` | web, throttle |

Use `{slug}` = `share_slug` (consistent with show route).

### Account (match real-estate middleware group)

Register in plugin `routes/web.php` or dedicated `routes/account.php`:

| Method | Path | Name |
|--------|------|------|
| GET | `account/room-requests` | `public.account.room-requests.index` |
| GET | `account/room-requests/{id}` | `public.account.room-requests.show` |
| POST | `account/room-requests/{id}/found` | `public.account.room-requests.found` |
| POST | `account/room-requests/{id}/responses/{response}/report` | `public.account.room-requests.responses.report` |

Middleware: `['web', 'core', 'account', EnsureAccountIsApproved::class, 'account.not_blocked']`

Import middleware classes from Real Estate namespace — **reference only**, no edits to real-estate.

### Admin (existing admin group in plugin)

| Method | Path | Name |
|--------|------|------|
| GET | `admin/room-request-responses` | `room-request-responses.index` |
| GET | `admin/room-request-responses/{id}` | `room-request-responses.show` |
| POST | `admin/room-request-responses/{id}/spam` | `room-request-responses.spam` |
| POST | `admin/room-request-responses/{id}/reject` | `room-request-responses.reject` |

---

## 13. Styling plan

| Area | Layout / CSS source |
|------|---------------------|
| Account list/detail | `@extends('plugins/real-estate::themes.dashboard.layouts.master')` |
| Account table | `plugins/real-estate::account.table.base` |
| Cards / detail rows | `<x-core::card>`, `list-group`, `list-group-item` |
| Sidebar | Automatic via `DashboardMenu` — no custom nav HTML |
| Dashboard CSS | `vendor/core/plugins/real-estate/css/dashboard/style.css` (already loaded by master) |
| Guest manage + owner form on public detail | Homzen public theme sections (`flat-section`, `form-contact`, `tf-btn`) — match `/post-room-need` and board cards |
| Select2 (if needed on public only) | Existing plugin `LocationFormHelper` pattern — not on account pages |

**No new dashboard theme.** No custom sidebar CSS file.

---

## 14. Build phases

### Phase 4A — Planning and account template map ✓ (this document)

### Phase 4B — Database migration and model relations

- Migrations A + B
- Model relations, scopes (`visibleToTenant()`), ownership service
- Email attach on login/register (event listener in plugin)

### Phase 4C — Owner response form on public request detail

- POST respond route + validation + throttle
- UI on `front/show.blade.php`
- Hide tenant private fields from owner

### Phase 4D — Tenant account dashboard pages

- `DashboardMenu` item
- `AccountRoomRequestController`, table, index/show views
- Authorization policies

### Phase 4E — Guest manage token page

- Token generation on guest create
- Success page CTAs + manage URL
- `GET /my-room-request/{token}` view

### Phase 4F — Report spam, mark found, admin response moderation

- Tenant actions (found, report)
- Admin response list/spam/reject
- Hide spam/rejected from tenant views

---

## 15. Testing checklist

- [ ] Guest post request → receive manage link on success
- [ ] Logged-in post request → `account_id` set
- [ ] Register/login with same email → guest requests attach to account
- [ ] Account sidebar shows “My Room Requests”
- [ ] List shows only current user’s requests
- [ ] Detail shows request + responses
- [ ] Owner submits response on public detail
- [ ] Response appears on tenant dashboard without admin action
- [ ] Tenant phone hidden from owner on public pages
- [ ] Owner phone visible to tenant on dashboard
- [ ] Guest manage link works without login
- [ ] Invalid manage token → 404
- [ ] Mark found → no new responses (or rejected with message)
- [ ] Report response → admin can see; tenant view updated per rules
- [ ] Admin spam → hidden from tenant
- [ ] `/account/dashboard` unchanged
- [ ] `/account/properties` unchanged
- [ ] Mobile account sidebar (drawer) shows new menu item

---

## 16. Risks

| Risk | Mitigation |
|------|------------|
| Dashboard template mismatch | Copy Consult/Property account views exactly; extend same master layout |
| Breaking owner property dashboard | No edits to `AccountPropertyController` or property routes |
| Forcing signup too early | Keep guest post; CTAs optional on success only |
| Token leakage | Long random token, noindex, not in sitemap, show once prominently |
| Spam owner responses | Throttle + honeypot + report + admin spam; optional captcha later |
| Overbuilding admin moderation | Default automated visibility; admin exception-only |
| Email notification dependency | Defer email to Phase 5; in-app/token sufficient for MVP |
| Email collision on attach | Only attach `account_id IS NULL`; log conflicts |
| Branch missing Stage 3 plugin | Merge `stage-3-room-request-board` before Phase 4B code |

---

## 17. Founder decisions needed (before code)

1. **Response visibility:** Auto-visible to tenant immediately, or brief `pending` until automated checks pass?
2. **Owner account:** Must owners be logged in to respond, or allow anonymous owners (recommended: allow anonymous + optional account prefill)?
3. **Sidebar menu:** Always show “My Room Requests” for all accounts, or only when user has requests?
4. **Mark found:** Block new owner responses immediately? Hide request from public board?
5. **Report response:** Hide from tenant immediately on report, or wait for admin?
6. **Email notifications:** MVP without email, or require notify tenant on new response?
7. **Rate limits:** Max responses per request per IP/day? Max reports per tenant?
8. **Guest manage token:** Show only on success page, or also allow “resend link” via email (future)?
9. **Merge Stage 3 branch:** Confirm `stage-3-room-request-board` merged into `stage-4-account-lead-exchange` before implementation starts.

---

## References

- Account routes: `platform/plugins/real-estate/routes/fronts.php`
- Account menu: `RealEstateServiceProvider` + `themes/dashboard/layouts/menu.blade.php`
- Consult pattern: `ConsultController`, `Fronts/ConsultTable`, `account/consults/show.blade.php`
- Stage 2 plugin plan: `.cursor/plans/stage_2_room_request_plugin.md`
- Project rules: `.cursor/rules/findmeroom.mdc`
