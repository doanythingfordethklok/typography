import { Elm } from './elm/Main.elm';
import readme from '../README.md';

const app = Elm.Main.init({
  node: document.getElementById('root'),
  flags: readme
});
