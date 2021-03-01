" Vimspector

let g:vimspector_enable_mappings = 'HUMAN'
nmap <Leader>db :call vimspector#ToggleBreakpoint()<CR>
nmap <Leader>dn :call vimspector#Continue()<CR>
nmap <Leader>do :call vimspector#StepOver()<CR>
nmap <Leader>dO :call vimspector#StepOut()<CR>
nmap <Leader>di :call vimspector#StepInto()<CR>
nmap <Leader>dd :call vimspector#Launch()<CR>
nmap <Leader>dx :VimspectorReset<CR>
nmap <Leader>de :VimspectorEval 
nmap <Leader>dw :VimspectorWatch 
nmap <Leader>ds :VimspectorShowOutput 
" packadd! vimspector
