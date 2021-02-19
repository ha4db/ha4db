import {MDCTabBar, MDCTabBarActivatedEvent} from '@material/tab-bar'

const diagnosis = document.getElementById('diagnosis')
const injury = document.getElementById('injury')
const bridge_content_images = document.getElementById('bridge_content_images')

const tab_bar = document.querySelector('.mdc-tab-bar#regular_inspection_tab_bar')
if (tab_bar) {
  const mdc_tab_bar = new MDCTabBar(tab_bar)
  mdc_tab_bar.listen('MDCTabBar:activated', (data: MDCTabBarActivatedEvent) => {
    active_tag(data.detail.index)
  })
}

const active_tag = (index: number): void => {
  if (index == 0) {
    diagnosis.style.display = ''
    injury.style.display = 'none'
    bridge_content_images.style.display = 'none'
  } else if (index == 1) {
    diagnosis.style.display = 'none'
    injury.style.display = ''
    bridge_content_images.style.display = 'none'
  } else if (index == 2) {
    diagnosis.style.display = 'none'
    injury.style.display = 'none'
    bridge_content_images.style.display = ''
  }
}

active_tag(0)