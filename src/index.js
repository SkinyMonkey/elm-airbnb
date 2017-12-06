import './main.css';
import { Main } from './Main.elm';

import registerServiceWorker from './Map/registerServiceWorker';
import initializeMap from './Map/initializeMap';
import initializeMarkers from './Map/initializeMarkers';
import updateMarkers from './Map/updateMarkers';
import setCenter from './Map/setCenter';

const app = Main.embed(document.getElementById('root'));

initializeMap(app)
initializeMarkers(app)
updateMarkers(app)
setCenter(app)

registerServiceWorker();
