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
    case (RECEIVE_STEPS):
      let newStepState = {};
      action.steps.forEach(step => newStepState[step.id] = step);
      return newStepState;
    case (RECEIVE_STEP):
      let nextState = Object.assign({}, state);
      nextState[action.step.id] = action.step;
      return nextState;
    case (REMOVE_STEP):
      let copy = Object.assign({}, state);
      delete copy[action.step.id];
      return copy;
    default:
      return state;
  }
};

export default stepsReducer;