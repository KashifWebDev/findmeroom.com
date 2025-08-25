<?php

use App\Http\Middleware\HandleAppearance;
use App\Http\Middleware\HandleInertiaRequests;
use Illuminate\Foundation\Application;
use Illuminate\Foundation\Configuration\Exceptions;
use Illuminate\Foundation\Configuration\Middleware;
use Illuminate\Http\Middleware\AddLinkHeadersForPreloadedAssets;
use Illuminate\Http\Request;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;
use Symfony\Component\HttpKernel\Exception\AccessDeniedHttpException;
use Illuminate\Auth\AuthenticationException;
use Illuminate\Validation\ValidationException;
use Spatie\Permission\Exceptions\UnauthorizedException;
use Illuminate\Http\Exceptions\ThrottleRequestsException;

return Application::configure(basePath: dirname(__DIR__))
    ->withRouting(
        web: __DIR__.'/../routes/web.php',
        api: __DIR__.'/../routes/api.php',
        commands: __DIR__.'/../routes/console.php',
        health: '/up',
    )
    ->withMiddleware(function (Middleware $middleware) {
        $middleware->encryptCookies(except: ['appearance', 'sidebar_state']);

        $middleware->web(append: [
            HandleAppearance::class,
            HandleInertiaRequests::class,
            AddLinkHeadersForPreloadedAssets::class,
        ]);

        $middleware->api(append: [
            // Sanctum middleware removed as it doesn't exist in Laravel 11
        ]);

        $middleware->alias([
            'owns.listing' => \App\Http\Middleware\EnsureLandlordOwnsListing::class,
            'role' => \Spatie\Permission\Middleware\RoleMiddleware::class,
            'permission' => \Spatie\Permission\Middleware\PermissionMiddleware::class,
            'role_or_permission' => \Spatie\Permission\Middleware\RoleOrPermissionMiddleware::class,
        ]);
    })
    ->withExceptions(function (Exceptions $exceptions) {
        // Handle API exceptions to return JSON envelope format
        $exceptions->renderable(function (NotFoundHttpException $e, Request $request) {
            if ($request->expectsJson() || $request->is('api/*')) {
                return response()->json([
                    'ok' => false,
                    'data' => null,
                    'meta' => null,
                    'error' => [
                        'code' => 'NOT_FOUND',
                        'message' => 'The requested resource was not found.',
                        'fields' => null,
                    ],
                ], 404);
            }
        });

        $exceptions->renderable(function (AccessDeniedHttpException $e, Request $request) {
            if ($request->expectsJson() || $request->is('api/*')) {
                return response()->json([
                    'ok' => false,
                    'data' => null,
                    'meta' => null,
                    'error' => [
                        'code' => 'FORBIDDEN',
                        'message' => 'Access denied.',
                        'fields' => null,
                    ],
                ], 403);
            }
        });

        $exceptions->renderable(function (AuthenticationException $e, Request $request) {
            if ($request->expectsJson() || $request->is('api/*')) {
                return response()->json([
                    'ok' => false,
                    'data' => null,
                    'meta' => null,
                    'error' => [
                        'code' => 'UNAUTHENTICATED',
                        'message' => 'Unauthenticated.',
                        'fields' => null,
                    ],
                ], 401);
            }
        });

        $exceptions->renderable(function (ValidationException $e, Request $request) {
            if ($request->expectsJson() || $request->is('api/*')) {
                return response()->json([
                    'ok' => false,
                    'data' => null,
                    'meta' => null,
                    'error' => [
                        'code' => 'VALIDATION_ERROR',
                        'message' => 'The given data was invalid.',
                        'fields' => $e->errors(),
                    ],
                ], 422);
            }
        });

        $exceptions->renderable(function (UnauthorizedException $e, Request $request) {
            if ($request->expectsJson() || $request->is('api/*')) {
                return response()->json([
                    'ok' => false,
                    'data' => null,
                    'meta' => null,
                    'error' => [
                        'code' => 'FORBIDDEN',
                        'message' => 'User does not have the right roles.',
                        'fields' => null,
                    ],
                ], 403);
            }
        });

        $exceptions->renderable(function (ThrottleRequestsException $e, Request $request) {
            if ($request->expectsJson() || $request->is('api/*')) {
                return response()->json([
                    'ok' => false,
                    'data' => null,
                    'meta' => null,
                    'error' => [
                        'code' => 'RATE_LIMITED',
                        'message' => 'Too Many Attempts.',
                        'fields' => null,
                    ],
                ], 429);
            }
        });
    })->create();
