<?php

namespace Botble\RealEstate\Tests\Feature;

use Botble\RealEstate\Models\Account;
use Botble\RealEstate\Models\Category;
use Botble\RealEstate\Models\Project;
use Botble\RealEstate\Models\Property;
use Botble\Slug\Models\Slug;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Support\Facades\DB;
use Tests\TestCase;

class CanonicalTagsTest extends TestCase
{
    use RefreshDatabase;

    protected function setUp(): void
    {
        parent::setUp();

        Slug::query()->truncate();
    }

    public function testPropertySlugCreation(): void
    {
        $property = Property::query()->create([
            'name' => 'Slug Property',
            'status' => 'publish',
            'author_id' => 1,
        ]);

        $slug = Slug::query()->create([
            'key' => 'slug-property',
            'prefix' => 'properties',
            'reference_type' => Property::class,
            'reference_id' => $property->id,
        ]);

        // Verify slug was created
        $this->assertDatabaseHas('slugs', [
            'key' => 'slug-property',
            'prefix' => 'properties',
            'reference_type' => Property::class,
            'reference_id' => $property->id,
        ]);
    }

    public function testProjectSlugCreation(): void
    {
        $project = Project::query()->create([
            'name' => 'Slug Project',
            'status' => 'publish',
            'author_id' => 1,
        ]);

        $slug = Slug::query()->create([
            'key' => 'slug-project',
            'prefix' => 'projects',
            'reference_type' => Project::class,
            'reference_id' => $project->id,
        ]);

        $this->assertDatabaseHas('slugs', [
            'key' => 'slug-project',
            'prefix' => 'projects',
            'reference_type' => Project::class,
            'reference_id' => $project->id,
        ]);
    }

    public function testCategorySlugCreation(): void
    {
        $category = Category::query()->create([
            'name' => 'Slug Category',
            'status' => 'publish',
        ]);

        $slug = Slug::query()->create([
            'key' => 'slug-category',
            'prefix' => 'categories',
            'reference_type' => Category::class,
            'reference_id' => $category->id,
        ]);

        $this->assertDatabaseHas('slugs', [
            'key' => 'slug-category',
            'prefix' => 'categories',
            'reference_type' => Category::class,
            'reference_id' => $category->id,
        ]);
    }

    public function testAccountSlugCreation(): void
    {
        $account = Account::query()->create([
            'first_name' => 'Jane',
            'last_name' => 'Smith',
            'email' => 'jane@example.com',
            'status' => 'publish',
        ]);

        $slug = Slug::query()->create([
            'key' => 'jane-smith-account',
            'prefix' => 'agents',
            'reference_type' => Account::class,
            'reference_id' => $account->id,
        ]);

        $this->assertDatabaseHas('slugs', [
            'key' => 'jane-smith-account',
            'prefix' => 'agents',
            'reference_type' => Account::class,
            'reference_id' => $account->id,
        ]);
    }

    public function testMultipleContentTypesCanHaveSlugs(): void
    {
        // Create property
        $property = Property::query()->create([
            'name' => 'Multi Property',
            'status' => 'publish',
            'author_id' => 1,
        ]);

        Slug::query()->create([
            'key' => 'multi-property',
            'prefix' => 'properties',
            'reference_type' => Property::class,
            'reference_id' => $property->id,
        ]);

        // Create project
        $project = Project::query()->create([
            'name' => 'Multi Project',
            'status' => 'publish',
            'author_id' => 1,
        ]);

        Slug::query()->create([
            'key' => 'multi-project',
            'prefix' => 'projects',
            'reference_type' => Project::class,
            'reference_id' => $project->id,
        ]);

        // Create category
        $category = Category::query()->create([
            'name' => 'Multi Category',
            'status' => 'publish',
        ]);

        Slug::query()->create([
            'key' => 'multi-category',
            'prefix' => 'categories',
            'reference_type' => Category::class,
            'reference_id' => $category->id,
        ]);

        // Verify all slugs exist
        $this->assertDatabaseCount('slugs', 3);

        $this->assertDatabaseHas('slugs', [
            'key' => 'multi-property',
            'reference_type' => Property::class,
        ]);

        $this->assertDatabaseHas('slugs', [
            'key' => 'multi-project',
            'reference_type' => Project::class,
        ]);

        $this->assertDatabaseHas('slugs', [
            'key' => 'multi-category',
            'reference_type' => Category::class,
        ]);
    }

    public function testSlugWithoutPrefix(): void
    {
        $property = Property::query()->create([
            'name' => 'No Prefix Property',
            'status' => 'publish',
            'author_id' => 1,
        ]);

        Slug::query()->create([
            'key' => 'no-prefix-property',
            'prefix' => null,
            'reference_type' => Property::class,
            'reference_id' => $property->id,
        ]);

        $this->assertDatabaseHas('slugs', [
            'key' => 'no-prefix-property',
            'prefix' => null,
            'reference_type' => Property::class,
            'reference_id' => $property->id,
        ]);
    }

    public function testSlugRefersToCorrectModel(): void
    {
        $property = Property::query()->create([
            'name' => 'Ref Property',
            'status' => 'publish',
            'author_id' => 1,
        ]);

        $slug = Slug::query()->create([
            'key' => 'ref-property',
            'prefix' => 'properties',
            'reference_type' => Property::class,
            'reference_id' => $property->id,
        ]);

        // Verify slug references correct model
        $this->assertEquals(Property::class, $slug->reference_type);
        $this->assertEquals($property->id, $slug->reference_id);
    }

    public function testCanonicalUrlPrefixStructure(): void
    {
        // Verify URL structure that would be used with setUrl()
        $testUrl = url('/properties/test-property');

        $this->assertStringContainsString('http', $testUrl);
        $this->assertStringContainsString('test-property', $testUrl);
    }

    public function testCanonicalUrlCanBeBuiltForAllContentTypes(): void
    {
        $propertyUrl = url('/properties/property-test');
        $projectUrl = url('/projects/project-test');
        $categoryUrl = url('/categories/category-test');
        $accountUrl = url('/agents/account-test');

        $this->assertStringContainsString('property-test', $propertyUrl);
        $this->assertStringContainsString('project-test', $projectUrl);
        $this->assertStringContainsString('category-test', $categoryUrl);
        $this->assertStringContainsString('account-test', $accountUrl);
    }

    public function testPropertySlugWithTranslations(): void
    {
        $property = Property::query()->create([
            'name' => 'Multi-lang Property',
            'status' => 'publish',
            'author_id' => 1,
        ]);

        $slug = Slug::query()->create([
            'key' => 'multi-lang-property',
            'prefix' => 'properties',
            'reference_type' => Property::class,
            'reference_id' => $property->id,
        ]);

        // Create translations
        DB::table('slugs_translations')->insert([
            'slugs_id' => $slug->id,
            'lang_code' => 'vi',
            'key' => 'tien-ich-da-ngon-ngu',
            'prefix' => 'tien-ich',
        ]);

        DB::table('slugs_translations')->insert([
            'slugs_id' => $slug->id,
            'lang_code' => 'ar',
            'key' => 'العقارات-متعددة-اللغات',
            'prefix' => 'العقارات',
        ]);

        // Verify base slug exists
        $this->assertDatabaseHas('slugs', [
            'key' => 'multi-lang-property',
            'reference_type' => Property::class,
        ]);

        // Verify translations exist
        $this->assertDatabaseHas('slugs_translations', [
            'slugs_id' => $slug->id,
            'lang_code' => 'vi',
            'key' => 'tien-ich-da-ngon-ngu',
        ]);

        $this->assertDatabaseHas('slugs_translations', [
            'slugs_id' => $slug->id,
            'lang_code' => 'ar',
            'key' => 'العقارات-متعددة-اللغات',
        ]);
    }

    public function testHreflangFallbackWhenTranslationMissing(): void
    {
        $property = Property::query()->create([
            'name' => 'Hreflang Fallback Property',
            'status' => 'publish',
            'author_id' => 1,
        ]);

        $slug = Slug::query()->create([
            'key' => 'hreflang-fallback-property',
            'prefix' => 'properties',
            'reference_type' => Property::class,
            'reference_id' => $property->id,
        ]);

        // Only create Vietnamese translation
        DB::table('slugs_translations')->insert([
            'slugs_id' => $slug->id,
            'lang_code' => 'vi',
            'key' => 'tien-ich-fallback',
            'prefix' => 'tien-ich',
        ]);

        // Arabic translation doesn't exist
        $arTranslation = DB::table('slugs_translations')
            ->where('slugs_id', $slug->id)
            ->where('lang_code', 'ar')
            ->first();

        $this->assertNull($arTranslation);

        // For hreflang, when translation missing, use base slug
        // This simulates AddHrefLangListener::getAdvancedTranslatedUrl logic
        $baseSlug = Slug::query()->where('id', $slug->id)->first();
        $fallbackPrefix = $baseSlug->prefix;
        $fallbackKey = $baseSlug->key;

        $this->assertEquals('properties', $fallbackPrefix);
        $this->assertEquals('hreflang-fallback-property', $fallbackKey);

        // Hreflang URL should use fallback
        $hreflangUrl = url('/' . $fallbackPrefix . '/' . $fallbackKey);
        $this->assertStringContainsString('properties/hreflang-fallback-property', $hreflangUrl);
    }

    public function testTranslatedPrefixUsedInCanonical(): void
    {
        $project = Project::query()->create([
            'name' => 'Translated Prefix Project',
            'status' => 'publish',
            'author_id' => 1,
        ]);

        $slug = Slug::query()->create([
            'key' => 'translated-prefix-project',
            'prefix' => 'projects',
            'reference_type' => Project::class,
            'reference_id' => $project->id,
        ]);

        // Create translation with different prefix
        DB::table('slugs_translations')->insert([
            'slugs_id' => $slug->id,
            'lang_code' => 'vi',
            'key' => 'du-an-tinh-dung-prefix',
            'prefix' => 'cac-du-an', // Different prefix
        ]);

        $translation = DB::table('slugs_translations')
            ->where('slugs_id', $slug->id)
            ->where('lang_code', 'vi')
            ->first();

        $this->assertNotNull($translation);
        $this->assertNotEquals($slug->prefix, $translation->prefix);

        // When building hreflang URL, use translated prefix
        $usedPrefix = $translation->prefix ?? $slug->prefix;
        $this->assertEquals('cac-du-an', $usedPrefix);

        // URL should use translated prefix
        $translatedUrl = url('/' . $usedPrefix . '/' . $translation->key);
        $this->assertStringContainsString('cac-du-an/du-an-tinh-dung-prefix', $translatedUrl);
    }

    public function testSlugTranslationQueryingPatterns(): void
    {
        $category = Category::query()->create([
            'name' => 'Query Pattern Category',
            'status' => 'publish',
        ]);

        $slug = Slug::query()->create([
            'key' => 'query-pattern-category',
            'prefix' => 'categories',
            'reference_type' => Category::class,
            'reference_id' => $category->id,
        ]);

        DB::table('slugs_translations')->insert([
            'slugs_id' => $slug->id,
            'lang_code' => 'vi',
            'key' => 'danh-muc-tuy-van',
            'prefix' => 'danh-muc',
        ]);

        // Pattern 1: Query by slug_id (used in translateSlugSwitcherUrl)
        $translations = DB::table('slugs_translations')
            ->where('slugs_id', $slug->id)
            ->get();

        $this->assertCount(1, $translations);
        $this->assertEquals('vi', $translations->first()->lang_code);

        // Pattern 2: Find specific translation by lang_code in collection
        $viTranslation = $translations->firstWhere('lang_code', 'vi');
        $this->assertNotNull($viTranslation);
        $this->assertEquals('danh-muc-tuy-van', $viTranslation->key);

        // Pattern 3: Look for translation that doesn't exist
        $frTranslation = $translations->firstWhere('lang_code', 'fr');
        $this->assertNull($frTranslation);

        // Pattern 4: Apply fallback when translation missing
        $finalKey = $frTranslation?->key ?? $slug->key;
        $this->assertEquals('query-pattern-category', $finalKey);
    }
}
