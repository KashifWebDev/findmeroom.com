<?php

namespace FindMeRoom\RoomRequest\Support;

class PhoneHelper
{
    public static function normalize(?string $phone): ?string
    {
        if (blank($phone)) {
            return null;
        }

        $phone = preg_replace('/[\s\-()]/', '', $phone);

        if (preg_match('/^03\d{9}$/', $phone)) {
            return '92' . substr($phone, 1);
        }

        if (preg_match('/^\+923\d{9}$/', $phone)) {
            return substr($phone, 1);
        }

        if (preg_match('/^923\d{9}$/', $phone)) {
            return $phone;
        }

        return $phone;
    }

    public static function isValidPakistanMobile(?string $phone): bool
    {
        $normalized = self::normalize($phone);

        if (! $normalized) {
            return false;
        }

        return (bool) preg_match('/^923\d{9}$/', $normalized);
    }
}
