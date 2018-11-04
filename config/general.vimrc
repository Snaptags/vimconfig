
set guioptions-=m  "menu bar
set guioptions-=T  "toolbar
set guioptions-=r  "scrollbar

let $LANG = 'en_US'         " sets the language of the messages / ui (vim)
set langmenu=en    " sets the language of the menu (gvim)
"set langmenu=en_US.UTF-8    " sets the language of the menu (only works for command line vim)
"
"Enable filetypes
filetype on
filetype plugin on
filetype indent on
syntax enable

"improve performance for long lines:
set synmaxcol=200

"Display current cursor position in lower right corner.
set ruler

"http://vim.wikia.com/wiki/Disable_beeping
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Search down into subfolders
" Provides tab-completion for all file-related tasks
" Source: https://www.youtube.com/watch?v=XA2WjJbmmoM
set path+=**

" default shell for :terminal
" if has('win32')
"   set shell=powershell.exe\ -NoExit\ -file\ \"d:\ownCloud\Software-Settings\Windows\ Powershell\profile.ps1\"
" endif

"set window size for gvim
if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window.
  set lines=42 columns=160
endif
" default font
if has('win32')
    set guifont=DankMono_NF_monospacified_for_D:h13
else
  " mkdir ~/.fonts/
  " cd ~/.fonts/
  " wget https://github.com/powerline/fonts/blob/master/DejaVuSansMono/DejaVu%20Sans%20Mono%20for%20Powerline.ttf
  " fc-cache -vf ~/.fonts/
  set guifont=DejaVu\ Sans\ Mono\ for\ Powerline
endif
"Ever notice a slight lag after typing the leader key + command? This lowers
"the timeout.
set timeoutlen=250 ttimeoutlen=0
let mapleader="ä"

"Set the color scheme. Change this to your preference.
"Here's 100 to choose from: http://www.vim.org/scripts/script.php?script_id=625
if (&term != "builtin_gui")
  set term=xterm
endif
set t_Co=256
if !has('win32') && !has('gui_running')
  let g:solarized_termcolors=&t_Co
  let g:solarized_termtrans=1
endif
set background=dark
if g:android != 1
    colorscheme solarized
endif
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

"Show command in bottom right portion of the screen
set showcmd

"Show lines numbers
set number

"Prefer relative line numbering?
set relativenumber

"better increase/decrease of numbers with leading zeros (e.g. 08 → 09):
set nrformats=bin,hex

"Indent stuff
set smartindent
set autoindent
if has('linebreak')
  set linebreak   " don't wrap in the middle of a word
  set breakindent "indent wrapped lines to match start
endif

"Always show the status line
set laststatus=2

"Set line height to standard for a cleaner airline status bar look
set linespace=0

"Better line wrapping
set wrap
set textwidth=0
set formatoptions=qrn1
set showbreak=…

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

" " Sets how many lines of history VIM has to remember
set history=700

" " Set to auto read when a file is changed from the outside
set autoread

" do not place backup- or swap-files in local directories
let b:tempdir = $HOME.'/vimtemp'
if has('win32')
    let b:tempdir = $HOME.'\AppData\Local\Temp\'
endif
if !isdirectory(b:tempdir)
    call mkdir(b:tempdir, "p")
endif
execute "set backupdir=".escape(b:tempdir, ' ')
execute "set directory=".escape(b:tempdir, ' ')

if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  if !isdirectory($HOME . '/vimundo')
    call mkdir($HOME . '/vimundo', "p")
  endif
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

" Open URI under cursor.
nmap <Leader><Leader> <Plug>(openbrowser-smart-search)
" Open selected URI.
vmap <Leader><Leader> <Plug>(openbrowser-smart-search)

" for <tab> use the autocomplete menu as provided by zsh:
set wildmenu
set wildmode=full

