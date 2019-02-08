import { connect } from "react-redux";
import { fetchBenches } from "../../actions/bench_actions";
import { allBenches } from "../../reducers/selectors";
import Search from "./search";
import { updateBounds } from "../../actions/filter_actions";

const mapStateToProps = state => ({
  benches: allBenches(state)
});

const mapDispatchToProps = dispatch => ({
  fetchBenches: () => dispatch(fetchBenches()),
  updateBounds: bounds => dispatch(updateBounds(bounds))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Search);
