" Copyright 2018 Bryan Frimin.
" Licensed under the Apache License, Version 2.0 (the "License");
" you may not use this file except in compliance with the License.
" You may obtain a copy of the License at
"     http://www.apache.org/licenses/LICENSE-2.0
" Unless required by applicable law or agreed to in writing, software
" distributed under the License is distributed on an "AS IS" BASIS,
" WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
" See the License for the specific language governing permissions and
" limitations under the License.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible               " be iMproved
filetype off                   " required!

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
if has('nvim')
  call plug#begin('~/.local/share/nvim/plugged')
else
  call plug#begin('~/.vim/plugged')
endif

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
"Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
"Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
"Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
"Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
"Plug '~/my-prototype-plugin'

if exists(':Plug')
  " Fugitive is a highly-capable Git wrapper for Vim.
  " https://github.com/tpope/vim-fugitive
  Plug 'tpope/vim-fugitive'

  " Vim sugar for the UNIX shell commands that need it the most.
  " https://github.com/tpope/vim-eunuch
  Plug 'tpope/vim-eunuch'

  " Asynchronous linting/fixing for Vim and Language Server Protocol
  " (LSP) integration.
  " https://github.com/w0rp/ale
  Plug 'w0rp/ale'

  if executable('fzf')
    if filereadable("/home/linuxbrew/.linuxbrew/opt/fzf/README.md")
      Plug '/home/linuxbrew/.linuxbrew/opt/fzf' | Plug 'junegunn/fzf.vim'
      let g:using_fzf = 1
    elseif filereadable("/usr/local/opt/fzf/README.md")
      Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
      let g:using_fzf = 1
    endif
  endif

  " Easy navigation of the Rails directory structure. gf considers context and
  " knows about partials, fixtures, and much more. There are two commands, :A
  " (alternate) and :R (related) for easy jumping between files, including
  " favorites like model to schema, template to helper, and controller to
  " functional test. Commands like :Emodel, :Eview, :Econtroller, are provided
  " to :edit files by type, along with S, V, and T variants for :split,
  " :vsplit, and :tabedit. Throw a bang on the end (:Emodel foo!) to
  " automatically create the file with the standard boilerplate if it doesn't
  " exist. :help rails-navigation
  "
  " Also provides an interface to Rake and Rails commands via :Rake and :Rails
  "
  " https://github.com/tpope/vim-rails
  Plug 'tpope/vim-rails'

  " It's the colorscheme we set that defines us. (Batman)
  " https://github.com/whatyouhide/vim-gotham
  Plug 'whatyouhide/vim-gotham'

  " Language syntax support
  Plug 'chrisbra/csv.vim'
  Plug 'elixir-lang/vim-elixir'
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  Plug 'google/vim-jsonnet'
  Plug 'hashivim/vim-terraform'
  Plug 'kchmck/vim-coffee-script'
  Plug 'lifepillar/pgsql.vim'
  Plug 'pangloss/vim-javascript'
  Plug 'slim-template/vim-slim'
  Plug 'tpope/vim-git'
  Plug 'tpope/vim-markdown'
  Plug 'vim-ruby/vim-ruby'
endif

" Initialize plugin system
call plug#end()

set autoindent   " preserve indent level on newlines
set tabstop=2    " a tab is two spaces
set shiftwidth=2 " an autoindent (with <<) is two spaces
set shiftround   " when indenting with >, round to nearest multiple of shiftwidth
set expandtab    " use spaces, not tabs
set smarttab     " use shiftwidth/tabstop based on context

set backspace=indent,eol,start

set ttyfast      " assume we are on a fast terminal
set lazyredraw   " don't echo non-typed characters (e.g., macro execution)

set ttimeout
set ttimeoutlen=100

set incsearch     " incremental searching
set hlsearch      " highlight matches
set ignorecase    " searches are case insensitive...
set smartcase     " ... unless they contain at least one capital letter

set laststatus=2  " always show the status line
set ruler         " show cursor position (overridden by statusline)
set showcmd       " show partial command in bottom-right
set showtabline=1 " Show tabline only when more than one tab exists

set wildmenu      " use tab completion on command line

" Configure backspace so it acts as it should act
" http://vim.wikia.com/wiki/Backspace_and_delete_problems
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Controls the number of lines/chars to keep visible before scrolling
set scrolloff=1
set sidescrolloff=5
set sidescroll=1
set display+=lastline " show the last line that fits in window (vs '@@@@')

if &encoding ==# 'latin1' && has('gui_running')
  set encoding=utf-8
endif

" Changes what Vim displays for special chars like trailing space & tabs
set list " Show invisible characters
let &listchars = "tab:>-,trail:\u2591,extends:>,precedes:<"

set autoread           " reload unchanged buffers when file changed outside vim
set fileformats+=mac   " should already be the default when compiled on mac

set history=1000       " remember more than 20 previous searches/commands

set tabpagemax=50      " max number of tab pages that can be opened

" Write swap and backup files in the event of a crash or accident
set swapfile
set directory=$TMPDIR,~/tmp,~/.vim/tmp,/tmp,/var/tmp
set backup
set backupdir=$TMPDIR,~/tmp,~/.vim/tmp,/tmp,/var/tmp

" Extend our undoable steps and preserve over restart (if available)
if has('persistent_undo')
  set undodir=$TMPDIR,~/tmp,~/.vim/tmp,/tmp,/var/tmp
  set undofile
  set undoreload=10000
end
set undolevels=10000

" Line numbering
" Relativenumber treats the current line as line 0 and is helpful for motions
if exists('+relativenumber')
  if !has('gui_running')
    " Disabling because syntax + relnum on MacVim is slow
    " see: https://github.com/vim/vim/issues/282
    set relativenumber
  end
end
" Setting number after Relativenumber replaces the '0' with the true number
set number

set nowrap        " don't wrap lines (we map leader-W to toggle)
set linebreak     " when wrapping, wrap at word boundaries (vs last char)
if exists('+breakindent')
  set breakindent " preserves the indent level of wrapped lines
  set wrap        " wrapping with breakindent is tolerable
endif
" When on first/last char in a line, allow left/right to navigate
" through to the prev/next line.
set whichwrap+=<,>,h,l

" allow modified buffers to be hidden
set hidden

" exclusions from the autocomplete menu
set wildignore+=*.so
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*.gif,*.jpg,*.png,*.log
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
set wildignore+=*/tmp/cache/assets/*/sprockets/*,*/tmp/cache/assets/*/sass/*
set wildignore+=*/public/assets/*
set wildignore+=*.swp,*~,._*
set wildignore+=.DS_Store

" Folding
set foldmethod=syntax
" Sets the fold level: Folds with a higher level will be closed.  Setting
" this option to zero will close all folds.  Higher numbers will close fewer
" folds.
" set foldlevel=1
" set foldnestmax=10
" set nofoldenable   " start with all folds open (toggle via zi)
set foldlevel=9 " Start with all folds open

" Remember last location in file, but not for commit messages.
" see :help last-position-jump
augroup RD_LastLocation
  autocmd!
  autocmd BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" STATUS LINE {{{1
" see: :help 'statusline'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline=                 " reset
set statusline+=%#identifier#   " set color
set statusline+=[               " open bracket char
set statusline+=%n              " buffer number
set statusline+=%H%M%R%W        " flags: Help, Modified, RO, Preview
set statusline+=]%*             " close bracket & reset color
set statusline+=./%f\           " relative path of the filename
set statusline+=%<              " cut from here if line is too long
set statusline+=%y              " Filetype flag (displays in brackets)

set statusline+=%=              " left/right separator (everything from here is pulled right)

" show various error states that may apply
set statusline+=%#error#
set statusline+=%{&paste?'[paste]':''}
set statusline+=%*

" display a warning if fileformat isn't unix or encoding isn't utf-8
set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'[ff:\ '.&ff.']':''}
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'[enc:\ '.&fenc.']':''}
set statusline+=%*

set statusline+=[tab:\ %{&expandtab==1?'soft':'HARD'}\ %{&ts}] " tab info

set statusline+=%{fugitive#statusline()} " git info

set statusline+=\ col\ %2c,      " cursor column
set statusline+=\ ln\ %3l/%L     " cursor line/total lines
set statusline+=\ (%P)           " percent through file

" recalculate the trailing whitespace & tab warning when idle and after saving
augroup RD_StatusUpdates
  autocmd!
  autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning
  autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MAPPINGS {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quick ESC
inoremap jj <Esc>

" Use , as leader
let mapleader=","

" Easier split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Disable key up/down/left/right
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

map <leader>f :FZF<CR>
map <leader>b :Buffers<CR>

" Copy and Past with the system clipboard
noremap <leader>y "+y
nmap <leader>p m`:set paste<cr>o<c-r>+<esc>:set nopaste<cr>``
nmap <leader>P m`:set paste<cr>O<c-r>+<esc>:set nopaste<cr>``

" Allow for some common quit/write cmd typos
command! Q q        " Bind :Q to :q
command! W w        " Bind :W to :w
command! Qall qall

" reload our .vimrc
nmap <leader>~ :source ~/.vim/vimrc<CR>:redraw!<CR>:echo "~/.vimrc reloaded!"<CR>

" Write file
nmap <leader>w :w<CR>

" Toggle paste mode
nmap <leader>p :set invpaste<CR>:set paste?<CR>

" upper/lower word
" (set a mark, visually select inner word, u/U, return to mark)
nmap <leader>U m`gUiw``
nmap <leader>L m`guiw``


"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FILE TYPES
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Some file types should wrap their text
function! RD_SetupWrapping()
  setlocal wrap
  setlocal linebreak
  setlocal textwidth=78
  setlocal nolist
endfunction

augroup RD_FileTypeCommands
  autocmd!

  " Make sure all markdown files have the correct filetype set and setup wrapping
  autocmd BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown
  autocmd FileType markdown call RD_SetupWrapping()
  autocmd FileType markdown setlocal ts=4 sts=4 sw=4
  " Syntax highlight fenced code blocks (e.g., ```ruby...)
  let g:markdown_fenced_languages = ['coffee', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'html']

  " enable spell checking on certain files
  autocmd BufNewFile,BufRead COMMIT_EDITMSG set spell

  " Treat JSON files like JavaScript
  autocmd BufNewFile,BufRead *.json set ft=javascript

  " Support for ES6
  autocmd BufRead,BufNewFile *.es6 setfiletype javascript

  " Avoid syntax highlight issue on hyphenated CSS keywords
  autocmd FileType css,scss setlocal iskeyword+=-
augroup END

" Automatically removing all trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

autocmd Filetype ruby set colorcolumn=100
autocmd Filetype python set colorcolumn=120
autocmd BufNewFile,BufRead Brewfile set filetype=ruby

" Terraform auto align
let g:terraform_align=1
autocmd FileType terraform setlocal commentstring=#%s

" Don't add the comment prefix when I hit enter or o/O on a comment line.
autocmd FileType * setlocal formatoptions-=o formatoptions-=r

colorscheme gotham256

" Use specific font
" Be carful this line require powerline
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 12
