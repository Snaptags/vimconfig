
" airline fonts
if !has('win32')
    let g:airline_powerline_fonts = 1
endif

let g:airline#extensions#tabline#enabled = 1

if has('win32')
    let g:Powerline_symbols="fancy"
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif
    let g:airline_left_sep          = "\ue0b0" "   use double quotes here
    let g:airline_left_alt_sep      = "\ue0b1" " 
    let g:airline_right_sep         = "\ue0b2" "
    let g:airline_right_alt_sep     = "\ue0b3" " 
    let g:airline_symbols.maxlinenr = "\ufa70" " 並
    let g:airline_symbols.notexists = " \uf0eb" " 
    let g:airline_symbols.branch    = "\ue725" " 
    let g:airline_symbols.readonly  = "\uf456" " 
    let g:airline_symbols.linenr    = "\ue0a1" " 
    let g:airline_theme = 'solarized'
endif

if has('autocmd')
  augroup airline_init
    autocmd!
    autocmd User AirlineAfterInit
      \ call s:airline_init()
  augroup END
endif

function! s:airline_init()
  let l:spc = g:airline_symbols.space
  let g:airline_section_z = airline#section#create(['windowswap', 'obsession', '%3p%%'.spc, 'linenr', 'maxlinenr', spc.'%3v'])
  let g:airline_section_y = airline#section#create_right([
    \ 'fencbomffmt'
  \])
endfunction

let g:airline_running = 1
