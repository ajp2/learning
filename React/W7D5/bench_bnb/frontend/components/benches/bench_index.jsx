import React, { Component } from "react";
import BenchIndexItem from "./bench_index_item";

export class BenchIndex extends Component {
  componentDidMount() {
    this.props.fetchBenches();
  }

  render() {
    const { benches } = this.props;
    console.log(benches);
    if (benches.length === 0) return null;

    return (
      <section>
        <h2>Benches</h2>
        <div>
          {benches.map((bench, idx) => <BenchIndexItem key={idx} bench={bench} />)}
        </div>
      </section>
    );
  }
}

export default BenchIndex
