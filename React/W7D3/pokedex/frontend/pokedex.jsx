import React from "react";
import ReactDOM from "react-dom";
import { fetchAllPokemon } from "./util/api_util";
import { receiveAllPokemon, requestAllPokemon } from "./actions/pokemon_actions";
import createStore from "./store/store";
import { selectAllPokemon } from "./reducers/selectors";

document.addEventListener("DOMContentLoaded", () => {
  const store = createStore();
  window.getState = store.getState;
  window.dispatch = store.dispatch;
  
  window.fetchAllPokemon = fetchAllPokemon;
  window.requestAllPokemon = requestAllPokemon;
  window.selectAllPokemon = selectAllPokemon;

  const rootEl = document.getElementById("root");
  ReactDOM.render(<h1>Pokedex</h1>, rootEl);
});