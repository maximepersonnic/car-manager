const closeDiv = (btn, div) => {
  if (btn) {
    btn.addEventListener('click', () => {
      div.classList.add("transition", "ease-in", "duration-100", "opacity-0")
      setTimeout(function() {
        div.classList.add("hidden");
      }, 100);
    });
  }
}

export { closeDiv };
