<?php

use Botble\Base\Forms\FieldOptions\ColorFieldOption;
use Botble\Base\Forms\FieldOptions\CoreIconFieldOption;
use Botble\Base\Forms\FieldOptions\MediaImageFieldOption;
use Botble\Base\Forms\FieldOptions\RepeaterFieldOption;
use Botble\Base\Forms\FieldOptions\SelectFieldOption;
use Botble\Base\Forms\FieldOptions\TextFieldOption;
use Botble\Base\Forms\Fields\ColorField;
use Botble\Base\Forms\Fields\CoreIconField;
use Botble\Base\Forms\Fields\MediaImageField;
use Botble\Base\Forms\Fields\RepeaterField;
use Botble\Base\Forms\Fields\SelectField;
use Botble\Base\Forms\Fields\TextField;
use Botble\Contact\Forms\Fronts\ContactForm;
use Botble\Media\Facades\RvMedia;
use Botble\Page\Forms\PageForm;
use Botble\RealEstate\Enums\ProjectStatusEnum;
use Botble\RealEstate\Enums\PropertyStatusEnum;
use Botble\RealEstate\Forms\AccountForm;
use Botble\RealEstate\Forms\CategoryForm;
use Botble\RealEstate\Forms\Fronts\Auth\LoginForm;
use Botble\RealEstate\Forms\Fronts\Auth\RegisterForm;
use Botble\RealEstate\Forms\PropertyForm;
use Botble\RealEstate\Models\Project;
use Botble\RealEstate\Models\Property;
use Botble\Theme\Facades\Theme;
use Botble\Theme\Supports\ThemeSupport;
use Botble\Theme\Typography\TypographyItem;
use Botble\Widget\Facades\WidgetGroup;

if (! function_exists('get_max_properties_price')) {
    function get_max_properties_price(): int
    {
        $price = Property::query()->max('price');

        return $price ? (int) ceil($price) : 0;
    }
}

if (! function_exists('get_min_square')) {
    function get_min_square(): int
    {
        $square = Property::query()->min('square');

        return $square ? (int) ceil($square) : 0;
    }
}

if (! function_exists('get_max_square')) {
    function get_max_square(): int
    {
        $square = Property::query()->max('square');

        return $square ? (int) ceil($square) : 0;
    }
}

if (! function_exists('get_min_flat')) {
    function get_min_flat(): int
    {
        $flat = Project::query()->min('number_flat');

        return $flat ? (int) ceil($flat) : 0;
    }
}

if (! function_exists('get_max_flat')) {
    function get_max_flat(): int
    {
        $flat = Project::query()->max('number_flat');

        return $flat ? (int) ceil($flat) : 0;
    }
}

if (! function_exists('get_property_listing_page_layout')) {
    function get_property_listing_page_layout(string $default = 'top-map'): string
    {
        $layout = theme_option('real_estate_property_listing_layout', $default);

        return in_array($layout, ['top-map', 'half-map', 'sidebar']) ? $layout : $default;
    }
}

app()->booted(function () {
    register_page_template([
        'default' => __('Default'),
        'full-width' => __('Full Width'),
        'no-layout' => __('No Layout'),
    ]);

    register_sidebar([
        'id' => 'top_footer_sidebar',
        'name' => __('Top Footer Sidebar'),
        'description' => __('Top section of the footer for logo and social links.'),
    ]);

    register_sidebar([
        'id' => 'inner_footer_sidebar',
        'name' => __('Inner Footer Sidebar'),
        'description' => __('Inner footer section for site info, menus, and newsletter.'),
    ]);

    register_sidebar([
        'id' => 'bottom_footer_sidebar',
        'name' => __('Bottom Footer Sidebar'),
        'description' => __('Bottom footer section for legal notices and credits.'),
    ]);

    register_sidebar([
        'id' => 'blog_sidebar',
        'name' => __('Blog Sidebar'),
        'description' => __('Add widgets here to appear in the sidebar of your blog pages.'),
    ]);

    register_sidebar([
        'id' => 'bottom_post_detail_sidebar',
        'name' => __('Bottom Post Detail Sidebar'),
        'description' => __('Place widgets here to display additional content below individual blog posts.'),
    ]);

    WidgetGroup::removeGroup('primary_sidebar');

    Theme::typography()
        ->registerFontFamilies([
            new TypographyItem('primary', __('Primary'), 'DM Sans'),
            new TypographyItem('heading', __('Heading'), 'Josefin Sans'),
        ])
        ->registerFontSizes([
            new TypographyItem('h1', __('Heading 1'), 80),
            new TypographyItem('h2', __('Heading 2'), 56),
            new TypographyItem('h3', __('Heading 3'), 44),
            new TypographyItem('h4', __('Heading 4'), 36),
            new TypographyItem('h5', __('Heading 5'), 30),
            new TypographyItem('h6', __('Heading 6'), 24),
            new TypographyItem('body', __('Body'), 16),
        ]);

    ThemeSupport::registerSocialLinks();
    ThemeSupport::registerSocialSharing();
    ThemeSupport::registerToastNotification();
    ThemeSupport::registerPreloader();
    ThemeSupport::registerSiteCopyright();
    ThemeSupport::registerDateFormatOption();
    ThemeSupport::registerLazyLoadImages();

    add_filter('ads_locations', function (array $locations) {
        return [
            ...$locations,
            'header_before' => __('Header (before)'),
            'header_after' => __('Header (after)'),
            'footer_before' => __('Footer (before)'),
            'footer_after' => __('Footer (after)'),
            'listing_page_before' => __('Listing Page (before)'),
            'listing_page_after' => __('Listing Page (after)'),
            'detail_page_before' => __('Detail Page (before)'),
            'detail_page_after' => __('Detail Page (after)'),
            'detail_page_sidebar_before' => __('Detail Page Sidebar (before)'),
            'detail_page_sidebar_after' => __('Detail Page Sidebar (after)'),
            'blog_list_before' => __('Blog List (before)'),
            'blog_list_after' => __('Blog List (after)'),
            'blog_sidebar_before' => __('Blog Sidebar (before)'),
            'blog_sidebar_after' => __('Blog Sidebar (after)'),
            'post_detail_before' => __('Post Detail (before)'),
            'post_detail_after' => __('Post Detail (after)'),
        ];
    }, 128);

    Theme::addBodyAttributes(['class' => 'body counter-scroll']);

    RvMedia::addSize('medium-square', 400, 400)
        ->addSize('medium-rectangle-column', 400, 560)
        ->addSize('medium-rectangle', 400, 260);

    add_filter('theme_preloader_versions', function (array $versions): array {
        return [
            ...$versions,
            'v2' => __('Theme built-in'),
        ];
    }, 999);

    add_filter('theme_preloader', function (?string $html): ?string {
        if (theme_option('preloader_version', 'v1') === 'v2') {
            return $html . Theme::partial('preloader');
        }

        return $html;
    }, 999);

    if (is_plugin_active('real-estate')) {
        add_filter('theme_front_footer_content', function (?string $html): ?string {
            if (theme_option('use_modal_for_authentication', true)) {
                $loginForm = LoginForm::create()
                    ->setFormOption('has_wrapper', 'no');
                $registerForm = RegisterForm::create()
                    ->setFormOption('has_wrapper', 'no');

                $html .= Theme::partial(
                    'modal-authentication',
                    compact('loginForm', 'registerForm')
                );
            }

            $html .= Theme::partial('go-to-top');

            return $html;
        }, 999);

        add_filter('real_estate_property_status_html', function (?string $html, string $value): ?string {
            $color = match ($value) {
                PropertyStatusEnum::SELLING, PropertyStatusEnum::RENTING => 'primary',
                default => null,
            };

            return sprintf('<span class="flag-tag %s">%s</span>', $color, PropertyStatusEnum::getLabel($value));
        }, 999, 2);

        add_filter('real_estate_project_status_html', function (?string $html, string $value): ?string {
            $color = match ($value) {
                ProjectStatusEnum::SELLING => 'primary',
                default => null,
            };

            return sprintf('<span class="flag-tag %s">%s</span>', $color, ProjectStatusEnum::getLabel($value));
        }, 999, 2);

        CategoryForm::extend(function (CategoryForm $form) {
            $form
                ->addAfter(
                    'is_default',
                    'icon',
                    CoreIconField::class,
                    CoreIconFieldOption::make()
                        ->label(__('Icon'))
                        ->metadata(),
                )
                ->addAfter(
                    'icon',
                    'icon_image',
                    MediaImageField::class,
                    MediaImageFieldOption::make()
                        ->label(__('Icon image'))
                        ->helperText(__('If icon image is set, it will be used instead of the icon above.'))
                        ->metadata()
                );
        });

        PropertyForm::extend(function (PropertyForm $form) {
            $form
                ->addAfter(
                    'author_id',
                    'video_url',
                    TextField::class,
                    TextFieldOption::make()
                        ->label(__('Video URL'))
                        ->placeholder('https://youtu.be/xxxx')
                        ->helperText(__('Use the Youtube video link to be able to watch the video directly on the website.'))
                        ->metadata()
                )
                ->addAfter(
                    'video_url',
                    'video_thumbnail',
                    MediaImageField::class,
                    MediaImageFieldOption::make()
                        ->label(__('Video thumbnail'))
                        ->helperText(__('If you use the Youtube video link above, the thumbnail will be automatically obtained.'))
                        ->metadata()
                );
        });

        AccountForm::extend(function (AccountForm $form) {
            return $form
                ->addAfter(
                    'closeRow',
                    'social_links',
                    RepeaterField::class,
                    RepeaterFieldOption::make()
                        ->fields(Theme::getSocialLinksRepeaterFields())
                        ->label(__('Social links'))
                        ->metadata()
                        ->toArray()
                );
        });
    }

    if (is_plugin_active('contact')) {
        ContactForm::extend(function (ContactForm $form) {
            $form
                ->setFormInputClass('form-control style-1')
                ->modify(
                    'submit',
                    'submit',
                    [
                        'attr' => ['class' => 'tf-btn primary size-1'],
                        'label' => __('Send Message'),
                    ]
                );
        });
    }

    PageForm::extend(function (PageForm $form) {
        $form
            ->add(
                'breadcrumb',
                SelectField::class,
                SelectFieldOption::make()
                    ->label(__('Breadcrumb'))
                    ->metadata()
                    ->choices([
                        'yes' => __('Yes'),
                        'no' => __('No'),
                    ]),
            )
            ->add(
                'breadcrumb_background_color',
                ColorField::class,
                ColorFieldOption::make()
                    ->label(__('Breadcrumb background color'))
                    ->defaultValue(theme_option('breadcrumb_background_color', '#f7f7f7'))
                    ->metadata()
            )
            ->add(
                'breadcrumb_text_color',
                ColorField::class,
                ColorFieldOption::make()
                    ->label(__('Breadcrumb text color'))
                    ->defaultValue(theme_option('breadcrumb_text_color', '#161e2d'))
                    ->metadata()
            )
            ->add(
                'breadcrumb_background_image',
                MediaImageField::class,
                MediaImageFieldOption::make()
                    ->label(__('Breadcrumb background image'))
                    ->defaultValue(theme_option('breadcrumb_background_image'))
                    ->metadata()
            );
    });
});
