import { Circle as CircleStyle, Fill, Stroke, Style } from 'ol/style'

const style = new Style({
  fill: new Fill({
    color: 'rgba(255, 255, 255, 0.2)',
  }),
  stroke: new Stroke({
    color: '#ffcc33',
    width: 2,
  }),
  image: new CircleStyle({
    radius: 7,
    stroke: new Stroke({
      color: 'blue',
      width: 2,
    }),
    fill: new Fill({
      color: 'rgba(255, 255, 255, 0.2)',
    }),
  }),
})

export default style