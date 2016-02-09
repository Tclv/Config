set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'godlygeek/tabular'
Plugin 'kchmck/vim-coffee-script'
Plugin 'LaTeX-Box-Team/LaTeX-Box'
Plugin 'rizzatti/dash.vim'
Plugin 'derekwyatt/vim-scala'
Plugin 'tpope/vim-sleuth'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

:let mapleader="\<Space>"

syntax enable
set background=light
set nu
set cursorline
colorscheme solarized
" set spell
set wrap
set nolist
set linebreak
set shell=/bin/bash
set fdm=syntax
set backspace=indent,eol,start
set hlsearch
au BufNewFile,BufRead *.py setlocal fdm=indent
set foldlevelstart=20
set scrolloff=5 " Scroll-boundaries
au BufNewFile,BufRead *.tex setlocal ft=tex
au BufNewFile,BufRead *.pynb setlocal ft=python


cabbr <expr> %% expand('%:p:h')
" Size indent
set expandtab
set autoindent
set spell spelllang=en_gb

set wildignore+=*.class,*.aux,*.out,*.toc,*.bbl,*.blg,*.fdb_latexmk,*.fls,*.log,*.pdf,*.run.xml,*.pyc

"""" Leader Mappings
" Tabularize
map <Leader>a= :Tabularize /=<CR>
map <Leader>a= :Tabularize /=<CR>
map <Leader>a: :Tabularize /:\zs<CR>
map <Leader>a: :Tabularize /:\zs<CR>
map <Leader>a& :Tabularize /&<CR>
map <Leader>a& :Tabularize /&<CR>
" Change focus
map <Leader>h <C-w>h
map <Leader>j <C-w>j
map <Leader>k <C-w>k
map <Leader>l <C-w>l
" Change split position
map <Leader>H <C-w>H
map <Leader>J <C-w>J
map <Leader>K <C-w>K
map <Leader>L <C-w>L
" Misc
map <Leader>ch :nohl<CR>
map <Leader>w :w<CR>
map <Leader>e :e
map <Leader>vs :vsplit<CR>
map <Leader>ss :split<CR>

map <Leader>hl :nohlsearch<CR>


let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
" Line break behaviour
nmap j gj
nmap k gk

noremap <C-c> :nohl<CR>

inoremap <Esc> <nop>
inoremap hj <Esc>

" Filetype dependant runfiles
autocmd Filetype c,cpp map <buffer> <Leader>r :w<CR> :!make<CR>
autocmd Filetype python map <buffer> <Leader>r :w<CR> :!python %<CR>
autocmd Filetype python map <buffer> <Leader>t :w<CR> :!nosetests<CR>
autocmd Filetype tex map <buffer> <Leader>r :w<CR> :T texfind <bar> xargs latexmk -xelatex<CR>
autocmd Filetype sh map <buffer> <Leader>r :w<CR> :!./%<CR>
autocmd Filetype tex map <silent> <Leader>o :!open *.pdf<CR>
autocmd Filetype java :ProjectImportDiscover .<CR>
autocmd Filetype haskell map <buffer> <Leader>r :w<CR> :!hugs %<CR>

set t_Co=256



" YCM
let g:ycm_register_as_syntastic_checker = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_global_ycm_extra_conf = '~/config/.ycm_extra_conf.py'
let g:EclimCompletionMethod = 'omnifunc'

" Dash
:nmap <silent> <leader>d <Plug>DashSearch

" Ultisnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<esc>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Vim airline
set laststatus=2
let g:airline_powerline_fonts = 1

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_python_checkers = ['flake8', 'pylint']
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_java_checkers = ['javac', 'checkstyle']
let g:syntastic_java_javac_config_file_enabled = 1
map <Leader>c :SyntasticCheck <CR>

let g:syntastic_python_flake8_args='--ignore=E501'


" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

if has("multi_byte")
    if &termencoding == ""
        let &termencoding = &encoding
    endif
    set encoding=utf-8
    setglobal fileencoding=utf-8
    "setglobal bomb
     set fileencodings=ucs-bom,utf-8,latin1
endif

if filereadable(".vimrc_proj")
    so .vimrc_proj
endif
