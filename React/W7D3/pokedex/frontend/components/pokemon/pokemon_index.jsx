import React from "react";

class PokemonIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.requestAllPokemon();
  }

  render() {
    return (
      <ul className="pokemon-list">
        {this.props.pokemon.map((poke, idx) => (
          <li key={idx} className="pokemon-index-item">
            <a href="#">
              <span>{poke.id}</span>
              <img src={poke.image_url} alt={poke.name} />
              <span>{poke.name}</span>
            </a>
          </li>
        ))}
      </ul>
    );
  }
}

export default PokemonIndex;