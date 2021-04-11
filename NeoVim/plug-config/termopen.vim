" Termopen

let g:termopen_autoinsert = 1


" TermOpen([command], [window], [callback])
"   command  : command to execute (default = &shell)
"   window   : [s]plit (default)
"              [m]aximized split
"              [v]ertical split
"              [t]ab
"   callback : function to call when done (default = close window)

" open a shell in a new split (= default behavior)
    nmap  <silent> <A-Return>    :call TermOpen(&shell, 'v')<CR>
  
" open a python shell in a new split
    nmap <Leader>p :call TermOpen('python')<CR>

" open Tig in a new tab
    nmap <A-g> :call TermOpen('tig', 't')<CR>


" TermOpenRanger([command], [window])
"   command  : command to execute (default = 'ranger')
"   window   : [s]plit
"              [m]aximized split (default)
"              [v]ertical split
"              [t]ab

" open Ranger a maximized split and edit the selected file(s)
    " nmap <Leader>r :call TermOpenRanger()<CR>

" alternative: use LF instead (much shorter startup time)
    " nmap <Leader>f :call TermOpenRanger('lf')<CR>
    "
" my favorite: https://github.com/samtay/tetris
    " nmap <Leader>T :call TermOpen('tetris', 'm')<CR>

