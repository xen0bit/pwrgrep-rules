// jsx-not-internationalized: element text must go through t() so the UI is
// translated. A name passed through t() with options is the fixed spelling.
import React from 'react';
import { useTranslation } from 'react-i18next';

export function Panel() {
  const { t } = useTranslation();
  // ruleid: jsx-not-internationalized
  const a = <p>Hello</p>;
  // ruleid: jsx-not-internationalized
  const b = <span>Worldwide</span>;
  // ruleid: jsx-not-internationalized
  const c = <h1>Welcome</h1>;
  // ok: jsx-not-internationalized
  const d = <p>{t('common.hello', {})}</p>;
  // ok: jsx-not-internationalized
  const e = <span>{t('common.world', {})}</span>;
  return [a, b, c, d, e];
}
