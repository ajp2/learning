import { UPDATE_BOUNDS } from "../actions/filter_actions";
import { UPDATE_FILTER } from "../actions/bench_actions";

const defaultState = {
  bounds: {},
  minSeating: 1,
  maxSeating: 10
};

const filterReducer = (state = defaultState, action) => {
  Object.freeze(state);
  switch (action.type) {
    case UPDATE_FILTER:
      const newState = Object.assign({}, state);
      newState[action.filter] = action.value;
      return newState;
    default:
      return state;
  }
};

export default filterReducer;