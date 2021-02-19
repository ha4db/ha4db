import '../../stylesheets/commons/dialog.scss'
import {MDCDialog} from '@material/dialog'
import {MDCList} from '@material/list'

const list = new MDCList(document.querySelector('.mdc-dialog .mdc-list'))

document.querySelectorAll('span.note').forEach((span: HTMLSpanElement) => {
  span.addEventListener('click', (ev) => {
    const current = ev.currentTarget as HTMLSpanElement
    const div = current.nextSibling as HTMLDivElement
    const dialog = new MDCDialog(div)
    dialog.listen('MDCDialog:opened', () => {
      list.layout()
    })
    dialog.open()
  })
})