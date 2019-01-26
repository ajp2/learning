import React from "react";

const Header = (props) => (
  <li className="tab-header" onClick={props.clickHandler} data-index={props.index}>
    <h1>{props.tabInfo.title}</h1>
  </li>
);

export default Header;