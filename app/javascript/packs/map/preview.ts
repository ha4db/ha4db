import '../../stylesheets/map/preview'
import 'ol/ol.css'
import { Map, View } from 'ol'
import Feature from 'ol/Feature'
import Point from 'ol/geom/Point'
import WKT from 'ol/format/WKT'
import VectorSource from 'ol/source/Vector'
import {Vector as VectorLayer} from 'ol/layer'
import gsi_std_layer from './layers/gsi-std'
import common_style from './styles/common_style'

const target = 'preview_map'
const map = document.getElementById(target)
const zoom = 18
const center = [parseFloat(map.dataset.longitude), parseFloat(map.dataset.latitude)]
const view = new View({
  projection: 'EPSG:4326',
  center: center,
  zoom: zoom
})

const iconFeature = new Feature({
  geometry: new Point(center)
})

const wkt = map.dataset.feature
const format = new WKT()

let features = [iconFeature]
if (wkt != '') {
  features = [format.readFeature(wkt)]
}

const vectorSource = new VectorSource({
  features: features,
})
const vectorLayer = new VectorLayer({
  source: vectorSource,
  style: common_style,
})
new Map({
  target: 'preview_map',
  layers: [gsi_std_layer, vectorLayer],
  view: view
})
