import createMarker from './createMarker';

export default function (app) {
  app.ports.updateMarkers.subscribe(function (flatsTuple) {
    window.markers.forEach((marker) => marker.setMap(null)); // remove markers

    const flats = flatsTuple[0]
    const selectedFlat = flatsTuple[1]

    window.markers = flats.map(createMarker(app.ports, selectedFlat));
    window.gmap.setCenter(selectedFlat);
  })
}
