import { connect } from "react-redux";
import { fetchBenches } from "../../actions/bench_actions";
import { allBenches } from "../../reducers/selectors";
import Search from "./search";

const mapStateToProps = state => ({
  benches: allBenches(state)
});

const mapDispatchToProps = dispatch => ({
  fetchBenches: () => dispatch(fetchBenches())
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Search);
