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
          grid.map((row, idx) => {
            return (
              <div key={idx}>
                { row.map((tile, idx2) => <Tile key={idx2} tile={tile} updateGame={this.props.updateGame} />) }
              </div>
            )
          })
        }
      </div>
    );
  }
}

export default Board;