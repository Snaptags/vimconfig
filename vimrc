if &compatible | set nocompatible | endif " Avoid side effects if `nocp` already set

" detect Android to disable incompatible stuff
let g:android = 0
if !has("win32")
    if " arm" == matchstr(system("uname -a"), " arm")
        let g:android = 1
    endif
endif

let $VIMHOME=expand('<sfile>:p:h')
source $VIMHOME/config/general.vimrc
source $VIMHOME/config/minpac.vimrc
source $VIMHOME/config/plugin_settings.vimrc
if g:android != 1
  source $VIMHOME/config/commands.vimrc
  source $VIMHOME/config/keys.vimrc
endif
source $VIMHOME/config/spelling.vimrc
if has('vim_starting')
  source $VIMHOME/config/airline.vimrc
endif
source $VIMHOME/config/diffexpr.vimrc
