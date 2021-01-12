import {MDCSelect} from '@material/select'

const selectDataType = () => {
  const select = document.getElementById('data_type-select')
  if (!select) {
    return
  }
  const mdc_select = new MDCSelect(select)
  if (!mdc_select) {
    return
  }
  const image_value = '1'
  const pointcloud_value = '5'
  const target_image = document.getElementById('image_metadata')
  const target_pointcloud = document.getElementById('pointcloud_metadata')
  mdc_select.listen('MDCSelect:change', () => {
    if (mdc_select.value != image_value) {
      target_image.style.display = 'none'
    } else {
      target_image.style.display = ''
    }
    if (mdc_select.value != pointcloud_value) {
      target_pointcloud.style.display = 'none'
    } else {
      target_pointcloud.style.display = ''
    }
  })
}

selectDataType()