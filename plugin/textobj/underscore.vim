if exists('g:loaded_textobj_underscore')
  finish
endif

call textobj#user#plugin('underscore', {
      \      'a': { 'select': 'a_', 'select-function': 'textobj#underscore#select_a' },
      \      'A': { 'select': 'a-', 'select-function': 'textobj#underscore#select_A' },
      \      'i': { 'select': 'i_', 'select-function': 'textobj#underscore#select_i' },
      \    })

let g:loaded_textobj_underscore = 1
