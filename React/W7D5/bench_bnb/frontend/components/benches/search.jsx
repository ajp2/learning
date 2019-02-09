import React from "react";
import BenchMap from "./bench_map";
import BenchIndex from "./bench_index";
import FilterForm from "./filter_form";

const Search = ({ benches, fetchBenches, updateBounds }) => (
  <div className="bench-info">
    <BenchMap benches={benches} updateBounds={updateBounds} />
    <div>
      <FilterForm updateBounds={updateBounds} />
      <BenchIndex benches={benches} fetchBenches={fetchBenches} />
    </div>
  </div>
);
export default Search
