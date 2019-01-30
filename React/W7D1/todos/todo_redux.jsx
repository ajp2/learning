import React from "react";
import ReactDOM from "react-dom";
import configureStore from "./frontend/store/store";
import Root from "./frontend/components/root";

import { stepsByTodoId } from "./frontend/reducers/selectors";

document.addEventListener("DOMContentLoaded", () => {
  const store = configureStore();
  window.store = store;
  
  const rootEl = document.getElementById("root");
  ReactDOM.render(<Root store={store}/>, rootEl)
});