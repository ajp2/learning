import React, { Component } from "react";
import { Link } from "react-router-dom";

export class Greeting extends Component {
  constructor(props) {
    super(props);

    this.handleLogout = this.handleLogout.bind(this);
  }

  handleLogout(e) {
    this.props.logout();
  }

  render() {
    const { currentUser } = this.props;

    return (
      <div>
        {currentUser ? (
          <div>
            <h2>Welcome {currentUser.username}</h2>
            <button onClick={this.handleLogout}>Log Out</button>
          </div>
        ) : (
          <div>
            <Link to="/signup">Sign Up</Link>
            <Link to="/login">Log In</Link>
          </div>
        )}
      </div>
    )
  }
}

export default Greeting
