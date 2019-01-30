import React from "react";

class StepListItem extends React.Component {
  constructor(props) {
    super(props);

    this.toggleDone = this.toggleDone.bind(this);
    this.deleteStep = this.deleteStep.bind(this);
  }

  toggleDone(event) {
    const updatedStep = Object.assign({}, this.props.step);
    updatedStep.done = !updatedStep.done;
    this.props.receiveStep(updatedStep);
  }

  deleteStep(event) {
    this.props.removeStep(this.props.step);
  }

  render() {
    const doneTxt = this.props.step.done ? "Undo" : "Done";

    return (
      <div>
        <h2>{this.props.step.title}</h2>
        <p>{this.props.step.body}</p>
        <button onClick={this.toggleDone}>{doneTxt}</button>
        <button onClick={this.deleteStep}>Delete</button>
      </div>
    );
  }
}

export default StepListItem;