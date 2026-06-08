<style>
    /* Select2 readability on public room request form (admin select2.css vars are undefined on frontend). */
    .flat-room-request-form .select-location-fields {
        position: relative;
        overflow: visible;
    }

    .flat-room-request-form .select-location-fields .select2-container {
        z-index: 1;
    }

    .flat-room-request-form .select-location-fields .select2-container--open {
        z-index: 1050;
    }

    .flat-room-request-form .select-location-fields .select2-container .select2-selection--single {
        background-color: #fff;
        border: 1px solid #dee2e6;
        color: #161e2d;
    }

    .flat-room-request-form .select-location-fields .select2-container--default .select2-selection--single .select2-selection__rendered {
        color: #161e2d;
    }

    .flat-room-request-form .select-location-fields .select2-container--default.select2-container--focus .select2-selection--single,
    .flat-room-request-form .select-location-fields .select2-container--default.select2-container--open .select2-selection--single {
        border-color: #86b7fe;
    }

    .flat-room-request-form .select-location-fields .select2-dropdown {
        background-color: #fff !important;
        border: 1px solid #dee2e6;
        border-radius: 0.375rem;
        box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
        z-index: 1051;
    }

    .flat-room-request-form .select-location-fields .select2-results,
    .flat-room-request-form .select-location-fields .select2-results__options {
        background-color: #fff;
    }

    .flat-room-request-form .select-location-fields .select2-results__option {
        background-color: #fff;
        color: #161e2d;
    }

    .flat-room-request-form .select-location-fields .select2-container--default .select2-results__option--highlighted[aria-selected] {
        background-color: #0d6efd;
        color: #fff;
    }

    .flat-room-request-form .select-location-fields .select2-container--default .select2-results__option[aria-selected="true"] {
        background-color: #e9ecef;
        color: #161e2d;
    }

    .flat-room-request-form .select-location-fields .select2-search--dropdown {
        background-color: #fff;
        padding: 8px;
    }

    .flat-room-request-form .select-location-fields .select2-search--dropdown .select2-search__field {
        background-color: #fff !important;
        border: 1px solid #dee2e6;
        color: #161e2d;
        border-radius: 0.375rem;
        padding: 0.375rem 0.75rem;
    }
</style>
