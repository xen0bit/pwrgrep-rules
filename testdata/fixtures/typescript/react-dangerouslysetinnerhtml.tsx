// react-dangerouslysetinnerhtml: rendering a request-derived string as HTML
// runs its scripts. Sanitize it or set textContent instead. Sources are
// untyped function parameters read as member expressions (see the rule).
import React from 'react';

function A(props, data) {
  const html = data.html;
  // ruleid: react-dangerouslysetinnerhtml
  return React.createElement('div', { dangerouslySetInnerHTML: { __html: html } });
}

function B(props, data) {
  // ruleid: react-dangerouslysetinnerhtml
  return <div dangerouslySetInnerHTML={{ __html: data.html }} />;
}

function C(props, data) {
  const html = data.html;
  // ruleid: react-dangerouslysetinnerhtml
  return <span dangerouslySetInnerHTML={{ __html: html }} />;
}

// ok: react-dangerouslysetinnerhtml
function D() {
  return <div dangerouslySetInnerHTML={{ __html: "fixed" }} />;
}

// ok: react-dangerouslysetinnerhtml
function E() {
  return React.createElement('div', { dangerouslySetInnerHTML: { __html: "hello" } });
}
