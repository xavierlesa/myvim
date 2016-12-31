"# vim: fdm=marker foldenable sw=4 ts=4 et sts=4 

" Plugins, autoload y ctags {{{
execute pathogen#infect()
set nocompatible
filetype on
filetype plugin on

set tags=./tags;,tags;$HOME
" }}}


" Customs del entorno, colores y esas cosas {{{
highlight ColorColumn guibg=purple
call matchadd('ColorColumn', '\%81v', 100)
" }}}


" UI/UX General {{{

" Coloreado por sintaxis
syntax on

" Paleta de colores para fondo oscuro (si usas fondo claro colocar light en lugar de dark)
set background=dark

colorscheme desert

" Indentacion segun el tipo de archivo detectado
if has("autocmd")
    filetype indent on
endif

" Mostrar parentesis que se emparejan
set showmatch

" Tabulador de 4 espacios
set shiftwidth=4
set tabstop=4
set smarttab
set expandtab
set autoindent
set softtabstop=4
set hlsearch
set bs=2

" columnas y lineas
" set co=80
" set lines=24
set number
set ruler

" fonts
" Menlo\ Regular 13
set guifont=Menlo\ Regular:h13
set laststatus=2
set ttimeoutlen=50
set encoding=utf-8
let g:airline_theme = 'molokai'
" }}}


" Congiguración para NerdTree {{{
let g:NERDTreeGlyphReadOnly = ''
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" }}}


" Snippets y shortcuts {{{
" Mapeo de comandos propios [y ajenos]
map <C-n> :NERDTreeToggle<CR>
nnoremap ,vcx :sp ~/vim_cheatsheet.vim<CR>

function! Header_django_template()
    put='{% comment %}'
    put='# fdm=marker foldenable sw=4 ts=4 et sts=4 filetype=htmldjango'
    put='Block: '
    put='{% endcomment %}'
endfunction
nnoremap ,tpl gg:call Header_django_template()<CR>

" }}}


" Funciones personales, tildes y esas cosas {{{

" Tildes2Acute: busca caracteres con tíldes y ñuflo y los transforma en &?atuce {{{
function! Tildes2Acute()
   %s/á/\&aacute;/gc
   %s/é/\&eacute;/gc
   %s/í/\&iacute;/gc
   %s/ó/\&oacute;/gc
   %s/ú/\&uacute;/gc
   %s/ñ/\&ntilde;/gc
   %s/Á/\&Aacute;/gc
   %s/É/\&Eacute;/gc
   %s/Í/\&Iacute;/gc
   %s/Ó/\&Oacute;/gc
   %s/Ú/\&Uacute;/gc
   %s/Ñ/\&Ntilde;/gc
endfunction
" }}}

" Acute2Tildes: busca caracteres con &?acute y los transforma tíldes y ñuflo {{{
function! Acute2Tildes()
   %s/&aacute;/á/gc
   %s/&eacute;/é/gc
   %s/&iacute;/í/gc
   %s/&oacute;/ó/gc
   %s/&uacute;/ú/gc
   %s/&ntilde;/ñ/gc
   %s/&Aacute;/Á/gc
   %s/&Eacute;/É/gc
   %s/&Iacute;/Í/gc
   %s/&Oacute;/Ó/gc
   %s/&Uacute;/Ú/gc
   %s/&Ntilde;/Ñ/gc
endfunction
" }}}

" HLNext: Highlight Next {{{
function! HLNext(blinktime)
    set invcursorline
    redraw
    exec 'sleep '. float2nr(a:blinktime * 1000) . 'm'
    set invcursorline
    redraw
endfunction

nnoremap <silent> n n:call HLNext(0.3)<CR>
" }}}

" Convert_to_li: crea una lista de <li> a partir de la selección actual {{{
function! Convert_to_li() range
    let lnum = a:firstline
    while lnum <= a:lastline
        let curr_line = getline(lnum)
        "busca y reemplaza cualquier & que no sea un &WORD es decir que el & 
        "preceda de una palabra.
        "let replacement = substitute(curr_line,'&\(\w\+;\)\@!','&amp;','g')
        call setline(lnum, "<li>" . curr_line . "</li>")
        let lnum = lnum + 1
    endwhile
endfunction

vnoremap <silent> L :'<,'>call Convert_to_li()<CR>
" }}}
" }}}
