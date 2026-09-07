const express = require('express');
function setup() {
  // ruleid: detect-no-csrf-before-method-override
  express.csrf();
  express.methodOverride();
}
function setupAgain() {
  // ruleid: detect-no-csrf-before-method-override
  express.csrf();
  express.methodOverride();
}
function setupThird() {
  // ruleid: detect-no-csrf-before-method-override
  express.csrf();
  express.methodOverride();
}
function safeReverse() {
  // ok: detect-no-csrf-before-method-override
  express.methodOverride();
  express.csrf();
}
function safeOnlyCsrf() {
  // ok: detect-no-csrf-before-method-override
  express.csrf();
}
function safeOther() {
  // ok: detect-no-csrf-before-method-override
  console.log('safe');
}
