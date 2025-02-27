" bom symbol for vim-devicons
let g:WebDevIconsUnicodeByteOrderMarkerDefaultSymbol = ''

" vimwiki/vimwiki https://github.com/vimwiki/vimwiki
let g:vimwiki_root = '~/VimWiki/'
if isdirectory('d:/__nextCloud__/VimWiki') " override default
  let g:vimwiki_root = 'd:/__nextCloud__/VimWiki/'
endif
if isdirectory('~/Nextcloud/VimWiki')
  let g:vimwiki_root = '~/Nextcloud/VimWiki/'
endif
let g:vimwiki_list = [{'path': g:vimwiki_root, 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown'}
map <Leader>tt <Plug>VimwikiToggleListItem
nmap <Leader>d <Plug>VimwikiMakeDiaryNote
nmap <Leader>i <Plug>VimwikiDiaryGenerateLinks

let g:ctrlp_map = '<Leader>p'
let g:ctrlp_custom_ignore = 'node_modules\|git'

" highlight yanked text: http://www.vim.org/scripts/script.php?script_id=5425
if !has("patch-8.0.1394")
  if has("patch-7.4.710")
    map y <Plug>(highlightedyank)
  endif
endif

" https://github.com/mileszs/ack.vim
let g:ackprg = 'ag --vimgrep'
:command! -nargs=* Ag Ack <args>

" https://github.com/mxw/vim-jsx
let g:jsx_ext_required = 0

" git-gutter
set updatetime=100

" indentLine https://github.com/Yggdroot/indentLine.git
let g:indentLine_color_term = 5
let g:indentLine_color_gui = '#AE325B'
let g:indentLine_char = ''
autocmd Filetype json let g:indentLine_enabled = 0   " disable for json, because the plugin hides quotes

" nerdtree https://github.com/scrooloose/nerdtree
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
let g:NERDTreeGlyphReadOnly = ''

"vim-startify https://github.com/mhinz/vim-startify.git
let g:startify_bookmarks = [ {'c': $VIMHOME.'/vimrc'}, {'o': g:vimwiki_root.'ToDo.md'}, {'w': g:vimwiki_root.'index.md'} ]
let g:startify_enable_unsafe = 1
let g:ascii = [
      \ '         __',
      \ ' .——.——.|__|.————————.',
      \ ' |  |  ||  ||        |',
      \ '  \___/ |__||__|__|__|',
      \ ' '
      \]
let g:startify_fortune_use_unicode = 0
let g:startify_custom_header =
      \ 'map(g:ascii + startify#fortune#boxed(), "\"   \".v:val")'
let g:startify_skiplist = [
      \ '\\fritz.nas',
      \ '\\zboxkodi',
      \ '\\beethoven'
      \ ]

" http://vim.wikia.com/wiki/Restore_screen_size_and_position
" " To enable the saving and restoring of screen positions.
let g:screen_size_restore_pos = 1

" To save and restore screen for each Vim instance.
" This is useful if you routinely run more than one Vim instance.
" For all Vim to use the same settings, change this to 0.
let g:screen_size_by_vim_instance = 0

" http://vim.wikia.com/wiki/Restore_screen_size_and_position
if has("gui_running")
  function! ScreenFilename()
    if has('amiga')
      return "s:.vimsize"
    elseif has('win32')
      return $HOME.'\_vimsize'
    else
      return $HOME.'/.vimsize'
    endif
  endfunction

  function! ScreenRestore()
    " Restore window size (columns and lines) and position
    " from values stored in vimsize file.
    " Must set font first so columns and lines are based on font size.
    let f = ScreenFilename()
    if has("gui_running") && g:screen_size_restore_pos && filereadable(f)
      let vim_instance = (g:screen_size_by_vim_instance==1?(v:servername):'GVIM')
      for line in readfile(f)
        let sizepos = split(line)
        if len(sizepos) == 5 && sizepos[0] == vim_instance
          silent! execute "set columns=".sizepos[1]." lines=".sizepos[2]
          silent! execute "winpos ".sizepos[3]." ".sizepos[4]
          return
        endif
      endfor
    endif
  endfunction

  function! StartUp()
      if g:screen_size_restore_pos == 1 
          call ScreenRestore() 
      endif
      if &diff
          " Display hint text
          echo "Remember to use :diffo [turn diff off] :difft [diff turn on] :diffu [diff update] and :diffg LO/BA/RE"
      endif
  endfunction

  function! ScreenSave()
    " Save window size and position.
    if has("gui_running") && g:screen_size_restore_pos
      let vim_instance = (g:screen_size_by_vim_instance==1?(v:servername):'GVIM')
      let data = vim_instance . ' ' . &columns . ' ' . &lines . ' ' .
            \ (getwinposx()<0?0:getwinposx()) . ' ' .
            \ (getwinposy()<0?0:getwinposy())
      let f = ScreenFilename()
      if filereadable(f)
        let lines = readfile(f)
        call filter(lines, "v:val !~ '^" . vim_instance . "\\>'")
        call add(lines, data)
      else
        let lines = [data]
      endif
      call writefile(lines, f)
    endif
  endfunction

  if !exists('g:screen_size_restore_pos')
    let g:screen_size_restore_pos = 1
  endif
  if !exists('g:screen_size_by_vim_instance')
    let g:screen_size_by_vim_instance = 1
  endif
endif

let g:ale_linters = {
\   'typescript': ['eslint'],
\   'json': ['jsonlint'],
\}

let g:ale_fixers = {
\   'typescript': ['prettier'],
\   'javascript': ['prettier'],
\   'css': ['prettier'],
\   'html': ['prettier'],
\   'json': ['prettier'],
\}

let g:ale_fix_on_save = 0
