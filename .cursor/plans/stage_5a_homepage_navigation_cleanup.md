# Stage 5A — Homepage and Navigation Cleanup (Planning)

> **Branch:** `stage-5a`  
> **Status:** Planning only — no code, theme, plugin, or database changes yet  
> **Prerequisite:** Stage 4 MVP lead exchange complete (4F committed)

---

## Rule of engagement

**Admin first.** Use code only when Admin Dashboard, CMS shortcodes, theme options, menus, or widgets cannot control the outcome.

Do **not** build in this stage: SEO pages, email, WhatsApp share, sitemap, payments/tokens, Botble core edits, vendor edits, real-estate plugin source edits.

---

## Inspection summary (2026-06-06)

| Area | Finding |
|------|---------|
| **Active homepage** | Set via **Admin → Appearance → Theme Options → Page → Homepage**. Seed DB has five demo pages (`Homepage 1`–`5`, IDs 1–5). Confirm which is selected in live admin; founder screenshot matches **Homepage 2** pattern (`property-categories`, “Featured Properties”, “Why Choose Us”). |
| **Homepage template** | CMS page, **Full width** template, content = stacked shortcodes (not `views/index.blade.php` fallback). |
| **Main menu** | **Admin → Appearance → Menus → Main menu** → location `main-menu`. Seed: Home submenu with Homepage 1–5, Projects, Properties, Pages mega-menu, Blog. |
| **Header CTA** | **Hardcoded theme Blade** — not menu-controlled. |
| **Footer** | **Admin → Appearance → Widgets** — `top_footer_sidebar`, `inner_footer_sidebar`, `bottom_footer_sidebar`. |
| **Room request homepage block** | **No shortcode exists** in `findmeroom-room-request` plugin. Latest requests preview needs admin workaround or future code. |

**Reference files (read-only audit):**

- Homepage seed content: `database.sql` → `pages` id 1–5
- Header CTA: `platform/themes/homzen/partials/header.blade.php` lines 27–31, 54–65
- Hero + search: `platform/themes/homzen/functions/shortcodes.php` (`hero-banner`), `views/real-estate/partials/search-box.blade.php`
- Property categories: `platform/themes/homzen/functions/shortcodes-real-estate.php` (`property-categories`)
- Footer shell: `platform/themes/homzen/partials/footer.blade.php` (widget areas only)

---

## 1. Current homepage audit

Assumes active page is a Homzen demo homepage (likely **Homepage 2**). Classify each visible section:

| # | Visible section | Source | Classification | Notes |
|---|-----------------|--------|----------------|-------|
| 1 | Site logo | Theme option + Site Logo widget | **Keep** | Replace logo image in theme options / widget |
| 2 | Main navigation | Menu `main-menu` | **Rewrite from admin** | Replace demo links with FindMeRoom structure (§3) |
| 3 | Header red CTA “Submit Property” | Theme Blade + translation | **Needs code** | Not admin-configurable (§4) |
| 4 | Hero banner (“Find Your… Dream Home”) | `[hero-banner]` shortcode | **Rewrite from admin** | Title, description, animation text, background, CTAs |
| 5 | Hero property search (Project/Rent/Sale tabs) | `[hero-banner search_box_enabled="1"]` | **Rewrite or remove from admin** | Disable search box OR set tabs to rent-only; cannot rename “Property Type” without removing `[property-categories]` |
| 6 | Property Type / Try Searching For (Apartment, Villa…) | `[property-categories]` shortcode | **Remove from admin** | Demo categories from `re_categories` seed |
| 7 | Featured Properties / Homzen dream home copy | `[properties]` shortcode | **Replace from admin** | Retitle to “Available Rooms”; update subtitle/button |
| 8 | What We Do? / Buy·Rent·Sell A Home | `[services]` shortcode (style 1 or 3) | **Remove or replace from admin** | Replace with “How FindMeRoom works” (§5) |
| 9 | Why Choose Us / real estate expertise | `[services]` shortcode style 3 | **Remove from admin** | Not relevant to room-request loop |
| 10 | Best Property Value | `[properties is_featured="1"]` | **Remove from admin** | Duplicate of featured block |
| 11 | Testimonials | `[testimonials]` | **Remove from admin** | Demo testimonials |
| 12 | Meet Our Agents | `[agents]` | **Remove from admin** | Not MVP positioning |
| 13 | Mortgage Calculator | `[mortgage-calculator]` shortcode | **Remove from admin** | Irrelevant for room rentals MVP |
| 14 | Helpful Homzen Guides | `[blog-posts]` | **Remove or replace from admin** | Optional: keep as “Blog” with neutral title |
| 15 | Partner logo slider (GitHub, etc.) | `[image-slider]` | **Remove from admin** | Demo partners |
| 16 | Footer logo + Homzen/about text | Site Logo + Site Information widgets | **Rewrite from admin** | FindMeRoom copy, PK contact |
| 17 | Footer link columns | Core Simple Menu widgets | **Rewrite from admin** | Room-focused links |
| 18 | Footer copyright “Homzen” | Theme option **Copyright** + Site Copyright widget | **Rewrite from admin** | Appearance → Theme Options → General |
| 19 | Newsletter widget | Newsletter widget | **Keep or remove from admin** | Optional for MVP |

**Gap — not on demo homepage but required for FindMeRoom story:**

| Section | Classification |
|---------|----------------|
| Latest Room Requests preview | **Needs code** (no shortcode) OR admin **call-to-action** link only |
| Safety and Trust | **Replace from admin** via `[services]` or `[call-to-action]` |
| Final CTA (Post Room Need) | **Replace from admin** via `[call-to-action]` or hero buttons |

---

## 2. Admin-first task list

Execute in this order. Verify active homepage under **Appearance → Theme Options → Page** first.

### Admin → Appearance → Theme Options

**Admin path:** Admin → Appearance → Theme Options

| What to change | Recommended value | Why |
|----------------|-------------------|-----|
| **Page → Homepage** | Edit/create page **“Home”** (see §5); select it here | Controls which CMS page renders at `/` |
| **Logo → Logo light** | Upload FindMeRoom logo | Removes Homzen branding in header/footer logo widget |
| **General → Copyright** | `© :year FindMeRoom. All rights reserved.` | Replaces Homzen footer text (supports `:year`) |
| **General → Site title / SEO** (if present) | FindMeRoom — Find a room that actually exists | Consistent branding |
| **Styles → Primary color** | Keep brand red or adjust | Optional polish |
| **Real Estate → Property listing layout** | `without-map` or `sidebar` | Simpler room browse UX (optional) |

---

### Admin → Pages

**Admin path:** Admin → Pages → (active homepage, e.g. “Homepage 2” or new “Home”)

| What to change | Recommended value | Why |
|----------------|-------------------|-----|
| Rename page | **Home** | Clear admin label |
| Template | **Full width** | Required for shortcode homepage |
| **Replace entire shortcode stack** | Order in §5 | Removes demo sections in one edit |
| **Hero `[hero-banner]`** | See §6 copy; `search_box_enabled="0"` OR rent-only tabs; add `button_label="Post Room Need" button_url="/post-room-need"` and second link via `[call-to-action]` below hero | FindMeRoom headline; disable misleading project/sale search |
| **Remove blocks** | Delete `[property-categories]`, duplicate `[properties]`, `[testimonials]`, `[agents]`, `[mortgage-calculator]`, `[image-slider]`, Buy/Rent/Sell `[services]`, Why Choose Us `[services]` | Demo removal |
| **How it works** | `[services style="1" services_quantity="3"]` with Post need / Owners respond / You choose | Explains loop without code |
| **Available rooms** | `[properties style="2" title="Available Rooms" subtitle="Rooms for rent" type="rent" limit="6" button_label="Browse all rooms" button_url="/properties"]` | Reuses existing listings shortcode |
| **Popular areas** | `[location title="Popular Areas" subtitle="Browse by city" type="city" destination="property" city_ids="…"]` | Reuse location shortcode; pick PK cities from Admin → Locations |
| **Safety** | `[services]` or `[call-to-action]` with §6 safety copy | Trust message |
| **Final CTA** | `[call-to-action title="…" button_label="Post Room Need" button_url="/post-room-need"]` | Strongest conversion |
| **Blog (optional)** | `[blog-posts title="From the blog" limit="3"]` or remove | Low priority |
| Create **Safety Guide** page | Slug `/safety-guide`; simple content page | Menu link target |

**Shortcode editing:** Admin → Pages → Edit → use visual shortcode editor (pencil on each block) or Code editor tab.

---

### Admin → Appearance → Menus

**Admin path:** Admin → Appearance → Menus → Main menu → assign to **Main menu** location

| What to change | Recommended value | Why |
|----------------|-------------------|-----|
| Remove | Homepage 1–5 submenu, Projects, Agents, Pricing, Careers, Wishlist under Pages | Demo clutter |
| **Home** | `/` | Standard |
| **Find a Room** | `/properties` | Owner listings |
| **Room Requests** | `/room-requests` | Owners browse tenant demand |
| **Post Room Need** | `/post-room-need` | Primary tenant action — consider **CSS class** or menu position last for emphasis |
| **Safety Guide** | `/safety-guide` | Trust |
| **Blog** | `/blog` | Content |
| Optional footer-only | Contact, Privacy, Cookie policy | Keep in footer widgets not header |

**Note:** Header red button is **not** this menu — see §4.

---

### Admin → Appearance → Widgets

**Admin path:** Admin → Appearance → Widgets

| Sidebar | What to change | Recommended value | Why |
|---------|----------------|-------------------|-----|
| **Top footer** | Site Logo widget | FindMeRoom logo | Branding |
| **Top footer** | Social Links | FindMeRoom social URLs or remove | Remove demo links |
| **Inner footer** | Site Information | “FindMeRoom helps tenants post room needs and connect with owners safely.” + PK phone/email | Replace US demo address |
| **Inner footer** | Simple Menu “Categories” | Rename **For tenants** → Post Room Need, Room Requests, Safety Guide | Useful links |
| **Inner footer** | Simple Menu “Our Company” | **For owners** → Find a Room, List your room (`/account/properties` or login) | Owner paths |
| **Inner footer** | Newsletter | Remove or update subtitle | Optional |
| **Bottom footer** | Site Copyright | Uses theme copyright option | Homzen text fix |
| **Bottom footer** | Simple Menu | Privacy Policy, Cookie Policy, Contact | Legal |
| **Property detail sidebar** | Mortgage Calculator widget | **Remove** | Not MVP |

---

### Admin → Real Estate → Settings

**Admin path:** Admin → Real Estate → Settings

| What to change | Recommended value | Why |
|----------------|-------------------|-----|
| **Enabled property types** | Rent only (disable sale if unused) | Hero/search tabs align with “rooms for rent” |
| **Projects** | Disable if unused | Removes “Project” search tab |
| **Categories** | Admin → Real Estate → Categories — rename or hide unused (Apartment→Room, etc.) OR leave and remove `[property-categories]` from homepage | Categories still used on `/properties` filters |
| **Accounts / login** | Keep enabled | Owner list-your-room flow |

---

### Admin → Locations

**Admin path:** Admin → Locations → Countries / States / Cities

| What to change | Recommended value | Why |
|----------------|-------------------|-----|
| Ensure PK cities exist | Islamabad, Lahore, Karachi, etc. | `[location]` shortcode and room request forms |
| Remove or unpublish unused demo US cities from homepage `[location]` city_ids | PK-only on homepage | “Popular Areas” relevance |

---

### Admin → Blog (optional)

**Admin path:** Admin → Blog → Posts / Categories

| What to change | Recommended value | Why |
|----------------|-------------------|-----|
| Categories | Rename from “Buying a Home” etc. to room-rental topics | If blog section kept on homepage |
| Posts | Draft or delete Homzen demo posts | Avoid “dream home” SEO noise |

---

## 3. Recommended main menu

```
Home              → /
Find a Room       → /properties
Room Requests     → /room-requests
Post Room Need    → /post-room-need    ← strongest CTA (last item or styled)
Safety Guide      → /safety-guide
Blog              → /blog
```

**Implementation:** Admin → Appearance → Menus only.

**Room Requests** must stay visible — owners need to browse tenant demand before responding.

**Post Room Need** should remain the strongest CTA in menu label positioning; the header button requires separate code fix (§4).

Remove from header menu: Projects, Agents, Pricing, demo Homepage variants, Wishlist (can stay account-only).

---

## 4. Header CTA audit

### Where “Submit Property” comes from

| Layer | Location | Configurable? |
|-------|----------|---------------|
| **Theme Blade (desktop)** | `platform/themes/homzen/partials/header.blade.php` ~line 29 | **No** — hardcoded |
| **Theme Blade (mobile)** | Same file ~lines 54–65 | **No** — hardcoded |
| **URL** | `route('public.account.properties.index')` | **No** |
| **Label** | `__('Submit Property')` → `platform/themes/homzen/lang/en.json` | Translation override only; still wrong URL |
| **Admin menu** | Not used for this button | — |
| **Theme option** | No setting for header CTA | — |

**Classification:** **Theme Blade + language string** — **cannot be fixed from admin alone.**

### Recommended CTA

| Button | URL | Priority |
|--------|-----|----------|
| **Post Room Need** (primary) | `/post-room-need` | Main tenant action |
| List Your Room (secondary, optional) | `/account/properties/create` or `/account/login` | Owner listing |

### Minimal code change (Stage 5A-B — do not implement in planning)

| File | Change |
|------|--------|
| `platform/themes/homzen/partials/header.blade.php` | Replace link + label: Post Room Need → `/post-room-need`; optional second btn for owners |
| `platform/themes/homzen/lang/en.json` | Add/update strings if using `__()` keys |

**Risk:** Theme file edit (Homzen). Acceptable per project rules when admin cannot control it. Keep diff minimal (~4 lines desktop + mobile block).

**Admin workaround until code:** None for header button — menu cannot override it.

---

## 5. Recommended homepage structure

| Order | Section | Admin or code? | Reuse shortcode | Title | Subtitle | CTA |
|-------|---------|----------------|-----------------|-------|----------|-----|
| 1 | **Hero** | Admin | `[hero-banner style="1"]` | Find a room that actually exists. | Post your room need, browse real requests… | Post Room Need → `/post-room-need`; secondary via `[call-to-action]` Browse Room Requests → `/room-requests` |
| 2 | **How FindMeRoom works** | Admin | `[services style="1" services_quantity="3"]` | How FindMeRoom works | Three simple steps | Step buttons → `/post-room-need`, `/room-requests` |
| 3 | **Latest Room Requests** | **Admin workaround** or **code** | **None today** — use `[call-to-action]` + link; **future:** `[room-requests]` shortcode | People looking for rooms | See who needs a room near you | Browse Room Requests → `/room-requests` |
| 4 | **Available Rooms** | Admin | `[properties type="rent" limit="6"]` | Available Rooms | Verified listings for rent | Browse all rooms → `/properties` |
| 5 | **Popular Areas** | Admin | `[location type="city" destination="property"]` | Popular Areas | Browse rooms by city | View all → `/properties` |
| 6 | **Safety and Trust** | Admin | `[services]` 1 tab or `[call-to-action]` | Safe by design | Your phone stays private… | Safety Guide → `/safety-guide` |
| 7 | **Final CTA** | Admin | `[call-to-action]` | Ready to find your room? | Post your need in under 2 minutes | Post Room Need → `/post-room-need` |
| 8 | **Footer cleanup** | Admin | Widgets + copyright theme option | — | — | — |

**Hero search box decision:**

- **Recommended:** `search_box_enabled="0"` on hero — avoids Project/Apartment/Villa demo UX.
- **Alternative:** Keep rent-only search pointing to `/properties` — configure hero tabs to `rent` only and disable projects in Real Estate settings.

---

## 6. Homepage copy suggestions

### Hero

- **Headline:** Find a room that actually exists.
- **Subtitle:** Post your room need, browse real requests, and connect with owners without exposing your phone publicly.
- **Primary CTA:** Post Room Need → `/post-room-need`
- **Secondary CTA:** Browse Room Requests → `/room-requests`

### How it works (three `[services]` tabs)

1. **Post your need** — Tell us your area, budget, and move-in date. We review every request before it goes public.
2. **Owners respond** — Room owners browse requests and send their room details through FindMeRoom.
3. **You choose who to contact** — See responses in your dashboard. Your phone stays private until you decide.

### Safety text

Your phone stays private. Owners respond through FindMeRoom, and you decide who to contact. Report anything suspicious — our team moderates abuse; we never manually connect tenants and owners.

### Owner CTA

Have a room? Browse real tenant requests and respond directly.

---

## 7. Demo content removal plan

| Demo item | Method | Admin path / action |
|-----------|--------|---------------------|
| Property Type / Try Searching For | **CMS shortcode edit** — delete block | Pages → homepage → remove `[property-categories]` |
| Featured Properties (Homzen copy) | **CMS shortcode edit** — rewrite | Pages → edit `[properties]` title/subtitle |
| Best Property Value | **CMS shortcode edit** — delete | Pages → remove second `[properties]` |
| Why Choose Us | **CMS shortcode edit** — delete | Pages → remove `[services]` block |
| Buy / Rent / Sell A Home | **CMS shortcode edit** — delete or replace | Pages → `[services]` block |
| Meet Our Agents | **CMS shortcode edit** — delete | Pages → remove `[agents]` |
| Mortgage Calculator (homepage) | **CMS shortcode edit** — delete | Pages → remove `[mortgage-calculator]` |
| Testimonials | **CMS shortcode edit** — delete | Pages → remove `[testimonials]` |
| Helpful Homzen Guides | **CMS shortcode edit** — delete or retitle | Pages → `[blog-posts]` |
| Partner logo slider | **CMS shortcode edit** — delete | Pages → remove `[image-slider]` |
| Footer Homzen branding | **Widget + theme option** | Widgets + Theme Options → Copyright |
| Header Submit Property | **Code required** | `header.blade.php` (§4) |
| Hero Project/Sale tabs | **CMS shortcode + RE settings** | Hero tabs + Real Estate → Settings |
| Latest room requests grid | **Code required** (optional) | Future `[room-requests]` shortcode in plugin |

---

## 8. Empty state cleanup

Existing plugin strings are usable; recommend admin-visible copy alignment:

| Context | Current string location | Recommended copy (admin/content or future lang tweak) |
|---------|-------------------------|--------------------------------------------------------|
| **No room listings** (`/properties`) | Real Estate / theme default | “No rooms match your search yet. Try a different area or budget.” + link Post Room Need |
| **No room requests** (`/room-requests`) | `room-request.board.empty` | Keep: “No active room requests match your filters right now.” Add CTA: Post Room Need (already on board) |
| **No owner responses** (guest manage) | `room-request.manage.no_responses_*` | Keep; ensure public link hint visible |
| **Tenant dashboard — no requests** | `room-request.account.empty_*` | Keep |
| **Tenant dashboard — request, no responses** | `room-request.account.no_responses_*` | Keep |
| **Admin — empty response list** | Botble table default | No change needed for 5A |

**Stage 5A:** Most empty states are **already coded** in Stage 4. Optional **code** later: add CTA link on properties empty state (theme override) — low priority.

---

## 9. Mobile QA checklist

After admin + header code changes, verify on phone width (~375px):

| Area | Check |
|------|-------|
| Homepage header | Logo, hamburger, no clipped menu |
| Header CTA | Post Room Need visible (after code fix); mobile drawer CTA matches |
| Hero | Headline readable; CTAs tappable; search off or rent-only |
| Post Room Need form | `/post-room-need` — fields, location selects, submit |
| Room Requests board | `/room-requests` — filters, cards, empty state |
| Room request detail | Public slug page — no owner responses shown |
| Owner response form | Visible on approved request only |
| Guest manage page | Token URL — summary, report/mark found |
| Account My Room Requests | Sidebar link, list, detail |
| Footer | FindMeRoom copy, links wrap, no Homzen |

---

## 10. Admin versus code — final table

| Task | Recommended method | Admin path or file path | Priority | Risk |
|------|-------------------|-------------------------|----------|------|
| Set homepage page | Admin | Appearance → Theme Options → Page | P0 | Low |
| Rewrite homepage shortcodes | Admin | Pages → Home | P0 | Low |
| Remove demo sections | Admin | Pages → delete shortcode blocks | P0 | Low |
| Main menu structure | Admin | Appearance → Menus | P0 | Low |
| Footer widgets + copyright | Admin | Widgets + Theme Options → Copyright | P0 | Low |
| Logo / site title | Admin | Theme Options → Logo / General | P0 | Low |
| Hero copy + disable demo search | Admin | Pages → `[hero-banner]` | P0 | Low |
| Available rooms section | Admin | Pages → `[properties]` | P1 | Low |
| Popular areas | Admin | Pages → `[location]` + Locations | P1 | Low |
| How it works + safety sections | Admin | Pages → `[services]` / `[call-to-action]` | P1 | Low |
| Safety Guide page | Admin | Pages → create | P1 | Low |
| Real Estate rent-only settings | Admin | Real Estate → Settings | P1 | Low |
| Remove mortgage widget on property detail | Admin | Appearance → Widgets | P2 | Low |
| **Header Post Room Need CTA** | **Code** | `platform/themes/homzen/partials/header.blade.php` | P0 | Medium — theme edit |
| **Latest room requests preview grid** | **Code** (optional) | `findmeroom-room-request` shortcode (future 5A-B) | P2 | Low |
| Hero banner button fields in shortcode UI | Code (optional) | `homzen/functions/shortcodes.php` | P3 | Low |
| Properties empty-state CTA | Code (optional) | Theme real-estate view | P3 | Low |
| Translation override Submit Property | Admin partial | Admin → Translations | P3 | Won’t fix URL |

---

## 11. Do not implement yet

This document is **planning only**.

- Do not edit application, theme, or plugin files.
- Do not run migrations or change database.
- Do not start SEO, email, WhatsApp, sitemap, or payments.

**Suggested execution phases after founder approval:**

1. **5A-Admin** — Founder or dev applies all admin tasks (§2); mobile QA (§9).
2. **5A-Code-min** — Header CTA Blade fix only (§4).
3. **5A-Optional** — `[room-requests]` homepage shortcode if founder wants live preview cards (not required for MVP homepage).

---

## Key references

| Doc | Path |
|-----|------|
| Stage 4 plan | `.cursor/plans/stage_4_account_lead_exchange.md` |
| Decisions | `docs/findmeroom/decisions.md` |
| Current state | `docs/findmeroom/current_state.md` |
| Task queue | `docs/findmeroom/task_queue.md` |
