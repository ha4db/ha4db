import '../../stylesheets/map/common'
import 'ol/ol.css'
import { Map, View } from 'ol'
import WKT from 'ol/format/WKT'
import {Draw, Modify, Snap} from 'ol/interaction'
import GeometryType from 'ol/geom/GeometryType'
import VectorSource from 'ol/source/Vector'
import {Vector as VectorLayer} from 'ol/layer'
import gsi_std_layer from './layers/gsi-std'
import common_style from './styles/common_style'

const target = 'edit_feature_map'
const map = document.getElementById(target)
const zoom = 18
const center = [parseFloat(map.dataset.longitude), parseFloat(map.dataset.latitude)]
const view = new View({
  projection: 'EPSG:4326',
  center: center,
  zoom: zoom
})

const wkt = map.dataset.feature
const format = new WKT()

const features = []
if (wkt != '') {
  features.push(format.readFeature(wkt))
}

const vectorSource = new VectorSource({
  features: features,
})
const vectorLayer = new VectorLayer({
  source: vectorSource,
  style: common_style,
})
const map_obj = new Map({
  target: target,
  layers: [gsi_std_layer, vectorLayer],
  view: view
})

const modify = new Modify({source: vectorSource})
map_obj.addInteraction(modify)

let draw
let snap
const typeSelect = (document.getElementById('type') as HTMLSelectElement)
const input_obj = document.getElementById(map.dataset.target) as HTMLInputElement
function addInteractions() {
  draw = new Draw({
    source: vectorSource,
    type: typeSelect.value as GeometryType,
  })
  map_obj.addInteraction(draw)
  snap = new Snap({source: vectorSource});
  map_obj.addInteraction(snap)
  draw.on('drawstart', () => {
    vectorSource.clear()
  })
  draw.on('drawend', (evt) => {
    input_obj.value = format.writeFeature(evt.feature)
  })
}

typeSelect.onchange = function () {
  map_obj.removeInteraction(draw)
  map_obj.removeInteraction(snap)
  addInteractions()
}

addInteractions()