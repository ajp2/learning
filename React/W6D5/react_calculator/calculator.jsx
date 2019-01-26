import React from 'react';

class Calculator extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      result: 0,
      num1: "",
      num2: ""
    };

    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);

    this.clear = this.clear.bind(this);
    this.add = this.add.bind(this);
    this.subtract = this.subtract.bind(this);
    this.multiply = this.multiply.bind(this);
    this.divide = this.divide.bind(this);
  }

  setNum1(event) {
    const val = Number(event.target.value);
    if (event.target.value === "") {
      this.setState({ num1: "" });
    } else if (!Number.isNaN(val)) {
      this.setState({ num1: val });
    }
  }

  setNum2(event) {
    const val = Number(event.target.value);
    if (event.target.value === "") {
      this.setState({ num2: "" });
    } else if (!Number.isNaN(val)) {
      this.setState({ num2: val });
    }
  }

  clear(event) {
    event.preventDefault();
    this.setState({ result: 0, num1: "", num2: "" });
  }

  add(event) {
    event.preventDefault();
    const newResult = this.state.num1 + this.state.num2;
    this.setState({ result: newResult });
  }

  subtract(event) {
    event.preventDefault();
    const newResult = this.state.num1 - this.state.num2;
    this.setState({ result: newResult });
  }

  multiply(event) {
    event.preventDefault();
    const newResult = this.state.num1 * this.state.num2;
    this.setState({ result: newResult });
  }

  divide(event) {
    event.preventDefault();
    const newResult = this.state.num1 / this.state.num2;
    this.setState({ result: newResult });
  }

  render() {
    const { result, num1, num2 } = this.state;

    return (
      <div>
        <h1>{result}</h1>
        <input type="text" value={num2} onChange={this.setNum2} />
        <input type="text" value={num1} onChange={this.setNum1} />

        <button onClick={this.clear}>Clear</button>
        <br/>

        <button onClick={this.add}>+</button>
        <button onClick={this.subtract}>-</button>
        <button onClick={this.multiply}>*</button>
        <button onClick={this.divide}>/</button>
      </div>
    );
  }
}

export default Calculator;