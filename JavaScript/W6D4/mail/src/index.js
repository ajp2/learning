const Router = require("./router");
const Inbox = require("./inbox");

const routes = {
  inbox: Inbox
};

document.addEventListener("DOMContentLoaded", (e) => {
  const contentDiv = document.querySelector(".content");
  const router = new Router(contentDiv, routes);
  router.start();
  window.location.hash = "inbox";

  const sidebarLis = document.querySelectorAll(".sidebar-nav li");

  sidebarLis.forEach(el => {
    el.addEventListener("click", event => {
      const text = el.innerText.toLowerCase();
      window.location.hash = text;
    });
  });
});