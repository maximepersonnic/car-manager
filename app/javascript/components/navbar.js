const initNavbarToggleDropdownPanel = () => {
  // desktop
  const btn = document.getElementById('user-menu');
  const dropdownPanel = document.getElementById('navbar-dropdown-panel');

  if (btn) {
    btn.addEventListener('click', () => {
      dropdownPanel.classList.toggle("hidden")
    });
  }

  // mobile
  const btnMobile = document.getElementById('navbar-btn-dropdown-mobile');
  const xIcon = document.getElementById('navbar-x-icon');
  const burgerIcon = document.getElementById('navbar-burger-icon');
  const dropdownPanelMobile = document.getElementById('navbar-dropdown-panel-mobile');

  if (btnMobile) {
    btnMobile.addEventListener('click', () => {
      xIcon.classList.toggle("hidden");
      burgerIcon.classList.toggle("hidden");
      dropdownPanelMobile.classList.toggle("hidden");
    });
  }
}

export { initNavbarToggleDropdownPanel };
