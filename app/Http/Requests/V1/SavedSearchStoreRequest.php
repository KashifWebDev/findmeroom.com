<?php

namespace App\Http\Requests\V1;

use App\Traits\ApiResponse;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Http\Exceptions\HttpResponseException;

class SavedSearchStoreRequest extends FormRequest
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
            'name' => 'required|string|max:100',
            'city_id' => 'nullable|exists:cities,id',
            'area_id' => 'nullable|exists:areas,id',
            'campus_id' => 'nullable|exists:campuses,id',
            'filters' => 'nullable|array',
            'filters.min_price' => 'nullable|integer|min:0',
            'filters.max_price' => 'nullable|integer|min:0',
            'filters.furnished' => 'nullable|boolean',
            'filters.gender_pref' => 'nullable|in:any,male_only,female_only',
            'filters.verified_level' => 'nullable|in:none,basic,verified',
            'filters.room_type' => 'nullable|in:private_room,shared_room,whole_place',
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
