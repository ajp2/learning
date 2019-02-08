export default class MarkerManager {
  constructor(map) {
    this.map = map;
    this.markers = {};
  }

  updateMarkers(benches) {
    benches.forEach(bench => {
      if (!this.markers.hasOwnProperty(bench.id)) {
        this.createMarkerFromBench(bench);
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
}