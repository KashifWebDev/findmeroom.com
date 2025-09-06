<?php

namespace Botble\Setting\Http\Controllers;

use Botble\Base\Exceptions\LicenseInvalidException;
use Botble\Base\Exceptions\LicenseIsAlreadyActivatedException;
use Botble\Base\Facades\BaseHelper;
use Botble\Base\Http\Responses\BaseHttpResponse;
use Botble\Base\Supports\Core;
use Botble\Base\Supports\Helper;
use Botble\Base\Supports\Language;
use Botble\Setting\Facades\Setting;
use Botble\Setting\Forms\GeneralSettingForm;
use Botble\Setting\Http\Requests\GeneralSettingRequest;
use Botble\Setting\Http\Requests\LicenseSettingRequest;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Str;
use Throwable;

class GeneralSettingController extends SettingController
{
    public function edit()
    {
        $this->pageTitle(trans('core/setting::setting.general_setting'));

        $form = GeneralSettingForm::create();

        return view('core/setting::general', compact('form'));
    }

    public function update(GeneralSettingRequest $request): BaseHttpResponse
    {
        $data = Arr::except($request->input(), [
            'locale',
        ]);

        $locale = $request->input('locale');
        if ($locale && array_key_exists($locale, Language::getAvailableLocales())) {
            session()->put('site-locale', $locale);
        }

        $isDemoModeEnabled = BaseHelper::hasDemoModeEnabled();

        if (! $isDemoModeEnabled) {
            $data['locale'] = $locale;
        }

        return $this->performUpdate($data);
    }

    public function getVerifyLicense(Request $request, Core $core)
    {
        $data = [
            'activated_at' => date('M d Y'),
            'licensed_to' => 'You',
        ];

        $core->clearLicenseReminder();

        return $this
            ->httpResponse()
            ->setMessage('Your license is activated.')->setData($data);
    }

    public function activateLicense(LicenseSettingRequest $request, Core $core)
    {
        $buyer = $request->input('buyer');

        if (filter_var($buyer, FILTER_VALIDATE_URL)) {
            $username = Str::afterLast($buyer, '/');
        }

        $purchasedCode = $request->input('purchase_code');

        $core->activateLicense($purchasedCode, $buyer);

        $data = $this->saveActivatedLicense($core, $buyer);

        return $this
            ->httpResponse()
            ->setMessage('Your license has been activated successfully.')
            ->setData($data);
    }

    public function deactivateLicense(Core $core)
    {
        return $this
            ->httpResponse()
            ->setMessage('Deactivated license successfully!');
    }

    public function resetLicense(LicenseSettingRequest $request, Core $core)
    {
        return $this
            ->httpResponse()
            ->setMessage('Your license has been reset successfully.');
    }

    protected function saveActivatedLicense(Core $core, string $buyer): array
    {
        Setting::forceSet('licensed_to', $buyer)->save();

        $core->clearLicenseReminder();

        return [
            'activated_at' => date('M d Y'),
            'licensed_to' => $buyer,
        ];
    }
}
