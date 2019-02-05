export const fetchAllPokemon = () => (
  $.ajax({
    method: "GET",
    url: "/api/pokemon"
  })
);

export const fetchSinglePokemon = id => (
  $.ajax({
    method: "GET",
    url: `/api/pokemon/${id}`
  })
);

export const createPokemon = pokemon => {
  pokemon.moves = Object.keys(pokemon.moves).map(move => pokemon.moves[move]);
  return $.ajax({
    method: "POST",
    url: "/api/pokemon",
    data: { pokemon }
  });
};