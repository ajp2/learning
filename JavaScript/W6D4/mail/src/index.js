const Router = require("./router");
const Inbox = require("./inbox");
const Sent = require("./sent");
const Compose = require("./compose");

const routes = {
  inbox: Inbox,
  sent: Sent,
  compose: Compose
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