const Board = require('./board');

class Game {
  constructor(reader, p1, p2) {
    this.board = new Board();
    this.p1 = p1;
    this.p2 = p2;
    this.current_mark = "X";
    this.reader = reader;
  }

  run(reader, completionCallback) {
    this.board.print();
    this.promptMove((pos) => {
      if (this.board.place_mark(pos, this.current_mark)) {
        console.log("Move successful");
        this.changeTurn();
      } else {
        console.log("Invalid move. Try again.");
      }

      if (this.board.won()) {
        this.board.print();
        console.log(`Congratulations! Player ${this.board.winner()} won!`)
        completionCallback();
      } else if (this.board.draw()) {
        this.board.print();
        console.log("Draw!");
        completionCallback();
      } else {
        this.run(reader, completionCallback);
      }
      
    });
  }

  promptMove(cb) {
    this.reader.question(`Enter a move ${this.current_mark}: `, (res) => {
      const pos = res.split(" ");
      cb(pos);
    });
  }

  changeTurn() {
    this.current_mark = this.current_mark === "X" ? "O" : "X";
  }
}

module.exports = Game;