import { RECEIVE_ALL_POKEMON, RECEIVE_SINGLE_POKEMON } from "../actions/pokemon_actions";
import { merge } from "lodash";

const pokemonReducer = (state = {}, action) => {
  switch (action.type) {
    case (RECEIVE_ALL_POKEMON):
      return action.pokemon;
    case (RECEIVE_SINGLE_POKEMON):
      const pokemonId = action.pokemon.pokemon.id;
      const pokemonInfo = action.pokemon.pokemon;
      
      const stateWithPokemonInfo = merge({}, state);
      stateWithPokemonInfo[pokemonId] = pokemonInfo;
      return stateWithPokemonInfo;
    default:
      return state;
  }
}

export default pokemonReducer;