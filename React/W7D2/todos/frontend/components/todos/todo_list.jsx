import React from "react";
import TodoListItem from "../todo_list/todo_list_item";
import TodoForm from "../todo_list/todo_form";

class TodoList extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.fetchTodos();
  }

  render() {
    return (
      <div>
        <ul>
          {this.props.todos.map((todo, idx) => <TodoListItem key={idx} todo={todo} updateTodo={this.props.updateTodo} />)}
        </ul>
        <TodoForm createTodo={this.props.createTodo} errors={this.props.errors} />
      </div>
    );
  }
}

export default TodoList;