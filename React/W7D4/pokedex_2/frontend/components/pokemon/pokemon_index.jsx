import React from "react";
import PokemonIndexItem from "./pokemon_index_item";
import PokemonDetailContainer from "./pokemon_detail_container";
import PokemonFormContainer from "./pokemon_form_container";
import { Route } from "react-router-dom";

class PokemonIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.requestAllPokemon();
  }

  render() {
    const pokemonItems = this.props.pokemon.map(poke => <PokemonIndexItem key={poke.id} pokemon={poke} />);

    return (
      <section className="pokedex">
        <ul className="pokemon-list">
          {pokemonItems}
        </ul>
        <Route exact path="/" component={PokemonFormContainer} />
        {this.props.pokemon.length > 1 ? <Route path="/pokemon/:pokemonId" component={PokemonDetailContainer} /> : false }
      </section>
    );
  }
}

export default PokemonIndex;