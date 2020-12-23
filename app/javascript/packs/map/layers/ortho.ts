import Tile from 'ol/layer/Tile'
import TileImage from 'ol/source/TileImage'
import { projection } from '../projections/ortho'
import { generate_tilegrid } from '../tilegrids/ortho'

const get_ortho_layer = (base_path:string, max_zoom: number): Tile => {
  const layer = new Tile({
    source: new TileImage({
      url: `${base_path}/{z}/{x}_{y}.png`,
      projection: projection,
      tileGrid: generate_tilegrid(max_zoom),
    })
  })
  return layer
}

export default get_ortho_layer
