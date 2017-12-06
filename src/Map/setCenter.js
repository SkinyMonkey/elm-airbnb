export default function setCenter(app)  {
  app.ports.setCenter.subscribe(function (flat) {
    const newMarker = flat[0]
    const oldMarker = flat[1]

    if (newMarker.name !== oldMarker.name) {
      window.markers.forEach((marker) => {
        if (marker.name === newMarker.name) {
          const content = marker.getContent();
          marker.setContent(content.replace('marker', 'marker-selected'))
        }

        if (marker.name === oldMarker.name) {
          const content = marker.getContent();
          marker.setContent(content.replace('marker-selected', 'marker'))
        }
      })
    }

    window.gmap.panTo(newMarker);
  })
}
