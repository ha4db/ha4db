const filter_list = (target_ul: HTMLUListElement, filter_function: (arg1: HTMLLIElement) => boolean):void => {
  const lis = target_ul.querySelectorAll('li')
  lis.forEach((li: HTMLLIElement) => {
    if (filter_function(li)) {
      li.style.display = ''
    } else {
      li.style.display = 'none'
    }
  })
}

export default filter_list