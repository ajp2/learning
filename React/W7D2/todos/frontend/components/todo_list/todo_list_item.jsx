import React from "react";
import TodoDetailViewContainer from "./todo_detail_view_container";

class TodoListItem extends React.Component {
  constructor(props) {
    super(props);
    this.state = { detail: false };

    this.toggleTodo = this.toggleTodo.bind(this);
    this.showDetails = this.showDetails.bind(this);
  }

  toggleTodo(event) {
    const updatedTodo = Object.assign({}, this.props.todo);
    updatedTodo.done = !updatedTodo.done;
    this.props.updateTodo(updatedTodo);
  }

  showDetails(event) {
    this.setState({ detail: !this.state.detail });
  }

  render() {
    const done = this.props.todo.done ? "Undo" : "Done";

    return (
      <li>
        <div>
          <a href="#" onClick={this.showDetails}>{this.props.todo.title}</a>
          <button onClick={this.toggleTodo}>{done}</button>
          {this.state.detail ? <TodoDetailViewContainer todo={this.props.todo} /> : false}
        </div>
      </li>
    );
  }
}

export default TodoListItem;