 
" ####################
" My NeoVim settings #
" ####################


" STUFF THAT NEEDS TO BE TRIED BEFORE VALIDATION AND ORGANISATION INTO .VIMRC
    let g:python_host_prog = '/home/kjm/.pyenv/versions/nvim2/bin/python'
    let g:python3_host_prog = '/home/kjm/.pyenv/versions/nvim3/bin/python'

    " auto-reload buffers when changed
    autocmd FocusGained,BufEnter * :checktime
    " change current working directory to active file
    set noautochdir " <- can conflict with Fugitive plugin (if true set to 'no')
    " use filetype plugins
    :filetype plugin indent on
" STUFF THAT NEEDS TO BE TRIED BEFORE VALIDATION AND ORGANISATION INTO .VIMRC


 source $HOME/.dotSetup/NeoVim/vim-plug/plugins.vim


" ======================
" PLUGIN CUSTOMIZATION =
" ======================
" source $HOME/.dotSetup/NeoVim/plug-config/coc.vim
source $HOME/.dotSetup/NeoVim/plug-config/esearch.vim
source $HOME/.dotSetup/NeoVim/plug-config/fugitive.vim
" source $HOME/.dotSetup/NeoVim/plug-config/fzf.vim
source $HOME/.dotSetup/NeoVim/plug-config/gitgutter.vim
source $HOME/.dotSetup/NeoVim/plug-config/goyo.vim
source $HOME/.dotSetup/NeoVim/plug-config/gundo.vim
source $HOME/.dotSetup/NeoVim/plug-config/sneak.vim
source $HOME/.dotSetup/NeoVim/plug-config/startify.vim
source $HOME/.dotSetup/NeoVim/plug-config/suckless.vim
luafile $HOME/.dotSetup/NeoVim/plug-config/treesitter.lua
source $HOME/.dotSetup/NeoVim/plug-config/termopen.vim
source $HOME/.dotSetup/NeoVim/plug-config/ultisnips.vim
source $HOME/.dotSetup/NeoVim/plug-config/vimspector.vim
" Fuzzy-search
source $HOME/.dotSetup/NeoVim/plug-config/telescope.vim
" LSP
source $HOME/.dotSetup/NeoVim/plug-config/lspconfig.vim
luafile $HOME/.dotSetup/NeoVim/plug-config/compe.lua
luafile $HOME/.dotSetup/NeoVim/lua/lsp/python-ls.lua



" =========
" FOLDING =
" =========
    " folding settings (use 'za' to open/close a fold)
        set foldmethod=indent   " fold based on indent
        set foldnestmax=5      " deepest fold is 7 levels
        set nofoldenable        " (don't) fold by default
        set foldlevel=2         " ...
    " Disable code folding in Markdown
        let g:vim_markdown_folding_disabled=1


" =======
" THEME =
" =======
    " dark mode rules!
        set background=dark
    " take the best out of gruvbox
        let g:gruvbox_italic=1
        set termguicolors
    " change color theme:
        " other themes: 'seoul256', ''
        colorscheme gruvbox
    " change airline theme:
        let airline_theme='gruvbox' " other themes: 'distinguished', ''
    " do not show in which mode you are (now handled by airline)
        set noshowmode
    " cursor properties
        :set guicursor=n:blinkon10
        :set guicursor=n:blinkoff10
        :set guicursor=n:blinkwait10
        :highlight Cursor gui=reverse
        :highlight Cursor gui=NONE guifg=bg guibg=fg
    " Transparent Background (For i3 and compton)
        highlight Normal guibg=NONE ctermbg=NONE
        highlight LineNr guibg=NONE ctermbg=NONE




" ================
" GENERAL SPECTS =
" ================
    " remap the <leader> key
        :let mapleader="\<Space>"
    " use system clipboard
        set clipboard+=unnamedplus
    " enable mouse interaction (in all modes)
        set mouse=a
    " set default shell for neovim terminal
        :set shell=bash
    " how many commands you can undo
        set history=1000
    " display the cursor position in the lower-right position of the window
        set ruler
    " display line number in front of each line (with relative nb for current line)
        set number relativenumber
    " keep a certain number of lines from top or bottom while scrolling
        set scrolloff=3
    " statusline (current & non-current), vertical, fold and diff filling characters
        set fillchars=stl:\_,stlnc:\-,vert:\|,fold::,diff:-
    " more convenient way to edit and source files
        nnoremap <leader>en :vs $MYVIMRC<CR>
        nnoremap <leader>sn :source $MYVIMRC<CR>
        nnoremap <leader>eb :vs ~/.bashrc<CR>
        nnoremap <leader>sb :source ~/.bashrc<CR>
        nnoremap <leader>ss :source %<CR>
    " enable space and newline even in normal mode
        nnoremap <space> i<space><Esc>
        nnoremap <CR> a<CR><Esc>
        nnoremap <backspace> <Left>x
    " make backspace consistent with other programs
        set backspace=indent,eol,start
    " enable spell checking
        map <F2> :setlocal spell! spelllang=en_us<CR>
    " Red underline for spelling errors
        hi clear SpellBad
        hi SpellBad cterm=underline ctermfg=009 guifg=#ff0000
 

" ============
" navigation =
" ============
    " go to normal mode from insert or terminal mode with 'jk'
        inoremap jk <Esc>
        tnoremap jk <C-\><C-n>
    " move into wrapped lines
        nnoremap k gk
        nnoremap j gj
    " faster scrolling
        " set scroll=5
        nnoremap <C-U>  5<C-U>
        nnoremap <C-D>  5<C-D>
        inoremap <C-U>  <Esc>5<C-U>i
        inoremap <C-D>  <Esc>5<C-D>i
        " function SmoothScroll(up)
        "     if a:up
        "         let scrollaction="\<C-Y>"
        "     else
        "         let scrollaction="\<C-E>"
        "     endif
        "     exec "normal " . scrollaction
        "     redraw
        "     let counter=1
        "     while counter<&scroll
        "         let counter+=1
        "         sleep 1m
        "         redraw
        "         exec "normal " . scrollaction
        "     endwhile
        " endfunction

        " nnoremap <C-U> :call SmoothScroll(1)<Enter>
        " nnoremap <C-D> :call SmoothScroll(0)<Enter>
        " inoremap <C-U> <Esc>:call SmoothScroll(1)<Enter>i
        " inoremap <C-D> <Esc>:call SmoothScroll(0)<Enter>i

    " ':w', ':wq' and ':q!' -> now also available in insert mode
        inoremap :w<CR> <Esc>:w<CR>
        inoremap :wq<CR> <Esc>:wq<CR>
        inoremap :q!<CR> <Esc>:q!<CR>


" =========================
" COMMAND LINE PROPERTIES =
" =========================
    " Show commands being typed
    set showcmd
    " Two lines for the command line
    set cmdheight=2


" =================
" FILE PROPERTIES =
" =================
    " keep a backup copy of a file when editing it (backup is removed when saved)
    set writebackup
    " persistent undo, even after closing vim
    set undofile
    " switch on syntax highlighting
    :syntax on
    " dissable case-sentitive search... but in a smart way!
    set ignorecase smartcase
    " highlight search matches
    set hlsearch
    " remove highlights manually
    nnoremap <Esc> :nohlsearch<CR><Esc>
    inoremap <Esc> <Esc>:nohlsearch<CR>i


" ============
" CODE STYLE =
" ============
    " smart indents
    set autoindent smartindent
    " tab formating
    set smarttab
    set tabstop=4
    set softtabstop=4
    set expandtab
    set shiftwidth=4
    set shiftround
    " use the indent and formatting of the previous line
    map <leader>i :setlocal noautoindent <bar> setlocal formatoptions-=cro<CR>
    map <leader>I :setlocal autoindent <bar> setlocal formatoptions=cro<CR>


" ====================
" CODE COMPREHENSION =
" ====================
    " highlight the cursor line and column
    set cursorline cursorcolumn
    " highlight yanks for half a second
    let g:highlightedyank_highlight_duration=900
    " display tabs and trailing spaces visually
    set list listchars=tab:>-,trail:-
    " set maximum number of characters in a single line
    set textwidth=80
    " color rows that have lines longer than 81 columns, lines shouldn't be that long
    highlight ColorColumn ctermbg=magenta
    call matchadd('ColorColumn', '\v%81v', 100)
    set colorcolumn=+1
    highlight ColorColumn ctermbg=234 guibg=#1C1C1C
    " Matching bracket color
    hi MatchParen cterm=bold ctermbg=none ctermfg=magenta
    " Highlight matching brackets
    set showmatch


" =====================
" CODE TRANSFORMATION =
" =====================
    " move lines up and down and indent them
    nnoremap <C-j> :m .+1<CR>==
    nnoremap <C-k> :m .-2<CR>==
    inoremap <C-j> <Esc>:m .+1<CR>==gi
    inoremap <C-k> <Esc>:m .-2<CR>==gi
    vnoremap <C-j> :m '>+1<CR>gv=gv
    vnoremap <C-k> :m '<-2<CR>gv=gv
    " augmented search-and-replace
    nnoremap <Leader>r :%s///g<Left><Left>
    nnoremap <Leader>rc :%s///gc<Left><Left><Left>
    xnoremap <Leader>r :s///g<Left><Left>
    xnoremap <Leader>rc :s///gc<Left><Left><Left>
    " augmented substitude (with sweet '.' capabilities)
    nnoremap <silent> s* :let @/='\<'.expand('<cword>').'\>'<CR>cgn
    xnoremap <silent> s* "sy:let @/=@s<CR>cgn
    " yank til end of line
    nnoremap Y y$



" =============
" OTHER STUFF =
" =============
    " calculator
    inoremap <silent> <C-C> <C-R>=string(eval(input("Calculate: ")))<CR>


" ==================
" CUSTOM FUNCTIONS =
" ==================
    augroup HiglightTodo
    " highlight TODO
            autocmd!
            autocmd WinEnter,VimEnter * :silent! call matchadd('Todo', 'TODO', -1)
            autocmd WinEnter,VimEnter * :silent! call matchadd('headers', '\v(<\".+\=>)', -1)
    augroup END

    " toggle background light / dark
    fun! ToggleBackground()
      if (&background ==? 'dark')
        set background=light
      else
        set background=dark
      endif
    endfun
    nnoremap <silent> <F10> :call ToggleBackground()<CR>





" ###########################
" EXPERIMENTAL and GHOST CODE
" ###########################
"Key mapping
"____________
" disable arrow keys in normal mode
    nnoremap <Left> :echoe "Use h"<CR>
    nnoremap <Right> :echoe "Use l"<CR>
    nnoremap <Up> :echoe "Use k"<CR>
    nnoremap <Down> :echoe "Use j"<CR>

