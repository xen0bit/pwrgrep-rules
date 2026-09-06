// react-find-dom: findDOMNode escapes React's abstraction; use refs instead.
import React from 'react';
import { findDOMNode } from 'react-dom';

export function bad(el: Element): void {
  // ruleid: react-find-dom
  const node = findDOMNode(el);
  console.log(node);
}

export function bad2(comp: React.Component): void {
  // ruleid: react-find-dom
  const node = React.findDOMNode(comp);
  console.log(node);
}

export function good(ref: React.RefObject<HTMLDivElement>): void {
  // ok: react-find-dom
  const node = ref.current;
  console.log(node);
}
