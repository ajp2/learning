class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupBoard();
  }

  bindEvents() {
    this.$el.on('click', 'li', event => {
      this.makeMove($(event.currentTarget));
    });
  }

  makeMove($square) {
    const currentPlayer = this.game.currentPlayer;

    try {
      this.game.playMove($square.data("pos"));
    } catch(e) {
      alert("This " + e.msg.toLowerCase());
    }

    $square.addClass("clicked").text(currentPlayer);

    if (this.game.isOver()) {
      this.$el.off("click");
      if (this.game.winner()) {
        this.$el.append($("<h2>").text(this.game.winner() + " won!"));
      } else {
        this.$el.append($("<h2>").text("Draw!"));
      }
    }
  }

  setupBoard() {
    const $grid = $('<ul>');
    for (let rowIdx = 0; rowIdx < 3; rowIdx++) {
      for (let colIdx = 0; colIdx < 3; colIdx++) {
        const $li = $('<li>').data("pos", [rowIdx, colIdx]);
        $grid.append($($li));
      }
    }

    this.$el.append($grid);
    this.bindEvents();
  }
}

module.exports = View;
