import React, { Component } from "react";
import BenchMap from "./bench_map";

export class BenchShow extends Component {
  componentDidMount() {
    this.props.fetchBench
      .then(res => {
        this.bench = res;
        this.forceUpdate();
      });
  }

  render() {
    if (!this.bench) return null;
    
    return (
      <div>
        <ul>
          <li>Rating: 4.6</li>
          <li>Description: {this.bench.description}</li>
          <li>Seats: {this.bench.seating}</li>
          <li>Latitude: {this.bench.lat}</li>
          <li>Longitude: {this.bench.lng}</li>
        </ul>
        <h3>Reviews</h3>
      </div>
    )
  }
}

export default BenchShow
