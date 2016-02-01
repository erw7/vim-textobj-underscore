if exists('g:loaded_textobj_underscore')
  finish
endif

call textobj#user#plugin('underscore', {
      \      'a': { 'sfile': expand('<sfile>'), 'select': 'a_', 'select-function': 's:select_a' },
      \      'A': { 'sfile': expand('<sfile>'), 'select': 'a-', 'select-function': 's:select_A' },
      \      'i': { 'sfile': expand('<sfile>'), 'select': 'i_', 'select-function': 's:select_i' },
      \    })

function! s:search_underscore()
  let current_pos = getpos('.')
  let start_pos = searchpos('_', 'bcn', current_pos[1])
  if start_pos == [0, 0]
    throw 'not_found'
  else
    let end_pos = searchpos('_', 'n', current_pos[1])
    if end_pos == [0, 0]
      if current_pos[1:2] == start_pos
        let end_pos = start_pos
        let start_pos = searchpos('_', 'bn', current_pos[1])
        if start_pos == [0, 0]
          throw 'not_found'
        endif
      else
        throw 'not_found'
      endif
    endif
  endif

  return [ start_pos[1], end_pos[1] ]
endfunction

function! s:select_a()
  try
    let [ start_col, end_col ] = s:search_underscore()
  catch
    return 0
  endtry

  let start_pos = getpos('.')
  let start_pos[2] = start_col

  let end_pos = getpos('.')
  let end_pos[2] = end_col

  return [ 'v', start_pos, end_pos ]
endfunction

function! s:select_A()
  try
    let [ start_col, end_col ] = s:search_underscore()
  catch
    return 0
  endtry

  let start_pos = getpos('.')
  let start_pos[2] = start_col + 1

  let end_pos = getpos('.')
  let end_pos[2] = end_col

  return [ 'v', start_pos, end_pos ]
endfunction

" ciao_come_stai

function! s:select_i()
  try
    let [ start_col, end_col ] = s:search_underscore()
  catch
    return 0
  endtry

  let start_pos = getpos('.')
  let start_pos[2] = start_col + 1

  let end_pos = getpos('.')
  let end_pos[2] = end_col - 1

  return ['v', start_pos, end_pos]
endfunction

let g:loaded_textobj_underscore = 1
