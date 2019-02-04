export const selectAllPokemon = state => {
  return Object.values(state.entities.pokemon);
};

export const selectSinglePokemon = (state, ownProps) => {
  const pokemonId = ownProps.match.params.pokemonId;
  return state.entities.pokemon[pokemonId];
}