// jsx-label-not-i18n: a literal label is shown to the user untranslated.
// Pass it through t() instead. The rule reads single-attribute elements
// (see the rule header).
import React from 'react';
import { useTranslation } from 'react-i18next';

export function Form() {
  const { t } = useTranslation();
  // ruleid: jsx-label-not-i18n
  const a = <Tab label="Name" />;
  // ruleid: jsx-label-not-i18n
  const b = <TextField label="Email" />;
  // ruleid: jsx-label-not-i18n
  const c = <Tab label="Address" />;
  // ok: jsx-label-not-i18n
  const d = <Tab label="" />;
  // ok: jsx-label-not-i18n
  const e = <Tab label={t('common.name')} />;
  // ok: jsx-label-not-i18n
  const f = <Tab value="x" />;
  return [a, b, c, d, e, f];
}
declare function Tab(props: any): any;
declare function TextField(props: any): any;
