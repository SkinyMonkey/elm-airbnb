import './main.css';
import { Main } from './Main.elm';
import registerServiceWorker from './registerServiceWorker';
import initializeMap from './initializeMap';
import initializeMarkers from './initializeMarkers';
import updateMarkers from './updateMarkers';

const app = Main.embed(document.getElementById('root'));

initializeMap(app)
initializeMarkers(app)
updateMarkers(app)

registerServiceWorker();
