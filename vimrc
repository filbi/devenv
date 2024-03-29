set nocompatible
set modelines=0
syntax on
colorscheme fgv
set backspace=start ",indent,eol
set nojoinspaces
set directory-=.
set ruler
set showcmd " Show (partial) command in status line.
set switchbuf=useopen,usetab,split
set clipboard-=autoselect
filetype plugin indent on

"utf-8 rocks
set encoding=utf-8
set fenc=utf-8
set termencoding=utf-8

"some movement options
set nostartofline
set scrolloff=5 "don't use the last line

"Some devel options
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set number
set list
set lcs=tab:▸\ ,trail:+,extends:>
set showbreak=↪
set textwidth=80
set cinoptions+=g0,N-s,t0,(0,u0,Ws,k2s
set formatoptions+=jro
set cursorline
set cursorlineopt=number
"set relativenumber
"set diffopt=horizontal
set viminfofile=$HOME/.local/var/viminfo

"mappings
inoremap kj <ESC>
cnoremap kj <C-c>
map <space> <c-f>
set pastetoggle=<F7>
" do not skip wrapped lines
nnoremap j gj
nnoremap k gk

"Some search options
set showmatch
set incsearch
set ignorecase
set smartcase
set wrapscan
set gdefault
set hlsearch
noremap <silent> <leader><space> :nohlsearch<CR>
"dont move cursor to next match when * and always search case-sensitive
nnoremap <silent> * :let @/ = '\C\<<C-R>=expand('<cword>')<CR>\>'\| setl hls<CR>
nnoremap <silent> # ?\C\<<C-R>=expand('<cword>')<CR>\><CR>
nmap <leader>g :let @/='\C\<<C-R><C-W>\>' \| set hls \| Ggrep! -q -w <cword> \| cclose \| tabedit \| copen<CR><C-W>L<C-W>\|

"Split Window Options
"map <C-J> <C-W>j<C-W>_
"map <C-K> <C-W>k<C-W>_
set wmh =0
set noequalalways

autocmd FileType cpp,rust setlocal matchpairs+=<:>
autocmd FileType c,cpp,python,sh,gitcommit setlocal colorcolumn=+1
autocmd FileType c,cpp,python,sh,go,rust nnoremap p ]p
autocmd FileType c,cpp,python,sh,go,rust nnoremap P ]P
autocmd FileType c,cpp map gd :YcmCompleter GoToImprecise<CR>
autocmd FileType gitcommit setlocal spell textwidth=68
autocmd FileType markdown setlocal spell textwidth=68 conceallevel=2
autocmd FileType make setlocal noexpandtab shiftwidth=8
autocmd FileType go setlocal noexpandtab shiftwidth=4 nolist
autocmd FileType qf nmap <buffer> <cr> <cr>:lcl<cr>

"vim completion options
set completeopt=longest,menu,preview
set wildmode=list:longest
set wildignore+=*.o,*.obj,.git,*.swp,*.bak,*.pyc
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

"latex-suite dependency
set grepprg=grep\ -nH\ 

"statuszeile
set laststatus=2 " statusline: always
set statusline=
set statusline+=%-3.3n\                     " buffer nummer
set statusline+=%t\                         " file name
set statusline+=%y                          " dateityp
set statusline+=[%{&fileformat}][%{&fileencoding}]
set statusline+=%m%r%w                      " status flags
set statusline+=%=                          " folgendes rechts
set statusline+=0x%-8B                      " hex-wert des zeichens
set statusline+=%-14(%l/%L,%c%)             " zeile, zeichen
set statusline+=%<%P                        " datei position

"GUI OPTIONS""""""""""""""""""""""""
"set guioptions-=t
"set guioptions-=T
"set guioptions-=m
"set guioptions+=M
"set guiheadroom=0            "the ratpoison option

set titlestring=VIM\ %t
set iconstring=VIM\ %t
if $TMUX != ""
    set t_ts=]2;
    set t_fs=\\
    set notitle
    set noicon
endif

" plugin options
let g:is_bash=1
let g:tex_flavor='latex'
let g:pyindent_open_paren = '&sw'
let g:pyindent_continue = '&sw'
let g:sql_type_default = 'mysql'
let g:markdown_fenced_languages = ['bash', 'python', 'rust', 'sh', 'javascript', 'typescript', 'json']
let g:UltiSnipsEditSplit = "horizontal"
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:CommandTAcceptSelectionMap = '<C-v>'
let g:CommandTAcceptSelectionVSplitMap = '<CR>'
let g:CommandTFileScanner = 'git'
let g:ycm_key_list_select_completion = ['<C-n>']

" cool way to change cursor color depending on insert/non-insert mode
"if &term =~ "xterm-256color"
"let &t_SI = "\<Esc>]12;purple\x7"
"let &t_EI = "\<Esc>]12;blue\x7"
"endif
