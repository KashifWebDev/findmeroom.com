<?php

namespace App\Traits;

use Illuminate\Http\JsonResponse;
use Illuminate\Contracts\Pagination\LengthAwarePaginator;

trait ApiResponse
{
    protected function ok($data = null, array $meta = [], int $code = 200): JsonResponse
    {
        return response()->json([
            'ok' => true,
            'data' => $data,
            'meta' => $meta,
        ], $code);
    }

    protected function created($data = null, array $meta = []): JsonResponse
    {
        return $this->ok($data, $meta, 201);
    }

    protected function noContent(): JsonResponse
    {
        return response()->json([
            'ok' => true,
            'data' => null,
            'meta' => null,
        ], 204);
    }

    protected function fail(string $code, string $message, ?array $fields = null, int $http = 400): JsonResponse
    {
        return response()->json([
            'ok' => false,
            'data' => null,
            'meta' => null,
            'error' => [
                'code' => $code,
                'message' => $message,
                'fields' => $fields,
            ],
        ], $http);
    }

    protected function paginated(LengthAwarePaginator $paginator, $items): JsonResponse
    {
        return $this->ok($items, [
            'page' => $paginator->currentPage(),
            'per_page' => $paginator->perPage(),
            'total' => $paginator->total(),
            'last_page' => $paginator->lastPage(),
        ]);
    }
}
