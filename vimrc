" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
syntax on
colorscheme badwolf

" Phatogen
call pathogen#infect()
call pathogen#helptags() " Make :help work for bundles

" Leader
let mapleader = ","

set enc=utf8
set smartindent
set autoindent
set ruler
set showcmd
set laststatus=2
set ignorecase
set smartcase
set go-=T
set mouse=a
set colorcolumn=80
set guioptions-=rL
set fillchars=diff:⣿,vert:│
set listchars=tab:▸\ ,eol:¬
set backspace=indent,eol,start
set hlsearch

" Tabs, spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Natural split opening positions
set splitbelow
set splitright

set winwidth=84
" We have to have a winheight bigger than we want to set winminheight. But if
" we set winheight to be huge before winminheight, the winminheight set will
" fail.
set winheight=5
set winminheight=5
set winheight=999"

noremap <leader><space> :noh<CR>

" Buffer navigation
nnoremap <Leader>p :bp<CR>
nnoremap <Leader>f :bn<CR>
nnoremap <Leader>b :b<Space>

" Shortcut to system clipboard
nnoremap <leader>c "*
vnoremap <leader>c "*y<CR>

" Exit insert mode with jj
inoremap jj <ESC>

" Go to function-defintion. Can't hit <C-]> with non-US layout :(
nmap ø <C-]>

" Additional colors
hi VertSplit        guibg=#252525 guifg=#5D6268 ctermbg=234 ctermfg=8
hi LineNr           guibg=#252525 guifg=#5D6268             ctermfg=240
hi ColorColumn      guibg=gray17                ctermbg=232
hi CursorLine                                   ctermbg=234
hi SyntasticErrorSign                                       ctermfg=160
hi SyntasticWarningSign                                     ctermfg=226

" Syntastic
let g:syntastic_error_symbol='X'
let g:syntastic_warning_symbol='!'

" Tabs
map <M-1> <Esc>:tabprev<CR>
map <M-2> <Esc>:tabnext<CR>
map <C-n> <Esc>:tabnew<CR>
map <C-t> <Esc>:tabnew<CR>
:nmap <A-1> :tabprevious<CR>
:map <ESC>1 :tabprevious<CR>
:map <A-2> :tabnext<CR>
:nmap <ESC>2 :tabnext<CR>
map ,t <Esc>:tabnew<CR>
:hi TabLineFill ctermfg=Black ctermbg=Black
:hi TabLine ctermfg=White ctermbg=Black
:hi TabLineSel ctermfg=White ctermbg=Red

" NERDTree
nnoremap <leader>t :NERDTreeToggle<cr>

let NERDTreeMinimalUI = 1
let NERDTreeChDirMode = 2

" Tagbar
nnoremap <leader>s :TagbarToggle<CR>

" Toggle line numbers
nmap <C-N><C-N> :set invnumber<CR>

" reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Timeouts
"set timeoutlen=350
"set ttimeout
"set ttimeoutlen=100

nnoremap <C-p> :Unite file_rec -auto-preview -start-insert<cr>

augroup Gitcommit
    au!

    au FileType gitcommit set spell
    au FileType gitcommit set textwidth=80
augroup END

" Completion {{{

let g:SuperTabDefaultCompletionType="context"

augroup php
    au!

    au FileType php set omnifunc=phpcomplete#CompletePHP
    au FileType php call SuperTabSetDefaultCompletionType("<c-x><c-o>")
augroup end

set wildmenu
set wildmode=longest,list,full
set completeopt=longest,menu

set wildignore+=.hg,.git,.svn " Version control
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl " compiled spelling word lists
set wildignore+=*.sw? " Vim swap files
set wildignore+=*.DS_Store " OSX bullshit
set wildignore+=*.luac " Lua byte code
set wildignore+=*.orig " Merge resolution files

" }}}

" Backups {{{

set undodir=~/.vim/tmp/undo// " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap// " swap files
" Vagrant NFS shared folder doesn't like it?!
"set backup " enable backups

" }}}

" Cursorline {{{
" Only show cursorline in the current window and in normal mode.

augroup cline
    au!
    au WinLeave,InsertEnter * set nocursorline
    au WinEnter,InsertLeave * set cursorline
augroup END

" }}}

" Auto set :paste when pasting
if &term =~ "xterm.*"
    let &t_ti = &t_ti . "\e[?2004h"
    let &t_te = "\e[?2004l" . &t_te
    function XTermPasteBegin(ret)
        set pastetoggle=<Esc>[201~
        set paste
        return a:ret
    endfunction
    map <expr> <Esc>[200~ XTermPasteBegin("i")
    imap <expr> <Esc>[200~ XTermPasteBegin("")
    cmap <Esc>[200~ <nop>
    cmap <Esc>[201~ <nop>
endif
