const createMarker = (ports, selectedFlat) => {
  return (flat) => {
    const selected = flat.lat === selectedFlat.lat &&
                     flat.lng === selectedFlat.lng;
    const className = selected ? "marker-selected" : "marker"
    const marker = new RichMarker({
        position: new google.maps.LatLng(flat.lat, flat.lng),
        icon: { url : 'http://1x1px.me/FF4D00-0.0.png' },
        map: window.gmap,
        content: `<div class=${className}>${flat.price}</div>`
    });

    marker.name = flat.name;

    /*
    marker.on('click', () => {
      ports.updateMarker(flat);
    })
    */

    return marker;
  }
}

export default createMarker;
