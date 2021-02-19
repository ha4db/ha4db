import show_bridge_content from './show_bridge_content'

document.querySelectorAll('ul#bridge_content_list > li').forEach((element: HTMLLIElement) => {
  element.addEventListener('click', (el) => {
    const target = document.getElementById('show_data_view') as HTMLDivElement
    target.dataset.id = el.currentTarget.dataset.id
    const seek_input = document.getElementById('bridge_content_injury_seek') as HTMLInputElement
    seek_input.value = 0
    show_bridge_content()
  })
})