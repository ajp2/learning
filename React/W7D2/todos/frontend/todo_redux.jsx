import React from "react";
import ReactDOM from "react-dom";
import configureStore from "./store/store";
import Root from "./components/root";

import { fetchTodos } from "./util/todo_api_util";

document.addEventListener("DOMContentLoaded", () => {
  const store = configureStore();
  window.store = store;
  
  const rootEl = document.getElementById("content");
  ReactDOM.render(<Root store={store}/>, rootEl)
});