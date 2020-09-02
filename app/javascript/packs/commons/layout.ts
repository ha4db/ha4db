import '../../src/commons/layout.scss'
import {MDCTopAppBar} from '@material/top-app-bar'
import {MDCMenu} from '@material/menu'
import {Corner} from '@material/menu-surface/constants'
import {MDCDrawer} from "@material/drawer"

const topAppBarElement = document.querySelector('.mdc-top-app-bar')
const topAppBar = new MDCTopAppBar(topAppBarElement)
const menu = new MDCMenu(document.querySelector('.mdc-menu'))
const profileToggleButton = document.querySelector('.profile-toggle-button');
const profileToggleButtonHeight = profileToggleButton.getBoundingClientRect().height;
menu.setAnchorMargin({top: profileToggleButtonHeight});
menu.setAnchorCorner(Corner.BOTTOM_LEFT);

const drawer = MDCDrawer.attachTo(document.querySelector('.mdc-drawer'))
topAppBar.setScrollTarget(document.getElementById('main-content'))
drawer.open = true

profileToggleButton.addEventListener('click', () => {
  menu.open = !menu.open
})

