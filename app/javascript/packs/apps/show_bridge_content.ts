import seekSupport from './seek'
import initOrthoView from '../map/ortho_image'
import { remove_select_tag } from '../map/editor/ortho_geojson_editor'
import edit_injury from '../pointcloud/edit_injury'

const target_id = 'show_data_view'
const target = document.getElementById(target_id)

const show_image = (url: string):void => {
  while (target.firstChild) {
    target.removeChild(target.firstChild)
  }
  const image_tag = document.createElement('img') as HTMLImageElement
  image_tag.src = url
  image_tag.style = 'max-width: 100%'
  target.appendChild(image_tag)
}

const show_video = (url: string, content_type: string):void => {
  while (target.firstChild) {
    target.removeChild(target.firstChild)
  }
  const video_tag = document.createElement('video') as HTMLVideoElement
  video_tag.src = url
  video_tag.controls = true
  video_tag.style = 'max-width: 100%'
  video_tag.id = 'video'
  video_tag.type = content_type
  target.appendChild(video_tag)
  seekSupport()
}

const show_ortho = (bridge_content_id: number, max_zoom: number, ortho_geojson: string): void => {
  while (target.firstChild) {
    target.removeChild(target.firstChild)
  }
  const div_tag = document.createElement('div') as HTMLDivElement
  div_tag.dataset.id = bridge_content_id
  div_tag.dataset.maxzoom = max_zoom
  div_tag.id = 'ortho_map'
  div_tag.style.maxWidth = '100%'
  target.appendChild(div_tag)
  const input_tag = document.createElement('input') as HTMLInputElement
  input_tag.hidden = true
  input_tag.id = 'bridge_content_injury_ortho_geojson'
  input_tag.value = ortho_geojson
  target.appendChild(input_tag)
  initOrthoView()
}

const show_pointcloud = (id, info):void => {
  while (target.firstChild) {
    target.removeChild(target.firstChild)
  }
  const pointcloud_tag = document.createElement('div') as HTMLElement
  pointcloud_tag.style = 'max-width: 100%; height: 700px;'
  pointcloud_tag.id = 'pointcloud'
  pointcloud_tag.dataset.id = id
  pointcloud_tag.dataset.x = info.x
  pointcloud_tag.dataset.y = info.y
  pointcloud_tag.dataset.z = info.z
  target.appendChild(pointcloud_tag)
  edit_injury()
}

const show_bridge_content = ():void => {
  const bridge_content_id = parseInt(target.dataset.id)
  if (bridge_content_id > 0) {
    const regular_inspection_id = parseInt(target.dataset.regular_inspection_id)
    const api_path = `/regular_inspections/${regular_inspection_id}/bridge_contents/${bridge_content_id}.json`
    fetch(api_path)
      .then(response => response.json())
      .then(data => {
        remove_select_tag()
        if (data.data_type == "1") {
          show_image(data.src)
        } else if (data.data_type == "2") {
          const content_type = data.content_type
          show_video(data.src, content_type)
        } else if (data.data_type == "4") {
          console.log(data)
          show_ortho(bridge_content_id, data.ortho_tile_info.max_zoom, data.ortho_geojson)
        } else if (data.data_type === '5') {
          show_pointcloud(data.id, data.pointcloud_info)
        }
      })
  }
}

show_bridge_content()

export default show_bridge_content
