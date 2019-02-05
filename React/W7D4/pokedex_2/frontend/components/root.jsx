import React from "react";
import { Provider } from "react-redux";
import PokemonIndexContainer from "./pokemon/pokemon_index_container";
import { HashRouter, Route } from "react-router-dom";

const Root = ({ store }) => (
  <Provider store={store}>
    <HashRouter>
      <section className="main">
        <Route path="/" component={PokemonIndexContainer} />
      </section>
    </HashRouter>
  </Provider>
);

export default Root;