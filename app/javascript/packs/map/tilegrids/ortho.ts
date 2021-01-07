import TileGrid from 'ol/tilegrid/TileGrid'

export const generate_tilegrid = (max_zoom: number): TileGrid => {
  const startResolution = 256
  const resolutions = new Array(max_zoom)
  for (let i = 0, ii = resolutions.length; i < ii; ++i) {
    resolutions[i] = startResolution / Math.pow(2, i);
  }
  const tileGrid = new TileGrid({
    extent: [0, 0, 256, 256],
    minZoom: 0,
    resolutions: resolutions,
    tileSize: [256, 256],
  })
  return tileGrid
}

