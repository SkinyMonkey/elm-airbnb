import './main.css';
import { Main } from './Main.elm';
import registerServiceWorker from './registerServiceWorker';
import initializeMap from './initializeMap';

const app = Main.embed(document.getElementById('root'));

initializeMap(app)

registerServiceWorker();
