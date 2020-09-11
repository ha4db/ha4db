import TileLayer from 'ol/layer/Tile'
import XYZ from 'ol/source/XYZ'

const gsi_std_layer = new TileLayer({
  source: new XYZ({
    attributions: [
      "<a href='https://maps.gsi.go.jp/development/ichiran.html' target='_blank'>地理院タイル</a>"
    ],
    url: "https://cyberjapandata.gsi.go.jp/xyz/std/{z}/{x}/{y}.png",
    projection: "EPSG:3857",
    maxZoom: 18
  })
})
export default gsi_std_layer