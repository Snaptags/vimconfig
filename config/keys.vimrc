
if !has('win32') " use windows keybinding in linux, too
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

" Jump to previous/next tag
nnoremap <C-Left> /<Bar><Bslash>zs<Bslash>k<Bslash>+<Bar><CR>
nnoremap <C-Right> /<Bar><Bslash>zs<Bslash>k<Bslash>+<Bar><CR>

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
:command! Fullscreen call fullscreen#maximize()|winc =
nmap <silent> <F11> <Plug>(fullscreen_toggle) :winc =<CR>
nmap <silent> <F12> qa

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

" convenience hotkey to quickly exit from diff mode
nnoremap <A-q> :qa<CR>

" filter command history using C-p and C-n as well:
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" Map Ctrl-Backspace to delete the previous word in insert mode.
:imap <C-BS> <C-W>

" comfortable moving between split windows
nnoremap <S-down> <C-W><C-J>
nnoremap <S-up> <C-W><C-K>
nnoremap <S-right> <C-W><C-L>
nnoremap <S-left> <C-W><C-H>
