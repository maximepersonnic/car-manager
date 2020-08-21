import { closeDiv } from './general';

const initNoticeClose = () => {
  const btn = document.getElementById('notice-btn-close');
  const notice = document.getElementById('notice');

  closeDiv(btn, notice);
}

export { initNoticeClose };
