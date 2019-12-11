:command! W execute "Gwrite | Gcommit -a -m 'update'" | Gpush | GitGutter
:command! WQ execute "Gwrite | Gcommit -a -m 'update'" | Gpush | q
