"" Plugin
call plug#begin('~/.local/share/nvim/plugged')
    Plug 'altercation/vim-colors-solarized'
    Plug 'benekastah/neomake' 
    Plug 'kassio/neoterm'
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'zchee/deoplete-jedi'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'derekwyatt/vim-scala'
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'godlygeek/tabular'
    Plug 'eagletmt/ghcmod-vim'
    Plug 'Shougo/vimproc.vim', { 'do' : 'make'}
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'tpope/vim-surround'
    Plug 'scrooloose/nerdcommenter'
    Plug 'scrooloose/nerdtree'
    Plug 'eagletmt/neco-ghc'
    Plug 'neovimhaskell/haskell-vim'
    Plug 'morhetz/gruvbox'
    Plug 'airblade/vim-gitgutter'
    Plug 'rust-lang/rust.vim'
    Plug 'sebastianmarkow/deoplete-rust'
    Plug 'vim-pandoc/vim-pandoc'
    Plug 'vim-pandoc/vim-pandoc-syntax'
call plug#end()


""" Editor settings
set mouse=a
"" Leader key
let mapleader=" "

"" Line number/break configuration
set number 		" Line numbering
set cursorline          " Highlight current line
set linebreak		" Line breaking
set showmode            " Show what mode we are in


"" Search configuration
set hlsearch		" Highlight searches
set ignorecase          " Ignore case when search
set smartcase		" Search case only when not-lower
set incsearch           " Highlight as typing query
nmap <Leader>n :let@/=""<CR>


"" Syntax and spelling
set termguicolors
set spell		" Enables spell checking
colorscheme gruvbox
set background=dark

"" Indents and tabs
set autoindent		" Starts new line on previous indentation level
set expandtab           " Use spaces instead of tabs
set smarttab            " Auto insert and delete according to shiftwidth at start of line

set sw=4 sts=4

"" Tex recognize
au BufNewFile,BufRead *.tex setlocal ft=tex

au BufNewFile,BufRead *.text setlocal ft=pandoc

"" File specific tab sizes
autocmd FileType ruby,haskell,haml,eruby,yaml,html,javascript,sass,cucumber,cabal set ai sw=2 sts=2
autocmd FileType java,python set sw=4 sts=4
autocmd FileType make setlocal noexpandtab


"" Random
set showcmd             " Show typed commands on the last line

""" Keybindings
"" Navigating through line breaks
nmap j gj
nmap k gk

"" Navigating splits
map <Leader>h <C-w>h
map <Leader>j <C-w>j
map <Leader>k <C-w>k
map <Leader>l <C-w>l

map <C-l> :vertical resize +5<CR>
map <C-k> :resize +5<CR>


"" Opening slpits
map <Leader>sv :vsplit<CR>
map <Leader>sh :split<CR>

"" Escape key
inoremap hj <Esc>
tnoremap hj <C-\><C-n>

"" Saving and loading nvimrc
map <Leader>w :w<CR>
map <Leader>pl :source ~/.config/nvim/init.vim<CR>
map <Leader>po :e ~/.config/nvim/init.vim<CR>


"" Installing and managing plugins
map <Leader>pi :PlugInstall<CR>
map <Leader>pu :PlugUpdate<CR>
map <Leader>pc :PlugClean<CR>

"" Background switcher
map <Leader>b :let &background = ( &background == "dark"? "light" : "dark" )<CR>

""" Plugin configuration
"" Neomake
autocmd! BufWritePost * Neomake
""let = g:neomake_haskell_enabled_makers=['hlint', 'hdevtools', 'ghc-mod']


map <Leader>lo :lopen<CR>
map <Leader>lc :lclose<CR>


"" Vim airline
let g:airline_powerline_fonts = 1

"" Ctrl P
let g:ctrlp_user_command = 'ag %s -l -g ""'

"" Deoplete 
let g:deoplete#enable_at_startup = 1
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-n>" :deoplete#mappings#manual_complete()
let g:python_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'
let g:deoplete#sources#jedi#python_path = '/usr/local/bin/python3'

"" Necoghc
let g:haskellmode_completion_ghc = 0
let g:necoghc_enable_detailed_browse = 1
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

"" Tabularize
vmap a= :Tabularize /=<CR>
vmap a: :Tabularize /::<CR>
vmap a- :Tabularize /-><CR>
vmap a& :Tabularize /&<CR>
vmap a\ :Tabularize /\\<CR>
vmap aa :Tabularize 

"" NerdTREE
map <Leader>d :NERDTreeToggle<CR>


"" Neoterm
let g:neoterm_position = 'vertical'
let g:neoterm_automap_keys = ',tt'
let g:neoterm_use_relative_path = 1

function! s:RunIPython()
  let cmd = "%run " . expand('%') . "\n"
  silent! call neoterm#exec(cmd)
endfunction
command! -nargs=* RunIPython call s:RunIPython()

"" Ultisnips
let g:UltiSnipsExpandTrigger="<Esc>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

""" Language 

"" Pandoc configuration
let g:pandoc#syntax#conceal#use=0
let g:pandoc#modules#disables = []
let g:pandoc#formatting#mode="ha"

"" Haskell

" GHC-mod
let $PATH = $PATH . ':' . expand('~/.local/bin')
autocmd FileType haskell map <silent> <Leader>gtt :GhcModType<CR>
autocmd FileType haskell map <silent> <Leader>gti :GhcModTypeInsert<CR>
autocmd FileType haskell map <silent> <Leader>gtc :GhcModTypeClear<CR>
autocmd FileType haskell map <silent> <Leader>gfc :GhcModSplitFunCase<CR>
autocmd FileType haskell map <silent> <Leader>gsc :GhcModSigCodegen<CR>

" Haskell-vim
let g:haskell_classic_highlighting = 0
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`


""" Default runbindings
autocmd Filetype tex map <buffer> <Leader>r :w<CR> :T texbuild<CR>
autocmd Filetype tex map <buffer> <silent> <Leader>o :!open -a "Skim.app" *.pdf<CR>
autocmd Filetype haskell map <buffer> <silent> <Leader>i :T stack ghci <CR>
autocmd Filetype haskell map <buffer> <silent> <Leader>r :w<CR>:T :! clear<CR>:T :reload<CR>
autocmd Filetype haskell map <buffer> <silent> <Leader>t :w<CR>:T :! clear<CR>:T :l %<CR>
autocmd Filetype python map <buffer> <Leader>r :w<CR> :RunIPython() <CR>
autocmd Filetype python map <buffer> <Leader>i :w<CR> :T ipython3<CR>
autocmd Filetype python map <buffer> <Leader>t :w<CR> :T nosetests<CR>
autocmd Filetype c map <buffer> <Leader>r :w<CR> :T clear<CR> :T make run<CR>
autocmd Filetype make map <buffer> <Leader>r :w <CR> :T clear<CR> :T make all<CR>
autocmd Filetype make map <buffer> <Leader>t :w <CR> :T clear<CR> :T make clean<CR>
autocmd Filetype cpp map <buffer> <Leader>r :w <CR> :T clear<CR> :T make run<CR>
autocmd Filetype cpp map <buffer> <Leader>t :w <CR> :T clear<CR> :T make clean<CR>

""" Read local vim if available in project directory
function! ChompedSystem( ... )
    return substitute(call('system', a:000), '\n\+$', '', '')
endfunction

let gitrootconfig = ChompedSystem("git rev-parse --show-toplevel") . '/.nvimrc_proj'

if filereadable(gitrootconfig)
    execute('so ' . gitrootconfig)
endif
if filereadable(".nvimrc_proj")
    so .nvimrc_proj
endif




