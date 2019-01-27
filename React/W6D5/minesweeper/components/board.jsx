import React from "react";
import Tile from "./tile";

class Board extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    const grid = this.props.board.grid;

    return (
      <div>
        {
          grid.map((row, idx) => <div key={idx}>{idx}</div>)
        }
      </div>
    );
  }
}

export default Board;