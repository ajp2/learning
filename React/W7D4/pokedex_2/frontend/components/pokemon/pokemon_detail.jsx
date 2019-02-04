import React from "react";

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

    return (
      <div>
        <h2>sdf</h2>
        <h1>{pokemon.name}</h1>
        <img src={pokemon.image_url} alt={pokemon.name}/>
        <p>{pokemon.attack}</p>
      </div>
    );
  }
}

export default PokemonDetail;