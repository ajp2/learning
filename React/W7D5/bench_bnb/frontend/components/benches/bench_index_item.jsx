import React, { Component } from "react";
import { withRouter } from "react-router-dom";

export class BenchIndexItem extends Component {
  constructor(props) {
    super(props);

    this.handleClick = this.handleClick.bind(this);
  }

  handleClick(e) {
    this.props.history.push(`/benches/${this.props.bench.id}`);
  }


  render() {
    return (
      <div onClick={this.handleClick}>
        <div>
          <span>Rating: </span>
          <span>5 </span>
          <span>Description: </span>
          <span>{this.props.bench.description}</span>
        </div>
        {/* img tag here */}
      </div>
    )
  }
}

export default withRouter(BenchIndexItem);
