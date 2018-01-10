
" https://github.com/k-takata/minpac.git - used for package management
" https://thoughtbot.com/upcase/videos/neovim-minpac
packadd minpac
call minpac#init()
call minpac#add('k-takata/minpac', {'type':'opt'})
call minpac#add('altercation/vim-colors-solarized')
call minpac#add('ctrlpvim/ctrlp.vim')
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')
call minpac#add('thinca/vim-visualstar')
call minpac#add('machakann/vim-highlightedyank')
call minpac#add('tpope/vim-repeat')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-commentary')
call minpac#add('Chiel92/vim-autoformat')
call minpac#add('vim-scripts/ReplaceWithRegister')
call minpac#add('ryanoasis/vim-devicons')
call minpac#add('Yggdroot/indentLine')
call minpac#add('vimwiki/vimwiki')
call minpac#add('tyru/open-browser.vim')
call minpac#add('tpope/vim-characterize')
call minpac#add('pangloss/vim-javascript')
call minpac#add('leafgarland/typescript-vim')
call minpac#add('mxw/vim-jsx')

" when running on Android, don't load all plugins
let g:android = 0
if !has("win32")
    if " arm" == matchstr(system("uname -a"), " arm")
        let g:android = 1
    endif
endif

if g:android != 1
    call minpac#add('scrooloose/nerdtree')
    call minpac#add('qpkorr/vim-renamer')
    call minpac#add('Snaptags/vim-fullscreen')
    call minpac#add('chrisbra/csv.vim')
    call minpac#add('Snaptags/vim-gitgutter')
    call minpac#add('tpope/vim-fugitive')
    call minpac#add('mhinz/vim-startify')
    call minpac#add('w0rp/ale')
    call minpac#add('Valloric/YouCompleteMe', {'type':'opt'})
endif

if has("python")
    packadd YouCompleteMe
endif

" minpac commands:
command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

" auto-install plugins if they are missing
if !isdirectory($VIMHOME . '/pack/minpac/start/vim-airline')
    call minpac#update()
    so $MYVIMRC
endif
