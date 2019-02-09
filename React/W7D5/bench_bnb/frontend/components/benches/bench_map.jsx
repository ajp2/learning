import React, { Component } from "react";
import { withRouter } from "react-router-dom";
import MarkerManager from "../../util/marker_manager";

export class BenchMap extends Component {
  constructor(props) {
    super(props);
    
    this._handleClick = this._handleClick.bind(this);
  }

  componentDidMount() {
    const mapOptions = {
      center: { lat: 37.7758, lng: -122.435 },
      zoom: 13
    };

    this.map = new google.maps.Map(this.mapNode, mapOptions);
    this.MarkerManager = new MarkerManager(this.map);
    this.MarkerManager.updateMarkers(this.props.benches);

    this.map.addListener("click", this._handleClick);

    this.map.addListener("idle", () => {
      const getBounds = this.map.getBounds();
      const getNE = getBounds.getNorthEast();
      const getSW = getBounds.getSouthWest();
      const bounds = {
        northEast: { lat: getNE.lat(), lng: getNE.lng() },
        southWest: { lat: getSW.lat(), lng: getSW.lng() }
      };
      
      this.props.updateBounds("bounds", bounds);
    });
  }

  _handleClick(e) {
    const lat = e.latLng.lat();
    const lng = e.latLng.lng();
    this.props.history.push({
      pathname: "benches/new",
      search: `lat=${lat}&lng=${lng}`
    });
  }

  componentDidUpdate() {
    this.MarkerManager.updateMarkers(this.props.benches);
  }

  render() {
    return (
      <div id="map-container" ref={map => this.mapNode = map}>
      
      </div>
    )
  }
}

export default withRouter(BenchMap);
