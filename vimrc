call plug#begin()
  Plug 'tpope/vim-fugitive'
  Plug 'bling/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'rking/ag.vim'
  Plug 'junegunn/goyo.vim' "@see https://github.com/junegunn/goyo.vim
  Plug 'slim-template/vim-slim'
  Plug 'elixir-lang/vim-elixir'
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-eunuch'
  Plug 'scrooloose/nerdtree'
  Plug 'airblade/vim-gitgutter'
call plug#end()

" Tabulation
set tabstop=2
set shiftwidth=2
set expandtab

" Ruby config
autocmd Filetype ruby set colorcolumn=100

inoremap jj <Esc>
let mapleader=","

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500

" Set to auto read when a file is changed from the outside
set autoread

" Enable filetype plugins
filetype plugin on
filetype indent on

" Automatically removing all trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use specific font
" Be carful this line require powerline
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 12

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
  set wildignore+=.git\*,.hg\*,.svn\*
else
  set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

set number

"Always show current position
set ruler

" Configure backspace so it acts as it should act
" @see http://vim.wikia.com/wiki/Backspace_and_delete_problems
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Make search insensitive
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
" (like google instant search)
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Always show the status line
set laststatus=2

" Active powerline font for airline
let g:airline_powerline_fonts = 1

" Define theme for airline
let g:airline_theme='luna'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

try
  set background=light
  colorscheme deep-space
catch
  set background=dark
endtry

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""'""""""""
" => NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinPos = 'right'
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__', '\~$']
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>

