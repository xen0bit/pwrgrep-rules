// react-href-var: an href built from a function argument sends the client
// wherever the caller names. Point at a constant instead. The rule only
// follows untyped parameters (see the rule header).
import React from 'react';

function Link(props, url) {
  const target = url.path;
  // ruleid: react-href-var
  return <a href={target}>go</a>;
}

function Direct(props, dest) {
  // ruleid: react-href-var
  return <a href={dest.value}>go</a>;
}

function Template(props, name) {
  const path = `/users/${name}`;
  // ruleid: react-href-var
  return <a href={path}>go</a>;
}

// ok: react-href-var
function Fixed() {
  return <a href="https://example.com/home">go</a>;
}

// ok: react-href-var
function Braced() {
  return <a href={"https://example.com/about"}>go</a>;
}
