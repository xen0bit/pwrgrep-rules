// mui-snackbar-message: snackbar text must go through t() so it is
// translated like every other string in the app.
import { useSnackbar } from 'notistack';
import { useTranslation } from 'react-i18next';

export function Notify() {
  const { enqueueSnackbar } = useSnackbar();
  const { t } = useTranslation();
  // ruleid: mui-snackbar-message
  enqueueSnackbar('Saved', { variant: 'success' });
  // ruleid: mui-snackbar-message
  enqueueSnackbar('Failed', { variant: 'error' });
  // ruleid: mui-snackbar-message
  enqueueSnackbar('Retry', { variant: 'warning' });
  // ok: mui-snackbar-message
  enqueueSnackbar(t('common.saved'), { variant: 'success' });
  // ok: mui-snackbar-message
  enqueueSnackbar(t('common.failed'), { variant: 'error' });
}
