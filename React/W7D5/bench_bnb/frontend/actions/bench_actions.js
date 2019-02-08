import * as BenchAPIUtil from "../util/bench_api_util";

export const RECEIVE_BENCHES = "RECEIVE_BENCHES";

export const receiveBenches = benches => ({
  type: RECEIVE_BENCHES,
  benches
});

export const fetchBenches = bounds => dispatch => BenchAPIUtil.fetchBenches(bounds)
  .then(benches => dispatch(receiveBenches(benches)));

window.fetchBenches = fetchBenches;