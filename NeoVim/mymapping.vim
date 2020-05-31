
" open new terminal splits @cwd
call NERDTreeAddKeyMap({
            \ 'key': 'ter',
            \ 'callback': 'NERDTreeOpenTerminal',
            \ 'quickhelpText': 'open new terminal in a v-split @cwd',
            \ 'scope': 'DirNode' })

function! NERDTreeOpenTerminal(dirnode)
    let dir_path = a:dirnode.path.str()
    vsplit
    exe 'cd' dir_path
    terminal
    startinsert
endfunction

