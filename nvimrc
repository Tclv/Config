"" Plugins
call plug#begin('~/.nvim/plugged')
    Plug 'altercation/vim-colors-solarized'
    Plug 'benekastah/neomake'
    Plug 'kassio/neoterm'
    Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'derekwyatt/vim-scala'
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'godlygeek/tabular'
call plug#end()

""" Editor settings

"" Leader key
let mapleader=" "

"" Line number/break configuration
set number 		" Line numbering
set cursorline          " Highlight current line
set linebreak		" Line breaking 


"" Search configuration
set hlsearch		" Highlight searches
set ignorecase          " Ignore case when search
set smartcase		" Search case only when not-lower
set incsearch           " Highlight as typing query
nmap <Leader>n :let@/=""<CR>


"" Syntax and spelling
syntax enable		" Enables syntax highlighting
set spell		" Enables spell checking
colorscheme solarized
set background=dark

"" Indents and tabs
set autoindent		" Starts new line on previous indentation level
set expandtab           " Use spaces instead of tabs
set sw=4 sts=4

"" Tex recognize
au BufNewFile,BufRead *.tex setlocal ft=tex

"" File specific tab sizes
autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber set ai sw=2 sts=2
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
map <Leader>cl :source ~/.config/nvim/init.vim<CR>
map <Leader>co :e ~/.config/nvim/init.vim<CR>

"" Installing and managing plugins
map <Leader>pi :PlugInstall<CR>


"" Background switcher
map <Leader>b :let &background = ( &background == "dark"? "light" : "dark" )<CR>


""" Plugin configuration
"" Neomake
autocmd! BufWritePost * Neomake

"" Ctrl P
let g:ctrlp_user_command = 'ag %s -l -g ""'

"" YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/config/.ycm_extra_conf.py'
let g:EclimCompletionMethod = 'omnifunc'

"" Neoterm
let g:neoterm_position = 'vertical'
let g:neoterm_automap_keys = ',tt'

"" Ultisnips
let g:UltiSnipsExpandTrigger="<esc>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"


" elseif filereadable(system("git rev-parse --show-toplevel") + ".nvimrc_proj")

function! ChompedSystem( ... )
    return substitute(call('system', a:000), '\n\+$', '', '')
endfunction

let gitrootconfig = ChompedSystem("git rev-parse --show-toplevel") . '/.nvimrc_proj'

""" Default runbindings
autocmd Filetype tex map <buffer> <Leader>r :w<CR> :T texfind <bar> xargs latexmk -pvc<CR>
autocmd Filetype tex map <buffer> <silent> <Leader>o :!open -a "Skim.app" *.pdf<CR>
autocmd Filetype haskell map <buffer> <silent> <Leader>i :T ghci -Wall<CR>
autocmd Filetype haskell map <buffer> <silent> <Leader>r :w<CR>:T :! clear<CR>:T :l %<CR>
autocmd Filetype python map <buffer> <Leader>r :w<CR> :T python %<CR>
autocmd Filetype python map <buffer> <Leader>t :w<CR> :T nosetests<CR>

""" Read local vim if available in project directory
if filereadable(gitrootconfig)
    execute('so ' . gitrootconfig)
endif
if filereadable(".nvimrc_proj")
    so .nvimrc_proj
endif

