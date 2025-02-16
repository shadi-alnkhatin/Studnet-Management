<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class RoleMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     * @param  string  $role
     * @return \Symfony\Component\HttpFoundation\Response
     */
    public function handle(Request $request, Closure $next, $role)
    {
        // Check if the user is not logged in
        if (!$request->user()) {
            return redirect()->guest(route('login'))->with('url.intended', $request->fullUrl());
        }

        // Check if the user's role does not match the required role
        if ($request->user()->role !== $role) {
            return abort(403, 'Unauthorized');
        }

        return $next($request);
    }
}