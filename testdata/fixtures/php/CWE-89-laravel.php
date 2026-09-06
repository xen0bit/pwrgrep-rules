<?php
// CWE-89: a Laravel route's argument, or a superglobal, reaching DB::raw.
//
// The query builder parameterises for you; `DB::raw`, `DB::select`,
// `DB::statement` and `DB::unprepared` are the escape hatches that do not, and
// the string goes to the database as written. Binding is the fix: pass the
// value as the second argument and the driver sends it out of band.

Route::get('/user/{name}', function ($name) {
    // ruleid: laravel-api-route-sql-injection
    DB::select("SELECT * FROM users WHERE name = '" . $name . "'");
});

Route::post('/delete/{id}', function ($id) {
    // ruleid: laravel-api-route-sql-injection
    DB::statement("DELETE FROM users WHERE id = " . $id);
});

Route::get('/bound/{name}', function ($name) {
    // ok: laravel-api-route-sql-injection
    DB::select("SELECT * FROM users WHERE name = ?", [$name]);
});

Route::get('/fixed', function () {
    // ok: laravel-api-route-sql-injection
    DB::select("SELECT count(*) FROM users");
});
