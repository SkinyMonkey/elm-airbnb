export default function initializeMap(app) {

app.ports.initializeMap.subscribe(function (pos) {
  console.log("Initialize Map");

  var mapDiv = document.getElementById('map');

  if (mapDiv) {
    // Map
    var myLatlng = new google.maps.LatLng(pos);
    var mapOptions = {
      zoom: 15,
      center: myLatlng
    };
    var gmap = new google.maps.Map(mapDiv, mapOptions);

    window.gmap = gmap;

    // ugly trick to avoid the position = relative
    setTimeout(() => {
      document.getElementById('map').style.position = 'sticky'
    }, 100)

    // Listening for map move event
    app.ports.moveMap.subscribe(function (pos) {
      console.log("received", pos);
      var myLatlng = new google.maps.LatLng(pos);
      gmap.setCenter(myLatlng);
    });


  } else {
    console.log ("Cant find map dom");
  }

});
}
