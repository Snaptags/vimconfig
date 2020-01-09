
" Enable spell checking by default:
set spelllang=de_20,en,it,nl,pt
if !&diff
  set spell
endif

" fancy spelling toggle
" source: http://vim.wikia.com/wiki/Toggle_spellcheck_with_function_keys
let g:myLangList=["de_20,en,it,nl,pt","de_20","en","it","nl","pt"]
function! ToggleSpell()
    if !exists( "b:myLang" )
        if &spell
            let b:myLang=index(g:myLangList, &spelllang)
        else
            let b:myLang=0
        endif
    endif
    let b:myLang = b:myLang + 1
    if b:myLang >= len(g:myLangList) | let b:myLang=0 | endif
    execute "setlocal spell spelllang=".get(g:myLangList, b:myLang)
    echo "spell checking language:" g:myLangList[b:myLang]
endfunction
nmap <silent> <F7> :call ToggleSpell()<CR>
nmap <silent> <F8> :se spell!<CR>

" Don't hijack the entire screen for spell checking, just show the top 9 results
" in the commandline.
" Press 0 for the full list. Any key press that's not a valid option (1-9) will
" behave as normal.
" source: https://vi.stackexchange.com/questions/19680/how-can-i-make-vim-not-use-the-entire-screen-for-spelling-suggestions/19681#19681
function! QuickSpell()
    if &spell is 0
        echohl Error | echo "Spell checking not enabled" | echohl None
        return
    endif

    " Separator between items.
    let l:sep = ' | '

    " Show as many columns as will fit in the window.
    let l:sug = spellsuggest(expand('<cword>'), 9)
    let l:c = 0
    for l:i in range(0, len(l:sug))
        let l:c += len(l:sug[l:i - 1]) + len(printf('%d ', l:i + 1))
        " The -5 is needed to prevent some hit-enter prompts, even when there is
        " enough space (bug?)
        if l:c + (len(l:sep) * l:i) >= &columns - 5
            break
        endif
    endfor

    " Show options; make it stand out a bit.
    echohl QuickFixLine
    echo join(map(l:sug[:l:i - 1], {i, v -> printf('%d %s', l:i+1, l:v)}), l:sep)
    echohl None

    " Get answer.
    let l:char = nr2char(getchar())

    " Display regular spell screen on 0.
    if l:char is# '0'
        normal! z=
        return
    endif

    let l:n = str2nr(l:char)

    " Feed the character if it's not a number, so it's easier to do e.g. "ciw".
    if l:n is 0 || l:n > len(l:sug)
        " clear the line to remove the options
        echo ""
        return feedkeys(l:char)
    endif

    " Replace!
    exe printf("normal! ciw%s\<Esc>", l:sug[l:n-1])
    echo
endfunction
nnoremap zs :call QuickSpell()<CR>
