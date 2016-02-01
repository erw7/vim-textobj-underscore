function! s:search_underscore(object_type)
  let current_pos = getpos('.')
  let start_pos = copy(current_pos)
  let start_pos[1:2] = searchpos('_', 'bcn', current_pos[1])
  if start_pos[1:2] == [0, 0]
    return 0
  else
    let end_pos = copy(current_pos)
    let end_pos[1:2] = searchpos('_', 'n', current_pos[1])
    if end_pos[1:2] == [0, 0]
      let end_pos[1:2] = searchpos('\>', 'n', current_pos[1])
    endif
  endif

  if a:object_type ==# 'A'
    let start_pos[2] = start_pos[2] + 1
  elseif a:object_type ==# 'i'
    let start_pos[2] = start_pos[2] + 1
    let end_pos[2] = end_pos[2] - 1
  endif

  return [ 'v', start_pos, end_pos ]
endfunction

function! textobj#underscore#select_a()
  return s:search_underscore('a')
endfunction

function! textobj#underscore#select_A()
  return s:search_underscore('A')
endfunction

function! textobj#underscore#select_i()
  return s:search_underscore('i')
endfunction
