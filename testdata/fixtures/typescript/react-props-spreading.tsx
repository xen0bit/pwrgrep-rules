// react-props-spreading: spreading passes unknown props (including event
// handlers) into the DOM. Name the props the component takes instead.
import React from 'react';

export function A(props: any) {
  // ruleid: react-props-spreading
  return <MyComponent {...props} />;
}

export function B(all: any) {
// ruleid: react-props-spreading
  return <input {...all} />;
}

export function C(extra: any) {
// ruleid: react-props-spreading
  return <button {...extra} />;
}

// ok: react-props-spreading
export function D(name: string) {
  return <MyComponent name={name} />;
}

// ok: react-props-spreading
export function E() {
  return <div className="a" />;
}
