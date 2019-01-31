import { connect } from "react-redux";
import { deleteTodo } from "../../actions/todo_actions";
import { receiveSteps } from "../../actions/step_actions";
import TodoDetailView from "./todo_detail_view";

const mapDispatchToProps = dispatch => ({
  deleteTodo: id => dispatch(deleteTodo(id)),
  receiveSteps: steps => dispatch(receiveSteps(steps))
});

export default connect(null, mapDispatchToProps)(TodoDetailView);