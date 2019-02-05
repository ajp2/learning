import React from "react";

class PokemonForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      name: "",
      image_url: "",
      poke_type: "bug",
      attack: "",
      defense: "",
      moves: {}
    };

    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleChange = this.handleChange.bind(this);
    this.updateMoves = this.updateMoves.bind(this);
  }

  handleSubmit(e) {
    e.preventDefault();
    this.props.createPokemon(this.state)
      .then(res => this.props.history.push(`/pokemon/${res.pokemon.id}`));
  }

  handleChange(e) {
    this.setState({ [e.target.name]: e.target.value });
  }

  updateMoves(e) {
    this.setState({
      moves: Object.assign({}, this.state.moves, {
        [e.target.id]: e.target.value
      })
    });
  }

  render() {
    return (
      <form
        action="#"
        onSubmit={this.handleSubmit}
        className="pokemon-form"
      >
        <input
          type="text"
          name="name"
          placeholder="Name"
          value={this.state.name}
          onChange={this.handleChange}
        />
        <input
          type="text"
          name="image_url"
          placeholder="Image Url"
          value={this.state.image_url}
          onChange={this.handleChange}
        />

        <select
          value={this.state.poke_type}
          name="poke_type"
          onChange={this.handleChange}
        >
          {POKEMON_TYPES.map((type, i) => {
            return (
              <option value={type} key={i}>
                {type}
              </option>
            );
          })}
        </select>

        <input
          type="number"
          name="attack"
          placeholder="Attack"
          value={this.state.attack}
          onChange={this.handleChange}
        />
        <input
          type="number"
          name="defense"
          placeholder="Defense"
          value={this.state.defense}
          onChange={this.handleChange}
        />

        <input
          type="text"
          id="move_1"
          value={this.state.moves.move_1 || ""}
          placeholder="Move 1"
          onChange={this.updateMoves}
        />
        <input
          type="text"
          id="move_2"
          value={this.state.moves.move_2 || ""}
          placeholder="Move 2"
          onChange={this.updateMoves}
        />

        <button>Create Pokemon</button>
      </form>
    );
  }
}

export default PokemonForm;