import { connect } from "react-redux";
import { fetchBenches } from "../../actions/bench_actions";
import { allBenches } from "../../reducers/selectors";
import Search from "./search";
import { updateBounds } from "../../actions/filter_actions";


const mapStateToProps = state => ({
  benches: allBenches(state),
  minSeating: state.ui.filters.minSeating,
  maxSeating: state.ui.filters.maxSeating
});

const mapDispatchToProps = dispatch => ({
  fetchBenches: () => dispatch(fetchBenches()),
  updateBounds: (filter, value) => dispatch(updateBounds(filter, value))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Search);
