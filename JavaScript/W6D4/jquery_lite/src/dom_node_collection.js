class DOMNodeCollection {
  constructor(elList) {
    this.elList = elList;
  }

  html(str = undefined) {
    if (str !== undefined) {
      this.elList.forEach(el => el.innerHTML = str);
    }

    return this.elList[0].innerHTML;
  }

  empty() {
    this.html("");
  }

  append(args) {
    if (args instanceof DOMNodeCollection) {
      this.elList.forEach(el => {
        args.elList.forEach(arg => {
          el.innerHTML += arg.innerHTML;
        });
      });

    } else if (args instanceof HTMLElement) {
      this.elList.forEach(el => el.innerHTML += args.outerHTML);
    } else if (typeof(args) === "string") {
      this.elList.forEach(el => el.outerHTML += args);
    }
  }

  attr(attrName, value = undefined) {
    if (value === undefined) {
      return this.elList[0].getAttribute(attrName);
    }

    this.elList[0].setAttribute(attrName, value);
    return undefined;
  }

  addClass(name) {
    this.elList.forEach(el => el.classList.add(name));
  }

  removeClass(name) {
    this.elList.forEach(el => el.classList.remove(name));
  }

  children() {
    let childrenArr = [];
    this.elList.forEach(el => {
      childrenArr = childrenArr.concat(el.children);
    });

    return new DOMNodeCollection(childrenArr);
  }

  parent() {
    const parentArr = [];
    this.elList.forEach(el => parentArr.push(el.parentElement));
    return parentArr;
  }

  find(selector) {
    let nodes = [];
    this.elList.forEach(el => {
      nodes = nodes.concat(el.querySelectorAll(selector));
    });

    return new DOMNodeCollection(nodes);
  }

  remove() {
    this.elList.forEach(el => el.outerHTML = "");
  }

  on(event, callback) {
    this.elList.forEach(el => {
      el.addEventListener(event, callback);
      el.callback = callback;
    });
  }

  off(event) {
    this.elList.forEach(el => el.removeEventListener(event, el.callback));
  }
}

module.exports = DOMNodeCollection;