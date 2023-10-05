set nocompatible
set modelines=0
syntax on
colorscheme fgv
let &t_8f = "[38;2;%lu;%lu;%lum"
let &t_8b = "[48;2;%lu;%lu;%lum"
set termguicolors
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
set diffopt+=internal,algorithm:patience
"set relativenumber
"set diffopt=horizontal
set viminfofile=$HOME/.local/var/viminfo

"mappings
inoremap kj <ESC>
inoremap <ESC> <NOP>
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

nnoremap <Leader><Leader> <C-^>
nnoremap <Leader>o :only<CR>
nnoremap <silent> <LocalLeader>s :syntax sync fromstart<CR>

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
autocmd VimEnter {} if &filetype != 'man' | execute 'CommandT' | endif

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

augroup YCM
    autocmd!
    autocmd FileType rust let b:ycm_hover = {
        \ 'command': 'GetType',
        \ 'syntax': &filetype
        \ }
    autocmd BufWrite,InsertLeave *.rs YcmCompleter Format
    autocmd FileType rust map gd :YcmCompleter GoToDefinition<CR>
augroup END

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
let g:CommandTMatchWindowReverse = 0
let g:ycm_key_list_select_completion = ['<C-n>']
let g:ycm_always_populate_location_list = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_global_ycm_extra_conf = '~/.config/confrepo/ycm_extra_conf.py'
let g:ale_echo_msg_format = '[%linter%] %s'
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:ale_linters = {'rust': [], 'typescript': ['rome', 'eslint', 'tsserver']}
let g:ale_linters_ignore = {'typescript': ['deno']}
let g:ale_fix_on_save = 1
let g:ale_fixers = {
    \'bash': ['shfmt'],
    \'go': ['goimports'],
    \'html': ['prettier'],
    \'javascript': ['rome'],
    \'typescript': ['rome'],
    \'typescriptreact': ['rome'],
    \'json': ['rome'],
    \'markdown': ['prettier'],
    \'python': ['black'],
    \'sh': ['shfmt'],
    \'vue': ['prettier'],
    \'xml': ['xmllint'],
    \'yaml': ['prettier'],
\}
let g:ale_json_jq_options = '--indent 4'
let g:ale_sh_shfmt_options = '--indent 4'

" cool way to change cursor color depending on insert/non-insert mode
"if &term =~ "xterm-256color"
"let &t_SI = "\<Esc>]12;purple\x7"
"let &t_EI = "\<Esc>]12;blue\x7"
"endif

call ale#Set('javascript_rome_executable', 'rome')
call ale#Set('javascript_rome_use_global', get(g:, 'ale_use_global_executables', 0))
call ale#Set('javascript_rome_options', '')

function! RomeExecutable(buffer) abort
  return ale#path#FindExecutable(a:buffer, 'javascript_rome', [
  \   'node_modules/@biomejs/cli-linux-x64/biome',
  \   'node_modules/@biomejs/cli-linux-arm64/biome',
  \   'node_modules/@biomejs/cli-win32-x64/biome.exe',
  \   'node_modules/@biomejs/cli-win32-arm64/biome.exe',
  \   'node_modules/@biomejs/cli-darwin-x64/biome',
  \   'node_modules/@biomejs/cli-darwin-arm64/biome',
  \   'node_modules/.bin/biome',
  \])
endfunction
function! RomeFormat(buffer) abort
  let l:executable = RomeExecutable(a:buffer)
  let l:options = ale#Var(a:buffer, 'javascript_rome_options')
  return {
  \   'command': ale#Escape(l:executable)
  \       . ' format'
  \       . (!empty(l:options) ? ' ' . l:options : '')
  \       . ' --stdin-file-path=%s',
  \}
endfunction

execute ale#fix#registry#Add('rome', 'RomeFormat', ['javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'json'], 'rome for javascript')

function! GetRomeProjectRoot(buffer) abort
    let l:rome_file = ale#path#FindNearestFile(a:buffer, 'biome.json')

    return !empty(l:rome_file) ? fnamemodify(l:rome_file, ':h') : ''
endfunction

call ale#linter#Define('typescript', {
\   'name': 'rome',
\   'lsp': 'stdio',
\   'executable': function('RomeExecutable'),
\   'command': '%e lsp-proxy',
\   'project_root': function('GetRomeProjectRoot'),
\})
