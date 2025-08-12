# FindMeRoom

FindMeRoom is a Laravel 12 application using Inertia and the React starter kit.

## Installation

```bash
cp .env.example .env
composer install
npm install
php artisan key:generate
```

Configure Redis, S3 and Reverb credentials in `.env`:

```
REDIS_URL=redis://localhost:6379
AWS_ACCESS_KEY_ID=
AWS_SECRET_ACCESS_KEY=
AWS_DEFAULT_REGION=
AWS_BUCKET=
REVERB_APP_ID=
REVERB_APP_KEY=
REVERB_APP_SECRET=
```

## Development

Run the development servers:

```bash
npm run dev
php artisan serve
```

## Build

```bash
npm run build
```

## Testing

```bash
npm run lint
npm run types
php artisan test
```

## Extending the design system

Design tokens live in `resources/js/styles/tokens.css` and are imported by
`resources/js/styles/globals.css`. Add new variables there to extend colors,
spacing or typography and reference them in your components via CSS variables.
