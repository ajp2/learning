const Router = require("./router");

document.addEventListener("DOMContentLoaded", (e) => {
  const contentDiv = document.querySelector(".content");
  const router = new Router(contentDiv);
  router.start();

  const sidebarLis = document.querySelectorAll(".sidebar-nav li");

  sidebarLis.forEach(el => {
    el.addEventListener("click", event => {
      const text = el.innerText.toLowerCase();
      window.location.hash = text;
    });
  });
});