import show_bridge_content from './show_bridge_content'

document.querySelectorAll('ul#bridge_content_injury_list > li').forEach((element: HTMLLIElement) => {
  element.addEventListener('click', (el) => {
    const current = el.currentTarget as HTMLLIElement
    const target = current.parentElement.nextSibling.nextSibling
    target.dataset.id = current.dataset.id
    target.dataset.preview = true
    const seek_input = document.getElementById('bridge_content_injury_seek') as HTMLInputElement
    seek_input.value = el.currentTarget.dataset.seek
    show_bridge_content(target)
  })
})