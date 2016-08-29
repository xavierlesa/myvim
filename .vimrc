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
" set bs=2

" columnas y lineas
" set co=80
" set lines=24
set number
set ruler

set nocompatible
filetype on
filetype plugin on

map <C-o> :browse tabnew<CR>
map <C-t> :tabnew<CR>
map <C-TAB> :tabnext<CR>
map <S-C-TAB> :tabprevious<CR>
map <F9> :NERDTreeToggle<CR>


:function Tildes2Acute()
:   %s/á/\&aacute;/gc
:   %s/é/\&eacute;/gc
:   %s/í/\&iacute;/gc
:   %s/ó/\&oacute;/gc
:   %s/ú/\&uacute;/gc
:   %s/ñ/\&ntilde;/gc
:   %s/Á/\&Aacute;/gc
:   %s/É/\&Eacute;/gc
:   %s/Í/\&Iacute;/gc
:   %s/Ó/\&Oacute;/gc
:   %s/Ú/\&Uacute;/gc
:   %s/Ñ/\&Ntilde;/gc
:endfunction

:function Acute2Tildes()
:   %s/&aacute;/á/gc
:   %s/&eacute;/é/gc
:   %s/&iacute;/í/gc
:   %s/&oacute;/ó/gc
:   %s/&uacute;/ú/gc
:   %s/&ntilde;/ñ/gc
:   %s/&Aacute;/Á/gc
:   %s/&Eacute;/É/gc
:   %s/&Iacute;/Í/gc
:   %s/&Oacute;/Ó/gc
:   %s/&Uacute;/Ú/gc
:   %s/&Ntilde;/Ñ/gc
:endfunction
