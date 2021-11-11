" This callback will be executed when the entire command is completed
function! OnPushed(channel)
  unlet g:asyncPushOutput
  " clear status line
  echo ""
endfunction

function! AsyncPush()
  " Make sure we're running VIM version 8 or higher.
  if v:version < 800
    echoerr 'asyncPush requires VIM version 8 or higher'
    return
  endif

  if exists('g:asyncPushOutput')
    echo 'Already running task in background'
  else
    echo 'pushing changes…'
    " Launch the job.
    " Notice that we're only capturing out, and not err here. This is because, for some reason, the callback
    " will not actually get hit if we write err out to the same file. Not sure if I'm doing this wrong or?
    let g:asyncPushOutput = tempname()
    call job_start('git push', {'close_cb': 'OnPushed', 'out_io': 'file', 'out_name': g:asyncPushOutput})
  endif
endfunction

:command! -buffer W  execute "silent Gwrite | silent Git commit -a -m 'update'" | call AsyncPush()
:command! -buffer WQ execute "Gwrite | Git commit -a -m 'update'" | Gpush | q
