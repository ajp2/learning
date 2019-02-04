import React from "react";
import ItemDetailContainer from "../items/item_detail_container";
import { Route, Link } from "react-router-dom";

class PokemonDetail extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.requestSinglePokemon(this.props.match.params.pokemonId);
  }

  componentDidUpdate(prevProps) {
    if (prevProps.match.params.pokemonId !== this.props.match.params.pokemonId) {
      this.props.requestSinglePokemon(this.props.match.params.pokemonId);
    }
  }

  render() {
    const pokemon = this.props.pokemon;
    const items = this.props.items;

    if (!pokemon) return null;
    
    return (
      <div>
        <img src={pokemon.image_url} alt={pokemon.name}/>
        <ul>
          <li><h2>{pokemon.name}</h2></li>
          <li><p>Type: {pokemon.poke_type}</p></li>
          <li><p>Attack: {pokemon.attack}</p></li>
          <li><p>Defense: {pokemon.defense}</p></li>
          <li><p>Moves: {pokemon.moves ? pokemon.moves.join(", ") : false}</p></li>
        </ul>
        <section>
          <h3>Items</h3>
          <ul>
            {items.map((item, idx) => (
              <li key={idx}>
                <Link to={`/pokemon/${pokemon.id}/item/${item.id}`}>
                  <img src={item.image_url} alt={item.name} />
                </Link>
              </li>)
            )}
          </ul>
        </section>

        <Route path="/pokemon/:pokemonId/item/:itemId" component={ItemDetailContainer} />
      </div>
    );
  }
}

export default PokemonDetail;