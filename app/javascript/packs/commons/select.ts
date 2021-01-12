import "../../stylesheets/commons/select.scss"
import {MDCSelect} from '@material/select'

document.querySelectorAll('.mdc-select').forEach(element => {
  const select = new MDCSelect(element)
  const target = element.getAttribute('data-target')
  if (target) {
    select.listen('MDCSelect:change', () => {
      document.getElementById(target).value = select.value
    })
  }
})