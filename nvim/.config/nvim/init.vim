" Minimalist Vim Plugin Manager                                                                                         https://github.com/junegunn/vim-plug
call plug#begin('~/.local/share/nvim/plugged')
"Plug 'aliou/bats.vim'                                                  " Add syntax files for Bats test files           https://github.com/aliou/bats.vim
"Plug 'colinkennedy/vim-vex-complete'                                   " Auto-completes functions for VEX               https://github.com/ColinKennedy/vim-vex-complete
"Plug 'drichardson/vex.vim'                                             " VEX support for Vim                            https://github.com/drichardson/vim-vex
"Plug 'fatih/vim-go'                                                    " Go support for Vim                             https://github.com/fatih/vim-go
"Plug 'honza/vim-snippets'                                              " Snippets files for various languages           https://github.com/honza/vim-snippets
"Plug 'jamessan/vim-gnupg'                                              " Transparent editing of gpg encrypted files     https://github.com/jamessan/vim-gnupg
"Plug 'jiangmiao/auto-pairs'                                            " Insert/Delete '[', '(', '{'... in pair         https://github.com/jiangmiao/auto-pairs
"Plug 'jmckiern/vim-venter'                                             " Horizontally centers the current window        https://github.com/JMcKiern/vim-venter
"Plug 'jparise/vim-graphql', { 'for': ['graphql', 'graphqls', 'gql'] }  " GraphQL detection, highlighting & indentation  https://github.com/jparise/vim-graphql
"Plug 'keith/rspec.vim', { 'for': 'rspec' }                             " Improved syntax highlighting for rspec         https://github.com/keith/rspec.vim
"Plug 'ledger/vim-ledger', { 'for': ['ldg', 'ledger', 'journal'] }      " Ledger filetype for Vim                        https://github.com/ledger/vim-ledger
"Plug 'machakann/vim-swap'                                              " Swap delimited items                           https://github.com/machakann/vim-swap
"Plug 'matsub/github-actions.vim'                                       " Syntax files of GitHub Actions                 https://github.com/matsub/github-actions.vim
"Plug 'mattesgroeger/vim-bookmarks'                                     " Allows toggling bookmarks per line             https://github.com/mattesgroeger/vim-bookmarks
"Plug 'mzlogin/vim-markdown-toc', { 'for': 'markdown' }                 " Generate table of contents for Markdown files  https://github.com/mzlogin/vim-markdown-toc
"Plug 'neo4j-contrib/cypher-vim-syntax', { 'for': ['cypher', 'cql'] }   " Cypher Vim Syntax                              https://github.com/neo4j-contrib/cypher-vim-syntax
"Plug 'ngmy/vim-rubocop', { 'on': 'RuboCop','for': 'ruby' }             " Runs RuboCop                                   https://github.com/ngmy/vim-rubocop
"Plug 'rainerborene/vim-reek', { 'on': 'RunReek', 'for': 'ruby' }       " Code smell detector for Ruby                   https://github.com/rainerborene/vim-reek
"Plug 'rhysd/git-messenger.vim'                                         " Reveal Git message under the cursor            https://github.com/rhysd/git-messenger.vim
"Plug 'rhysd/vim-github-actions'                                        " Filetype support for GitHub Actions            https://github.com/rhysd/vim-github-actions
"Plug 'sirver/ultisnips'                                                " Ultimate solution for snippets                 https://github.com/SirVer/ultisnips
"Plug 'thoughtbot/vim-rspec', { 'for': 'rspec' }                        " Lightweight RSpec runner                       https://github.com/thoughtbot/vim-rspec
"Plug 'tpope/vim-cucumber', { 'for': 'feature' }                        " Syntax highlight, indent, and more             https://github.com/tpope/vim-cucumber
"Plug 'tpope/vim-dadbod'                                                " Interacting with databases                     https://github.com/tpope/vim-dadbod
"Plug 'tpope/vim-heroku'                                                " Interacting with Heroku                        https://github.com/tpope/vim-heroku
"Plug 'tpope/vim-jdaddy'                                                " Working with JSON in Vim                       https://github.com/tpope/vim-jdaddy
"Plug 'tpope/vim-rails', { 'for': 'ruby' }                              " Ruby on Rails power tools                      https://github.com/tpope/vim-rails
"Plug 'tpope/vim-rvm'                                                   " Switch Ruby versions from inside Vim           https://github.com/tpope/vim-rvm
"Plug 'tpope/vim-surround'                                              " Quoting/parenthesizing made simple             https://github.com/tpope/vim-surround
"Plug 'tpope/vim-unimpaired'                                            " Pairs of handy bracket mappings                https://github.com/tpope/vim-unimpaired
"Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }                            " Provides motions and text objects for Ruby     https://github.com/vim-ruby/vim-ruby
"Plug 'vim-scripts/bats.vim', { 'for': 'bash' }                         " Extends shell highlighting for Bats            https://github.com/vim-scripts/bats.vim
"Plug 'vim-scripts/taglist.vim', { 'on': 'TlistToggle' }                " Source code browser                            https://vimawesome.com/plugin/taglist-vim
"Plug 'wellle/context.vim'                                              " Shows context of currently visible contents    https://github.com/wellle/context.vim
Plug 'ctrlpvim/ctrlp.vim', { 'on': ['CtrlP', 'CtrlPMixed'] }           " Fuzzy file, buffer, mru, tag... finder         https://github.com/ctrlpvim/ctrlp.vim
Plug 'dag/vim-fish'                                                    " Add syntax files for fish sell files           https://github.com/dag/vim-fish
Plug 'editorconfig/editorconfig-vim'                                   " EditorConfig Vim Plugin                        https://github.com/editorconfig/editorconfig-vim
Plug 'godlygeek/tabular'                                               " Aligning text                                  https://github.com/godlygeek/tabular
Plug 'itchyny/vim-gitbranch'                                           " Returns the name of the git branch             https://github.com/itchyny/vim-gitbranch
Plug 'lambdalisue/suda.vim'                                            " Add missing !sudo tee % feature                https://github.com/lambdalisue/suda.vim
Plug 'machakann/vim-highlightedyank'                                   " Make the yanked region apparent!               https://github.com/machakann/vim-highlightedyank
Plug 'neomake/neomake'                                                 " Syntax checking hacks                          https://github.com/neomake/neomake
Plug 'nlknguyen/vim-docker-compose-syntax'                             " Syntax file for Docker's docker-compose file   https://github.com/nlknguyen/vim-docker-compose-syntax
Plug 'pbrisbin/vim-mkdir'                                              " Auto create directories at buffer save         https://github.com/pbrisbin/vim-mkdir
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }                  " A tree explorer plugin                         https://github.com/scrooloose/nerdtree
Plug 'reedes/vim-lexical'                                              " Build on Vim's spell/thes/dict completion      https://github.com/reedes/vim-lexical
Plug 'ryanoasis/vim-devicons'                                          " Adds filetype glyphs to various vim plugins    https://github.com/ryanoasis/vim-devicons
Plug 'sfeuga/dockerfile.vim'                                           " Syntax file for Docker's Dockerfile            https://github.com/elemecca/dockerfile.vim
Plug 'tomasr/molokai', {'as': 'molokai' }                              " My favorite theme !                            https://github.com/tomasr/molokai
Plug 'tpope/vim-dotenv'                                                " Basic support for .env and Procfile            https://github.com/tpope/vim-dotenv
Plug 'tpope/vim-endwise'                                               " Adding end after if, do, def                   https://github.com/tpope/vim-endwise
Plug 'tpope/vim-speeddating'                                           " Make vim understand date format                https://github.com/tpope/vim-speeddating
Plug 'uarun/vim-protobuf'                                              " Syntax highlighting for Google's ProtoBuf      https://github.com/uarun/vim-protobuf
Plug 'xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }         " Add git status flags to NERDTree               https://github.com/Xuyuanp/nerdtree-git-plugin
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""" General
"set timeout timeoutlen=500 ttimeoutlen=100
syntax on                                                              " Enable syntax highlighting
set autoread                                                           " Set autoread when files changed from outside
set wildmenu                                                           " Show menu with tab completion
set wildmode=list:longest,full                                         " Command <Tab> completion, list matches, then
                                                                       "   longest common part, then all.
set wildignore+=*.swp
set wildignore+=*.DS_Store
set wildignore+=.svn,CVS,.git
set wildignore+=*.o,*.a,*.so
set wildignore+=*.mo,*.la
set wildignore+=*.class
set wildignore+=*.obj
set wildignore+=*.jpg,*.jpeg
set wildignore+=*.png,*.gif
set wildignore+=*.bmp,*.xmp
set wildignore+=*.zip,*.7z
set wildignore+=*.tar,*.gz
set wildignore+=*.tgz
set wildignore+=*.exe,*.dll
set wildignore+=*\\tmp\\*,*/tmp/*
set mouse-=a                                                           " Disable mouse integration in vim
set scrolloff=3                                                        " Minimum lines to keep above and below cursor
set list                                                               " Display invisible characters
set listchars=tab:>·                                                   " Highlight problematic white space
"set listchars=eol:¬,tab:>·                                             " Highlight problematic white space
filetype on                                                            " Enable file type detection
filetype indent on                                                     " Enable file type-specific indenting
filetype plugin on                                                     " Enable file type-specific plugins
set ffs=unix,dos,mac                                                   " Use Unix as the standard file type
set nostartofline                                                      " Stop certain movements from always going to
                                                                       "   the first character of a line
set confirm                                                            " Instead of failing because of unsaved changes,
                                                                       "   raise a dialogue to save changed files
set nopaste                                                            " 'paste' should not be set in your config
autocmd FocusLost * :wa                                                " Save all files on losing focus
autocmd TermOpen * startinsert                                         " Enter in Terminal-mode automatically

" Automatically install missing plugins on startup
autocmd VimEnter *
      \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)')) |
      \    PlugInstall --sync | q |
      \  endif

" Return to last edit position when opening files
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \     exe "normal! g`\"" |
      \ endif

""" user interface
set splitbelow                                                         " Open new split panes to bottom
set splitright                                                         " Open new split panes to right

""" Theming
set termguicolors                                                      " Enables the true color support
set t_Co=256                                                           " Enable support for 256-color terminal
if &runtimepath =~ 'molokai'
  colorscheme molokai
  let g:rehash256 = 1
endif
" No Background color
hi Normal             guibg=NONE
" In Visual mode apply this to see what's selected
hi Visual guifg=White guibg=#576F72
" Display trailing witespace
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
set number                                                             " Display line numbers on the left
set numberwidth=5                                                      " Line number width
set cursorline                                                         " Highlight current line
set ruler                                                              " Always show current position
set textwidth=120                                                      " Line wrap at 80 chars
set lazyredraw                                                         " Redraw only when we need to
set undofile                                                           " Persistent undo after close Vim
autocmd TermOpen * setlocal wrap                                       " Wrap text in terminal

""" Format the status line
set laststatus=2                                                       " Always display the status line
set statusline=                                                        " Clean statusline
"set statusline+=%h                                                     " help flag
"set statusline+=%m                                                     " modified flag
"set statusline+=%r                                                     " readonly flag
set statusline+=%{ReadOnly()}                                          " Display lock if icon file is readonly
set statusline+=%<%f                                                   " Filename with path from opened folder
"set statusline+=%<%F                                                   " Filename with full relative path
"set statusline+=%<%t                                                   " Filename
set statusline+=%=                                                     " Left/Right separator
if &runtimepath =~ 'vim-rvm'
  "set statusline+=%<%{rvm#string()}                                    " Ruby Version (without '[  ]')
  "set statusline+=%<%{rvm#statusline()}                                " Ruby Version
  set statusline+=%<%{rvm#statusline_ft_ruby()}                        " Ruby Version only if ruby file
endif
if &runtimepath =~ 'vim-gitbranch'
  set statusline+=%<%{gitbranch#name()}
endif
set statusline+=\ \|\                                                  " Separator
"set statusline+=\ \%{wordcount()[\"bytes\"]}b                          " Bytes Count
"set statusline+=\%{wordcount()[\"chars\"]}c                            " Characters Count
"set statusline+=\%{wordcount()[\"words\"]}w                            " Words Count
set statusline+=\%{wordcount()[CountWoC()]}                            " Characters Count or Words Count in Visual Mode
set statusline+=\ \|\                                                  " Separator
set statusline+=%l                                                     " Line number
"set statusline+=%l/%L                                                  " Line number/Total lines
set statusline+=,%c                                                    " Column position
"set statusline+=\ \|\                                                  " Separator
"set statusline+=%{strlen(&fenc)?&fenc:'none'}                          " File encoding
"set statusline+=,%{&ff}                                                " File format
"set statusline+=%y                                                     " Filetype
"set statusline+=\ %P                                                   " Position %

""" Format the tab line
set showtabline=2                                                      " Always show tab bar

""" Code folding
set foldenable                                                         " Enable folding
set foldmethod=indent                                                  " Fold based on indentation
                                                                       "   indent, marker, manual, expr, syntax, diff
set foldlevelstart=10                                                  " Open most folds by default
set foldnestmax=10                                                     " 10 nested fold max
set foldcolumn=1                                                       " Add a 1 char margin to the foldcolumn

""" Sign Column
set signcolumn=yes                                                     " Always display sign column

""" Encoding
set encoding=utf-8

""" Tabs and spacing
set autoindent                                                         " Always indent
set cindent                                                            " C style indentation
set tabstop=2                                                          " 1 tab == 2 spaces
set expandtab                                                          " Convert tab to space
set shiftwidth=2                                                       " 1 tab == 2 spaces
set smarttab                                                           " Inserts blanks according to 'shiftwidth'
set softtabstop=0                                                      " Setting this to a non-zero value other than
                                                                       "   tabstop will make the tab key (in insert
                                                                       "   mode) insert a combination of spaces (and
                                                                       "   possibly tabs) to simulate tab stops at this
                                                                       "   width.
set backspace=indent,eol,start                                         " Backspace through everything in insert mode

""" Search
set hlsearch                                                           " Highlight matches
set incsearch                                                          " Incremental searching
set ignorecase                                                         " Searches are case insensitive...
set smartcase                                                          " ... unless they contain at least one capital
set inccommand=split                                                   " Get interactive feedback as we compose our
                                                                       "   substitute command
set diffopt +=iwhite                                                   " Diff: Ignore changes in amount of white space

""" Word completion
set complete=.,b,u,t,kspell                                            " How completion works when press <C-p> or <C-n>
                                                                       " Valid options are:
                                                                       "   .       scan the current buffer
                                                                       "   w       scan buffers from other windows
                                                                       "   b       scan other loaded buffers in buffer list
                                                                       "   u       scan unloaded buffers in buffer list
                                                                       "   U       scan buffers not in buffer list
                                                                       "   k       scan files given with 'dictionary' option
                                                                       "   kspell  use currently active spell checking
                                                                       "   s       scan files given with 'thesaurus' option
                                                                       "   i       scan current & included files
                                                                       "   d       scan current & included files for
                                                                       "             defined name or macro
                                                                       "   t       tag completion
set completeopt=menu,preview                                           " Options for Insert mode completion
                                                                       "   menu, menuone, longest, preview

""" Paste toggle in insert mode
set pastetoggle=<C-A-P>

""" Remap Keyboard
" [nvixso](nore)map
"  │       └ don't recurse
"  │
"  └ normal, visual, insert,
"    eX mode, select, operator-pending
"
" <Tab><Tab> for word completion
imap        <Tab><Tab>          <C-P>
" Quick Quit
imap        :q                  <ESC>:q<CR>
vmap        :q                  <ESC>:q<CR>
nmap        :q                  :q<CR>
tnoremap    :q                  <C-\><C-N>:q<CR>
" Quick Save
imap        :w                  <ESC>:w<CR>
vmap        :w                  <ESC>:w<CR>
nmap        :w                  :w<CR>
" Quick Save + Make Vim Session & Quit All
imap        :Q                  <ESC>:wa<CR>:mksession<CR>:qa<CR>
vmap        :Q                  <ESC>:wa<CR>:mksession<CR>:qa<CR>
nmap        :Q                  :wa<CR>:mksession<CR>:qa<CR>
tnoremap    :Q                  <C-\><C-N>:wa<CR>:mksession<CR>:qa<CR>
" Quick Delete
imap        dw                  <ESC>dw
" Quick Change
imap        cw                  <ESC>cw
" r to redo
nnoremap    r                   :redo<CR>
" List all buffers
nnoremap    <Leader>b           :ls<CR>
" Keep search matches in the middle of the window.
nnoremap    n                   nzzzv
nnoremap    N                   Nzzzv
" + toggle open/closes folds
nnoremap    +                   za
" Insert digraph
"inoremap    <Leader>k           <C-K>
" Easy resize windows
inoremap    <A-right>           <Esc>:vertical resize +5<CR>i
vnoremap    <A-right>           <Esc>:vertical resize +5<CR>v
nnoremap    <A-right>           <Esc>:vertical resize +5<CR>n
tnoremap    <A-right>           <C-\><C-n>:vertical resize +5<CR>a
inoremap    <A-left>            <Esc>:vertical resize -5<CR>i
vnoremap    <A-left>            <Esc>:vertical resize -5<CR>v
nnoremap    <A-left>            <Esc>:vertical resize -5<CR>n
tnoremap    <A-left>            <C-\><C-n>:vertical resize -5<CR>a
inoremap    <A-up>              <ESC>:resize +5<CR>i
vnoremap    <A-up>              <ESC>:resize +5<CR>v
nnoremap    <A-up>              <ESC>:resize +5<CR>n
tnoremap    <A-up>              <C-\><C-n>:resize +5<CR>a
inoremap    <A-down>            <ESC>:resize -5<CR>i
vnoremap    <A-down>            <ESC>:resize -5<CR>v
nnoremap    <A-down>            <ESC>:resize -5<CR>n
tnoremap    <A-down>            <C-\><C-n>:resize -5<CR>a
" Smart way to move between windows
" ⇦
inoremap    <C-H>               <C-\><C-N><C-W>h
nnoremap    <C-H>               <C-W>h
tnoremap    <C-H>               <C-\><C-N><C-W>h
" ⇩
inoremap    <C-J>               <C-\><C-N><C-W>j
nnoremap    <C-J>               <C-W>j
tnoremap    <C-J>               <C-\><C-N><C-W>j
" ⇧
inoremap    <C-K>               <C-\><C-N><C-W>k
nnoremap    <C-K>               <C-W>k
tnoremap    <C-K>               <C-\><C-N><C-W>k
" ⇨
inoremap    <C-L>               <C-\><C-N><C-W>l
nnoremap    <C-L>               <C-W>l
tnoremap    <C-L>               <C-\><C-N><C-W>l
" Smart way to move between tabs
" ⇦
nnoremap    <C-T>p              <Esc>gT
" ⇨
nnoremap    <C-T>               <Esc>gt
" Switch between the last two files
nnoremap    <Leader><Leader>    <C-^>
" Next Buffer
nnoremap    <Leader>n           :bnext<CR>
" Previous Buffer
nnoremap    <Leader>p           :bprevious<CR>
" Remove the Windows "^M" - when the encodings gets messed up
nnoremap    <Leader><Leader>m   mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
" Easy exit terminal-mode
tnoremap    <Esc>               <C-\><C-n>
" Sends an escape key to the terminal
tnoremap    <Leader>e           <Esc>
" Send Ctrl-L to the terminal
tnoremap    <Leader>l           <C-l>
" Send Ctrl-K to the terminal
tnoremap    <Leader>k           <C-k>
" This unsets the last search pattern register by hitting return
vnoremap    8                   <Esc>:noh<CR>
nnoremap    8                   <Esc>:noh<CR>
" Vsplit a new Terminal
nnoremap    <F4>                :vsplit\|te<CR>
nnoremap    <Leader>t           :15split\|te<CR>

" D will duplicate selection at the beginnig of the next line
vnoremap    D                   y'>o<ESC>p

""" File type mapping
autocmd FileType ruby compiler ruby                                      " Set MRI as default ruby compiler
autocmd FileType fish compiler fish                                      " Set fish as default fish compiler
autocmd VimEnter,BufRead,BufNewFile *.rb                                 set filetype=ruby tabstop=4 shiftwidth=4
autocmd VimEnter,BufRead,BufNewFile *.gemspec                            set filetype=ruby tabstop=4 shiftwidth=4
autocmd VimEnter,BufRead,BufNewFile *.rake                               set filetype=ruby tabstop=4 shiftwidth=4
autocmd VimEnter,BufRead,BufNewFile *.thor                               set filetype=ruby tabstop=4 shiftwidth=4
autocmd VimEnter,BufRead,BufNewFile Gemfile                              set filetype=ruby tabstop=4 shiftwidth=4
autocmd VimEnter,BufRead,BufNewFile Guardfile                            set filetype=ruby tabstop=4 shiftwidth=4
autocmd VimEnter,BufRead,BufNewFile Procfile                             set filetype=ruby tabstop=4 shiftwidth=4
autocmd VimEnter,BufRead,BufNewFile Rakefile                             set filetype=ruby tabstop=4 shiftwidth=4
autocmd VimEnter,BufRead,BufNewFile Thorfile                             set filetype=ruby tabstop=4 shiftwidth=4
autocmd VimEnter,BufRead,BufNewFile config.ru                            set filetype=ruby tabstop=4 shiftwidth=4
autocmd VimEnter,BufRead,BufNewFile *.feature                            set filetype=cucumber
autocmd VimEnter,BufRead,BufNewFile *.idr                                set filetype=idris
autocmd VimEnter,BufRead,BufNewFile *.jl                                 set filetype=julia
autocmd VimEnter,BufRead,BufNewFile *.lfe                                set filetype=lfe
autocmd VimEnter,BufRead,BufNewFile *.lidr                               set filetype=lidris
autocmd VimEnter,BufRead,BufNewFile .bash{rc,_profile,_logout,_aliases}  set filetype=sh tabstop=2 shiftwidth=2
autocmd VimEnter,BufRead,BufNewFile .z{shrc,login}                       set filetype=sh tabstop=2 shiftwidth=2
autocmd VimEnter,BufRead,BufNewFile *.m{d,arkdown}                       set filetype=markdown
autocmd VimEnter,BufRead,BufNewFile *.go                                 set filetype=go tabstop=2 shiftwidth=2 noexpandtab

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Neovim Wrapper
let g:ruby_host_prog = '~/.asdf/shims/neovim-ruby-host'
let g:python3_host_prog = '/home/sfo/.asdf/shims/python3'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""" Macro
" Change docker-compose variable to .env variable
let @e = 'wwd$a$�khwvw�kly�@7a{pww'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""" Plugins Parameters

"" ctrlpvim/ctrlp.vim
if exists(":CtrlP")
  let g:ctrlp_cmd = 'CtrlPMixed'
  let g:ctrlp_working_path_mode = 'ra'
  nnoremap  <C-p>               :CtrlPMixed<CR>
  nnoremap  <F5>                :CtrlPMixed<CR>
endif

"" jiangmiao/auto-pairs
"if &runtimepath =~ 'auto-pairs'
""  " Disable <M-p>, <M-e>, <M-b> and <M-n> shortcuts
""  let g:AutoPairsShortcutToggle = ''
"endif

"" lambdalisue/suda.vim
if &runtimepath =~ 'suda'
  let g:suda_smart_edit = 1
endif

"" ledger/vim-ledger
if &runtimepath =~ 'vim-ledger'
  au BufNewFile,BufRead *.ldg,*.ledger,*.journal setf ledger | comp ledger
  let g:ledger_maxwidth = 80
  " Map :da to <ESC>:put =strftime('%Y/%m/%d') for quick insert current date
  "   Use '$' to move at the end of insertions
  "   Use 'a' to change to append mode
  imap      :da                 <ESC>:put =strftime('%Y/%m/%d ')<CR>$a
  vmap      :da                 <ESC>:put =strftime('%Y/%m/%d ')<CR>$a
  nmap      :da                 :put =strftime('%Y/%m/%d ')<CR>$a
endif

"" neomake/neomake
if &runtimepath =~ 'neomake'
  call neomake#configure#automake('nrwi', 1000)
  " open the list automatically
  let g:neomake_open_list = 0
endif

"" ngmy/vim-rubocop
if exists(":RuboCop")
  let g:vimrubocop_keymap = 0
  nnoremap  <F6>                :RuboCop<CR>
  nnoremap  <Leader>ru          :RuboCop<CR>
endif

"" preservim/nerdtree
if &runtimepath =~ 'nerdtree'
  map       <F1>                :NERDTreeToggle<CR>

  " Quit vim if NerdTree is the last opened window
  autocmd bufenter *
        \ if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) |
        \     q |
        \ endif

  let g:NERDTreeDirArrowExpandable = '▷'
  let g:NERDTreeDirArrowCollapsible = '▽'
else
  " Change help key to escape
  inoremap    <F1>                <ESC>
  nnoremap    <F1>                <ESC>
  vnoremap    <F1>                <ESC>
endif

"" rainerborene/vim-reek
if exists(":RunReek")
  " Disable reek for > 1000 lines files
  let g:reek_line_limit = 1000
  nnoremap  <F7>                :RunReek<CR>
  nnoremap  <Leader>re          :RunReek<CR>
endif

"" reedes/vim-lexical
if &runtimepath =~ 'vim-lexical'
  augroup lexical
    autocmd!
    autocmd FileType gitcommit call lexical#init()
    autocmd FileType ledger call lexical#init()
    autocmd FileType markdown,mkd,md call lexical#init()
    autocmd FileType tex call lexical#init()
    autocmd FileType text call lexical#init()
    autocmd FileType textile call lexical#init()
  augroup END

  let g:lexical#spelllang = ['en', 'fr',]
  let g:lexical#thesaurus = ['~/.local/share/nvim/thesaurus/mthesaur.txt',]
  let g:lexical#dictionary = ['/usr/share/dict/words',]
  " Toggle Spelling
  nnoremap  <Leader>ss          :set spell!<CR><Bar>:echo "Spell Check: " . strpart("OffOn", 3 * &spell, 3)<CR>

  function! MyOwnSpell()
    if &spelllang=='en'
      setlocal spell
      setlocal spelllang=fr
      setlocal spelllang?
    elseif &spelllang=='fr'
      setlocal spell
      setlocal spelllang=en,fr
      setlocal spelllang?
    elseif &spelllang=='en,fr'
      setlocal spell
      setlocal spelllang=en
      setlocal spelllang?
    endif
  endfunction
  nnoremap  <Leader>s           :<C-U>call MyOwnSpell()<CR>
endif

"" sirver/ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"


"" thoughtbot/vim-rspec
if &runtimepath =~ 'vim-rspec'
  nnoremap  <Leader>cs          :call RunCurrentSpecFile()<CR>
  nnoremap  <Leader>ns          :call RunNearestSpec()<CR>
  nnoremap  <Leader>ls          :call RunLastSpec()<CR>
  nnoremap  <Leader>as          :call RunAllSpecs()<CR>
endif

"" tpope/vim-surround
if &runtimepath =~ 'vim-surround'
" Type command + one of the following "'[{|< or any HTML tag
  " Add new surround to current word
  nnoremap  ls                  yss
  nnoremap  ws                  ysiw
endif

"" vim-scripts/taglist.vim
if exists(":TlistToggle")
  nnoremap  <F3>                :TlistToggle<CR>
endif

"" xuyuanp/nerdtree-git-plugin
if &runtimepath =~ 'nerdtree-git-plugin'
  let g:NERDTreeIndicatorMapCustom = {
        \ "Clean"     : "✓",
        \ "Deleted"   : "-­",
        \ "Dirty"     : "✗",
        \ "Modified"  : "±",
        \ "Renamed"   : "⇒",
        \ "Staged"    : "◎",
        \ "Unknown"   : "?",
        \ "Unmerged"  : "∴",
        \ "Untracked" : "•" }
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""" My functions
" Get running OS
let os = ""
if has("win32")
  let os="win"
  " Display OS in statusline
  "set statusline+=\ \|\ win
elseif has("unix")
  let s:uname = system("uname")
  if s:uname =~ "Darwin"
    " Display OS in statusline
    "set statusline+=\ \|\ mac
    let os="mac"
  else
    " Display OS in statusline
    "set statusline+=\ \|\ unix
    let os="unix"
  endif
endif

" Set python 3 path on macOS (need pip install pynvim)
if os=="mac"
  let g:python3_host_prog = expand('~/.asdf/shims/python3')
endif

" Press [gh] to open the GitHub URL for a plugin or a commit with the default browser
function! s:plug_gx()
  let line = getline('.')
  let sha  = matchstr(line, '^  \X*\zs\x\{7,9}\ze ')
  let name = empty(sha) ? matchstr(line, '^[-x+] \zs[^:]\+\ze:')
                      \ : getline(search('^- .*:$', 'bn'))[2:-2]
  let uri  = get(get(g:plugs, name, {}), 'uri', '')
  if uri !~ 'github.com'
    return
  endif
  let repo = matchstr(uri, '[^:/]*/'.name)
  let url  = empty(sha) ? 'https://github.com/'.repo
                      \ : printf('https://github.com/%s/commit/%s', repo, sha)
  call netrw#BrowseX(url, 0)
endfunction

augroup PlugGx
  autocmd!
  autocmd FileType vim-plug nnoremap <buffer> <silent> gx :call <sid>plug_gx()<cr>
augroup END

" Easy edit Vimrc
command! Vimrc                  :e $MYVIMRC

" Spell check your markdown and git commits
augroup setSpelling
  autocmd!
  autocmd FileType gitcommit setlocal spell spelllang=en
  autocmd FileType markdown setlocal spell spelllang=en,fr
augroup END

" Delete trailing white space on save
" Useful for Python, Ruby and CoffeeScript
function! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.*            :call DeleteTrailingWS()
autocmd BufWrite .*             :call DeleteTrailingWS()

" Add SheBang automatically on new files
augroup Shebang
  autocmd BufNewFile *.pl                   0put =\"#!/usr/bin/env perl\<nl>\<nl># Copyright (c) Stephane FEUGA OSHIMA\<nl>#  stephane [@] feuga-oshima.com\<nl>#\<nl># This source code is licensed under the GNU/GPLv3 license found in the\<nl>#   LICENSE file in the root directory of this source tree.\<nl>\<nl>\"|$
  autocmd BufNewFile *.{sh,bash}            0put =\"#!/usr/bin/env bash\<nl>\<nl># Copyright (c) Stephane FEUGA OSHIMA\<nl>#  stephane [@] feuga-oshima.com\<nl>#\<nl># This source code is licensed under the GNU/GPLv3 license found in the\<nl>#   LICENSE file in the root directory of this source tree.\<nl>\<nl>\"|$
  autocmd BufNewFile *.tcsh                 0put =\"#!/usr/bin/env tcsh\<nl>\<nl># Copyright (c) Stephane FEUGA OSHIMA\<nl>#  stephane [@] feuga-oshima.com\<nl>#\<nl># This source code is licensed under the GNU/GPLv3 license found in the\<nl>#   LICENSE file in the root directory of this source tree.\<nl>\<nl>\"|$
  autocmd BufNewFile *.tcsh                 0put =\"#!/usr/bin/env tcsh\<nl>\<nl># Copyright (c) Stephane FEUGA OSHIMA\<nl>#  stephane [@] feuga-oshima.com\<nl>#\<nl># This source code is licensed under the GNU/GPLv3 license found in the\<nl>#   LICENSE file in the root directory of this source tree.\<nl>\<nl>\"|$
  autocmd BufNewFile *.zsh                  0put =\"#!/usr/bin/env zsh\<nl>\<nl># Copyright (c) Stephane FEUGA OSHIMA\<nl>#  stephane [@] feuga-oshima.com\<nl>#\<nl># This source code is licensed under the GNU/GPLv3 license found in the\<nl>#   LICENSE file in the root directory of this source tree.\<nl>\<nl>\"|$
  autocmd BufNewFile *.py                   0put =\"#!/usr/bin/env python\<nl># -*- coding: utf-8 -*-\<nl>\<nl>\"|$
  autocmd BufNewFile *.rb                   0put =\"# frozen_string_literal: true\<nl>\<nl>\"|$
  autocmd BufNewFile *.{cc,hh}              0put =\"//\<nl>// \".expand(\"<afile>:t\").\" -- \<nl>//\<nl>\<nl>\"|$
  autocmd BufNewFile *.{ldg,ledger,journal} 0put =\"# -*- ledger -*-\<nl># -*- coding: utf-8 -*-\<nl>\<nl>\"|$
augroup END

" Display a lock icon if current file is readonly or not modifiable
function! ReadOnly()
  if &readonly || !&modifiable
    return ' '
  else
    return ''
  endif
endfunction

" Return word numbers in Visual mode
function! CountWoC()
  if mode() == "v" || mode() == "V"
    return "words"
  else
    return "chars"
  endif
endfunction

" Number of Buffers : Buffer Number
function! StatlineBufCount()
  if !exists("s:statline_n_buffers")
    let s:statline_n_buffers = len(filter(range(1,bufnr('$')), 'buflisted(v:val)'))
  endif
  return s:statline_n_buffers
endfunction

if !exists('g:statline_show_n_buffers')
  let g:statline_show_n_buffers = 1
endif

if g:statline_show_n_buffers
  set statusline+=\ \|\ [%{StatlineBufCount()}\:%n]%<
  " Only calculate buffers after adding/removing buffers
  augroup statline_nbuf
    autocmd!
    autocmd BufAdd,BufDelete * unlet! s:statline_n_buffers
  augroup END
else
  set statusline+=\ [%n]%<
endif
