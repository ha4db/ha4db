import '../../src/admin/layout.scss'
import {MDCTopAppBar} from '@material/top-app-bar'
import {MDCMenu} from '@material/menu'
import {Corner} from '@material/menu-surface/constants'

const topAppBarElement = document.querySelector('.mdc-top-app-bar')
new MDCTopAppBar(topAppBarElement)
const menu = new MDCMenu(document.querySelector('.mdc-menu'))
const profileToggleButton = document.querySelector('.profile-toggle-button');
const profileToggleButtonHeight = profileToggleButton.getBoundingClientRect().height;
menu.setAnchorMargin({top: profileToggleButtonHeight});
menu.setAnchorCorner(Corner.BOTTOM_LEFT);

profileToggleButton.addEventListener('click', () => {
  menu.open = !menu.open
})