import { RECEIVE_SINGLE_POKEMON } from "../actions/pokemon_actions";
import { merge } from "lodash";

const itemsReducer = (state = {}, action) => {
  switch (action.type) {
    case (RECEIVE_SINGLE_POKEMON):
      const items = action.pokemon.items;
      return merge({}, state, items);
    default:
      return state;
  }
};

export default itemsReducer;