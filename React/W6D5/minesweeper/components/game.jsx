import React from "react";
import * as Minesweeper from "../minesweeper";
import Board from "./board";

class Game extends React.Component {
  constructor() {
    super();
    this.state = {
      board: new Minesweeper.Board(9, 10)
    };

    this.updateGame = this.updateGame.bind(this);
    this.restartGame = this.restartGame.bind(this);
  }

  updateGame(tile, flagged) {
    if (flagged) {
      tile.toggleFlag();
    } else {
      tile.explore();
    }

    this.setState({ board: this.state.board });
  }

  restartGame() {
    this.setState({ board: new Minesweeper.Board(9, 10) });
  }

  render() {
    let message;

    if (this.state.board.won()) {
      message = <p>You won!</p>;
    } else if (this.state.board.lost()) {
      message = <p>You lost!</p>
    }

    let gameOver;
    if (message) {
      gameOver = true;
    }

    return (
      <div className="game">
        <h1>Minesweeper</h1>
        <Board board={this.state.board} updateGame={this.updateGame} />
        {gameOver ? (
          <div className="modal">
            <div className="modal-display">
              {message}
              <button className="gameOver" onClick={this.restartGame}>Play Again</button>
            </div>
          </div>
        ) : false}
      </div>
    );
  }
}

export default Game;