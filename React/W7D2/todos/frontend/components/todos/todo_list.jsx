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
          {this.props.todos.map((todo, idx) => <TodoListItem key={idx} todo={todo} receiveTodo={this.props.receiveTodo} removeTodo={this.props.removeTodo} />)}
        </ul>
        <TodoForm receiveTodo={this.props.receiveTodo} createTodo={this.props.createTodo} />
      </div>
    );
  }
}

export default TodoList;