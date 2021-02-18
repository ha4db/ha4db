import show_bridge_content from './show_bridge_content'
import {MDCSelect} from '@material/select'

const element = document.getElementById('bridge_content_id-select')
const select = new MDCSelect(element)
select.listen('MDCSelect:change', () => {
  const target = document.getElementById('show_data_view') as HTMLDivElement
  target.dataset.id = select.value
  const seek_input = document.getElementById('bridge_content_injury_seek') as HTMLInputElement
  seek_input.value = 0
  show_bridge_content()
})