import '../../stylesheets/map/edit_poi'
import 'ol/ol.css'
import { Map, View } from 'ol'
import Feature from 'ol/Feature'
import { Icon, Style } from 'ol/style'
import Point from 'ol/geom/Point'
import VectorSource from 'ol/source/Vector'
import {Vector as VectorLayer} from 'ol/layer'
import gsi_std_layer from './layers/gsi-std'

const target = 'edit_poi_map'
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
const map_obj = new Map({
  target: target,
  layers: [gsi_std_layer, vectorLayer],
  view: view
})

// move to center
map_obj.on('click', (evt) => {
  iconFeature.setGeometry(new Point(evt.coordinate))
  map.dataset.longitude = evt.coordinate[0]
  map.dataset.latitude = evt.coordinate[1]
})