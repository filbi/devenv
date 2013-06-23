"Fuck the standard vi options
set nocompatible
syntax on
"Gentoo defaults
"set backspace=indent,eol,start
"set ruler
filetype plugin on

"utf-8 rocks
set encoding=utf-8
set fenc=utf-8
set termencoding=utf-8

"some movement options
set nostartofline

"Taglist dependecy
filetype on

"Some devel options
set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set number
set list
set lcs=tab:▸\ ,trail:+,extends:>

"mappings
map <space> <c-f>
set pastetoggle=<F7>
map <F8> :set spell!<CR>
imap <F8> <ESC>:set spell!<CR>a
map <f9> <c-]>		"go to def
map <f10> :set laststatus=2<CR>		" display statusline
map <silent> <f12> :Tlist<CR>
imap <silent> <f12> <esc>:Tlist<CR>a
map <F4> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

"spell
setlocal spell spelllang=en
set spell!


"Some search options
set showmatch
set incsearch
set ignorecase
set smartcase
set wrapscan
set gdefault


"Split Window Options
"map <C-J> <C-W>j<C-W>_
"map <C-K> <C-W>k<C-W>_
set wmh =0

set showcmd        " Show (partial) command in status line.


" Make p in Visual mode replace the selected text with the "" register.
"vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>


"filbert magic enter key
"imap <ENTER> <ESC>o


"some default options
autocmd FileType c,cpp,slang set cindent
autocmd FileType make set noexpandtab shiftwidth=8
autocmd FileType c,cpp,java,javascript,php inoremap <buffer> { {<CR>}<C-O>O
autocmd FileType c,cpp inoremap <buffer> \[:graph:\]= =
"autocmd FileType c,cpp inoremap <buffer> \*\|\+\|-\|^\|&\||\&= =
"autocmd FileType c,cpp,java,php,python,text,html,xml,ruby,  inoremap <buffer> [ []<LEFT>
"autocmd FileType c,cpp,java,php,python,text,html,xml,ruby,  inoremap <buffer> ( ()<LEFT>
"autocmd FileType c,cpp,java,php,python,text,html,xml,ruby,  inoremap <buffer> " ""<LEFT>
"autocmd FileType c,cpp,java,php,python,text,html,xml,ruby,  inoremap <buffer> ' ''<LEFT>

ab #d #define
ab #i #include
ab $d $\displaystyle

"vim completion options
set completeopt=longest,menu,preview
set wildmode=list:longest
function! CleverTab()
    if strpart(getline('.'), 0, col('.')-1) =~ '^\s*$'
        return "\<Tab>"
    elseif pumvisible()
        return "\<C-E>\<C-N>"
    else
        return "\<C-N>"
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>
"inoremap <C-N> <C-R>=pumvisible() ? "\<lt>C-X>\<lt>C-N>" : "\<lt>C-N>"<CR>
"inoremap <Down> <C-R>=pumvisible() ? "\<lt>C-N>" : "\<lt>Down>"<CR>

"latex-suite dependency
set grepprg=grep\ -nH\ 
let g:tex_flavor='latex'

"don't use the last line
set scrolloff=5

" zeige alle aenderungen
" set report=0
" " das terminal ist nicht immer schnell (bsp. ssh-verbindung)
" set nottyfast
" wir benutzen dunklen hintergrund 
" set background=dark


"statuszeile
set laststatus=2							" statusline: always
set statusline=
set statusline+=%-3.3n\                      " buffer nummer
set statusline+=%f\                          " dateiname
"set statusline+=%h							  " helpflag
set statusline+=%y 							" dateityp
set statusline+=[%{&fileformat}][%{&fileencoding}]
set statusline+=%m%r%w                     " status flags
set statusline+=%=                           " folgendes rechts
set statusline+=0x%-8B                       " hex-wert des zeichens
set statusline+=%-14(%l/%L,%c%)               " zeile, zeichen
set statusline+=%<%P                         " datei position
"set statusline=[%n]\ [%f]\ %w%y%r%m[%{&fileformat}][%{&fileencoding}]\ %=\ %l/%L,%-5c\ %P\ 

" Tabulatoren durch Leerzeichen ersetzen
" set expandtab
" Zeilenanfang markieren, wenn umgebrochen
" set showbreak=+
" Bei Fehler nicht piepsen, sondern visuelle Anzeige
" set noerrorbells
" Tabulatoren und Zeilenende NICHT anzeigen
" set nolist

"GUI OPTIONS""""""""""""""""""""""""
"set guioptions-=t
"set guioptions-=T
"set guioptions-=m
"set guioptions+=M
"set guiheadroom=0            "the ratpoison option

if $TMUX == ""
    if &term =~ "screen"
        " set title in screen hardstatus line (see manpage)
        set t_ts=_
        set t_fs=\
    endif
endif

" cool way to change cursor color depending on insert/non-insert mode
"if &term =~ "xterm-256color"
"let &t_SI = "\<Esc>]12;purple\x7"
"let &t_EI = "\<Esc>]12;blue\x7"
"endif
