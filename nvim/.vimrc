set number
set autoindent
syntax on
filetype plugin indent on
set tabstop=4
set laststatus=2
highlight LineNr ctermfg=DarkGrey
highlight StatusLine ctermfg=Grey

if has('gui_running')
  inoremap <C-BS> <C-W>
  cnoremap <C-BS> <C-W>
else
  inoremap <C-H> <C-W>
  cnoremap <C-H> <C-W>
endif
