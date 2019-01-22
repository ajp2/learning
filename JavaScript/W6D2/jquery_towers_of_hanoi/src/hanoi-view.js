class View {
  constructor(hanoigame, $el) {
    this.hanoigame = hanoigame;
    this.$el = $el;
    this.setupTowers();
    this.render();
    this.$el.on("click", "ul", this.clickTower.bind(this));
  }

  setupTowers() {
    for (let i = 0; i < 3; i++) {
      const $grid = $("<ul>").data("tower", i);
      this.$el.append($grid);
    }

    const firstTower = $("ul:first-of-type");
    for (let j = 0; j < 3; j++) {
      firstTower.append($("<li>").addClass(`disc-${j + 1}`));
    }
  }

  render() {
    this.hanoigame.towers.forEach((arr, idx) => {
      const tower = $(".hanoi").find("ul")[idx];
      const $tower = $(tower);
      $tower.children().remove();

      arr.slice().reverse().forEach((disc) => {
        const $disc = $("<li>").addClass(`disc-${disc}`);
        $tower.append($($disc));
      });
    });
  }

  clickTower(event) {
    if (this.initialTower !== undefined) {
      const secondTower = $(event.currentTarget).data("tower");
      const returnVal = this.hanoigame.move(this.initialTower, secondTower)
      this.initialTower = undefined;
      this.render();
      this.$el.find("ul").removeClass("clicked");
    } else {
      this.initialTower = $(event.currentTarget).data("tower");
      $(event.currentTarget).addClass("clicked");
    }

    if (this.hanoigame.isWon()) {
      const $winMessge = $("<h2>").text("You won!!");
      $("body").append($winMessge);
      this.$el.off("click");
    }
  }
}

module.exports = View;