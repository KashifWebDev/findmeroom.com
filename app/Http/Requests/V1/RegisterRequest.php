<?php

namespace App\Http\Requests\V1;

use App\Traits\ApiResponse;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Http\Exceptions\HttpResponseException;

class RegisterRequest extends FormRequest
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
            'name' => 'required|string|max:120',
            'email' => 'nullable|email|unique:users,email',
            'phone_e164' => 'nullable|string|max:20|unique:users,phone_e164',
            'password' => 'required|string|min:8',
            'role' => 'nullable|in:tenant,landlord',
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
