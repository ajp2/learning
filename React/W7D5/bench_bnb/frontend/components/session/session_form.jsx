import React, { Component } from "react";
import { Link, Redirect } from "react-router-dom";

export class SessionForm extends Component {
  constructor(props) {
    super(props);
    this.state = {
      username: "",
      password: ""
    };

    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(e) {
    this.setState({ [e.target.name]: e.target.value });
  }

  handleSubmit(e) {
    e.preventDefault();
    const user = Object.assign({}, this.state);
    this.props.processForm(user);
  }

  render() {
    const loginRoute = this.props.formType === "login";

    return (
      <div>
        <h2>{loginRoute ? "Log In" : "Sign Up"}</h2>
        <form>
          <label>Username:
            <input type="text" name="username" onChange={this.handleChange} value={this.state.username} />
          </label>

          <label>Password:
            <input type="password" name="password" onChange={this.handleChange} value={this.state.password} />
          </label>

          <button onClick={this.handleSubmit}>Submit</button>
        </form>

        {this.props.errors.length >= 1 ? (
        <ul>
          {this.props.errors.map((err, idx) => <li key={idx}>{err}</li>)}
        </ul>
        ) : false}
        
        {loginRoute ? (
          <Link to="/signup">Sign Up</Link>
        ) : (
          <Link to="/login">Log In</Link>
        )}
      </div>
    )
  }
}

export default SessionForm
