import {MDCSelect} from '@material/select'

const selectImage = () => {
  const select = document.getElementById('data_type-select')
  if (!select) {
    return
  }
  const mdc_select = new MDCSelect(select)
  if (!mdc_select) {
    return
  }
  const image_value = '1'
  const target = document.getElementById('image_metadata')
  mdc_select.listen('MDCSelect:change', () => {
    if (mdc_select.value != image_value) {
      target.style.display = 'none'
    } else {
      target.style.display = ''
    }
  })
}

selectImage()