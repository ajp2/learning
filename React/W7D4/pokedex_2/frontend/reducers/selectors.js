export const selectAllPokemon = state => {
  return Object.values(state.entities.pokemon);
};

export const selectPokeItems = (state, poke) => {
  return poke && poke.item_ids ? poke.item_ids.map(id => state.entities.items[id]) : [];
}

export const selectPokemonItem = (state, itemId) => (
  state.entities.items[itemId]
);