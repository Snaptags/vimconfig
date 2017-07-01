
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
