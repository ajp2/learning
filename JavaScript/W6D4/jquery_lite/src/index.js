const DOMNodeCollection = require("./dom_node_collection");

const $1 = (selector) => {
  if (selector instanceof HTMLElement) {
    return new DOMNodeCollection([selector]);
  }

  let els = document.querySelectorAll(selector);
  els = Array.from(els);
  return new DOMNodeCollection(els);
}

window.$1 = $1;

console.log($1("body"));