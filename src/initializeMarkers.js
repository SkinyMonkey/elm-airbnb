export default function initializeMarkers(app)  {

app.ports.initializeMarkers.subscribe(function (flats) {
  console.log('Initialize markers')

  var mapDiv = document.getElementById('map');

  if (mapDiv) {
  // TODO : add a setCenter port and chain it with initializeMarkers
  window.gmap.setCenter(flats[0]);

  window.markers = flats.map(function (flat) {
    var marker = new google.maps.Marker({
      position: flat,
      title: flat.name
    });

    marker.setMap(window.gmap);

    // TODO : on marker click, select right flat
    
    return (marker);
  });

  }
  else {
    console.error('no div found')
  }
});

}
