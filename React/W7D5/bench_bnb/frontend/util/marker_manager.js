export default class MarkerManager {
  constructor(map) {
    this.map = map;
    this.markers = {};
  }

  updateMarkers(benches) {
    let benchesObj = {};

    benches.forEach(bench => {
      benchesObj[bench.id] = bench;
      if (!this.markers.hasOwnProperty(bench.id)) {
        this.createMarkerFromBench(bench);
      }
    });

    Object.keys(this.markers).forEach(key => {
      if (!benchesObj[key]) {
        this.removeMarker(key);
      }
    });
  }

  createMarkerFromBench(bench) {
    const position = { lat: bench.lat, lng: bench.lng };
    const marker = new google.maps.Marker({
      position,
      title: bench.description
    });

    marker.setMap(this.map);
    this.markers[bench.id] = marker;
  }

  removeMarker(marker) {
    console.log(this.markers[marker]);
    
    this.markers[marker].setMap(null);
    delete this.markers[marker];
  }
}