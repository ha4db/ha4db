import "../../src/commons/button.scss"
import { MDCRipple } from '@material/ripple'

const mdc_buttons = document.querySelectorAll('.mdc_button')
mdc_buttons.forEach(mdc_button => {
  new MDCRipple(mdc_button)
})

const mdc_icon_buttons = document.querySelectorAll('.mdc-icon-button')
mdc_icon_buttons.forEach(mdc_icon_button => {
  const iconButtonRipple = new MDCRipple(mdc_icon_button);
  iconButtonRipple.unbounded = true;
})

const mdc_fabs = document.querySelectorAll('.mdc-fab')
mdc_fabs.forEach(mdc_fab => {
  new MDCRipple(mdc_fab)
})
