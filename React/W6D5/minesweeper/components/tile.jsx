import React from "react";

class Tile extends React.Component {
  constructor(props) {
    super(props);
    this.handleClick = this.handleClick.bind(this);
  }

  handleClick(event) {
    let flagged;
    if (event.altKey) {
      flagged = true;
    } else {
      flagged = false;
    }

    this.props.updateGame(this.props.tile, flagged);
  }

  render() {
    const { tile } = this.props;
    let tileVal;
    let setClass;

    if (tile.explored && tile.bombed) {
      tileVal = "☢";
      setClass = " bombed";
    } else if (tile.flagged) {
      tileVal = "⚑";
      setClass = " flagged";
    } else if (tile.explored) {
      tileVal = tile.adjacentBombCount() || "";
      setClass = " revealed";
    } else {
      setClass = "";
    }

    return (
      <div className={`tile${setClass}`} onClick={this.handleClick}>{tileVal}</div>
      );
  }
}

export default Tile;