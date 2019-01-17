const Board = require('./board');

class Game {
  constructor() {
    this.board = new Board();
    this.current_mark = "X";
  }

  run(reader, completionCallback) {
    this.board.print();
    this.promptMove(reader, (pos) => {
      if (this.board.place_mark(pos, this.current_mark)) {
        console.log("Move successful");
        this.changeTurn();
      } else {
        console.log("Invalid move. Try again.");
      }

      this.checkGameOver(reader, completionCallback);
    });
  }

  promptMove(reader, cb) {
    reader.question(`Enter a move ${this.current_mark}: `, (res) => {
      const pos = res.split(" ");
      cb(pos);
    });
  }

  changeTurn() {
    this.current_mark = this.current_mark === "X" ? "O" : "X";
  }

  checkGameOver(reader, completionCallback) {

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
    
  }
}

module.exports = Game;