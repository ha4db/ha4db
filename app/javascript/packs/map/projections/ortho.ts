import Projection from 'ol/proj/Projection'
import { addProjection } from 'ol/proj'

export const epsg_code = "EPSG:10000"

export const projection = new Projection({
  code: epsg_code,
  extent: [0, 0, 256, 256],
  units: 'pixels'
})
addProjection(projection)
