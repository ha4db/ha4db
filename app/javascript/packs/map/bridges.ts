import '../../stylesheets/map/common'
import '../../stylesheets/map/popup'
import 'ol/ol.css'
import { Map, View } from 'ol'
import Feature from 'ol/Feature'
import Overlay from 'ol/Overlay'
import Select from 'ol/interaction/Select'
import { click } from 'ol/events/condition'
import Point from 'ol/geom/Point'
import VectorSource from 'ol/source/Vector'
import {Vector as VectorLayer} from 'ol/layer'
import gsi_std_layer from './layers/gsi-std'
import common_style from './styles/common_style'

const target = 'map'
const zoom = 15
const center = [140.084556, 36.104611]
const view = new View({
  projection: 'EPSG:4326',
  center: center,
  zoom: zoom
})

const container = document.getElementById('popup')
const content = document.getElementById('popup-content')
const closer = document.getElementById('popup-closer')

const overlay = new Overlay({
  element: container,
  autoPan: true,
  autoPanAnimation: {
    duration: 250,
  },
})
closer.onclick = () => {
  overlay.setPosition(undefined)
  closer.blur()
  return false
}

const select = new Select({
  condition: click
})

const features = []
document.querySelectorAll('span.bridge_list').forEach((element: HTMLSpanElement) => {
  const longitude = parseFloat(element.dataset.longitude)
  const latitude = parseFloat(element.dataset.latitude)
  const title = element.dataset.title
  const url = element.dataset.url
  const iconFeature = new Feature({
    geometry: new Point([longitude, latitude]),
    name: title,
    url: url
  })
  features.push(iconFeature)
})

const vectorSource = new VectorSource({
  features: features,
})
const vectorLayer = new VectorLayer({
  source: vectorSource,
  style: common_style,
})


const map = new Map({
  target: target,
  layers: [gsi_std_layer, vectorLayer],
  view: view,
  overlays: [overlay]
})

map.addInteraction(select)
select.on('select', (e) => {
  if (e.selected.length > 0) {
    const selected = e.selected[0]
    const title = selected.get('name')
    const url = selected.get('url')
    const point = selected.getGeometry() as Point
    const coordinate = point.getCoordinates()
    content.innerHTML = `<a href='${url}'>${title}</a>`
    overlay.setPosition(coordinate)
  }
})

view.fit(vectorSource.getExtent())