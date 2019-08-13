" Minimalist Vim Plugin Manager                                                                                         https://github.com/junegunn/vim-plug
call plug#begin('~/.local/share/nvim/plugged')
"Plug 'taglist.vim', { 'on': 'TlistToggle' }                             " Source code browser                           https://www.vim.org/scripts/script.php?script_id=273
"Plug 'slashmili/alchemist.vim'                                          " Elixir Integration                            https://github.com/slashmili/alchemist.vim
"Plug 'garbas/vim-snipmate'                                              " Mimic TextMate's snippets features            https://github.com/garbas/vim-snipmate
"Plug 'godlygeek/tabular'                                                " Aligning text                                 https://github.com/godlygeek/tabular
"Plug 'honza/vim-snippets'                                               " Snippets files for programming languages      https://github.com/honza/vim-snippets
"Plug 'kassio/neoterm'                                                   " Wrapper of some :terminal functions           https://github.com/kassio/neoterm
"Plug 'mileszs/ack.vim'                                                  " :Ack [options] {pattern} [{directories}]      https://github.com/mileszs/ack.vim
"Plug 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}          " Statusline plugin                             https://github.com/powerline/powerline
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }          " Add git status flags to NERDTree              https://github.com/Xuyuanp/nerdtree-git-plugin
Plug 'csexton/jekyll.vim'                                               " Automate common Jekyll tasks                  https://github.com/csexton/jekyll.vim
Plug 'ctrlpvim/ctrlp.vim', { 'on': ['CtrlP', 'CtrlPMixed'] }            " Fuzzy file, buffer, mru, tag... finder        https://github.com/ctrlpvim/ctrlp.vim
Plug 'editorconfig/editorconfig-vim'                                    " EditorConfig Vim Plugin                       https://github.com/editorconfig/editorconfig-vim
Plug 'jiangmiao/auto-pairs'                                             " Insert/Delete '[', '(', '{'... in pair        https://github.com/jiangmiao/auto-pairs
Plug 'kana/vim-textobj-user'                                            " Create your own text objects                  https://github.com/kana/vim-textobj-user
Plug 'ledger/vim-ledger'                                                " Ledger filetype for Vim                       https://github.com/ledger/vim-ledger
Plug 'machakann/vim-highlightedyank'                                    " Make the yanked region apparent!              https://github.com/machakann/vim-highlightedyank
Plug 'nelstrom/vim-textobj-rubyblock', { 'for': 'ruby' }                " Custom text object for selecting ruby blocks  https://github.com/nelstrom/vim-textobj-rubyblock
Plug 'neo4j-contrib/cypher-vim-syntax', { 'for': ['cypher', 'cql'] }    " Cypher Vim Syntax                             https://github.com/neo4j-contrib/cypher-vim-syntax
Plug 'neomake/neomake'                                                  " Syntax checking hacks                         https://github.com/neomake/neomake
Plug 'ngmy/vim-rubocop', { 'on': 'RuboCop','for': 'ruby' }              " Runs RuboCop                                  https://github.com/ngmy/vim-rubocop
Plug 'pbrisbin/vim-mkdir'                                               " Auto create directories at buffer save        https://github.com/pbrisbin/vim-mkdir
Plug 'rainerborene/vim-reek', { 'on': 'RunReek', 'for': 'ruby' }        " Code smell detector for Ruby                  https://github.com/rainerborene/vim-reek
Plug 'reedes/vim-lexical'                                               " Build on Vim’s spell/thes/dict completion     https://github.com/reedes/vim-lexical
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }                  " A tree explorer plugin                        https://github.com/scrooloose/nerdtree
Plug 'terryma/vim-multiple-cursors'                                     " True Sublime Text style multiple selections   https://github.com/terryma/vim-multiple-cursors
Plug 'thoughtbot/vim-rspec'                                             " Lightweight RSpec runner                      https://github.com/thoughtbot/vim-rspec
Plug 'tomasr/molokai', {'as': 'molokai' }                               " My favorite theme !                           https://github.com/tomasr/molokai
Plug 'tpope/vim-bundler'                                                " Lightweight support for Ruby's Bundler        https://github.com/tpope/vim-bundler
Plug 'tpope/vim-cucumber', { 'for': 'feature' }                         " Syntax highlight, indent, and more            https://github.com/tpope/vim-cucumber
Plug 'tpope/vim-endwise'                                                " Adding end after if, do, def                  https://github.com/tpope/vim-endwise
Plug 'tpope/vim-fugitive'                                               " Git wrapper so awesome, it should be illegal  https://github.com/tpope/vim-fugitive
Plug 'tpope/vim-rails', { 'for': 'ruby' }                               " Ruby on Rails power tools                     https://github.com/tpope/vim-rails
Plug 'tpope/vim-rake', { 'for': 'ruby' }                                " Like rails.vim without the rails              https://github.com/tpope/vim-rake
Plug 'tpope/vim-rhubarb'                                                " GitHub extension for fugitive.vim             https://github.com/tpope/vim-rhubarb
Plug 'tpope/vim-rvm'                                                    " Switch Ruby versions from inside Vim          https://github.com/tpope/vim-rvm
Plug 'tpope/vim-surround'                                               " Quoting/parenthesizing made simple            https://github.com/tpope/vim-surround
Plug 'tpope/vim-unimpaired'                                             " Pairs of handy bracket mappings               https://github.com/tpope/vim-unimpaired
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }                             " Provides motions and text objects for Ruby    https://github.com/vim-ruby/vim-ruby
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" General
"set timeout timeoutlen=500 ttimeoutlen=100
syntax on                                       " Enable syntax highlighting
set autoread                                    " Set autoread when files changed from outside
set wildmenu                                    " Show menu with tab completion
set wildmode=list:longest,full                  " Command <Tab> completion, list matches, then
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
set mouse-=a                                    " Disable mouse integration in vim
set scrolloff=3                                 " Minimum lines to keep above and below cursor
set list                                        " Display invisible characters
set listchars=tab:>·                            " Highlight problematic white space
"set listchars=eol:¬,tab:>·                      " Highlight problematic white space
filetype on                                     " Enable file type detection
filetype indent on                              " Enable file type-specific indenting
filetype plugin on                              " Enable file type-specific plugins
set ffs=unix,dos,mac                            " Use Unix as the standard file type
set nostartofline                               " Stop certain movements from always going to
                                                "   the first character of a line
set confirm                                     " Instead of failing because of unsaved changes,
                                                "   raise a dialogue to save changed files
set nopaste                                     " 'paste' should not be set in your config
autocmd FocusLost * :wa                         " Save all files on losing focus
autocmd TermOpen * startinsert                  " Enter in Terminal-mode automatically

" Return to last edit position when opening files
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \     exe "normal! g`\"" |
      \ endif

""" user interface
set splitbelow                                  " Open new split panes to bottom
set splitright                                  " Open new split panes to right

""" Theming
set termguicolors                               " Enables the true color support
set t_Co=256                                    " Enable support for 256-color terminal
if &rtp =~ 'molokai'
  colorscheme molokai
endif
let g:rehash256 = 1
hi Normal             guibg=NONE
hi Visual guifg=White guibg=#576F72
set number                                      " Display line numbers on the left
set numberwidth=5                               " Line number width
set cursorline                                  " Highlight current line
set ruler                                       " Always show current position
set textwidth=80                                " Line wrap at 80 chars
set lazyredraw                                  " Redraw only when we need to
set undofile                                    " Persistent undo after close Vim
autocmd TermOpen * setlocal wrap                " Wrap text in terminal

""" Format the status line
set laststatus=2                                " Always display the status line
set statusline=                                 " Clean statusline
"set statusline+=%h                              " help flag
"set statusline+=%m                              " modified flag
"set statusline+=%r                              " readonly flag
set statusline+=%{ReadOnly()}                   " Display lock if icon file is readonly
set statusline+=%<%f                            " Filename with path from opened folder
"set statusline+=%<%F                            " Filename with full relative path
"set statusline+=%<%t                            " Filename
set statusline+=%=                              " Left/Right separator
if &runtimepath =~ 'vim-rvm'
  "set statusline+=%<%{rvm#string()}             " Ruby Version (without '[  ]')
  "set statusline+=%<%{rvm#statusline()}         " Ruby Version
  set statusline+=%<%{rvm#statusline_ft_ruby()} " Ruby Version only if ruby file
endif
if &runtimepath =~ 'vim-fugitive'
  "set statusline+=%{FugitiveStatusline()}       " Long Git Branch Name
  set statusline+=%<%{fugitive#Head()}          " Short Git Branch Name
endif
set statusline+=\ \|\                           " Separator
"set statusline+=\ \%{wordcount()[\"bytes\"]}b   " Bytes Count
"set statusline+=\%{wordcount()[\"chars\"]}c     " Characters Count
"set statusline+=\%{wordcount()[\"words\"]}w     " Words Count
set statusline+=\%{wordcount()[CountWoC()]}     " Characters Count or Words Count in Visual Mode
set statusline+=\ \|\                           " Separator
set statusline+=%l                              " Line number
"set statusline+=%l/%L                           " Line number/Total lines
set statusline+=,%c                             " Column position
"set statusline+=\ \|\                           " Separator
"set statusline+=%{strlen(&fenc)?&fenc:'none'}   " File encoding
"set statusline+=,%{&ff}                         " File format
"set statusline+=%y                              " Filetype
"set statusline+=\ %P                            " Position %

""" Format the tab line
set showtabline=2                               " Always show tab bar

""" Code folding
set foldenable                                  " Enable folding
set foldmethod=indent                           " Fold based on indentation (indent, marker, manual, expr, syntax, diff)
set foldlevelstart=10                           " Open most folds by default
set foldnestmax=10                              " 10 nested fold max
set foldcolumn=1                                " Add a 1 char margin to the foldcolumn

""" Encoding
set encoding=utf-8

""" Tabs and spacing
set autoindent                                  " Always indent
set cindent                                     " C style indentation
set tabstop=2                                   " 1 tab == 2 spaces
set expandtab                                   " Convert tab to space
set shiftwidth=2                                " 1 tab == 2 spaces
set smarttab                                    " Inserts blanks according to 'shiftwidth'
set backspace=indent,eol,start                  " Backspace through everything in insert mode

""" Search
set hlsearch                                    " Highlight matches
set incsearch                                   " Incremental searching
set ignorecase                                  " Searches are case insensitive...
set smartcase                                   " ... unless they contain at least one capital
set inccommand=split                            " Get interactive feedback as we compose our substitute command
set diffopt +=iwhite                            " Diff mode: Ignore changes in amount of white space

""" Word completion
set complete=.,b,u,]                            "
set completeopt=menu,preview                    "

""" Paste toggle in insert mode
set pastetoggle=<C-A-P>

""" Remap Keyboard
" Change help key to escape
inoremap    <F1>                <ESC>
nnoremap    <F1>                <ESC>
vnoremap    <F1>                <ESC>
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
" Quick Save + Make Vim Session
imap        :W                  <ESC>:w<CR>:mksession<CR>
vmap        :W                  <ESC>:w<CR>:mksession<CR>
nmap        :W                  :w<CR>:mksession<CR>
" Quick Delete
imap        dw                  <ESC>dw
" Quick Change
imap        cw                  <ESC>cw
" r to redo
nnoremap    r                   :redo<CR>
" List all buffers
nnoremap    <Leader>b           :buffers<CR>
" Keep search matches in the middle of the window.
nnoremap    n                   nzzzv
nnoremap    N                   Nzzzv
" + toggle open/closes folds
nnoremap    +                   za
" Insert digraph
inoremap    <Leader>k           <C-K>
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
nmap        <C-A-H>             gT
" ⇨
nmap        <C-A-L>             gt
" Switch between the last two files
nnoremap    <Leader><Leader>    <C-^>
" Next Buffer
nnoremap    <C-N>               :bnext<CR>
" Previous Buffer
nnoremap    <C-P>               :bprevious<CR>
" Remove the Windows "^M" - when the encodings gets messed up
nnoremap    <Leader><Leader>m   mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
" Easy exit terminal-mode
tnoremap    <Esc>               <C-\><C-n>
" Sends an escape key to the terminal
tnoremap    <A-E>               <Esc>
" Send Ctrl-L to the terminal
tnoremap    <A-L>               <C-l>
" Send Ctrl-K to the terminal
tnoremap    <A-K>               <C-k>
" This unsets the last search pattern register by hitting return
vnoremap    8                   <Esc>:noh<CR>
nnoremap    8                   <Esc>:noh<CR>
" Vsplit a new Terminal
nnoremap    <Leader>t           :vsplit\|te<CR>
nnoremap    <Leader>T           :10split\|te<CR>

" D will duplicate selection at the beginnig of the next line
vnoremap    D                   y'>o<ESC>p

""" File type mapping
autocmd FileType ruby compiler ruby                                 " Set MRI as default ruby compiler
autocmd VimEnter,BufRead,BufNewFile *.gemspec                       set filetype=ruby
autocmd VimEnter,BufRead,BufNewFile *.rake                          set filetype=ruby
autocmd VimEnter,BufRead,BufNewFile *.thor                          set filetype=ruby
autocmd VimEnter,BufRead,BufNewFile Gemfile                         set filetype=ruby
autocmd VimEnter,BufRead,BufNewFile Guardfile                       set filetype=ruby
autocmd VimEnter,BufRead,BufNewFile Procfile                        set filetype=ruby
autocmd VimEnter,BufRead,BufNewFile Rakefile                        set filetype=ruby
autocmd VimEnter,BufRead,BufNewFile Thorfile                        set filetype=ruby
autocmd VimEnter,BufRead,BufNewFile config.ru                       set filetype=ruby
autocmd VimEnter,BufRead,BufNewFile *.feature                       set filetype=cucumber
autocmd VimEnter,BufRead,BufNewFile *.idr                           set filetype=idris
autocmd VimEnter,BufRead,BufNewFile *.jl                            set filetype=julia
autocmd VimEnter,BufRead,BufNewFile *.lfe                           set filetype=lfe
autocmd VimEnter,BufRead,BufNewFile *.lidr                          set filetype=lidris
autocmd VimEnter,BufRead,BufNewFile .bash{rc,_profile,_logout}      set filetype=sh
autocmd VimEnter,BufRead,BufNewFile .z{shrc,login}                  set filetype=sh
autocmd VimEnter,BufRead,BufNewFile .aliases                        set filetype=sh
autocmd VimEnter,BufRead,BufNewFile .utils                          set filetype=sh
autocmd VimEnter,BufRead,BufNewFile *.m{d,kd,kdn,dwn,mdown,arkdown} set filetype=markdown

""" Plugins Parameters
"" Auto Pairs
if &runtimepath =~ 'auto-pairs'
"  " Disable <M-p>, <M-e>, <M-b> and <M-n> shortcuts
"  let g:AutoPairsShortcutToggle = ''
endif

"" Bundler

"" Ctrl-P
if exists(":CtrlP")
  let g:ctrlp_cmd = 'CtrlPMixed'
  let g:ctrlp_working_path_mode = 'ra'
  nnoremap  <C-p>               :CtrlPMixed<CR>
endif

"" Cucumber

"" Cypher-vim-Syntax

"" Editorconfig-Vim

"" Endwise

"" Fugitive

"" Highlightedyank

"" JekyllVim
if exists(":JekyllBuild")
  " Change this path to your jekyll blog directory
  let g:jekyll_path = "$HOME/Documents/Development/sfeuga.com/blog.sfeuga.com"
endif

"" Ledger
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

"" Lexical
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

"" Mkdir

"" Molokai

"" Multiple-Cursors

"" Neomake
if &runtimepath =~ 'neomake'
  function! MyOnBattery()
    return readfile('/sys/class/power_supply/AC/online') == ['0']
  endfunction
  " Full config: when writing or reading a buffer, and on changes in insert and
  "   normal mode (after 1s; no delay when writing)
  if MyOnBattery()
    call neomake#configure#automake('w')
  else
    call neomake#configure#automake('nrwi', 1000)
  endif
  " open the list automatically
  let g:neomake_open_list = 0
endif

"" NerdTree
if exists(":NERDTreeToggle")
  map       <Leader>n           :NERDTreeToggle<CR>
  autocmd bufenter *
        \ if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) |
        \     q |
        \ endif
  let g:NERDTreeDirArrowExpandable = '►'
  let g:NERDTreeDirArrowCollapsible = '▼'
endif

"" NerdTree-Git
if &runtimepath =~ 'nerdtree-git-plugin'
  let g:NERDTreeIndicatorMapCustom = {
        \ "Clean"     : "~",
        \ "Deleted"   : "‼",
        \ "Dirty"     : "⌂",
        \ "Modified"  : "*",
        \ "Renamed"   : "→",
        \ "Staged"    : "+",
        \ "Unknown"   : "?",
        \ "Unmerged"  : "=",
        \ "Untracked" : "•" }
endif

"" Reek
if exists(":RunReek")
  " Disable reek for > 1000 lines files
  let g:reek_line_limit = 1000
  nnoremap  <Leader>re          :RunReek<CR>
endif

"" Rhubarb

"" Rspec
if &runtimepath =~ 'vim-rspec'
  nnoremap  <Leader>te          :call RunCurrentSpecFile()<CR>
  nnoremap  <Leader>sp          :call RunNearestSpec()<CR>
  nnoremap  <Leader>ls          :call RunLastSpec()<CR>
  nnoremap  <Leader>as          :call RunAllSpecs()<CR>
endif

"" RuboCop
if exists(":RuboCop")
  let g:vimrubocop_keymap = 0
  nnoremap  <Leader>ru          :RuboCop<CR>
endif

"" Ruby

"" Rvm

"" Surround
if &rtp =~ 'vim-surround'
" Type command + one of the following "'[{|< or any HTML tag
  " Add new surround to current word
  nnoremap  ls                  yss
  nnoremap  ws                  ysiw
endif

"" Taglist
"nnoremap    <Leader>tl          :TlistToggle<CR>

"" Textobj-User

"" Unimpaired

""" My functions
" Easy edit Vimrc
command!    Vimrc               :vs $MYVIMRC

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
  autocmd BufNewFile *.{cc,hh}              0put =\"//\<nl>// \".expand(\"<afile>:t\").\" -- \<nl>//\<nl>\<nl>\"|$
  autocmd BufNewFile *.{ldg,ledger,journal} 0put =\"# -*- ledger -*-\<nl># -*- coding: utf-8 -*-\<nl>\<nl>\"|$
  autocmd BufNewFile *.py                   0put =\"#!/usr/bin/env python\<nl># -*- coding: utf-8 -*-\<nl>\<nl>\"|$
  autocmd BufNewFile *.rb                   0put =\"# frozen_string_literal: true\<nl>\<nl>\"|$
  autocmd BufNewFile *.sh                   0put =\"#!/usr/bin/env bash\<nl>\"|$
  autocmd BufNewFile *.zsh                  0put =\"#!/usr/bin/env zsh\<nl>\"|$
  autocmd BufNewFile *.tcsh                 0put =\"#!/usr/bin/env tcsh\<nl>\"|$
augroup END

" Display a lock icon if current file is readonly or not modifiable
function! ReadOnly()
  if &readonly || !&modifiable
    return ''
  else
    return ''
endfunction

" Return word numbers in Visual mode
function! CountWoC()
  if mode() == "v" || mode() == "V"
    return "words"
  else
    return "chars"
  endif
endfunction

" Test Funtion to explore VimL
function! AddBrackets(someText)
  let isgitrepo = system('echo -n $(git rev-parse --is-inside-work-tree)')
  let toreturn = "[" . a:someText . "]\ \|\ "
  if isgitrepo == "true"
    return toreturn
  else
    return ''
  endif
endfunction
