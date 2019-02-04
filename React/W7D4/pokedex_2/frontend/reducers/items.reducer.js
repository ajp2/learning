import { RECEIVE_SINGLE_POKEMON } from "../actions/pokemon_actions";

const itemsReducer = (state = {}, action) => {
  switch (action.type) {
    case (RECEIVE_SINGLE_POKEMON):
      return action.pokemon.items
    default:
      return state;
  }
};

export default itemsReducer;