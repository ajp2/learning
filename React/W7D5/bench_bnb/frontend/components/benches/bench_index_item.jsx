import React from 'react'

const BenchIndexItem = ({ idx, bench }) => (
  <div>
    <div>
      <span>Rating: </span>
      <span>5 </span>
      <span>Description: </span>
      <span>{bench.description}</span>
    </div>
    {/* img tag here */}
  </div>
);

export default BenchIndexItem
