<?php

use App\Traits\ApiResponse;
use Illuminate\Http\JsonResponse;
use Illuminate\Contracts\Pagination\LengthAwarePaginator;
use Illuminate\Pagination\LengthAwarePaginator as Paginator;
use Illuminate\Support\Collection;

class TestController
{
    use ApiResponse;
}

test('ok method returns correct response structure', function () {
    $controller = new TestController();
    $data = ['message' => 'Success'];
    $meta = ['version' => '1.0'];
    
    $response = $controller->ok($data, $meta);
    
    $this->assertInstanceOf(JsonResponse::class, $response);
    $this->assertEquals(200, $response->getStatusCode());
    
    $content = json_decode($response->getContent(), true);
    $this->assertTrue($content['ok']);
    $this->assertEquals($data, $content['data']);
    $this->assertEquals($meta, $content['meta']);
});

test('ok method works without data and meta', function () {
    $controller = new TestController();
    
    $response = $controller->ok();
    
    $this->assertInstanceOf(JsonResponse::class, $response);
    $this->assertEquals(200, $response->getStatusCode());
    
    $content = json_decode($response->getContent(), true);
    $this->assertTrue($content['ok']);
    $this->assertNull($content['data']);
    $this->assertNull($content['meta']);
});

test('ok method with custom status code', function () {
    $controller = new TestController();
    $data = ['message' => 'Success'];
    
    $response = $controller->ok($data, [], 201);
    
    $this->assertInstanceOf(JsonResponse::class, $response);
    $this->assertEquals(201, $response->getStatusCode());
    
    $content = json_decode($response->getContent(), true);
    $this->assertTrue($content['ok']);
    $this->assertEquals($data, $content['data']);
});

test('created method returns correct response structure', function () {
    $controller = new TestController();
    $data = ['id' => 1, 'name' => 'Created Item'];
    $meta = ['location' => '/api/items/1'];
    
    $response = $controller->created($data, $meta);
    
    $this->assertInstanceOf(JsonResponse::class, $response);
    $this->assertEquals(201, $response->getStatusCode());
    
    $content = json_decode($response->getContent(), true);
    $this->assertTrue($content['ok']);
    $this->assertEquals($data, $content['data']);
    $this->assertEquals($meta, $content['meta']);
});

test('created method works without data and meta', function () {
    $controller = new TestController();
    
    $response = $controller->created();
    
    $this->assertInstanceOf(JsonResponse::class, $response);
    $this->assertEquals(201, $response->getStatusCode());
    
    $content = json_decode($response->getContent(), true);
    $this->assertTrue($content['ok']);
    $this->assertNull($content['data']);
    $this->assertNull($content['meta']);
});

test('noContent method returns correct response structure', function () {
    $controller = new TestController();
    
    $response = $controller->noContent();
    
    $this->assertInstanceOf(JsonResponse::class, $response);
    $this->assertEquals(204, $response->getStatusCode());
    
    $content = json_decode($response->getContent(), true);
    $this->assertTrue($content['ok']);
    $this->assertNull($content['data']);
    $this->assertNull($content['meta']);
});

test('fail method returns correct error response structure', function () {
    $controller = new TestController();
    $errorCode = 'VALIDATION_ERROR';
    $errorMessage = 'Validation failed';
    $fields = ['name' => ['The name field is required.']];
    
    $response = $controller->fail($errorCode, $errorMessage, $fields, 422);
    
    $this->assertInstanceOf(JsonResponse::class, $response);
    $this->assertEquals(422, $response->getStatusCode());
    
    $content = json_decode($response->getContent(), true);
    $this->assertFalse($content['ok']);
    $this->assertNull($content['data']);
    $this->assertNull($content['meta']);
    $this->assertEquals($errorCode, $content['error']['code']);
    $this->assertEquals($errorMessage, $content['error']['message']);
    $this->assertEquals($fields, $content['error']['fields']);
});

test('fail method works without fields', function () {
    $controller = new TestController();
    $errorCode = 'NOT_FOUND';
    $errorMessage = 'Resource not found';
    
    $response = $controller->fail($errorCode, $errorMessage);
    
    $this->assertInstanceOf(JsonResponse::class, $response);
    $this->assertEquals(400, $response->getStatusCode());
    
    $content = json_decode($response->getContent(), true);
    $this->assertFalse($content['ok']);
    $this->assertNull($content['error']['fields']);
});

test('fail method uses default 400 status code', function () {
    $controller = new TestController();
    
    $response = $controller->fail('ERROR', 'Something went wrong');
    
    $this->assertInstanceOf(JsonResponse::class, $response);
    $this->assertEquals(400, $response->getStatusCode());
});

test('fail method with custom status codes', function () {
    $controller = new TestController();
    
    $response401 = $controller->fail('UNAUTHORIZED', 'Not authenticated', null, 401);
    $this->assertEquals(401, $response401->getStatusCode());
    
    $response403 = $controller->fail('FORBIDDEN', 'Access denied', null, 403);
    $this->assertEquals(403, $response403->getStatusCode());
    
    $response404 = $controller->fail('NOT_FOUND', 'Resource not found', null, 404);
    $this->assertEquals(404, $response404->getStatusCode());
    
    $response422 = $controller->fail('VALIDATION_ERROR', 'Validation failed', [], 422);
    $this->assertEquals(422, $response422->getStatusCode());
    
    $response429 = $controller->fail('RATE_LIMITED', 'Too many requests', null, 429);
    $this->assertEquals(429, $response429->getStatusCode());
    
    $response500 = $controller->fail('SERVER_ERROR', 'Internal server error', null, 500);
    $this->assertEquals(500, $response500->getStatusCode());
});

test('paginated method returns correct response structure', function () {
    $controller = new TestController();
    
    // Create a mock paginator
    $items = collect(['item1', 'item2', 'item3']);
    $paginator = new Paginator($items, 3, 2, 1);
    
    $response = $controller->paginated($paginator, $items);
    
    $this->assertInstanceOf(JsonResponse::class, $response);
    $this->assertEquals(200, $response->getStatusCode());
    
    $content = json_decode($response->getContent(), true);
    $this->assertTrue($content['ok']);
    $this->assertEquals($items->toArray(), $content['data']);
    $this->assertEquals(1, $content['meta']['page']);
    $this->assertEquals(2, $content['meta']['per_page']);
    $this->assertEquals(3, $content['meta']['total']);
    $this->assertEquals(1, $content['meta']['last_page']);
});

test('paginated method with empty results', function () {
    $controller = new TestController();
    
    $items = collect([]);
    $paginator = new Paginator($items, 0, 20, 1);
    
    $response = $controller->paginated($paginator, $items);
    
    $this->assertInstanceOf(JsonResponse::class, $response);
    $this->assertEquals(200, $response->getStatusCode());
    
    $content = json_decode($response->getContent(), true);
    $this->assertTrue($content['ok']);
    $this->assertEquals([], $content['data']);
    $this->assertEquals(1, $content['meta']['page']);
    $this->assertEquals(20, $content['meta']['per_page']);
    $this->assertEquals(0, $content['meta']['total']);
    $this->assertEquals(1, $content['meta']['last_page']);
});

test('paginated method with multiple pages', function () {
    $controller = new TestController();
    
    $items = collect(['item1', 'item2']);
    $paginator = new Paginator($items, 25, 2, 2);
    
    $response = $controller->paginated($paginator, $items);
    
    $this->assertInstanceOf(JsonResponse::class, $response);
    $this->assertEquals(200, $response->getStatusCode());
    
    $content = json_decode($response->getContent(), true);
    $this->assertTrue($content['ok']);
    $this->assertEquals(2, $content['meta']['page']);
    $this->assertEquals(2, $content['meta']['per_page']);
    $this->assertEquals(25, $content['meta']['total']);
    $this->assertEquals(13, $content['meta']['last_page']);
});

test('response content is valid JSON', function () {
    $controller = new TestController();
    
    $response = $controller->ok(['test' => 'data']);
    
    $this->assertInstanceOf(JsonResponse::class, $response);
    
    // Should not throw JSON decode error
    $content = json_decode($response->getContent(), true);
    $this->assertIsArray($content);
    $this->assertArrayHasKey('ok', $content);
    $this->assertArrayHasKey('data', $content);
    $this->assertArrayHasKey('meta', $content);
});

test('error response content is valid JSON', function () {
    $controller = new TestController();
    
    $response = $controller->fail('TEST_ERROR', 'Test error message');
    
    $this->assertInstanceOf(JsonResponse::class, $response);
    
    // Should not throw JSON decode error
    $content = json_decode($response->getContent(), true);
    $this->assertIsArray($content);
    $this->assertArrayHasKey('ok', $content);
    $this->assertArrayHasKey('data', $content);
    $this->assertArrayHasKey('meta', $content);
    $this->assertArrayHasKey('error', $content);
    $this->assertArrayHasKey('code', $content['error']);
    $this->assertArrayHasKey('message', $content['error']);
});

test('response headers are set correctly', function () {
    $controller = new TestController();
    
    $response = $controller->ok(['test' => 'data']);
    
    $this->assertInstanceOf(JsonResponse::class, $response);
    $this->assertEquals('application/json', $response->headers->get('Content-Type'));
});

test('error response headers are set correctly', function () {
    $controller = new TestController();
    
    $response = $controller->fail('ERROR', 'Error message', null, 422);
    
    $this->assertInstanceOf(JsonResponse::class, $response);
    $this->assertEquals('application/json', $response->headers->get('Content-Type'));
});
