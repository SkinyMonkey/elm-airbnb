export default function setCenter(app)  {
  app.ports.setCenter.subscribe(function (flat) {
    window.gmap.setCenter(flat);
  })
}
