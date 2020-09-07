import "../../stylesheets/commons/list.scss"
import {MDCList} from '@material/list'
import {MDCRipple} from '@material/ripple'

document.querySelectorAll('.mdc-list').forEach(element => {
  const list = new MDCList(element)
  list.listElements.map((listItemEl) => new MDCRipple(listItemEl))
})

