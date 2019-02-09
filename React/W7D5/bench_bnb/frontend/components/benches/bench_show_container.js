import { connect } from "react-redux";
import BenchShow from "./bench_show";
import { fetchBench } from "../../util/bench_api_util";

const mapStateToProps = (state, ownProps) => ({
  fetchBench: fetchBench(ownProps.match.params.benchId)
});

export default connect(mapStateToProps)(BenchShow);