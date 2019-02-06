import React from "react";
import ReactDOM from "react-dom";
import configureStore from "./store/store";
import Root from "./components/root";

import { signup } from "./util/session_api_util";

document.addEventListener("DOMContentLoaded", () => {
  const store = configureStore();

  // Testing
  window.getState = store.getState;
  window.dispatch = store.dispatch;

  const rootEl = document.getElementById("root");
  ReactDOM.render(<Root store={store} />, rootEl);
});