import "../../stylesheets/commons/tab.scss"
import {MDCTabBar} from '@material/tab-bar'

const tab_bar = document.querySelector('.mdc-tab-bar')
if (tab_bar) {
  new MDCTabBar(tab_bar)
}
