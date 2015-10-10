" Phatogen
call pathogen#infect()
call pathogen#helptags() " Make :help work for bundles

" Colors
set background=dark
colorscheme solarized

" Tabs
set tabstop=4
set softtabstop=4
set expandtab

" UI
set number
set list "Show white space
set cursorline "Hightligt current line

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
