if &compatible | set nocompatible | endif " Avoid side effects if `nocp` already set

let $VIMHOME=expand('<sfile>:p:h')
source $VIMHOME/config/general.vimrc
source $VIMHOME/config/minpac.vimrc
source $VIMHOME/config/plugin_settings.vimrc
source $VIMHOME/config/commands.vimrc
source $VIMHOME/config/keys.vimrc
source $VIMHOME/config/spelling.vimrc
source $VIMHOME/config/airline.vimrc
source $VIMHOME/config/diffexpr.vimrc
