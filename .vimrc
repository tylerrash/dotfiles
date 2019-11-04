" This must be first, because it changes other options as a side effect
set nocompatible

" fzf
set rtp+=/usr/local/opt/fzf

" Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'easymotion/vim-easymotion'
Plugin 'mileszs/ack.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
" Plugin 'rhysd/vim-crystal'
" Plugin 'motus/pig.vim'
Plugin 'leafgarland/typescript-vim'
" Plugin 'aserebryakov/vim-todo-lists'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'flazz/vim-colorschemes'
"Plugin 'quramy/tsuquyomi'
Plugin 'ycm-core/YouCompleteMe'

call vundle#end()
filetype plugin indent on

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
set si                          " Smart indent
set expandtab                   " Use spaces instead of tabs
set shiftwidth=4                " 1 tab = 4 spaces
set tabstop=4                   " 1 tab = 4 spaces
"set cino=(0                    " align function arguments

" Colors, layout, etc.
set background=dark
" set cursorline                " Highlight current line
set relativenumber              " Show line numbers relative to current line
set number                      " Show line number of current line
syntax on                       " Enable syntax highlighting

" Solarized stuff
" colorscheme solarized
" let g:solarized_termtrans = 1

" Turn off swap files
set noswapfile
set nobackup
set nowb

" Diff
set diffopt=filler,vertical     " Display diffs side-by-side

" Buffers
set hidden                      " Allow switching buffers without saving

" Folding
fu! CustomFoldText()
    let fs = v:foldstart
    let fe = v:foldend
    let fl = v:foldlevel

    while getline(fs) =~ '^\s*$' | let fs = nextnonblank(fs + 1)
    endwhile

    if fs > v:foldend 
        let line = getline(v:foldstart)
    else
        let line = substitute(getline(fs), '\t', repeat('', &tabstop), 'g')
    endif

    let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
    let foldSize = 1 + fe - fs
    let foldSizeStr = " " . foldSize . " lines "
    let lineCount = line("$")
    let foldPct = printf("[%.1f", (foldSize*1.0)/lineCount*100) . "%] "
    let expansionStr = " " . repeat(".", w - strwidth(foldSizeStr.line.foldPct))

    return line . expansionStr . foldSizeStr . foldPct
endf

set foldlevel=2
set foldmethod=syntax
set foldtext=CustomFoldText()

" hi Folded cterm=NONE ctermfg=0 ctermbg=NONE

" Don't screw up folds when inserting text that might affect them, until
" leaving insert mode. Foldmethod is local to the window.
autocmd InsertEnter * let w:last_fdm=&foldmethod | setlocal foldmethod=manual
autocmd InsertLeave * let &l:foldmethod=w:last_fdm

" Different cursors for insert vs normal mode
" Cursor shapes: 0 = block, 1 = vertical bar, 2 = underline
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=2\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Status line 
set laststatus=2                " Always show the statusline
set statusline=\ %F             " File path
set statusline+=\ %m            " Modified flag
set statusline+=%=L:\ %l/%L     " Line number
set statusline+=\ \ C:\ %c\     " Column number

hi StatusLine ctermbg=NONE ctermfg=DarkGrey cterm=bold
hi LineNr ctermbg=NONE ctermfg=DarkGrey

" YouCompleteMe
highlight YcmErrorSection guibg=Red ctermbg=Red
highlight YcmErrorSection guifg=White ctermfg=White
highlight YcmWarningSign guibg=NONE ctermbg=NONE
highlight YcmWarningSign guifg=Red ctermfg=Red

" ==============================================================================
" Custom leader commands
" ==============================================================================

" TODO: should these be nnoremap?

" Set leader key to Space
let mapleader = "\<Space>"

" Reload .vimrc
map <Leader>r :so $MYVIMRC<CR>

" Clear search result higlighting
map <leader>h :noh<CR>

" Break line at 100 characters
map <Leader>b :ls<CR>
map <Leader>b 100<Bar>F<Space>i<CR>jj

" Copy to system clipboard
map <Leader>y :w !pbcopy<CR><CR>

" Format JSON
" map <Leader>j :execute '%!python -m json.tool' |

" Fugitive
map <Leader>gc :Gcommit<CR>
map <Leader>gb :Gblame<CR>
map <Leader>gd :Gdiff<CR>
map <Leader>gs :Gstatus<CR>
map <Leader>gw :Gwrite<CR>

" fzf
map <Leader>f :FZF<CR>

" YouCompleteMe
nnoremap <leader>jg :YcmCompleter GoTo<CR>
nnoremap <leader>jd :YcmCompleter GetDoc<CR>
nnoremap <leader>ju :YcmCompleter GoToReferences<CR>


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

" Buffer navigation
nnoremap <S-L> :bn<CR>:redraw<CR>:ls<CR>
nnoremap <S-H> :bp<CR>:redraw<CR>:ls<CR>
nmap <Leader><Tab> :b#<CR>

" Navigation between vim splits and tmux panes
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-H> :TmuxNavigateLeft<CR>
nnoremap <silent> <C-J> :TmuxNavigateDown<CR>
nnoremap <silent> <C-K> :TmuxNavigateUp<CR>
nnoremap <silent> <C-L> :TmuxNavigateRight<CR>
nnoremap <silent> <C-'> :TmuxNavigatePrevious<CR>

" Easier recursive unfolding
nnoremap zz zA

" Easily move lines
nnoremap <Up> :m-2<CR>==
nnoremap <Down> :m+<CR>==

" ==============================================================================
" Auto-correct 
" ==============================================================================

:ab funciton function
:ab unit16 uint16

" ==============================================================================
" File types
" ==============================================================================

" Detect file type
filetype plugin on

autocmd BufRead,BufNewFile *.less set filetype=css
autocmd BufRead,BufNewFile *.ts set filetype=typescript
autocmd BufRead,BufNewFile *.cr set filetype=crystal

autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
autocmd Filetype css setlocal ts=4 sw=4 expandtab
autocmd Filetype html setlocal ts=4 sw=4 expandtab
autocmd Filetype jade setlocal ts=4 sw=4 expandtab
autocmd Filetype phtml setlocal ts=4 sw=4 expandtab
autocmd Filetype javascript setlocal ts=2 sw=2 expandtab
autocmd Filetype typescript setlocal ts=2 sw=2 expandtab
autocmd FileType crystal setlocal ts=2 sw=2 expandtab

" ==============================================================================
" NERDtree
" ==============================================================================

" Open NERDtree when vim starts
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close vim when NERDtree is the only open window
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Open NERDtree
" map <Leader>n :NERDTreeTabsToggle<CR>

" ==============================================================================
" CtrlP
" ==============================================================================

let g:ctrlp_map = "<C-P>"

" ==============================================================================
" UltiSnips
" ==============================================================================

let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<C-F>"
let g:UltiSnipsJumpBackwardTrigger="<C-B>"

" ==============================================================================
" Easy Motion
" ==============================================================================

" Disable default mappings
let g:EasyMotion_do_mapping = 0

" Case-insensitive
let g:EasyMotion_smartcase = 1

" Bi-directional find-motion
nmap <Leader>s <Plug>(easymotion-s)

hi EasyMotionTarget ctermbg=NONE ctermfg=3
hi EasyMotionTarget2First ctermbg=NONE ctermfg=3
hi EasyMotionTarget2Second ctermbg=NONE ctermfg=3
hi EasyMotionShade ctermbg=NONE ctermfg=0

" ==============================================================================
" Handy functions
" ==============================================================================

" Inserts a newline between tightly spaced JS object properties
fu! FixObjectSpacing()
    :%s/\(},\)\(\n\s*\/\*\*\)/\1\r\2
endfu

" ==============================================================================
" vim-go
" ==============================================================================
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gg <Plug>(go-def)
au FileType go nmap <Leader>gt <Plug>(go-test)
au FileType go nmap <Leader>gc <Plug>(go-coverage)

" ==============================================================================
" ack
" ==============================================================================
nnoremap <Leader>a :Ack<Space>

" ==============================================================================
" Typescript
" ==============================================================================
let g:tsuquyomi_completion_detail = 1
autocmd FileType typescript setlocal completeopt-=menu
