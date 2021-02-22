import filter_table from './filter_table'

const do_filter = (span_number: string, component_category: number) => {
  const target_list = document.getElementById('regular_inspection_injuries') as HTMLTableElement
  if (!target_list) {
    return
  }
  if (span_number == "0" && component_category == 0) {
    filter_table(target_list, (_) => {
      return true
    })
  } else {
    filter_table(target_list, (arg1) => {
      if (span_number != "0" && component_category != 0) {
        if (arg1.dataset.span_number == span_number && arg1.dataset.component_category && parseInt(arg1.dataset.component_category) == component_category) {
          return true
        }
      } else if (span_number != "0") {
        if (arg1.dataset.span_number == span_number) {
          return true
        }
      } else if (component_category != 0) {
        if (arg1.dataset.component_category && parseInt(arg1.dataset.component_category) == component_category) {
          return true
        }
      }
      return false
    })
  }
}

const search_setup = ():void => {
  const span_number_target_id = "injury_filter_span_number"
  const span_number_target = document.getElementById(span_number_target_id)
  let span_number = "0"
  span_number_target.querySelectorAll('input').forEach((element: HTMLInputElement) => {
    element.addEventListener('change', (e) => {
      const target = e.target as HTMLInputElement
      span_number = target.value
      do_filter(span_number, component_category)
    })
  })
  const component_category_target_id = "injury_filter_component_category"
  const component_category_target = document.getElementById(component_category_target_id)
  let component_category = 0
  component_category_target.querySelectorAll('input').forEach((element: HTMLInputElement) => {
    element.addEventListener('change', (e) => {
      const target = e.target as HTMLInputElement
      component_category = parseInt(target.value)
      do_filter(span_number, component_category)
    })
  })
}

search_setup()