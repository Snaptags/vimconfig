"Forget compatibility with Vi. Who cares.
set nocompatible

set guioptions-=m  "menu bar
set guioptions-=T  "toolbar
set guioptions-=r  "scrollbar

let $LANG = 'en_US'         " sets the language of the messages / ui (vim)
set langmenu=en    " sets the language of the menu (gvim)
"set langmenu=en_US.UTF-8    " sets the language of the menu (only works for
"command line vim)

" https://github.com/tpope/vim-pathogen - used for package management
execute pathogen#infect()

"Enable filetypes
filetype on
filetype plugin on
filetype indent on
syntax enable

"Display current cursor position in lower right corner.
set ruler

"set window size for gvim
if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window.
  set lines=38 columns=140
endif

"Ever notice a slight lag after typing the leader key + command? This lowers
"the timeout.
set timeoutlen=250
let mapleader="ä"

"Set the color scheme. Change this to your preference.
"Here's 100 to choose from: http://www.vim.org/scripts/script.php?script_id=625
"set term=xterm
"set t_Co=256
"let &t_AB="\e[48;5;%dm"
"let &t_AF="\e[38;5;%dm"
set background=dark
colorscheme solarized

"to get a block cursor in normal mode
if !has('win32')
    let &t_ti.="\e[1 q"
    let &t_SI.="\e[5 q"
    let &t_EI.="\e[1 q"
    let &t_te.="\e[0 q"
endif

"Show command in bottom right portion of the screen
set showcmd

"Show lines numbers
set number

"Prefer relative line numbering?
set relativenumber

"Indent stuff
set smartindent
set autoindent

"Always show the status line
set laststatus=2

"Prefer a slightly higher line height
set linespace=3

"Better line wrapping
set nowrap
set textwidth=79
set formatoptions=qrn1
set showbreak=…

" use the Wrap command below for entering text in paragraphs without
" automatic line breaknig:
command! -nargs=* Wrap set wrap linebreak nolist textwidth=0 

"Set incremental searching"
set incsearch

"Highlight searching
set hlsearch


source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
"
"let skip_loading_mswin=1

" default file encoding
set encoding=utf-8
set enc=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf8,prc

" hide vim mode indicator in favour of airline status bar
set noshowmode

" airline fonts
set guifont=Consolas_for_Powerline_FixedD:h11
let g:Powerline_symbols="fancy"
let g:airline_symbols = {}
let g:airline_left_sep = "\u2b80" "use double quotes here
let g:airline_left_alt_sep = "\u2b81"
let g:airline_right_sep = "\u2b82"
let g:airline_right_alt_sep = "\u2b83"
let g:airline_symbols.branch = "\u2b60"
let g:airline_symbols.readonly = "\u2b64"
let g:airline_symbols.linenr = "\u2b61"
let g:airline_theme = 'solarized'

" => General
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Sets how many lines of history VIM has to remember
" set history=700
"
" " Set to auto read when a file is changed from the outside
set autoread

" do not place backup- or swap-files in local directories
set backupdir=$HOME/AppData/Local/Temp/,.
set directory=$HOME/AppData/Local/Temp/,.

if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  set undodir=$HOME/vimundo/
  set undofile
endif

" virtual tabstops using spaces
set tabstop=8 " to be used if tab characters are present
set shiftwidth=4
set softtabstop=4
set expandtab " always insert spaces instead of tab characters

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
set list

"Invisible character colors 
highlight NonText guifg=#3a3a59
highlight SpecialKey guifg=#3a3a59

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

" quicker Escaping (NO text will contain jj, so remap it to Esc :-)
inoremap jj <ESC>

" open NERDTree
nnoremap ß :NERDTreeToggle<CR>

" Neo 2 Layer 4 fixes
inoremap l<Up> k
nnoremap l<Up> <Up>
vnoremap l<Up> k
inoremap a<Down> j
nnoremap a<Down> <Down>
vnoremap a<Down> j
inoremap i<Left> h
nnoremap i<Left> <Left>
vnoremap i<Left> h
inoremap e<Right> l
nnoremap e<Right> <Right>
vnoremap e<Right> l
inoremap ?<Esc> <Esc>
nnoremap ?<Esc> <Esc>
inoremap v<BS> <BS>
nnoremap v<BS> <BS>
inoremap c<Del> <Del>
nnoremap c<Del> <Del>
inoremap ?<Tab> <Tab>
nnoremap ?<Tab> <Tab>
inoremap u<Home> <Home>
nnoremap u<Home> <Home>
inoremap p<CR> <CR>
nnoremap p<CR> <CR>
inoremap o<End> <End>
nnoremap o<End> <End>
inoremap x<PageUp> <PageUp>
nnoremap x<PageUp> <PageUp>
inoremap w<PageDown> <PageDown>
nnoremap w<PageDown> <PageDown>
inoremap ?<Insert> <Insert>
nnoremap ?<Insert> <Insert>
nnoremap \\ <c-]>  
nnoremap <Space> 0
" not working :-(
" inoremap z<Undo> <Undo>
" nnoremap z<Undo> <Undo>
"
" Open URI under cursor. 
nmap <Leader><Leader> <Plug>(openbrowser-smart-search) 
" Open selected URI. 
vmap <Leader><Leader> <Plug>(openbrowser-smart-search) 

" JSON formatting
:command Json :%!python -m json.tool

" Music library
:command E2m :syntax off|%s/\cE:%5Cmusik/M:%5Cmusik/g|:syntax on|:wq

" http://vim.wikia.com/wiki/Restore_screen_size_and_position
" " To enable the saving and restoring of screen positions.
let g:screen_size_restore_pos = 1

" To save and restore screen for each Vim instance.
" This is useful if you routinely run more than one Vim instance.
" For all Vim to use the same settings, change this to 0.
let g:screen_size_by_vim_instance = 0

set diffexpr=MyDiff()
function! MyDiff()
   let opt = '-a --binary '
   if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
   if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
   let arg1 = v:fname_in
   if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
   let arg2 = v:fname_new
   if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
   let arg3 = v:fname_out
   if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
   if $VIMRUNTIME =~ ' '
     if &sh =~ '\<cmd'
       if empty(&shellxquote)
         let l:shxq_sav = ''
         set shellxquote&
       endif
       let cmd = '"' . $VIMRUNTIME . '\diff"'
     else
       let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
     endif
   else
     let cmd = $VIMRUNTIME . '\diff'
   endif
   silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
   if exists('l:shxq_sav')
     let &shellxquote=l:shxq_sav
   endif
endfunction

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
  autocmd VimEnter * if g:screen_size_restore_pos == 1 | call ScreenRestore() | endif
  autocmd VimLeavePre * if g:screen_size_restore_pos == 1 | call ScreenSave() | endif
endif
