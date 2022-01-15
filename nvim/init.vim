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

call plug#end()


augroup nerdtree_open
    autocmd!
    autocmd VimEnter * NERDTree | wincmd p
augroup END

autocmd VimEnter * AirlineTheme abstract
autocmd VimEnter * colorscheme deep-space
:set guifont=Hack:h7


