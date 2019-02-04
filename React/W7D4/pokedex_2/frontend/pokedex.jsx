import React from "react";
import ReactDOM from "react-dom";
import Root from "./components/root";
import createStore from "./store/store";

import { fetchSinglePokemon } from "./util/api_util";
import { requestSinglePokemon } from "./actions/pokemon_actions";

document.addEventListener("DOMContentLoaded", () => {
  const store = createStore();
  const rootEl = document.getElementById("root");

  window.store = store;
  window.requestSinglePokemon = requestSinglePokemon;

  ReactDOM.render(<Root store={store}/>, rootEl);
});