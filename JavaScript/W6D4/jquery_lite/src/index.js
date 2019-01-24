const DOMNodeCollection = require("./dom_node_collection");

const $1 = (args) => {
  if (args instanceof HTMLElement) {
    return new DOMNodeCollection([args]);
  } else if (args instanceof Function) {
    const funcQueue = [];
    funcQueue.push(args);
    document.addEventListener("DOMContentLoaded", e => {
      funcQueue.forEach(func => func());
    });
  } else {
    let els = document.querySelectorAll(args);
    els = Array.from(els);
    return new DOMNodeCollection(els);
  }
};

$1.extend = (target, ...otherObjs) => {
  otherObjs.forEach(obj => {
    Object.keys(obj).forEach(key => {
      if (target.key === undefined) {
        target[key] = obj[key];
      }
    });
  });

  return target;
};

$1.ajax = (options) => {
  const defaults = {
    url: window.location.href,
    method: "GET",
    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
    data: {},
    success: () => {},
    error: () => {},
  };

  const updatedOptions = $1.extend(options, defaults);

  const xhr = new XMLHttpRequest();

  xhr.open(updatedOptions.method, updatedOptions.url);
  xhr.onload = (e) => {
    if (xhr.status === 200) {
      updatedOptions.success(xhr.response);
    } else {
      updatedOptions.error(request.response);
    }

  };
  xhr.send(JSON.stringify(updatedOptions.data));
};

window.$1 = $1;

console.log($1("body"));