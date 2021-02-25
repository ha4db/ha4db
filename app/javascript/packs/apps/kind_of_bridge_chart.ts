import Chart from 'chart.js'
import colors from '../commons/colors'

const chart_div = document.getElementById('kind_of_bridge_chart') as HTMLDivElement
const ctx = document.getElementById('kind_of_bridge_chart_area') as HTMLCanvasElement

const values = {}
document.querySelectorAll('.kind_of_bridge_chart_value').forEach((element: HTMLSpanElement) => {
  values[element.dataset.key] = JSON.parse(element.dataset.value)
})

if (Object.keys(values).length != 0) {
  const i18n = {}
  document.querySelectorAll('.kind_of_bridge_chart_i18n').forEach((element: HTMLSpanElement) => {
    i18n[element.dataset.key] = element.dataset.value
  })
  const dataset = values[Object.keys(values)[0]]
  const datasets = []
  const dataset_colors = [colors.red, colors.blue, colors.green, colors.purple]
  Object.keys(dataset).forEach((key, index) => {
    const color = dataset_colors[index]
    const value = {
      label: i18n[key],
      backgroundColor: color,
      data: Object.values(values).map((v) => v[key])
    }
    datasets.push(value)
  })
  const data = {
    labels: Object.keys(values),
    datasets: datasets
  }
  const config = {
    type: 'bar',
    data: data,
    title: {
      display: true,
      text: chart_div.dataset.title
    },
    tooltips: {
      mode: 'index',
      intersect: false
    },
    responsive: true,
    options: {
      scales: {
        xAxes: [{
          stacked: true,
        }],
        yAxes: [{
          stacked: true,
          ticks: {
            stepSize: 1
          }
        }]
      }
    }
  }
  new Chart(ctx, config)
}
