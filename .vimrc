"Fuck the standard vi options
set nocompatible
syntax on
colorscheme fgv
"Gentoo defaults
"set backspace=indent,eol,start
"set ruler
filetype plugin indent on "is also Taglist dependency

"utf-8 rocks
set encoding=utf-8
set fenc=utf-8
set termencoding=utf-8

"some movement options
set nostartofline

"Some devel options
set smartindent
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set number
set list
set lcs=tab:▸\ ,trail:+,extends:>
set showbreak=↪
set textwidth=80
set hlsearch
"set diffopt=horizontal

"mappings
map <space> <c-f>
set pastetoggle=<F7>
map <silent> <f12> :Tlist<CR>
imap <silent> <f12> <esc>:Tlist<CR>a
"map <F4> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q -o ~/.tags/cpptags $(pwd)<CR>
"map <F5> :!ctags -R --python-kinds=-i  -o ~/.tags/pytags $(pwd)<CR>

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

"some default options
autocmd FileType c,cpp,slang set cindent
autocmd FileType c,cpp,python set colorcolumn=81
autocmd FileType make set noexpandtab shiftwidth=8

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
"inoremap <Tab> <C-R>=CleverTab()<CR>
"inoremap <C-N> <C-R>=pumvisible() ? "\<lt>C-X>\<lt>C-N>" : "\<lt>C-N>"<CR>
"inoremap <Down> <C-R>=pumvisible() ? "\<lt>C-N>" : "\<lt>Down>"<CR>

"latex-suite dependency
set grepprg=grep\ -nH\ 
let g:tex_flavor='latex'

"don't use the last line
set scrolloff=5

"statuszeile
set laststatus=2							" statusline: always
set statusline=
set statusline+=%-3.3n\                      " buffer nummer
set statusline+=%f\                          " dateiname
set statusline+=%y 							" dateityp
set statusline+=[%{&fileformat}][%{&fileencoding}]
set statusline+=%m%r%w                     " status flags
set statusline+=%=                           " folgendes rechts
set statusline+=0x%-8B                       " hex-wert des zeichens
set statusline+=%-14(%l/%L,%c%)               " zeile, zeichen
set statusline+=%<%P                         " datei position

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
