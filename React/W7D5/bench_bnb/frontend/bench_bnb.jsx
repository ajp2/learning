import React from "react";
import ReactDOM from "react-dom";

import {signup} from "./util/session_api_util";

document.addEventListener("DOMContentLoaded", () => {
  const rootEl = document.getElementById("root");
  ReactDOM.render(<h1>test</h1>, rootEl);
});