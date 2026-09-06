// CWE-79: XSS via dangerouslySetInnerHTML
import React from 'react';

function Vuln(props: any) {
  const user = props.name;
  // ruleid: typescript-xss
  return <div dangerouslySetInnerHTML={{__html: user}} />;
}
function Vuln2(props: any) {
  const data = props.data;
  // ruleid: typescript-xss
  return <span dangerouslySetInnerHTML={{__html: data}} />;
}
function Vuln3(props: any) {
  const x = props.x;
  // ruleid: typescript-xss
  return <p dangerouslySetInnerHTML={{__html: x}} />;
}
function Safe() {
  // ok: typescript-xss
  return <div dangerouslySetInnerHTML={{__html: "fixed"}} />;
}
function Safe2() {
  // ok: typescript-xss
  return <div dangerouslySetInnerHTML={{__html: "hello"}} />;
}
