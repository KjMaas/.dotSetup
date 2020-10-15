
" set python interpreter

let g:python_host_prog = '/home/kjm/.pyenv/versions/nvim3/bin/python'
let g:python3_host_prog = '/home/kjm/.pyenv/versions/nvim3/bin/python'

" ================
" = PYTHON THEME =
" ================
    " dark mode rules!
    set background=dark
    " take the best out of gruvbox
    let g:gruvbox_italic=1
    set termguicolors
    " change color theme:
    colorscheme gruvbox
    " change airline theme:
    let airline_theme='gruvbox' " other themes: 'distinguished', ''



" Wrapping and tabs.set tw=78 ts=4 sw=4 sta et sts=4 ai

" pythonic indentation
" """"""""""""""""""""
" au BufNewFile,BufRead *.py
"     \ set expandtab       " replace tabs with spaces
"     \ set autoindent      " copy indent when starting a new line
"     \ set tabstop=4
"     \ set softtabstop=4
"     \ set shiftwidth=4
