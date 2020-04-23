:command! -buffer W execute "Gwrite | Gcommit -a -m 'update'" | Gpush | GitGutter
:command! -buffer WQ execute "Gwrite | Gcommit -a -m 'update'" | Gpush | q
