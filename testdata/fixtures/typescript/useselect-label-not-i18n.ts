// useselect-label-not-i18n: the label argument of useSelect must go through
// t() so the dropdown label is translated.
import { useTranslation } from 'react-i18next';

declare function useSelect(a: unknown, b: unknown, label: string, d: unknown): unknown;

export function Pickers(store: unknown, opts: unknown, extra: unknown) {
  const { t } = useTranslation();
  // ruleid: useselect-label-not-i18n
  const a = useSelect(store, opts, 'Country', extra);
  // ruleid: useselect-label-not-i18n
  const b = useSelect(store, opts, 'City', extra);
  // ruleid: useselect-label-not-i18n
  const c = useSelect(store, opts, 'Language', extra);
  // ok: useselect-label-not-i18n
  const d = useSelect(store, opts, t('common.country'), extra);
  // ok: useselect-label-not-i18n
  const e = useSelect(store, opts, t('common.city'), extra);
  return [a, b, c, d, e];
}
