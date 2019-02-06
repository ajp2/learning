import { connect } from "react-redux";
import { signup } from "../../actions/session_actions";
import SessionForm from "./session_form";

const mapStateToProps = state => ({
  errors: state.errors.session,
  formType: "signup",
  currentUser: state.entities.users[state.session.id]
});

const mapDispatchToProps = dispatch => ({
  processForm: formUser => dispatch(signup(formUser))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(SessionForm);
