import { RECEIVE_STEPS, RECEIVE_STEP, REMOVE_STEP } from "../actions/step_actions";

const initialState = {
  1: {
    id: 1,
    title: 'walk to store',
    done: false,
    todo_id: 1
  },
  2: {
    id: 2,
    title: 'buy soap',
    done: false,
    todo_id: 1
  }
};

const stepsReducer = (state = initialState, action) => {
  switch (action.type) {
    default:
      return state;
  }
};

export default stepsReducer;