import React, { Component } from "react";

export class BenchForm extends Component {
  constructor(props) {
    super(props);
    this.state = {
      description: "",
      seats: 2
    };

    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(e) {
    this.setState({ [e.target.name]: e.target.value });
  }

  handleSubmit(e) {
    e.preventDefault();
    const bench = {
      ...this.state,
      lat: this.props.lat,
      lng: this.props.lng
    };

    this.props.createBench(bench);
    this.props.history.push("/");
  }

  render() {
    return (
      <form>
        <label>Description:
          <input type="text" name="description" onChange={this.handleChange} value={this.state.description} />
        </label>

        <label>Number of Seats:
          <input type="number" name="seats" onChange={this.handleChange} value={this.state.seats} />
        </label>

        <label>Latitude:
          <input type="text" disabled value={this.props.lat} />
        </label>

        <label>Longitude:
          <input type="text" disabled value={this.props.lng} />
        </label>

        <button onClick={this.handleSubmit}>Create Bench</button>
      </form>
    )
  }
}

export default BenchForm
