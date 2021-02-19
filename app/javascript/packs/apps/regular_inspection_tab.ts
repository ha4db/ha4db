import {MDCTabBar, MDCTabBarActivatedEvent} from '@material/tab-bar'

const diagnosis = document.getElementById('diagnosis')
const injury = document.getElementById('injury')

const tab_bar = document.querySelector('.mdc-tab-bar')
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
  } else if (index == 1) {
    diagnosis.style.display = 'none'
    injury.style.display = ''
  }
}

active_tag(0)