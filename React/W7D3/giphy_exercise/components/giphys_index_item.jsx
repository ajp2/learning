import React from "react";

const GiphysIndexItem = ({ giphy }) => (
  <div>
    {console.log(giphy)}
    <img src={giphy.url} alt="Giphy"/>
  </div>
);

export default GiphysIndexItem;