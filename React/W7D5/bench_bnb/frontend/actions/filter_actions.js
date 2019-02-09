import { fetchBenches, updateFilter } from "./bench_actions";

export const updateBounds = (filter, value) => {
  return (dispatch, getState) => {
    dispatch(updateFilter(filter, value));
    return fetchBenches(getState().ui.filters)(dispatch);
  };
};