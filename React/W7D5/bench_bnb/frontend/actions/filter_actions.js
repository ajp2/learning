import { fetchBenches } from "./bench_actions";

export const UPDATE_BOUNDS = "UPDATE_BOUNDS";

export const changeBounds = (bounds, value) => ({
  type: UPDATE_BOUNDS,
  bounds
});

export const updateBounds = (filter, value) => {
  return (dispatch, getState) => {
    dispatch(changeBounds(filter, value));
    return fetchBenches(getState().ui.filters)(dispatch);
  };
};