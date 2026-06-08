@extends('plugins/real-estate::themes.dashboard.layouts.master')

@section('content')
    <x-core::card>
        <x-core::card.header>
            <x-core::card.title>
                {{ trans('plugins/findmeroom-room-request::room-request.account.menu') }}
            </x-core::card.title>
        </x-core::card.header>
        <x-core::card.body>
            @if ($roomRequests->isEmpty())
                <div class="empty">
                    <div class="empty-icon">
                        <x-core::icon name="ti ti-home-search" />
                    </div>
                    <p class="empty-title">
                        {{ trans('plugins/findmeroom-room-request::room-request.account.empty_title') }}
                    </p>
                    <p class="empty-subtitle text-muted">
                        {{ trans('plugins/findmeroom-room-request::room-request.account.empty_subtitle') }}
                    </p>
                    <div class="empty-action">
                        <a href="{{ route('public.room-request.create') }}" class="btn btn-primary">
                            {{ trans('plugins/findmeroom-room-request::room-request.account.post_need') }}
                        </a>
                    </div>
                </div>
            @else
                <div class="table-responsive">
                    <table class="table table-vcenter card-table">
                        <thead>
                            <tr>
                                <th>{{ trans('plugins/findmeroom-room-request::room-request.account.col_title') }}</th>
                                <th>{{ trans('plugins/findmeroom-room-request::room-request.form.location') }}</th>
                                <th>{{ trans('plugins/findmeroom-room-request::room-request.form.budget') }}</th>
                                <th>{{ trans('plugins/findmeroom-room-request::room-request.tables.status') }}</th>
                                <th>{{ trans('plugins/findmeroom-room-request::room-request.account.col_responses') }}</th>
                                <th>{{ trans('plugins/findmeroom-room-request::room-request.tables.created_at') }}</th>
                                <th>{{ trans('plugins/findmeroom-room-request::room-request.tables.approved_at') }}</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($roomRequests as $request)
                                <tr>
                                    <td>{{ $request->public_name }}</td>
                                    <td>{{ $request->displayLocationShort() }}</td>
                                    <td>{{ $request->displayBudget() }}</td>
                                    <td>{!! $request->status->toHtml() !!}</td>
                                    <td>{{ $request->visible_responses_count }}</td>
                                    <td>{{ $request->created_at->translatedFormat('M d, Y') }}</td>
                                    <td>{{ $request->approved_at ? $request->approved_at->translatedFormat('M d, Y') : '—' }}</td>
                                    <td>
                                        <a href="{{ route('public.account.room-requests.show', $request->getKey()) }}" class="btn btn-sm btn-primary">
                                            {{ trans('core/base::tables.view') }}
                                        </a>
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>

                @if ($roomRequests->hasPages())
                    <div class="mt-3">
                        {!! $roomRequests->links() !!}
                    </div>
                @endif
            @endif
        </x-core::card.body>
    </x-core::card>
@stop
