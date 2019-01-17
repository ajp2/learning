class Board {
  constructor() {
    this.board = new Array(3).fill(undefined).map(el => new Array(3).fill(undefined));
  }

  draw() {
    for (let i = 0; i < this.board.length; i++) {
      if (this.board[i].some((el, idx) => this.empty([i, idx]))) {
        return false;
      }
    }

    return true;
  }

  won() {
    if (this.checkRows() || this.checkColumns() || this.checkDiagonals()) {
      return true;
    }

    return false;
  }

  winner() {
    const rows = this.checkRows();
    const cols = this.checkColumns();
    const diags = this.checkDiagonals();

    if (rows) {
      return rows[0]
    } else if (cols) {
      return cols[0];
    } else {
      return diags[0];
    }
  }

  checkRows() {
    for (let i = 0; i < this.board.length; i++) {
      const rowStr = this.board[i].join("");
      if (rowStr === "XXX" || rowStr === "OOO") {
        return rowStr;
      }
    }

    return false;
  }

  checkColumns() {
    for (let i = 0; i < this.board.length; i++) {
      const column = [];

      for (let j = 0; j < this.board.length; j++) {
        column.push(this.board[j][i]);
      }

      const colStr = column.join("");
      if (colStr === "XXX" || colStr === "OOO") {
        return colStr;
      }
    }

    return false;
  }

  checkDiagonals() {
    const winningStr = ["XXX", "OOO"];
    const topLeftDiag = [];
    const topRightDiag = [];

    for (let i = 0; i < this.board.length; i++) {
      topLeftDiag.push(this.board[i][i]);
      topRightDiag.push(this.board[i][this.board.length - 1 - i]);
    }

    const topLeftDiagStr = topLeftDiag.join("");
    const topRightDiagStr = topRightDiag.join("");

    if (winningStr.includes(topLeftDiagStr)) {
      return topLeftDiagStr;
    } else if (winningStr.includes(topRightDiagStr)) {
      return topRightDiagStr;
    }

    return false;
  }

  empty(pos) {
    return !this.board[pos[0]][pos[1]];
  }

  validMove(pos) {
    if ((pos[0] < 0 || pos[0] > 2) || (pos[1] < 0 || pos[1] > 2)) {
      return false;
    }

    return true;
  }

  place_mark(pos, mark) {
    if (this.validMove(pos) && this.empty(pos)) {
      this.board[pos[0]][pos[1]] = mark;
      return true;
    }

    return false;
  }

  print() {
    const printableBoard = [[], [], []];

    this.board.forEach((row, rowIdx) => {
      row.forEach((pos, idx) => {
        printableBoard[rowIdx].push(pos ? pos : "_");
      });
    });

    printableBoard.forEach(row => console.log(row));
  }
}

// const b = new Board();
// b.board[0][2] = "X";
// b.board[1][1] = "X";
// b.board[2][0] = "X";
// b.board[1][2] = "O";
// b.print();
// console.log(b.won());
// console.log(b.winner());


module.exports = Board;