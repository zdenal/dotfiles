"let g:ale_disable_lsp = 1

call plug#begin('~/.vim/plugged')
  Plug 'bling/vim-airline'
  Plug 'scrooloose/syntastic'
  Plug 'romgrk/winteract.vim'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'bronson/vim-trailing-whitespace'
  Plug 'jeetsukumaran/vim-buffergator'
  Plug 'tpope/vim-surround'
  Plug 'airblade/vim-gitgutter'
  Plug 'scrooloose/nerdtree'
  Plug 'xuyuanp/nerdtree-git-plugin'
  Plug 'sickill/vim-monokai'
  Plug 'christoomey/vim-system-copy'
  Plug 'konfekt/fastfold'
  Plug 'tpope/vim-repeat'
  Plug 'scrooloose/nerdcommenter'
  Plug 'yggdroot/indentline'
  Plug 'ervandew/supertab'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'ap/vim-css-color'
  Plug 'tpope/vim-endwise'
  Plug 'vim-scripts/matchit.zip'
  Plug 'easymotion/vim-easymotion'
  Plug 'tomtom/tlib_vim'
  Plug 'rust-lang/rust.vim'
  Plug 'metakirby5/codi.vim'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'jamshedvesuna/vim-markdown-preview'
  Plug 'elixir-editors/vim-elixir'
  Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
  Plug 'neovimhaskell/haskell-vim'
  Plug 'mattn/webapi-vim'
  Plug 'leafOfTree/vim-svelte-plugin'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'elixir-lsp/coc-elixir', {'do': 'yarn install && yarn prepack'}
  Plug 'dense-analysis/ale'
  Plug 'mhinz/vim-mix-format'

  Plug 'kien/ctrlp.vim'
  "Plug 'marcweber/vim-addon-mw-utils'

  "Plug 'amadeus/vim-mjml'
  "Plug 'peitalin/vim-jsx-typescript'
  "Plug 'leafgarland/typescript-vim'
  "Plug 'HerringtonDarkholme/yats.vim'
  "Plug 'godlygeek/tabular'
  "Plug 'dhruvasagar/vim-table-mode'
  "Plug 'slashmili/alchemist.vim'
  "Plug 'slim-template/vim-slim'
  "Plug 'kassio/neoterm'
  "Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  "Plug 'diepm/vim-rest-console'
  "Plug 'tpope/vim-rails'
  "Plug 'honza/vim-snippets'
call plug#end()

let g:rustfmt_autosave = 1

"let g:ale_completion_enabled = 1
"let g:ale_completion_autoimport = 0
let g:ale_linters = {
       \'javascript': ['eslint', 'flow', 'flow-language-server', 'jscs', 'jshint', 'standard', 'xo']
\}

"let g:deoplete#enable_at_startup = 1
let g:move_key_modifier = 'C'

let vim_markdown_preview_github=1
let vim_markdown_preview_toggle=1
let vim_markdown_preview_browser='Google Chrome'

let g:mix_format_on_save = 1

let g:vim_svelte_plugin_load_full_syntax = 1

nmap <silent> gi <Plug>(coc-implementation)

" Leader
let mapleader = ","

if has('vim_starting') && !has('nvim') && &compatible
  set nocompatible               " Be iMproved
endif

set foldmethod=indent
set foldlevelstart=20

"set relativenumber
set number            " Show line numbers
set ruler             " Show line and column number
syntax enable         " Turn on syntax highlighting allowing local overrides

set ttyfast
set lazyredraw
set regexpengine=1
set cursorline              " Highlight current line
"set title                   " Show the filename in the window title bar.

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
                                   "off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                   "off and the line continues beyond the left of the screen

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
"set wildmenu " Show list instead of just completing
"set wildmode=list:longest,list:full
"set wildmode=list:longest,full
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

map <Leader>ba :bufdo bd<CR>
map <Leader>f :Ag!<CR>
map <Leader>n :NERDTreeToggle<CR>
map <Leader>m :CtrlPBuffer<CR>
map <leader>w :InteractiveWindow<CR>
set rtp+=/usr/local/opt/fzf

let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

let g:ag_working_path_mode="ra"
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$|bower_components|node_modules',
  \ 'file': '\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\~$\',
  \ }
 "ignore from .gitignore
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

let g:prettier#autoformat = 1
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.vue,*.yaml,*.html PrettierAsync

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor\ --column
  set grepformat=%f:%l:%c:%m
  command! -nargs=+ -bang Ag silent! grep <args> | redraw! | botright copen
endif

" for vim 7
set t_Co=256

" for vim 8
if (has("termguicolors"))
 set termguicolors
endif

colorscheme monokai
hi Search guibg=DarkRed

" Window split settings
"highlight TermCursor ctermfg=red guifg=red
"set splitbelow
"set splitright
"set inccommand=split
set clipboard^=unnamed,unnamedplus

" Terminal settings
tnoremap <Leader><ESC> <C-\><C-n>

" Window navigation function
" Make ctrl-h/j/k/l move between windows and auto-insert in terminals
func! s:mapMoveToWindowInDirection(direction)
    func! s:maybeInsertMode(direction)
        stopinsert
        execute "wincmd" a:direction

        if &buftype == 'terminal'
            startinsert!
        endif
    endfunc

    execute "tnoremap" "<silent>" "<C-" . a:direction . ">"
                \ "<C-\\><C-n>"
                \ ":call <SID>maybeInsertMode(\"" . a:direction . "\")<CR>"
    execute "nnoremap" "<silent>" "<C-" . a:direction . ">"
                \ ":call <SID>maybeInsertMode(\"" . a:direction . "\")<CR>"
endfunc
for dir in ["h", "j", "l", "k"]
    call s:mapMoveToWindowInDirection(dir)
endfor

autocmd BufNewFile,BufRead *.thor set syntax=ruby

"FZF stuff
function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()

" Command for git grep
" - fzf#vim#grep(command, with_column, [options], [fullscreen])
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   { 'dir': systemlist('git rev-parse --show-toplevel')[0] }, <bang>0)

" Override Colors command. You can safely do this in your .vimrc as fzf.vim
" will not override existing commands.
command! -bang Colors
  \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'}, <bang>0)

" Augmenting Ag command using fzf#vim#with_preview function
"   * fzf#vim#with_preview([[options], preview window, [toggle keys...]])
"     * For syntax-highlighting, Ruby and any of the following tools are required:
"       - Highlight: http://www.andre-simon.de/doku/highlight/en/highlight.php
"       - CodeRay: http://coderay.rubychan.de/
"       - Rouge: https://github.com/jneen/rouge
"
"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" Likewise, Files command with preview window
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
