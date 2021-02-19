import {MDCTabBar, MDCTabBarActivatedEvent} from '@material/tab-bar'

const tab_bar = document.querySelector('.mdc-tab-bar#regular_inspection_main_contents_tab_bar')
if (tab_bar) {
  const mdc_tab_bar = new MDCTabBar(tab_bar)
  mdc_tab_bar.listen('MDCTabBar:activated', (data: MDCTabBarActivatedEvent) => {
    console.log(data.detail.index)
    active_tag(data.detail.index)
  })
}

const active_tag = (index: number): void => {
  document.querySelectorAll('.show-main-content').forEach((element: HTMLDivElement) => {
    if (parseInt(element.dataset.index) == index) {
      element.style.display = ''
    } else {
      element.style.display = 'none'
    }
  })
}

active_tag(0)