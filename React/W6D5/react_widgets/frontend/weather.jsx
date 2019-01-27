import React from "react";

class Weather extends React.Component {
  constructor() {
    super();
    this.state = {
      weather: "loading weather..."
    }
  }

  componentWillMount() {
    navigator.geolocation.getCurrentPosition((pos) => {
      // const url = `http://api.openweathermap.org/data/2.5/weather?lat=${pos.coords.latitude}&lon=${pos.coords.longitude}&units=metric&APPID=7db5e6c3b824597d8087edda4ff99bfa`;
      const url = "http://google.com";
      let weather;

      const xml = new XMLHttpRequest();
      xml.open("GET", url);

      xml.onload = () => {
        if (xml.status === 200) {
          console.log(xml.responseText);
           let parsedWeather = JSON.parse(xml.responseText);
          weather = (
            <div>
              <p>{parsedWeather.name}</p>
              <p>{parsedWeather.main.temp} degrees</p>
            </div>
          );

          this.setState({ weather });
        } else {
          console.log("target reached, error");
        }
      };

      xml.send();
    });
  }

  render() {
    return (
      <div className="main-weather">
        <h1>Weather</h1>
        <div className="weather">{this.state.weather}</div>
      </div>
    )
  }
}

export default Weather;