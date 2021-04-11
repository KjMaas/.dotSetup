" suckless.vim


let g:suckless_tmap = 1

set splitbelow splitright

let g:suckless_min_width = 24      " minimum window width
let g:suckless_inc_width = 4       " width increment
let g:suckless_inc_height = 2      " height increment

let g:suckless_mappings = {
\        '<M-[sdf]>'      :   'SetTilingMode("[sdf]")'    ,
\        '<M-[hjkl]>'     :    'SelectWindow("[hjkl]")'   ,
\        '<M-[HJKL]>'     :      'MoveWindow("[hjkl]")'   ,
\      '<C-M-[hjkl]>'     :    'ResizeWindow("[hjkl]")'   ,
\        '<M-[oO]>'       :    'CreateWindow("[sv]")'     ,
\        '<M-c>'          :     'CloseWindow()'           ,
\        '<M-[&é"456789]>':       'SelectTab([123456789])',
\        '<M-[123456789]>': 'MoveWindowToTab([123456789])',
\      '<C-M-[&é"456789]>': 'CopyWindowToTab([123456789])',
\}


