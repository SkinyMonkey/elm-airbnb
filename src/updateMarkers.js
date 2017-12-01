export default function (app) {
  app.ports.updateMarkers.subscribe(function (flats) {
    window.markers.forEach((marker) => marker.setMap(null))

    window.gmap.setCenter(flats[0]);

    window.markers = flats.map(function (flat) {
      var marker = new google.maps.Marker({
        position: flat,
        title: flat.name
      });

      marker.setMap(window.gmap);

      return (marker);
    });
  })
}
