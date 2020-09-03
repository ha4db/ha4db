import "../../src/commons/button.scss"
import { MDCRipple } from '@material/ripple'

new MDCRipple(document.querySelector('.mdc_button'))
const iconButtonRipple = new MDCRipple(document.querySelector('.mdc-icon-button'));
iconButtonRipple.unbounded = true;
new MDCRipple(document.querySelector('.mdc-fab'))