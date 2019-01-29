import React from "react";

class TodoListItem extends React.Component {
  constructor(props) {
    super(props);

    this.deleteTodo = this.deleteTodo.bind(this);
    this.toggleTodo = this.toggleTodo.bind(this);
  }

  deleteTodo(event) {
    this.props.removeTodo(this.props.todo.id);
  }

  toggleTodo(event) {
    const updatedTodo = Object.assign({}, this.props.todo);
    updatedTodo.done = !updatedTodo.done;
    this.props.receiveTodo(updatedTodo);
  }

  render() {
    const done = this.props.todo.done ? "Undo" : "Done";

    return (
      <li>
        <div>
          <a href="#">{this.props.todo.title}</a>
          <button onClick={this.toggleTodo}>{done}</button>
          <button onClick={this.deleteTodo}>Delete Todo</button>
        </div>
      </li>
    );
  }
}

export default TodoListItem;