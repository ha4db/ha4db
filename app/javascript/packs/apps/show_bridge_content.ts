import seekSupport from './seek'
import initOrthoView from '../map/ortho_image'
import { remove_select_tag } from '../map/editor/ortho_geojson_editor'

const show_image = (target: HTMLDivElement, url: string): void => {
  while (target.firstChild) {
    target.removeChild(target.firstChild)
  }
  const image_tag = document.createElement('img') as HTMLImageElement
  image_tag.src = url
  image_tag.style = 'max-width: 100%'
  target.appendChild(image_tag)
}

const show_video = (target: HTMLDivElement, url: string, content_type: string): void => {
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

const show_ortho = (target: HTMLDivElement, bridge_content_id: number, max_zoom: number, ortho_geojson: string): void => {
  while (target.firstChild) {
    target.removeChild(target.firstChild)
  }
  const div_tag = document.createElement('div') as HTMLDivElement
  div_tag.dataset.id = bridge_content_id
  div_tag.dataset.maxzoom = max_zoom
  div_tag.id = 'ortho_map'
  div_tag.style.maxWidth = '100%'
  target.appendChild(div_tag)
  console.log(div_tag.clientWidth)
  if (div_tag.clientWidth < 250) {
    div_tag.style.minWidth = "500px";
  }
  const input_tag = document.createElement('input') as HTMLInputElement
  input_tag.hidden = true
  input_tag.id = 'bridge_content_injury_ortho_geojson'
  input_tag.value = ortho_geojson
  target.appendChild(input_tag)
  initOrthoView()
}

const show_bridge_content = (target_node: HTMLDivElement | null):void => {
  const target_id1 = 'show_data_view'
  const target1 = document.getElementById(target_id1) as HTMLDivElement
  const target2 = target_node
  let target: HTMLDivElement
  if (target2 && target2.dataset.preview == 'true') {
    target = target2
  } else {
    target = target1
  }

  const bridge_content_id = parseInt(target.dataset.id)
  if (bridge_content_id > 0) {
    const regular_inspection_id = parseInt(target.dataset.regular_inspection_id)
    const api_path = `/regular_inspections/${regular_inspection_id}/bridge_contents/${bridge_content_id}.json`
    fetch(api_path)
      .then(response => response.json())
      .then(data => {
        remove_select_tag()
        if (data.data_type == "1") {
          show_image(target, data.src)
        } else if (data.data_type == "2") {
          const content_type = data.content_type
          show_video(target, data.src, content_type)
        } else if (data.data_type == "4") {
          show_ortho(target, bridge_content_id, data.ortho_tile_info.max_zoom, data.ortho_geojson)
        }
      })
  }
}

show_bridge_content(null)

export default show_bridge_content