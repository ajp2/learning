import React from "react";

class Clock extends React.Component {
  constructor() {
    super();
    this.state = {
      date: new Date()
    };

    this.tick = this.tick.bind(this);
  }

  tick() {
    this.setState({ date: new Date() });
  }

  componentDidMount() {
    this.interval = setInterval(this.tick, 1000);
  }

  componentWillUnmount() {
    clearInterval(this.interval);
  }

  render() {
    const { date } = this.state

    return <div>
        <h1>Clock</h1>

        <div className="clock-display">
          <p className="time">
            <span>Time:</span>
            <span>
              <span>{date.getHours()}:</span>
              <span>{date.getMinutes()}:</span>
              <span>{date.getSeconds()}</span>
            </span>
          </p>
          <p className="date">
            <span>Date:</span>
            <span>{date.toDateString()}</span>
          </p>
        </div>
      </div>;
  }
}

export default Clock;