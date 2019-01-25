class Router {
  constructor(node) {
    this.node = node;
  }

  start() {
    this.render();
    window.addEventListener("hashchange", this.render.bind(this));
  }

  activeRoute() {
    return window.location.hash.slice(1);
  }

  render() {
    this.node.innerHTML = "";
    const currentRoute = this.activeRoute();
    console.log(currentRoute);

    const pTag = document.createElement("p");
    pTag.innerHTML = currentRoute;
    this.node.appendChild(pTag);
  }
}

module.exports = Router;