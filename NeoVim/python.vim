
" set python3 as default python interpreter
let g:python3_host_prog=expand('/usr/miniconda3/bin/python3')

" Wrapping and tabs.set tw=78 ts=4 sw=4 sta et sts=4 ai

" pythonic indentation
" """"""""""""""""""""
" au BufNewFile,BufRead *.py
"     \ set expandtab       " replace tabs with spaces
"     \ set autoindent      " copy indent when starting a new line
"     \ set tabstop=4
"     \ set softtabstop=4
"     \ set shiftwidth=4
