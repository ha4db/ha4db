const filter_table = (target_table: HTMLTableElement, filter_function: (arg1: HTMLTableRowElement) => boolean):void => {
  const trs = target_table.querySelectorAll('tbody > tr')
  trs.forEach((tr: HTMLTableRowElement) => {
    if (filter_function(tr)) {
      tr.style.display = ''
    } else {
      tr.style.display = 'none'
    }
  })
}

export default filter_table