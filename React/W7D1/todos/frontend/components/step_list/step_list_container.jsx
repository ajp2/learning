import { connect } from "react-redux";
import StepList from "./step_list";
import { receiveStep } from "../../actions/step_actions";
import { stepsByTodoId } from "../../reducers/selectors";

const mapStateToProps = (state, ownProps) => ({
  steps: stepsByTodoId(state, ownProps.todo.id),
  todo_id: ownProps.todo.id
});

const mapDispatchToProps = dispatch => ({
  receiveStep: step => dispatch(receiveStep(step))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(StepList);