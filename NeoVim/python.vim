
" set python3 as default python interpreter
" let g:python3_host_prog=expand($HOME.'/miniconda3/bin/python3')

    " call plug#begin('~/.config/nvim/plugged')
    " " """"""""""""""""""""""
    " " Python-related plugins
    " " """"""""""""""""""""""
    " " Autocompletion for python
    " Plug 'davidhalter/jedi-vim' "<- also checkout COC.vim
    " " Syntax highlighting for Python
    " Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
    " " 'PEP8' python
    " Plug 'Vimjas/vim-python-pep8-indent'
    " " Folding python script
    " Plug 'tmhedberg/SimpylFold'
    " " Close '(' '{' '[' ... automagically after opening them (and more)
    " Plug 'jiangmiao/auto-pairs'

    " call plug#end()

" =======
" THEME =
" =======
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
