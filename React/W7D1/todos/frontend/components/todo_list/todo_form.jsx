import React from "react";
import { uniqueId } from "../../util/util";
import { receiveTodo } from "../../actions/todo_actions";

class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      title: "",
      body: ""
    };

    this.onChange = this.onChange.bind(this);
    this.onSubmit = this.onSubmit.bind(this);
  }

  onChange(event) {
    this.setState({ [event.target.name]: event.target.value });
  }

  onSubmit(event) {
    event.preventDefault();

    const newTodo = Object.assign({}, this.state, { id: uniqueId() });
    this.props.receiveTodo(newTodo);

    this.setState({ title: "", body: "" });
  }

  render() {
    return (
      <form action="#" onSubmit={this.onSubmit}>
        <label htmlFor="todo_title">Title:</label>
        <br/>
        <input type="text" name="title" id="todo_title" placeholder="buy milk" onChange={this.onChange} value={this.state.title} />
        <br/><br/>

        <label htmlFor="todo_body">Body:</label>
        <br/>
        <textarea name="body" id="todo_body" onChange={this.onChange} value={this.state.body} />
        <br/><br/>

        <button>Create Todo!</button>
      </form>
    )
  }
}

export default TodoForm;