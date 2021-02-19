import { Map } from 'ol'
import { Circle as CircleStyle, Fill, Stroke, Style } from 'ol/style'
import { Vector as VectorSource } from 'ol/source'
import { Vector as VectorLayer} from 'ol/layer'
import { GeoJSON } from 'ol/format'
import { Draw, Modify, Snap } from 'ol/interaction'

const select_tag_id = 'ortho_editor_type'

const setup_geometry_type = (ortho_geojson_input: HTMLInputElement):void => {
  const form = document.querySelector('form') as HTMLFormElement
  if (!form) {
    return
  }
  remove_select_tag()
  const select_tag = document.createElement('select') as HTMLSelectElement
  select_tag.id = select_tag_id
  const option_point_tag = document.createElement('option') as HTMLOptionElement
  option_point_tag.value = 'Point'
  option_point_tag.innerText = 'Point'
  select_tag.appendChild(option_point_tag)
  const option_line_string_tag = document.createElement('option') as HTMLOptionElement
  option_line_string_tag.value = 'LineString'
  option_line_string_tag.innerText = 'LineString'
  select_tag.appendChild(option_line_string_tag)
  const option_polygon_tag = document.createElement('option') as HTMLOptionElement
  option_polygon_tag.value = 'Polygon'
  option_polygon_tag.innerText = 'Polygon'
  select_tag.appendChild(option_polygon_tag)
  ortho_geojson_input.after(select_tag)
}

const setup_ortho_geojson_editor = (map: Map, ortho_geojson_input: HTMLInputElement):void => {
  setup_geometry_type(ortho_geojson_input)

  const image = new CircleStyle({
    radius: 5,
    fill: null,
    stroke: new Stroke({color: 'red', width: 1}),
  })

  const styles = {
    'Point': new Style({
      image: image,
    }),
    'LineString': new Style({
      stroke: new Stroke({
        color: 'green',
        width: 1,
      }),
    }),
    'MultiLineString': new Style({
      stroke: new Stroke({
        color: 'green',
        width: 1,
      }),
    }),
    'MultiPoint': new Style({
      image: image,
    }),
    'MultiPolygon': new Style({
      stroke: new Stroke({
        color: 'yellow',
        width: 1,
      }),
      fill: new Fill({
        color: 'rgba(255, 255, 0, 0.1)',
      }),
    }),
    'Polygon': new Style({
      stroke: new Stroke({
        color: 'blue',
        lineDash: [4],
        width: 3,
      }),
      fill: new Fill({
        color: 'rgba(0, 0, 255, 0.1)',
      }),
    }),
    'GeometryCollection': new Style({
      stroke: new Stroke({
        color: 'magenta',
        width: 2,
      }),
      fill: new Fill({
        color: 'magenta',
      }),
      image: new CircleStyle({
        radius: 10,
        fill: null,
        stroke: new Stroke({
          color: 'magenta',
        }),
      }),
    }),
    'Circle': new Style({
      stroke: new Stroke({
        color: 'red',
        width: 2,
      }),
      fill: new Fill({
        color: 'rgba(255,0,0,0.2)',
      }),
    }),
  }

  const styleFunction = function (feature) {
    return styles[feature.getGeometry().getType()]
  }

  let vectorSource
  if (ortho_geojson_input.value == '') {
    vectorSource = new VectorSource()
  } else {
    const geojsonObject = JSON.parse(ortho_geojson_input.value)
    vectorSource = new VectorSource({
      features: new GeoJSON().readFeatures(geojsonObject),
    })
  }

  const vectorLayer = new VectorLayer({
    source: vectorSource,
    style: styleFunction,
  })

  map.addLayer(vectorLayer)

  const form = document.querySelector('form') as HTMLFormElement
  if (!form) {
    return
  }


  const modify = new Modify({source: vectorSource})
  map.addInteraction(modify)

  let draw, snap
  const typeSelect = document.getElementById('ortho_editor_type') as HTMLSelectElement
  const features = []

  const addInteractions = ():void => {
    draw = new Draw({
      source: vectorSource,
      type: typeSelect.value,
    })
    draw.on('drawend', (e) => {
      features.push(e.feature)
      const writer = new GeoJSON()
      const geojson_str = writer.writeFeatures(features)
      ortho_geojson_input.value = geojson_str
    })
    map.addInteraction(draw)
    snap = new Snap({source: vectorSource})
    map.addInteraction(snap)
  }

  typeSelect.onchange = ():void => {
    map.removeInteraction(draw)
    map.removeInteraction(snap)
    addInteractions()
  }

  addInteractions()
}

const remove_select_tag = ():void => {
  const select_tag_before = document.getElementById(select_tag_id) as HTMLSelectElement
  if (select_tag_before) {
    select_tag_before.remove()
  }
}

export { setup_ortho_geojson_editor as default, remove_select_tag }
