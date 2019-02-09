import React, { Component } from "react";

export class FilterForm extends Component {
  constructor(props) {
    super(props);
    this.state = {
      minSeating: 1,
      maxSeating: 10
    }

    this.handleChange = this.handleChange.bind(this);
  }

  handleChange(e) {
    this.setState({ [e.target.name]: e.target.value });
    this.props.updateBounds(e.target.name, e.target.value);
  }
  render() {
    return (
      <form>
        <label>Minimum Seats:
          <input type="number" name="minSeating" value={this.state.minSeating} onChange={this.handleChange} />
        </label>

        <label>Maximum Seats:
          <input type="number" name="maxSeating" value={this.state.maxSeating} onChange={this.handleChange} />
        </label>
      </form>
    )
  }
}

export default FilterForm
