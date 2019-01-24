const DOMNodeCollection = require("./dom_node_collection");

const $1 = (args) => {
  if (args instanceof HTMLElement) {
    return new DOMNodeCollection([args]);
  } else if (args instanceof Function) {
    const funcQueue = [];
    funcQueue.push(args);
    document.addEventListener("DOMContentLoaded", e => {
      funcQueue.forEach(func => func());
    })
  }

  let els = document.querySelectorAll(args);
  els = Array.from(els);
  return new DOMNodeCollection(els);
}

window.$1 = $1;

console.log($1("body"));