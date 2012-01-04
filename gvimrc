set guifont=Menlo:h16

set lines=52
set columns=189

set number
set numberwidth=5

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab
set laststatus=2

" Maps edit bar to jj from esc
imap jj <ESC>
" Maps autocomplete to tab
imap <Tab> <C-N> 

" Tab completion options
" only complete to the longest unambiguous match and show a menu
set completeopt=longest,menu
set complete=.,w,b,u,t
set wildmode=longest,list:longest


