const initAlertClose = () => {

  const btn = document.getElementById('alert-btn-close');
  const alert = document.getElementById('alert');

  if (btn) {
    btn.addEventListener('click', () => {
      alert.classList.add("transition", "ease-in", "duration-100", "opacity-0")
      setTimeout(function() {
        alert.classList.add("hidden");
      }, 100);
    });
  }

}

export { initAlertClose };
