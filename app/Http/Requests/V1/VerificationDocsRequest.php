<?php

namespace App\Http\Requests\V1;

use App\Traits\ApiResponse;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Http\Exceptions\HttpResponseException;

class VerificationDocsRequest extends FormRequest
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
            'cnic' => 'required|file|mimes:jpeg,png,webp,pdf|max:5120',
            'selfie' => 'required|image|mimes:jpeg,png,webp|max:5120',
            'proof' => 'required|file|mimes:jpeg,png,webp,pdf|max:5120',
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
