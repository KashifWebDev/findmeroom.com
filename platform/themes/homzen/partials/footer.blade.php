@php
    $topFooterSidebar = dynamic_sidebar('top_footer_sidebar');
    $innerFooterSidebar = dynamic_sidebar('inner_footer_sidebar');
    $bottomFooterSidebar = dynamic_sidebar('bottom_footer_sidebar');
    $footerBackgroundColor = theme_option('footer_background_color', '#161e2d');
    $footerBackgroundImageOption = theme_option('footer_background_image');
    $footerBackgroundImage = $footerBackgroundImageOption ? RvMedia::getImageUrl($footerBackgroundImageOption) : null;
@endphp

@if($topFooterSidebar || $innerFooterSidebar || $bottomFooterSidebar)
    <footer class="footer" @style(["background-color: $footerBackgroundColor" => $footerBackgroundColor])>
        @if($footerBackgroundImage)
            <img class="footer-bg-image" src="{{ $footerBackgroundImage }}" alt="" loading="lazy" decoding="async" aria-hidden="true">
        @endif
        @if($topFooterSidebar)
            <div class="top-footer">
                <div class="container">
                    <div class="content-footer-top">
                        {!! $topFooterSidebar !!}
                    </div>
                </div>
            </div>
        @endif

        @if($innerFooterSidebar)
            <div class="inner-footer">
                <div class="container">
                    <div class="row">
                        {!! $innerFooterSidebar !!}
                    </div>
                </div>
            </div>
        @endif

        @if($bottomFooterSidebar)
            <div class="bottom-footer">
                <div class="container">
                    <div class="content-footer-bottom">
                        {!! $bottomFooterSidebar !!}
                    </div>
                </div>
            </div>
        @endif
    </footer>
@endif
