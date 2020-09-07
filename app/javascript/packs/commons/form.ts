import '../../stylesheets/commons/form.scss'
import {MDCTextField} from '@material/textfield';
import {MDCTextFieldHelperText} from '@material/textfield/helper-text';

const text_fields = document.querySelectorAll('.mdc-text-field')
text_fields.forEach(element => {
  new MDCTextField(element)
})
const helper_texts = document.querySelectorAll('.mdc-text-field-helper-text')
helper_texts.forEach(element => {
  new MDCTextFieldHelperText(element)
})