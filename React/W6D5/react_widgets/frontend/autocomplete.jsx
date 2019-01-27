import React from "react";

class AutoComplete extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      inputVal: ""
    };

    this.changeInput = this.changeInput.bind(this);
    this.handleClick = this.handleClick.bind(this);
  }

  changeInput(event) {
    this.setState({ inputVal: event.target.value });
  }

  handleClick(event) {
    this.setState({ inputVal: event.target.innerText });
  }

  render() {
    const { inputVal } = this.state;
    const { names } = this.props;
    const filteredNames = names.filter(name =>
      name.toLowerCase().startsWith(inputVal.toLowerCase())
    );

    return (
      <div className="autocomplete">
        <h1>Autocomplete</h1>
        <div className="innerDiv">
          <input type="text" placeholder="Search..." value={this.state.inputVal} onChange={this.changeInput} />
          <ul>
            {
              filteredNames.map((name, idx) => <li key={idx} onClick={this.handleClick}>{name}</li> )
            }
          </ul>
        </div>
      </div>
    )
  }
}

export default AutoComplete;