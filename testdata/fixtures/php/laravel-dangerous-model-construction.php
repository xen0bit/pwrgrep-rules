<?php
// An empty $guarded list unguards every column: mass assignment can set
// whatever the request names. Populated guards and plain classes pass.

class OpenProfile extends Model
{
    // ruleid: laravel-dangerous-model-construction
    protected $guarded = [];
}

class OpenAvatar extends Model
{
    // ruleid: laravel-dangerous-model-construction
    protected $guarded = [];
}

class ClosedProfile extends Model
{
    // ok: laravel-dangerous-model-construction
    protected $guarded = ['is_admin'];
}

class PlainHelper
{
    // ok: laravel-dangerous-model-construction
    protected $guarded = [];
}
