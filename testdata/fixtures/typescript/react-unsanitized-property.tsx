// react-unsanitized-property: assigning a request-derived string to
// innerHTML parses it as markup. The receiver may be a ref's `current`
// (see the rule header).
import React from 'react';

function A(props, data) {
  const body = React.useRef(null);
  // ruleid: react-unsanitized-property
  body.current.innerHTML = data.html;
}

function B(props, data) {
  const panel = React.createRef(null);
  const html = data.html;
  // ruleid: react-unsanitized-property
  panel.current.outerHTML = html;
}

function C(props, data) {
  const box = React.useRef(null);
  // ruleid: react-unsanitized-property
  box.innerHTML = data.title;
}

// ok: react-unsanitized-property
function D() {
  const body = React.useRef(null);
  body.current.innerHTML = "fixed";
}

// ok: react-unsanitized-property
function E() {
  const body = React.useRef(null);
  body.current.textContent = "hello";
}
