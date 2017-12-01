export default function initializeMarkers(app)  {

app.ports.initializeMarkers.subscribe(function (flats) {
  console.log('Initialize markers')

  var mapDiv = document.getElementById('map');

  if (mapDiv) {
  // TODO : add a setCenter port and chain it with initializeMarkers
  window.gmap.setCenter(flats[0]);

  window.markers = flats.map(function (flat, index) {
    var className = index === 0 ? "marker-selected" : "marker"
    var marker = new RichMarker({
      position: new google.maps.LatLng(flat.lat, flat.lng),
      icon: { url : 'http://1x1px.me/FF4D00-0.0.png' },
      map: window.gmap,
      content: `<div class=${className}>${flat.price}</div>`
    });

    marker.name = flat.name;

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
