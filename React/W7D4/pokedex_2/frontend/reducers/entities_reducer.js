import { combineReducers } from "redux";
import pokemonReducer from "./pokemon_reducer";
import itemsReducer from "./items.reducer";

const entitiesReducer = combineReducers({
  pokemon: pokemonReducer,
  items: itemsReducer
});

export default entitiesReducer;