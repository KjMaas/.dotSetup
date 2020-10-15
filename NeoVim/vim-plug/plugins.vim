"=========================================
"=            Plugin section             =
"=        (managed with vim-plug:        =
"= https://github.com/junegunn/vim-plug) =
"=========================================

" auto-install vim-plug manager if it isn't already done:
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif



" install plugins:
call plug#begin('~/.config/nvim/autoload/plugged')

    " Navigation <
    " Plug 'preservim/nerdtree'
    " Tab completion
    " Plug 'ervandew/supertab'

    " Graphical undo tree
    Plug 'sjl/gundo.vim'

    " Improved '*' search
    Plug 'bronson/vim-visual-star-search'
    " Automatically remove search highlights when done
    Plug 'haya14busa/is.vim'

    " Commenting
    Plug 'tpope/vim-commentary'
    " Incrementing dates... and more!
    Plug 'tpope/vim-speeddating'
    " Enhance the experience of making sessions
    Plug 'tpope/vim-obsession'
    " Focus attention
    Plug 'junegunn/goyo.vim'
    " Aspect
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'junegunn/seoul256.vim' " <- color scheme
    Plug 'morhetz/gruvbox'       " <- color scheme
    " Visualize colors
    Plug 'chrisbra/Colorizer'
    " Fuzzy-search
    Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
    Plug 'junegunn/fzf.vim'
    " Enable '.' (repeat command) with plugins
    Plug 'tpope/vim-repeat'
    " Surround your word/sentence/paragraph and whatelse with anything you want
    Plug 'tpope/vim-surround'
    " debugging code... this makes NeoVim really look like an IDE...
    Plug 'puremourning/vimspector' 
    " enable multiple cursors
    Plug 'mg979/vim-visual-multi'
    " easy search
    Plug 'eugen0329/vim-esearch'


    " """""""""""""""""""
    " Git-related plugins
    " """""""""""""""""""
    " Git versionning
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter' " <- can slow down your Nvim xp, maybe?
    Plug 'tpope/vim-rhubarb' " <- shortcut to repo on Ghub

    " """"""""""""""""""""""
    " Python-related plugins
    " """"""""""""""""""""""
    " Autocompletion for python
    Plug 'davidhalter/jedi-vim'
    Plug 'neoclide/coc.nvim', { 'branch': 'release' }
    " Syntax highlighting for Python
    Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
    " 'PEP8' python
    Plug 'Vimjas/vim-python-pep8-indent'
    " Folding python script
    Plug 'tmhedberg/SimpylFold'
    " Close '(' '{' '[' ... automagically after opening them (and more)
    Plug 'jiangmiao/auto-pairs'
    " add code snippets
    " Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'


call plug#end()


" " Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
