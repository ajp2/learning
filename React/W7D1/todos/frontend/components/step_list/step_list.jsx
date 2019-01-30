import React from "react";
import StepListItemContainer from "./step_list_item_container";

class StepList extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <div>
        <ul>
          {this.props.steps.map((step, idx) => <StepListItemContainer key={idx} step={step} />)}
        </ul>
      </div>
    );
  }
}

export default StepList;