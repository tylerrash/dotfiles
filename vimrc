" Use vim settings, rathern than vi settings
" This must be first, because it changes other options as a side effect
set nocompatible

" Load Pathogen plugins
execute pathogen#infect()

" Load powerline
" source /usr/local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim

"
" ============================================================================== 
" General config
" ============================================================================== 

set autoread                    " Auto-read a file that is changed outside
set backspace=eol,start,indent  " Allow backspace in insert mode
set clipboard=unnamed           " Access system clipboard
set history=1000                " Store 1000 cmdline commands in history
set mat=2                       " Tenths of a second to blink when matching brackets
set scrolloff=10                " Keep at least 5 lines above/below
set showcmd                     " Show incomplete commands at the bottom
set showmatch                   " Show matching brackets
set showmode                    " Show current mode at the bottom

" Search
set hlsearch                    " Highlight search results
set ignorecase                  " Ignore case when search
set incsearch                   " Find the next match as you type
set smartcase                   " Don't ignore case if you type uppercase 

" Indentation
set ai                          " Auto-indent
set expandtab                   " Use spaces instead of tabs
set shiftwidth=4                " 1 tab = 4 spaces
set tabstop=4                   " 1 tab = 4 spaces

" Status line 
set laststatus=2                " Always show the statusline
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h%=L:\ %l/%L\ \ C:\ %c\ 

" Colors, layout, etc.
set background=dark
set cursorline                  " Highlight current line
set number                      " Show line numbers
syntax on                       " Enable syntax highlighting

" Solarized stuff
colorscheme solarized
let g:solarized_termtrans = 1

" Turn off swap files
set noswapfile
set nobackup
set nowb

" Different cursors for insert vs normal mode
" Cursor shapes: 0 = block, 1 = vertical bar, 2 = underline
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=2\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" ==============================================================================
" Custom leader commands
" ==============================================================================

" Set leader key to ,
let mapleader = ","		
let g:mapleader = ","

" Tab management
map <leader>tc :tabclose<cr>
map <leader>te :tabedit
map <leader>tm :tabmove
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tt :tabnext<cr>

" Clear search result higlighting
map <leader>h :noh<cr>

" ==============================================================================
" Remap commands
" ============================================================================== 

" Back to normal mode
imap jj <Esc>

" Disable ex mode
nnoremap Q <nop>

" Quick yank to the end of the line
nnoremap Y y$

" Avoid shift for getting to the command line
nnoremap ; :

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" Home = Home, L = End
noremap H ^
noremap L $
vnoremap L g_

" Insert lines without entering insert mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" Open help in a new tab
:cabbrev help tab help

" ==============================================================================
" File types
" ==============================================================================

filetype plugin on              " Detect file type

autocmd BufRead,BufNewFile *.less set filetype=css

autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
autocmd Filetype css setlocal ts=4 sw=4 expandtab
autocmd Filetype html setlocal ts=4 sw=4 expandtab
autocmd Filetype jade setlocal ts=4 sw=4 expandtab
autocmd Filetype phtml setlocal ts=4 sw=4 expandtab
autocmd Filetype javascript setlocal ts=4 sw=4 expandtab

" ==============================================================================
" NERDtree
" ==============================================================================

" Open NERDtree when vim starts
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close vim when NERDtree is the only open window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Open NERDtree
map <leader>n :NERDTreeTabsToggle<CR>

" ==============================================================================
" UltiSnips
" ==============================================================================

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
