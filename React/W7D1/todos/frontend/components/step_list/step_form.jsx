import React from "react";
import { uniqueId } from "../../util/util";

class StepForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      title: "",
      body: ""
    };

    this.createStep = this.createStep.bind(this);
    this.handleChange = this.handleChange.bind(this);
  }

  createStep(event) {
    event.preventDefault();
    const newStep = Object.assign({}, this.state, { id: uniqueId() });
    newStep.todo_id = this.props.todo_id;
    this.props.receiveStep(newStep);

    this.setState({ title: "", body: "" });
  }

  handleChange(event) {
    this.setState({ [event.target.name]: event.target.value });
  }

  render() {
    return (
      <form action="#" onSubmit={this.createStep}>
        <label htmlFor="step_title">Title:</label>
        <br/>
        <input type="text" placeholder="walk to store" id="step_title" name="title" onChange={this.handleChange} value={this.state.title} />
        <br/><br/>

        <label htmlFor="step_body">Description</label>
        <br/>
        <input type="text" placeholder="google store directions" id="step_body" name="body" onChange={this.handleChange} value={this.state.body} />
        <br/><br/>

        <input type="submit" value="Create Step!"/>
      </form>
    );
  }
}

export default StepForm;