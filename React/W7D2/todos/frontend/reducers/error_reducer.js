import { RECEIVE_ERRORS, CLEAR_ERRORS } from "../actions/error_actions";

const initialState = {};

const errorsReducer = (state = initialState, action) => {
  switch (action.type) {
    case (RECEIVE_ERRORS):
      return action.errors;
    case (CLEAR_ERRORS):
      return [];
    default:
      return initialState;
  }
};

export default errorsReducer;