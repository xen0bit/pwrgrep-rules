// i18next-key-format: keys must read 'MODULE.FEATURE.*' so missing
// translations are found by grep rather than by guessing.
import { useTranslation } from 'react-i18next';

export function Labels() {
  const { t } = useTranslation();
  // ruleid: i18next-key-format
  const a = t('submit');
  // ruleid: i18next-key-format
  const b = t('Title');
  // ruleid: i18next-key-format
  const c = t('buttons');
  // ok: i18next-key-format
  const d = t('common.buttons.submit');
  // ok: i18next-key-format
  const e = t('checkout.form.email-label');
  // ok: i18next-key-format
  const f = t('app.header.title');
  return a + b + c + d + e + f;
}
