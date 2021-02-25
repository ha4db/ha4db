import Chart from 'chart.js'
import colors from '../commons/colors'

const chart_div = document.getElementById('priority_chart') as HTMLDivElement
const ctx = document.getElementById('priority_chart_area') as HTMLCanvasElement

const values = {}
document.querySelectorAll('.priority_chart_value').forEach((element: HTMLSpanElement) => {
  values[element.dataset.key_name] = parseInt(element.dataset.value)
})

const config = {
  type: 'pie',
  data: {
    datasets: [{
      data: Object.values(values),
      backgroundColor: [
        colors.blue,
        colors.green,
        colors.yellow,
        colors.purple,
      ],
      label: chart_div.dataset.title
    }],
    labels: Object.keys(values)
  },
  options: {
    responsive: true,
    title: {
      display: true,
      text: chart_div.dataset.title
    }
  }
}

new Chart(ctx, config)