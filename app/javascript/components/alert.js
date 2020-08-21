import { closeDiv } from './general';

const initAlertClose = () => {
  const btn = document.getElementById('alert-btn-close');
  const alert = document.getElementById('alert');

  closeDiv(btn, alert);
}

export { initAlertClose };
