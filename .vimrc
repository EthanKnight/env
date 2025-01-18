" Spaces instead of tabs at width 4
set expandtab
set shiftwidth=4
set softtabstop=4

" View customizations
set number relativenumber
set cursorline
set cursorlineopt=number
set scrolloff=3
set sidescroll=8
set nowrap
set colorcolumn=81

" QOL interfacing
set foldmethod=manual
set foldcolumn=1
set smartindent
"set clipboard^=unnamed,unnamedplus

" Create and configure leader functionality
let mapleader = " "
set notimeout
set ttimeout
set showcmd

" Custom maps
nnoremap Y "+yy
nnoremap ; :
nnoremap <leader><Esc> <Esc>
" Mark (mz) cursor pos, move cursor to first visual column (g0), mark (mw) new
" cursor pos, append semicolon to line (A;<Esc>), return to mark (`w) to reset
" view, and return to original mark (`z)
" NOTE: g$ would need to be used if reproducing functionality for a BOL input
nnoremap <leader>; mzg0mwA;<Esc>`w`z
nnoremap <leader>h :noh<CR>

" Set dynamic cursor moding for non-SSH sessions
let &t_SI = "\e[5 q"
let &t_SR = "\e[2 q"
let &t_EI = "\e[1 q"

colorscheme industry

" Detect filetype and enable tag-jumping with %
filetype plugin on
runtime macros/matchit.vim

" Default file skeletons
autocmd BufNewFile *.py 0r ~/.vim/templates/skeleton.py
autocmd BufNewFile *.sh 0r ~/.vim/templates/skeleton.sh

augroup update_header
    autocmd!
    " Mark (mz) cursor pos, move cursor to top of screen (H), mark again (mw)
    autocmd BufWritePre,FileWritePre *.py exe "normal mzHmw"
    " Update header last modified time at buffer write
    autocmd BufWritePre,FileWritePre *.py exe "g/#@knighet1 modified: /3s/# @.*/# @knighet1 modified: " . strftime("%Y-%m-%d %H:%M:%S %z")
    " Return to mark (`w), lower screen for cursor at top (zt), return (`z)
    autocmd BufWritePost,FileWritePost *.py exe "normal `wzt`z"
augroup END

" Save view when unfocus/leave buffer, restore when focus/reopen
augroup remember_folds
    autocmd!
    autocmd BufWinLeave * mkview
    autocmd BufWinEnter * silent! loadview
augroup END

augroup whitespace
    autocmd!
    " Set to 0 for PuTTY, DarkRed not displayed. Change later.
    autocmd Syntax * highlight spaces ctermbg=0 guibg=DarkGreen
    autocmd Syntax * syntax match spaces /    /
    "autocmd Syntax * highlight tabs ctermbg=1 guibg=DarkRed
    "autocmd Syntax * syntax match tabs /\t/
    autocmd Syntax * highlight trailing ctermbg=1 guibg=DarkRed
    autocmd Syntax * syntax match trailing /\s\+$/
augroup END

" Relative numbering for Normal/Visual, absolute for Insert/Command
augroup numbers
    autocmd!
    autocmd InsertEnter,CmdLineEnter * set number norelativenumber | redraw
    autocmd InsertLeave,CmdLineLeave * set number relativenumber   | redraw
augroup END

"augroup angle_brackets
"    autocmd!
"    autocmd FileType xml set matchpairs+=<:>;
"augroup END

highlight ColorColumn ctermbg=Red guibg=Red
highlight CursorLine cterm=NONE ctermbg=NONE ctermbg=NONE guibg=NONE guifg=NONE
highlight CursorLineNr cterm=NONE ctermfg=0 ctermbg=2 gui=NONE guifg=Yellow guibg=DarkRed
highlight Folded ctermbg=None
highlight FoldColumn ctermbg=None
