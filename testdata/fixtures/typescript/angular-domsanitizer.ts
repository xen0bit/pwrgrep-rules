// angular-bypasssecuritytrust: bypassSecurityTrust* switches off Angular's
// sanitization for the value. Pass a constant, or sanitize the input with
// DOMPurify first. Sources are untyped-holder functions with a typed string
// parameter (see the rule header).
import { DomSanitizer } from '@angular/platform-browser';

function a(sanitizer, input: string) {
  // ruleid: angular-bypasssecuritytrust
  return sanitizer.bypassSecurityTrustHtml(input);
}

function b(sanitizer, style: string) {
  // ruleid: angular-bypasssecuritytrust
  return sanitizer.bypassSecurityTrustStyle(style);
}

function c(sanitizer, url: string) {
  const target = url;
  // ruleid: angular-bypasssecuritytrust
  return sanitizer.bypassSecurityTrustUrl(target);
}

function d(sanitizer) {
  const safe = "<b>hi</b>";
  // ok: angular-bypasssecuritytrust
  return sanitizer.bypassSecurityTrustHtml(safe);
}

function e(sanitizer) {
  // ok: angular-bypasssecuritytrust
  return sanitizer.bypassSecurityTrustHtml("<b>hello</b>");
}
