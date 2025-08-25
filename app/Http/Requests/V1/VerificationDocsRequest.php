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
            'id_proof' => 'nullable|image|mimes:jpeg,png,webp|max:5120',
            'address_proof' => 'nullable|image|mimes:jpeg,png,webp|max:5120', 
            'income_proof' => 'nullable|image|mimes:jpeg,png,webp|max:5120',
        ];
    }
    
    public function withValidator($validator)
    {
        $validator->after(function ($validator) {
            $files = ['id_proof', 'address_proof', 'income_proof'];
            $hasAnyFile = false;
            
            foreach ($files as $file) {
                if ($this->hasFile($file)) {
                    $hasAnyFile = true;
                    break;
                }
            }
            
            if (!$hasAnyFile) {
                $validator->errors()->add('documents', 'At least one verification document is required.');
            }
        });
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
