import React from "react";

class TodoDetailView extends React.Component {
  constructor(props) {
    super(props);

    this.deleteTodo = this.deleteTodo.bind(this);
  }

  deleteTodo(event) {
    this.props.removeTodo(this.props.todo.id);
  }

  render() {
    return (
      <div>
        <p>{this.props.todo.body}</p>
        <button onClick={this.deleteTodo}>Delete Todo</button>
      </div>
    );
  }
}

export default TodoDetailView;