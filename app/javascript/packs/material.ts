import "../src/material.scss"
import * as mdc from 'material-components-web'
import window from './window'
window.mdc = mdc
document.addEventListener('DOMContentLoaded', () => {
  mdc.autoInit()
})