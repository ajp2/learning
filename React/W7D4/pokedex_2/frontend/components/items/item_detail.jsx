import React from "react";

class ItemDetail extends React.Component {
  render() {
    const item = this.props.item;

    if (!item) return null;

    return (
      <ul>
        <li><h3>{item.name}</h3></li>
        <li><p>Happiness: {item.happiness}</p></li>
        <li><p>Price: ${item.price}</p></li>
      </ul>
    );
  }
}

export default ItemDetail;