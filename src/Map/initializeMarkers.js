import createMarker from './createMarker';

export default function initializeMarkers(app)  {

app.ports.initializeMarkers.subscribe(function (flats) {
  console.log('Initialize markers')

  var mapDiv = document.getElementById('map');

  if (mapDiv) {
  // TODO : chain setCenter with initializeMarkers instead
    window.gmap.setCenter(flats[0]);

    window.markers = flats.map(createMarker(app.ports, flats[0]));
  }
  else {
    console.error('no div found')
  }
});

}
