call plug#begin('~/.vim/plugged')
  Plug 'bling/vim-airline'
  Plug 'scrooloose/syntastic'
  Plug 'leafgarland/typescript-vim'
  Plug 'romgrk/winteract.vim'
  Plug 'kien/ctrlp.vim'
  Plug 'honza/vim-snippets'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'bronson/vim-trailing-whitespace'
  Plug 'jeetsukumaran/vim-buffergator'
  Plug 'tpope/vim-surround'
  Plug 'airblade/vim-gitgutter'
  Plug 'scrooloose/nerdtree'
  Plug 'xuyuanp/nerdtree-git-plugin'
  Plug 'sickill/vim-monokai'
  Plug 'christoomey/vim-system-copy'
  Plug 'tpope/vim-rails'
  Plug 'konfekt/fastfold'
  Plug 'tpope/vim-repeat'
  Plug 'scrooloose/nerdcommenter'
  Plug 'honza/vim-snippets'
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'ervandew/supertab'
  Plug 'junegunn/fzf'
  Plug 'rking/ag.vim'
call plug#end()

let g:deoplete#enable_at_startup = 1

set rtp+=/usr/local/opt/fzf

" Leader
let mapleader = ","

if has('vim_starting') && !has('nvim') && &compatible
  set nocompatible               " Be iMproved
endif

set number            " Show line numbers
set ruler             " Show line and column number
syntax enable         " Turn on syntax highlighting allowing local overrides

set cursorline              " Highlight current line
set title                   " Show the filename in the window title bar.

set scrolloff=5             " Start scrolling n lines before horizontal border of window.
set sidescrolloff=7         " Start scrolling n chars before end of screen.
set sidescroll=1            " The minimal number of columns to scroll
                            "   horizontally.
" Neovim disallow changing 'enconding' option after initialization
" see https://github.com/neovim/neovim/pull/2929 for more details
if !has('nvim')
  set encoding=utf-8  " Set default encoding to UTF-8
endif

""
"" Whitespace
""
set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
set list                          " Show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode

if exists("g:enable_mvim_shift_arrow")
  let macvim_hig_shift_movement = 1 " mvim shift-arrow-keys
endif

" List chars
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the left of the screen

""
"" Searching
""
set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

""
"" Wild settings
""

" TODO: Investigate the precise meaning of these settings
" Wildmenu
set wildmenu " Show list instead of just completing
"set wildmode=list:longest,list:full
set wildmode=list:longest,full
set wildignorecase
set wildchar=<TAB>
set whichwrap=b,s,h,l,<,>,[,] " Backspace and cursor keys wrap too

" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem

" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

" Ignore librarian-chef, vagrant, test-kitchen and Berkshelf cache
set wildignore+=*/tmp/librarian/*,*/.vagrant/*,*/.kitchen/*,*/vendor/cookbooks/*

" Ignore rails temporary asset caches
set wildignore+=*/tmp/cache/assets/*/sprockets/*,*/tmp/cache/assets/*/sass/*

" Disable temp and backup files
set wildignore+=*.swp,*~,._*

""
"" Backup and swap files
""

set backupdir^=~/.vim/_backup//    " where to put backup files.
set directory^=~/.vim/_temp//      " where to put swap files.

" Disable Ex mode
nnoremap Q <Nop>
nnoremap H gT
nnoremap L gt

map <Leader> :NERDTreeToggle<CR>
map <Leader>m :CtrlPBuffer<CR>
map <leader>w :InteractiveWindow<CR>
set rtp+=/usr/local/opt/fzf

let g:ag_working_path_mode="ra"
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$|bower_components|node_modules',
  \ 'file': '\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\~$\',
  \ }

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor\ --column
  set grepformat=%f:%l:%c:%m
  command! -nargs=+ -bang Ag silent! grep <args> | redraw! | botright copen
endif

 " Theme
syntax enable
" for vim 7
set t_Co=256

" for vim 8
if (has("termguicolors"))
 set termguicolors
endif

colorscheme monokai
