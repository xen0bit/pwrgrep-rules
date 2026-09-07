// react-markdown-insecure-html: allowDangerousHtml (or escapeHtml={false},
// or custom transform URIs) lets markdown render raw HTML and script URIs.
// Drop the flag so HTML is escaped.
import React from 'react';
import ReactMarkdown from 'react-markdown';

export function A(doc: string) {
  // ruleid: react-markdown-insecure-html
  return <ReactMarkdown allowDangerousHtml />;
}

export function B(doc: string) {
// ruleid: react-markdown-insecure-html
  return <ReactMarkdown escapeHtml={false} />;
}

export function C(doc: string) {
// ruleid: react-markdown-insecure-html
  return <ReactMarkdown transformLinkUri={null} />;
}

// ok: react-markdown-insecure-html
export function D(doc: string) {
  return <ReactMarkdown source={doc} />;
}

// ok: react-markdown-insecure-html
export function E(doc: string) {
  return <ReactMarkdown>{doc}</ReactMarkdown>;
}
