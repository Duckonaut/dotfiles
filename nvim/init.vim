:set number
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a

let g:airline_powerline_fonts = 1

call plug#begin()

Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/neoclide/coc.nvim', {'branch': 'release'}
Plug 'https://github.com/ryanoasis/vim-devicons'
Plug 'https://github.com/tc50cal/vim-terminal'
Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/rafi/awesome-vim-colorschemes'
Plug 'haystackandroid/vimspectr'
Plug 'mhinz/vim-startify'
Plug 'https://github.com/uiiaoo/java-syntax.vim'
Plug 'vim-python/python-syntax'
Plug 'rust-lang/rust.vim'

call plug#end()

let g:python_highlight_all = 1

augroup nerdtree_open
    autocmd!
    autocmd VimEnter * NERDTree | wincmd p
augroup END

autocmd VimEnter * AirlineTheme abstract
:set guifont=Hack:h7


