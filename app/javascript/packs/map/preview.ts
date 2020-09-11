import '../../stylesheets/map/preview'
import 'ol/ol.css'
import { Map, View } from 'ol'
import Feature from 'ol/Feature'
import { Icon, Style } from 'ol/style'
import Point from 'ol/geom/Point'
import VectorSource from 'ol/source/Vector'
import {Vector as VectorLayer} from 'ol/layer'
import gsi_std_layer from './layers/gsi-std'

const target = 'preview_map'
const map = document.getElementById(target)
const zoom = 18
const center = [parseFloat(map.dataset.longitude), parseFloat(map.dataset.latitude)]
const view = new View({
  projection: 'EPSG:4326',
  center: center,
  zoom: zoom
})

// set icon

const iconFeature = new Feature({
  geometry: new Point(center)
})
const iconStyle = new Style({
  image: new Icon({
    imgSize: [50, 82],
    anchor: [0.5, 82],
    anchorXUnits: 'fraction',
    anchorYUnits: 'pixels',
    src: require('../../images/marker.svg')
  })
})
iconFeature.setStyle(iconStyle)
const vectorSource = new VectorSource({
  features: [iconFeature],
})
const vectorLayer = new VectorLayer({
  source: vectorSource,
})
new Map({
  target: 'preview_map',
  layers: [gsi_std_layer, vectorLayer],
  view: view
})
