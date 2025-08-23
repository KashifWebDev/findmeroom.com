# Test Suite for FindMeRoom.com API

This directory contains a comprehensive automated test suite for the FindMeRoom.com Laravel 12 API application.

## Test Structure

### Feature Tests
- **HealthTest.php** - API health endpoint tests
- **GeographyTest.php** - Geography endpoints (cities, areas, campuses)
- **AuthTest.php** - Authentication (register, login, me, logout)
- **ListingPublicTest.php** - Public listing endpoints (index, show)
- **TenantFeaturesTest.php** - Tenant-specific features (enquiries, saved listings, searches)
- **LandlordListingManagementTest.php** - Landlord listing CRUD and media management
- **VerificationTest.php** - User verification system
- **AdminModerationTest.php** - Admin listing moderation
- **BoostsOrdersTest.php** - Boost management and order processing
- **ResponseEnvelopeTest.php** - API response envelope consistency

### Unit Tests
- **ListingQueryServiceTest.php** - Listing query service functionality
- **OrderServiceTest.php** - Order service business logic
- **ListingScopesTest.php** - Listing model scopes (min_price, max_price)
- **ApiResponseTraitTest.php** - API response trait methods

### Support Files
- **CreatesUsers.php** - Trait for creating test users with different roles
- **GeographyFactory.php** - Helper for creating geography test data
- **TestCase.php** - Base test case with common setup

### Fixtures
- **sample_listing.json** - Sample listing data for tests
- **sample_user.json** - Sample user data for tests

## Running Tests

### Prerequisites
1. Ensure MySQL is running and accessible
2. Create a test database: `findmeroom_testing`
3. Configure `.env.testing` with test database credentials

### Commands

```bash
# Run all tests
php artisan test

# Run tests in parallel
php artisan test --parallel

# Run specific test suite
php artisan test --testsuite=Feature
php artisan test --testsuite=Unit

# Run specific test file
php artisan test tests/Feature/AuthTest.php

# Run tests with coverage (if Xdebug is available)
php artisan test --coverage

# Run tests with verbose output
php artisan test -v
```

### Test Database Setup

The test suite uses a separate test database to avoid affecting development data. Ensure your `.env.testing` file contains:

```env
DB_DATABASE=findmeroom_testing
DB_USERNAME=root
DB_PASSWORD=
```

## Test Configuration

### phpunit.xml
- Configured for MySQL testing
- Parallel testing enabled
- Scout driver set to `array` for tests
- Cache and session drivers set to `array`

### Pest Configuration
- Uses `RefreshDatabase` for clean test state
- Creates Spatie roles in `beforeEach`
- Fakes storage disk for media tests

## Test Coverage

The test suite covers:

### API Endpoints
- ✅ All public endpoints
- ✅ Authentication endpoints
- ✅ Tenant-specific endpoints
- ✅ Landlord-specific endpoints
- ✅ Admin endpoints
- ✅ Webhook endpoints

### Business Logic
- ✅ User registration and role assignment
- ✅ Listing creation, updates, and deletion
- ✅ Media upload and management
- ✅ Enquiry creation and management
- ✅ Boost purchase and activation
- ✅ Payment processing
- ✅ Admin moderation

### Edge Cases
- ✅ Validation errors
- ✅ Authentication failures
- ✅ Authorization failures
- ✅ Rate limiting
- ✅ Duplicate data handling
- ✅ Error responses

### Data Integrity
- ✅ Database constraints
- ✅ Soft deletes
- ✅ Relationship integrity
- ✅ Activity logging
- ✅ Media file management

## Writing New Tests

### Feature Test Template
```php
<?php

use Tests\Support\CreatesUsers;

uses(CreatesUsers::class);

test('test description', function () {
    // Test implementation
});
```

### Unit Test Template
```php
<?php

test('test description', function () {
    // Test implementation
});
```

### Using Test Helpers
```php
// Create users with specific roles
$tenant = $this->actingAsTenant();
$landlord = $this->actingAsLandlord();
$admin = $this->actingAsAdmin();

// Create geography data
$geography = GeographyFactory::createFullGeography();
```

## Best Practices

1. **Use descriptive test names** that explain what is being tested
2. **Test both happy path and failure scenarios**
3. **Use database assertions** to verify data changes
4. **Fake external services** (storage, mail, etc.)
5. **Clean up test data** using `RefreshDatabase`
6. **Test response structure** and status codes
7. **Verify business logic** not just HTTP responses

## Troubleshooting

### Common Issues

1. **Database connection errors**: Check `.env.testing` configuration
2. **Permission errors**: Ensure Spatie roles are created in `beforeEach`
3. **Storage errors**: Verify `Storage::fake('public')` is called
4. **Model factory errors**: Check if models have `HasFactory` trait

### Debug Commands

```bash
# Clear configuration cache
php artisan config:clear

# Clear route cache
php artisan route:clear

# Check test database connection
php artisan tinker --env=testing
```

## Performance

- Tests run in parallel by default
- Database transactions are used for isolation
- Storage is faked to avoid file I/O
- Scout is configured to use `array` driver

## Continuous Integration

The test suite is designed to run in CI/CD environments:
- No external dependencies
- Fast execution
- Reliable results
- Comprehensive coverage
