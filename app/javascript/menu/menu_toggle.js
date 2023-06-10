/* Query html elements */
const body = document.querySelector("body");
const menu = document.querySelector(".toggle_menu");
const nav = document.querySelector("#desktop-nav");
const menuOptions = document.querySelectorAll("#desktop-nav li a");

/* Toggle menu on mobile */
const toggleMenu = () => {
  nav.classList.toggle("hidden");
  nav.classList.toggle("popup-menu");
  body.classList.toggle("no-scroll");
};

/* Add event listner to the menu on mobile */
document.addEventListener("DOMContentLoaded", () => {
  menu.addEventListener("click", toggleMenu);
});

/* Close menu when user clicks on a menu option */
document.addEventListener("DOMContentLoaded", () => {
  menuOptions.forEach((option) => {
    option.addEventListener("click", () => {
      if (nav.classList.contains("popup-menu")) {
        toggleMenu();
      }
    });
  });
});

/* Close menu when user clicks outside the menu */
document.addEventListener("DOMContentLoaded", () => {
  body.addEventListener("click", (e) => {
    if (e.target.classList.contains("popup-menu")) {
      toggleMenu();
      e.stopPropagation(); //stop event propagation
    }
  });
});
