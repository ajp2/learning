import React from "react";
import Header from "./header";

class Tabs extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      index: 0 
    };

    this.changeTab = this.changeTab.bind(this);
  }

  changeTab(event) {
    this.setState({ index: event.currentTarget.dataset.index });
  }

  render() {
    return (
      <div className="tabs">
        <h1>Tabs</h1>
        <ul className="tabs-list">
          {
            this.props.info.map((tab, idx) => {
              return <Header tabInfo={tab} key={idx} index={idx} clickHandler={this.changeTab} />;
            })
          }
        </ul>
        <article>{this.props.info[this.state.index].content}</article>
      </div>
    );
  }
}

export default Tabs;