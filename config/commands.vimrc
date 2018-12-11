
if has("autocmd")
  augroup vimrc
    autocmd!
    autocmd BufReadPost *Owncloud/VimWiki/ToDo.md :normal! Go
    " Source the vimrc file after saving it
    autocmd bufwritepost vimrc source $MYVIMRC
    autocmd bufwritepost .vimrc source $MYVIMRC
    autocmd bufwritepost airline.vimrc source $MYVIMRC
    autocmd bufwritepost commands.vimrc source $MYVIMRC
    autocmd bufwritepost diffexpr.vimrc source $MYVIMRC
    autocmd bufwritepost general.vimrc source $MYVIMRC
    autocmd bufwritepost keys.vimrc source $MYVIMRC
    autocmd bufwritepost minpac.vimrc source $MYVIMRC
    autocmd bufwritepost plugin_settings.vimrc source $MYVIMRC
    autocmd bufwritepost spelling.vimrc source $MYVIMRC
    autocmd bufreadpost vimrc NERDTree $VIMHOME/config/
    autocmd bufreadpost .vimrc NERDTree $VIMHOME/config/
    if has("gui_running")
      autocmd VimEnter * call StartUp()
      autocmd VimLeavePre * if g:screen_size_restore_pos == 1 | call ScreenSave() | endif
    endif
  augroup END
  augroup vimrc_help
    autocmd!
    " open help in VERTICAL split
    autocmd BufEnter *.txt if &buftype == 'help' | wincmd L | endif
  augroup END
endif

" JSON formatting
:command! Json :%!python -m json.tool

" shortcuts for vim renamer
let g:RenamerSupportColonWToRename = 1
:command! F s/.*/folder.jpg/|nohl
:command! Dela %s/\(^\d\d - \).* - /\1/|%s/^01 - /&/|nohl

:command! P terminal powershell.exe -NoExit -file "d:\ownCloud\Software-Settings\Windows Powershell\profile.ps1"
