
" airline fonts
if !has('win32')
    let g:airline_powerline_fonts = 1
endif

let g:airline#extensions#tabline#enabled = 1

if has('win32')
    let g:Powerline_symbols="fancy"
    let g:airline_symbols = {}
    let g:airline_left_sep = "\u2b80" "use double quotes here
    let g:airline_left_alt_sep = "\u2b81"
    let g:airline_right_sep = "\u2b82"
    let g:airline_right_alt_sep = "\u2b83"
    let g:airline_symbols.maxlinenr = '☰'
    let g:airline_symbols.branch = "\u2b60"
    let g:airline_symbols.readonly = "\u2b64"
    let g:airline_symbols.linenr = "" "\ue0a1
    let g:airline_theme = 'solarized'
endif

if has('autocmd')
  augroup airline_init
    autocmd!
    autocmd User AirlineAfterInit
      \ call s:airline_init()
  augroup END
endif

if has("gui_running")
    call airline#parts#define_function(
      \ 'fencbomffmt',
      \ 'Airline_file_encoding_bom_file_format'
    \)
endif

function! s:airline_init()
  let l:spc = g:airline_symbols.space
  let g:airline_section_z = airline#section#create(['windowswap', 'obsession', '%3p%%'.spc, 'linenr', 'maxlinenr', spc.'%3v'])
  let g:airline_section_y = airline#section#create_right([
    \ 'fencbomffmt'
  \])
endfunction

function! Airline_file_encoding_bom_file_format()
  return printf(
    \ '%s%s%s',
    \ &fenc,
    \ &bomb ? '[bom]' : '',
    \ strlen(&ff) > 0 ? '['.&ff.']' : ''
  \)
endfunction

let g:airline_running = 1
