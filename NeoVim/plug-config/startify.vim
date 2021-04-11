" Startify

let g:ascii = [
        \'Neovim'
        \]
let g:startify_custom_header =
          \ 'startify#pad(g:ascii + startify#fortune#boxed())'
let g:startify_custom_footer =
          \ 'startify#pad(startify#fortune#cowsay())'

let g:startify_change_to_vcs_root = 1

let g:startify_session_dir = '~/.dotSetup/NeoVim/session'

let g:startify_files_number = 10

let g:startify_lists = [
        \ { 'type': 'files',     'header': ['Files']            },
        \ { 'type': 'dir',       'header': ['Directories ['. getcwd().']'] },
        \ { 'type': 'sessions',  'header': ['Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['Bookmarks']      },
        \ { 'type': 'commands',  'header': ['Commands']       },
        \ ]

let g:startify_bookmarks = [
        \ {'n': '~/.config/nvim/init.vim'},
        \ {'b': '~/.bashrc'},
        \ ]

let g:startify_skiplist = [
        \ '^/tmp',
        \ ]


hi StartifyBracket ctermfg=240
hi StartifyFile    ctermfg=147
hi StartifyFooter  ctermfg=240
hi StartifyHeader  ctermfg=114
hi StartifyNumber  ctermfg=215
hi StartifyPath    ctermfg=245
hi StartifySlash   ctermfg=240
hi StartifySpecial ctermfg=240

