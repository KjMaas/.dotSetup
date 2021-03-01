" Gitgutter
set updatetime=100
nmap <Leader>ghl :GitGutterLineHighlightsToggle<CR>
nmap <Leader>ghn :GitGutterLineNrHighlightsToggle<CR>
let g:gitgutter_map_keys = 1
nmap ghp <Plug>(GitGutterPreviewHunk)
nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)
nmap [c <Plug>(GitGutterPrevHunk)
nmap ]c <Plug>(GitGutterNextHunk)
" show changes in the status bar
function! GitStatus()
    let [a,m,r] = GitGutterGetHunkSummary()
    return printf('+%d ~%d -%d', a, m, r)
endfunction
set statusline+=%{GitStatus()}
