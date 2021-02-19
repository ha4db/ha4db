import 'ol/ol.css'
import '../../stylesheets/map/ortho'
import Map from 'ol/Map'
import View from 'ol/View'
import { projection } from './projections/ortho'
import get_ortho_layer from './layers/ortho'
import {OverviewMap, defaults as defaultControls} from 'ol/control'
import {
  DragRotateAndZoom,
  defaults as defaultInteractions,
} from 'ol/interaction'

const initOrthoView = ():void => {

  const view = new View({
    projection: projection,
    extent: [0, 0, 256, 256],
    center: [0, 256],
    zoom: 0,
    showFullExtent: true,
  })

  const target = 'ortho_map'
  const target_obj = document.getElementById(target)
  if (!target_obj) {
    return
  }
  const id:string = target_obj.dataset.id
  const path = `/ortho_images/${id}`
  const max_zoom: number = parseInt(target_obj.dataset.maxzoom)

  const layer = get_ortho_layer(path, max_zoom)

  const overviewMapControl = new OverviewMap({
    className: 'ol-overviewmap ol-custom-overviewmap',
    layers: [get_ortho_layer(path, max_zoom)],
    collapseLabel: '\u00BB',
    label: '\u00AB',
    collapsed: false,
    rotateWithView: true,
    view: new View({
      projection: projection,
    })
  })

  const map = new Map({
    controls: defaultControls().extend([overviewMapControl]),
    interactions: defaultInteractions().extend([new DragRotateAndZoom()]),
    target: target,
    layers: [
      layer
    ],
    view: view
  })
  console.log(map)
  map.on('singleclick', evt => {
    console.log(evt.coordinate)
  })
}

initOrthoView()

export default initOrthoView
