"# vim: fdm=marker foldenable sw=4 ts=4 et sts=4 

" Plugins, autoload y ctags {{{

set nocompatible
filetype on
filetype plugin on

if has('python3')
  silent! python3 1
endif

"" Init Pathogen {{{
try
    execute pathogen#infect()
catch
    echo "Pathogen no se cargo?"
endtry
"" }}}

"" TAGS {{{
set tags=./tags;,tags;$HOME
"" }}}

"" Plugins para JS y JSX {{{
""" jsx, verifica jsx dentro de .js
let g:jsx_ext_required = 0
""" jsx estricto
"let g:jsx_pragma_required = 1
"" }}}

"" Vim-Airline: control de buffers {{{
" mustra los buffers como tabs
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '>'

" tabline format
" https://github.com/vim-airline/vim-airline#default
"let g:airline#extensions#tabline#formatter = 'unique_tail'


" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
"nmap <leader>T :enew<cr>
 
" Move to the next buffer
nmap gt :bnext<CR>

" Move to the previous buffer
nmap gT :bprevious<CR>
 
" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
"nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
"nmap <leader>bl :ls<CR>
"" }}}

"" CtrlP {{{
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Set default mode as buffer
let g:ctrlp_cmd = 'CtrlPBuffer'

" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg|pyc|swp)$',
\}

" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version
" control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'

"" }}}

" }}}


" Customs del entorno, colores y esas cosas {{{

highlight ColorColumn guibg=purple
call matchadd('ColorColumn', '\%81v', 80)

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

" backspace compatible
set backspace=indent,eol,start

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
"set bs=2

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


" Congiguración para netrw / NerdTree {{{

"if exists("NERDTree") || exists('t:NERDTreeBufName') && bufwinnr(t:NERDTreeBufName) != -1
    " Existe NerdTree
    let g:NERDTreeGlyphReadOnly = ''
    let g:NERDTreeDirArrows = 1
    let g:NERDTreeDirArrowExpandable = '▸'
    let g:NERDTreeDirArrowCollapsible = '▾'
    nmap <C-n> :NERDTreeToggle<CR>
"else
"    " Usa por defecto newtr
"    let g:netrw_banner = 0
"    let g:netrw_liststyle = 3
"    " Hit enter in the file browser to open the selected
"    let g:netrw_browse_split = 4
"    " file with :vsplit to the right of the browser.
"    let g:netrw_altv = 1
"    let g:netrw_winsize = 25
"
"    " Change directory to the current buffer when opening files.
"    set autochdir
"
"    "augroup ProjectDrawer
"    "    autocmd!
"    "    autocmd VimEnter * :Vexplore
"    "augroup END
"
"    " Toggle Vexplore with Ctrl-E
"    function! ToggleVExplorer()
"      if exists("t:expl_buf_num")
"          let expl_win_num = bufwinnr(t:expl_buf_num)
"          if expl_win_num != -1
"              let cur_win_nr = winnr()
"              exec expl_win_num . 'wincmd w'
"              close
"              exec cur_win_nr . 'wincmd w'
"              unlet t:expl_buf_num
"          else
"              unlet t:expl_buf_num
"          endif
"      else
"          exec '1wincmd w'
"          Vexplore
"          let t:expl_buf_num = bufnr("%")
"      endif
"    endfunction
"
"    " Mapeo para newtr igual que NerdTree
"    "nmap <silent> <C-n> :call ToggleVExplorer()<CR>
"    " map <silent> <C-n> :VExplorer<CR>
"    " map <C-n> :Explore<CR>
"endif

" }}}


" Snippets y shortcuts {{{

" Mapeo de comandos propios [y ajenos]
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

" Wrap {% trans "" %} {{{
xnoremap <silent> trans xi{% trans "" %}<ESC>3hP
" }}}

" Wrap {% static "" %} {{{
xnoremap <silent> static xi{% static "" %}<ESC>3hP
" }}}
" }}}
