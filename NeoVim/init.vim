
" ####################
" My NeoVim settings #
" ####################


" STUFF THAT NEEDS TO BE TRIED BEFORE VALIDATION AND ORGANISATION INTO .VIMRC
    " auto-reload buffers when changed
    autocmd FocusGained,BufEnter * :checktime
    " change current working directory to active file
    set autochdir " <- can conflict with Fugitive plugin (if true set to 'no')
    " use filetype plugins
    :filetype plugin indent on
" STUFF THAT NEEDS TO BE TRIED BEFORE VALIDATION AND ORGANISATION INTO .VIMRC


" ==============================================================================
" Plugin section (managed with vim-plug: https://github.com/junegunn/vim-plug) =
" ==============================================================================
    " auto-install vim-plug manager if it isn't already done:
    if empty(glob('~/.config/nvim/autoload/plug.vim'))
    !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
    endif

    " install plugins:
    call plug#begin('~/.config/nvim/plugged')

    " Git versionning
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    " Navigation
    Plug 'preservim/nerdtree'
    " Graphical undo tree
    Plug 'sjl/gundo.vim'
    " Commenting
    Plug 'tpope/vim-commentary'
    " incrementing dates... and more!
    Plug 'tpope/vim-speeddating'
    " enhance the experience of making sessions
    Plug 'tpope/vim-obsession'
    " Focus attention
    Plug 'junegunn/goyo.vim'
    " Aspect
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " Plug ' itchyny/lightline.vim' " <- lighter than vim-airline
    Plug 'junegunn/seoul256.vim' " <- color scheme
    Plug 'morhetz/gruvbox'       " <- color scheme
    " Visualize colors
    Plug 'chrisbra/Colorizer'
    " Plug 'ap/vim-css-color'
    " Tab completion
    Plug 'ervandew/supertab'
    " Fuzzy-search
    Plug 'ctrlpvim/ctrlp.vim'
    " Python-related plugins
    Plug 'tmhedberg/SimpylFold'

	Plug 'davidhalter/jedi-vim'
	"Plug 'http://github.com/tpope/vim-surround'

    " Browsing
	" Plug 'voldikss/vim-browser-search' " <- issue with finding browser check 'has(win32unix)'

    call plug#end()
 

" ======================
" PLUGIN CUSTOMIZATION =
" ======================
    " toggle Goyo on and off
        map <leader>g :Goyo<CR>
    " Supertab
        let g:SuperTabDefaultCompletionType = "<C-n>"
    " NerdTree
        map ² :NERDTree<CR>
        map &² :NERDTreeClose<CR>
        " open Nerd Tree in folder of file in active buffer
        map <Leader>² :NERDTree %:p:h<CR>
        " show hidden files (like '.*' files)
        let NERDTreeShowHidden=1 
        " sort nb by increasing value
        let NERDTreeNaturalSort=1
        " make NERDTree cd follow Nvim cd
        let NERDTreeChDirMode=3
        " prevent certain files from showing up in NERDTree
        let NERDTreeIgnore=['\~$', '^__pycache__$[[dir]]']
        " quit NERDTree when opening a file
        let NERDTreeQuitOnOpen=3
        " show line nbs also in NERDTree
        let NERDTreeShowLineNumbers=0
    " Fugitive
        map :Gdiff :Gvdiffsplit!

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
    " python autocompletion -> Jedi-Vim
        let g:jedi#use_splits_not_buffers = "left"
    " Gundo
        " toggle gundo tree
        nnoremap <leader>u :GundoToggle<CR>

"--------------------------------------------------------------------------------

" =========
" FOLDING =
" =========
    " folding settings (use 'zo' and 'zc' to open/close a fold)
    set foldmethod=indent   "fold based on indent
    set foldnestmax=10      "deepest fold is 10 levels
    set nofoldenable          "(don't) fold by default
    set foldlevel=2         "this is just what i use
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
    colorscheme gruvbox
    " change airline theme:
    let airline_theme='gruvbox' " other themes: 'distinguished', ''
    " do not show in which mode you are (now handled by airline)
    set noshowmode
    " set color (terminal-dependent)
    if &term =~ '256color'
        " disable Background Color Erase (BCE) so that color schemes
        " render properly when inside 256-color tmux and GNU screen.
        " see also httpas://sunaku.github.io/vim-256color-bce.html
        set t_ut=""
    endif




" ================
" GENERAL SPECTS =
" ================
    " use system clipboard
    " set clipboard+=unnamedplus
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
    set fillchars=stl:\ ,stlnc:\ ,vert:\ ,fold::,diff:-
    " remap the <leader> key
    :let mapleader=" "
    " more convenient way to edit and source files
    nnoremap <leader>en :vs $MYVIMRC<CR>
    nnoremap <leader>sn :source $MYVIMRC<CR>
    nnoremap <leader>eb :vs ~/.bashrc<CR>
    nnoremap <leader>sb :source ~/.bashrc<CR>
    nnoremap <leader>ss :source %<CR>
    " enable space and newline even in normal mode
    nnoremap <space> i<space><Esc>
    nnoremap <CR> a<CR><Esc>
    nnoremap <backspace> i<backspace><Esc>
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
    nnoremap <C-J> <C-d>
    nnoremap <C-K> <C-u>
    " ':w' and ':wq' -> now also available in insert and modes
    inoremap :w<CR> <Esc>:w<CR>
    inoremap :wq<CR> <Esc>:wq<CR>
    " cursor properties
    :set guicursor=n:blinkon10
    :set guicursor=n:blinkoff10
    :set guicursor=n:blinkwait10
    :highlight Cursor gui=reverse guifg=NONE guibg=NONE
    :highlight Cursor gui=NONE guifg=bg guibg=fg
    " Transparent Background (For i3 and compton)
    highlight Normal guibg=NONE ctermbg=NONE
    highlight LineNr guibg=NONE ctermbg=NONE


" ==================
" SPLIT MANAGEMENT =
" ==================
    " change default window spiting
    set splitright splitbelow
    " create a new Vsplit/Hsplit with a terminal now made easy
    nnoremap <Leader>v :vs <bar> :term<CR>i
    nnoremap <Leader>s :sp <bar> :term<CR>i
    " enhance window-switching experience
    nnoremap <A-h> <C-w>h
    nnoremap <A-j> <C-w>j
    nnoremap <A-k> <C-w>k
    nnoremap <A-l> <C-w>l
    inoremap <A-h> <Esc><C-w>h
    inoremap <A-j> <Esc><C-w>j
    inoremap <A-k> <Esc><C-w>k
    inoremap <A-l> <Esc><C-w>l
    tnoremap <A-h> <C-\><C-n><C-w>h
    tnoremap <A-j> <C-\><C-n><C-w>j
    tnoremap <A-k> <C-\><C-n><C-w>k
    tnoremap <A-l> <C-\><C-n><C-w>l
    " adjust split sizes
    noremap <silent> <C-Left> :vertical resize -3<CR>
    noremap <silent> <C-Right> :vertical resize +3<CR>
    noremap <silent> <C-Up> :resize +3<CR>
    noremap <silent> <C-Down> :resize -3<CR>
    " invert vert to horiz or horiz to vert splits
    map <leader>l <C-w>t<C-w>H
    map <leader>j <C-w>t<C-w>K


" ================
" TAB MANAGEMENT =
" ================
    " create a new tab with a terminal now made easy
    nnoremap <Leader>t :tabnew <bar> :term<CR>i


" =========================
" COMMAND LINE PROPERTIES =
" =========================
    " Show commands being typed
    set showcmd
    " Two lines for the command line
    set cmdheight=3


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
    " remove highlight
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
    " use the indent of the previous line
    map <leader>i :setlocal autoindent<CR>
    map <leader>I :setlocal noautoindent<CR>
    " map <leader>c :setlocal formatoptions-=cro<CR>
    " map <leader>C :setlocal formatoptions=cro<CR>


" ====================
" CODE COMPREHENSION =
" ====================
    " highlight the cursor line and column
    set cursorline cursorcolumn
    " highlight yanks for half a second
    let g:highlightedyank_highlight_duration=500
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


" =============
" OTHER STUFF =
" =============



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
"put word into curly braces, ex: example => {example}
nnoremap <leader>{ Bi{<Esc>Ea}<Esc>
"put word into brakets, ex: example => [example]
nnoremap <leader>[ Bi[<Esc>Ea]<Esc>
"put word into parenthesis, ex: example => (example)
nnoremap <leader>( Bi(<Esc>Ea)<Esc>
" disable arrow keys in normal mode
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>
" disable arrow keys in normal mode
