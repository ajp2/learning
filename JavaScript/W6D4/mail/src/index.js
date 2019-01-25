

document.addEventListener("DOMContentLoaded", (e) => {
  const sidebarLis = document.querySelectorAll(".sidebar-nav li");

  sidebarLis.forEach(el => {
    el.addEventListener("click", event => {
      const text = el.innerText.toLowerCase();
      window.location.hash = text;
    });
  });
});