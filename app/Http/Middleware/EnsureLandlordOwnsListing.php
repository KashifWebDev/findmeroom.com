<?php

namespace App\Http\Middleware;

use App\Models\Listing;
use App\Traits\ApiResponse;
use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class EnsureLandlordOwnsListing
{
    use ApiResponse;

    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        $listing = $request->route('listing');
        
        // Admin can access any listing
        if (auth()->user()->hasRole('admin')) {
            return $next($request);
        }
        
        // Ensure the authenticated user owns this listing
        if (auth()->id() !== $listing->landlord->user_id) {
            return $this->fail('FORBIDDEN', 'You do not own this listing.', null, 403);
        }
        
        return $next($request);
    }
}
