<?php

namespace App\Http\Requests\V1;

use App\Traits\ApiResponse;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Http\Exceptions\HttpResponseException;

class ListingUpdateRequest extends FormRequest
{
    use ApiResponse;

    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'title' => 'nullable|string|max:140',
            'description' => 'nullable|string',
            'area_id' => 'nullable|exists:areas,id',
            'rent_monthly' => 'nullable|integer|min:0',
            'room_type' => 'nullable|in:private_room,shared_room,whole_place',
            'campus_id' => 'nullable|exists:campuses,id',
            'deposit' => 'nullable|integer|min:0',
            'bills_included' => 'nullable|boolean',
            'gender_pref' => 'nullable|in:any,male_only,female_only',
            'furnished' => 'nullable|boolean',
            'available_from' => 'nullable|date',
            'available_to' => 'nullable|date',
            'address_line' => 'nullable|string|max:180',
            'lat' => 'nullable|numeric',
            'lng' => 'nullable|numeric',
            'amenities' => 'nullable|array',
            'amenities.*' => 'exists:amenities,id',
            'rules' => 'nullable|array',
            'rules.*.key' => 'string|max:40',
            'rules.*.value' => 'boolean',
        ];
    }

    /**
     * Handle a failed validation attempt.
     */
    protected function failedValidation(Validator $validator): void
    {
        throw new HttpResponseException(
            $this->fail('VALIDATION_ERROR', 'Validation failed', $validator->errors()->toArray(), 422)
        );
    }
}
