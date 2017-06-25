call plug#begin()
  Plug 'tpope/vim-fugitive'
  Plug 'bling/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'rking/ag.vim'
  Plug 'junegunn/goyo.vim' " ZENMODE
  Plug 'slim-template/vim-slim'
  Plug 'elixir-lang/vim-elixir'
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-eunuch'
  Plug 'airblade/vim-gitgutter'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'w0rp/ale'
  Plug 'hashivim/vim-terraform'
call plug#end()

" Terraform
let g:terraform_align=1
autocmd FileType terraform setlocal commentstring=#%s

" Tabulation
set tabstop=2
set shiftwidth=2
set expandtab

" Ruby config
autocmd Filetype ruby set colorcolumn=100
autocmd Filetype python set colorcolumn=120
autocmd BufNewFile,BufRead Brewfile set filetype=ruby

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

" Easier split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

map <leader>f :FZF<CR>
map <leader>s :w<CR>
map <leader>b :Buffers<CR>

" Disable key up/down/left/right
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use specific font
" Be carful this line require powerline
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 12

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

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

" Don't add the comment prefix when I hit enter or o/O on a comment line.
autocmd FileType * setlocal formatoptions-=o formatoptions-=r
