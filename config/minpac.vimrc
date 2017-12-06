
" https://github.com/k-takata/minpac.git - used for package management
" https://thoughtbot.com/upcase/videos/neovim-minpac
packadd minpac
call minpac#init()
call minpac#add('k-takata/minpac', {'type':'opt'})
call minpac#add('scrooloose/nerdtree')
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')
call minpac#add('altercation/vim-colors-solarized')
call minpac#add('qpkorr/vim-renamer')
call minpac#add('thinca/vim-visualstar')
call minpac#add('mileszs/ack.vim')
call minpac#add('machakann/vim-highlightedyank')
call minpac#add('tpope/vim-repeat')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-commentary')
call minpac#add('Snaptags/vim-gitgutter')
call minpac#add('Chiel92/vim-autoformat')
call minpac#add('vim-scripts/ReplaceWithRegister')
call minpac#add('Snaptags/vim-fullscreen')
call minpac#add('ryanoasis/vim-devicons')
call minpac#add('tpope/vim-fugitive')
call minpac#add('mhinz/vim-startify')
call minpac#add('Yggdroot/indentLine')
call minpac#add('vimwiki/vimwiki')
call minpac#add('tyru/open-browser.vim')
call minpac#add('tpope/vim-characterize')
call minpac#add('pangloss/vim-javascript')
call minpac#add('mxw/vim-jsx')
call minpac#add('w0rp/ale')

" minpac commands:
command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

" auto-install plugins if they are missing
if !isdirectory($VIMHOME . '/pack/minpac/start/vim-airline')
    call minpac#update()
    so $MYVIMRC
endif
