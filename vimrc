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

" Search down into subfolders
" Provides tab-completion for all file-related tasks
" Source: https://www.youtube.com/watch?v=XA2WjJbmmoM
set path+=**

"set window size for gvim
if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window.
  set lines=38 columns=140
endif

"Ever notice a slight lag after typing the leader key + command? This lowers
"the timeout.
set timeoutlen=250 ttimeoutlen=0
let mapleader="ä"

"Set the color scheme. Change this to your preference.
"Here's 100 to choose from: http://www.vim.org/scripts/script.php?script_id=625
set term=xterm
set t_Co=256
if !has('win32') && !has('gui_running')
  let g:solarized_termcolors=&t_Co
  let g:solarized_termtrans=1
endif
set background=dark
colorscheme solarized
" Stupid Windows settings
if has('win32') && !has('gui_running') && !empty($CONEMUBUILD)
    let &t_AB="\e[48;5;%dm"
    let &t_AF="\e[38;5;%dm"
endif

"to get a block cursor in normal mode
if !has('win32')
    let &t_ti.="\e[1 q"
    let &t_SI.="\e[5 q"
    let &t_EI.="\e[1 q"
    let &t_te.="\e[0 q"
endif
"
" https://github.com/airblade/vim-gitgutter/issues/377
let g:gitgutter_async=0
let g:gitgutter_max_signs = 500  " default value

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

"Set line height to standard for a cleaner airline status bar look
set linespace=0

"Better line wrapping
set wrap
set textwidth=0
set formatoptions=qrn1
set showbreak=…

" Enable spell checking by default:
set spelllang=de_20,en,it,nl,pt
if !&diff
  set spell
endif

" fancy spelling toggle
" source: http://vim.wikia.com/wiki/Toggle_spellcheck_with_function_keys
let b:myLang=0
let g:myLangList=["nospell","de_20","en","it","nl","pt"]
function! ToggleSpell()
  let b:myLang=b:myLang+1
  if b:myLang>=len(g:myLangList) | let b:myLang=0 | endif
  if b:myLang==0
    setlocal nospell
  else
    execute "setlocal spell spelllang=".get(g:myLangList, b:myLang)
  endif
  echo "spell checking language:" g:myLangList[b:myLang]
endfunction
nmap <silent> <F7> :call ToggleSpell()<CR>
nmap <silent> <F8> :se spell!<CR>
"
" yank and delete directly into the system clipboard in order to store the
" clips using ditto → will result in LOTS of clips, not that good…
"set clipboard=unnamed

" use the Wrap command below for entering text in paragraphs without
" automatic line breaking:
command! -nargs=* Wrap set wrap linebreak nolist textwidth=0

"Set incremental searching"
set incsearch

"Highlight searching
set hlsearch

"case sensitivity of search patterns. ignore case UNLESS at least one
"uppercase character is used:
set ignorecase
set smartcase

" default file encoding
set encoding=utf-8      " sets how vim shall represent characters internally
set fileencoding=utf-8  " the encoding written to file
set fileencodings=ucs-bom,utf8,latin1,prc

" hide vim mode indicator in favour of airline status bar
set noshowmode

" highlight yanked text: http://www.vim.org/scripts/script.php?script_id=5425
if has("patch-7.4.710")
  map y <Plug>(highlightedyank)
endif

" airline fonts
if !has('win32')
    " mkdir ~/.fonts/
    " cd ~/.fonts/
    " wget https://github.com/powerline/fonts/blob/master/DejaVuSansMono/DejaVu%20Sans%20Mono%20for%20Powerline.ttf
    " fc-cache -vf ~/.fonts/
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline
    let g:airline_powerline_fonts = 1
endif

let g:airline#extensions#tabline#enabled = 1

if has('win32')
    set guifont=ConsolasForPowerline_NF:h11
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

call airline#parts#define_function(
  \ 'fencbomffmt',
  \ 'Airline_file_encoding_bom_file_format'
\)

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

"
" => General
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Sets how many lines of history VIM has to remember
set history=700

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
if has("patch-7.4.710")
    set listchars=tab:\ ,eol:¬,trail:˽,extends:›,precedes:‹,space:
else
    set listchars=tab:\ ,eol:¬,trail:˽,extends:›,precedes:‹
endif
set list

"Invisible character colors
if !has('win32') && !has('gui_running')
    highlight NonText ctermfg=13 ctermbg=NONE
    highlight SpecialKey ctermfg=13 ctermbg=NONE
else
    highlight NonText guifg=#AE325B ctermfg=5 ctermbg=8
    highlight SpecialKey guifg=#AE325B guibg=#002B36 ctermfg=5 ctermbg=8
endif

if !has('win32') " use windows keybinding, too
   nnoremap <silent> <C-q> <C-v>
endif

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

" quicker Escaping (NO text will contain jj, so remap it to Esc :-)
inoremap jj <ESC>

" open NERDTree
nnoremap ß :NERDTreeToggle<CR>

" make help file navigation useable on German keyboard
nnoremap ü <C-]>
nnoremap Ü <C-O>

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

" https://github.com/ruedigerha/vim-fullscreen
" requires Python for Windows Extensions: https://sourceforge.net/projects/pywin32/files/
nmap <silent> <F11> <Plug>(fullscreen_toggle)

" jump to recent modifications
if !&diff
    nnoremap <A-down> :GitGutterNextHunk<CR>
    nnoremap <A-up> :GitGutterPrevHunk<CR>
else
    set cursorline
    nnoremap <A-down> ]c
    nnoremap <A-up> [c
    nnoremap <A-left> do
    nnoremap <A-right> dp

    " Fix the difficult-to-read default setting for diff text highlighting.  The
    " bang (!) is required since we are overwriting the DiffText setting. The highlighting
    " for "Todo" also looks nice (yellow) if you don't like the "MatchParen" colors.
    highlight! link DiffText ToDo

    "hi DiffAdd    ctermfg=233 ctermbg=LightGreen guifg=#003300 guibg=#DDFFDD gui=none cterm=none
    "hi DiffChange ctermbg=white  guibg=#ececec gui=none   cterm=none
    "hi DiffText   ctermfg=233  ctermbg=yellow  guifg=#000033 guibg=#DDDDFF gui=none cterm=none
endif

" filter command history using C-p and C-n as well:
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" Map Ctrl-Backspace to delete the previous word in insert mode.
:imap <C-BS> <C-W>

" Open URI under cursor.
nmap <Leader><Leader> <Plug>(openbrowser-smart-search)
" Open selected URI.
vmap <Leader><Leader> <Plug>(openbrowser-smart-search)

" JSON formatting
:command Json :%!python -m json.tool

" Music library
:command E2m :syntax off|%s/\cE:%5Cmusik/M:%5Cmusik/g|:syntax on|:wq

" shortcuts for vim renamer
:command F s/.*/folder.jpg/|nohl
:command Dela %s/\(^\d\d - \).* - /\1/|%s/^01 - /&/|nohl

" http://vim.wikia.com/wiki/Restore_screen_size_and_position
" " To enable the saving and restoring of screen positions.
let g:screen_size_restore_pos = 1

" To save and restore screen for each Vim instance.
" This is useful if you routinely run more than one Vim instance.
" For all Vim to use the same settings, change this to 0.
let g:screen_size_by_vim_instance = 0

" for <tab> use the autocomplete menu as provided by zsh:
set wildmenu
set wildmode=full

" Source the vimrc file after saving it
" Does not really work because of all the plugins…
if has("autocmd")
"  autocmd bufwritepost vimrc source $MYVIMRC
"  autocmd bufwritepost .vimrc source $MYVIMRC
endif

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
