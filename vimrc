set nocompatible              " be iMproved, required
filetype off                  " required
set shell=/bin/bash           " Fix some plugin failling

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" Let Vundle manage Vundle, required
" https://github.com/VundleVim/Vundle.vim
Plugin 'VundleVim/Vundle.vim'

"Plugin 'MarcWeber/vim-addon-mw-utils'                       " Interpret a file by function & cache file automatically https://github.com/MarcWeber/vim-addon-mw-utils
"Plugin 'garbas/vim-snipmate'                                " Mimic TextMate's snippets features https://github.com/garbas/vim-snipmate
"Plugin 'honza/vim-snippets'                                 " Snippets files for various programming languages https://github.com/honza/vim-snippets
"Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}   " Statusline plugin https://github.com/powerline/powerline
"Plugin 'tomtom/tlib_vim'                                    " Some utility functions for VIM https://github.com/tomtom/tlib_vim
"Plugin 'tpope/vim-cucumber'                                 " Syntax highlight, indent, and more https://github.com/tpope/vim-cucumber
"Plugin 'tpope/vim-surround'                                 " Add mappings to delete, change and add surroundings https://github.com/tpope/vim-surround
"Plugin 'vim-ruby/vim-ruby'                                  " Ruby plugin's https://github.com/vim-ruby/vim-ruby
Plugin 'Xuyuanp/nerdtree-git-plugin'                        " NerdTree-Git
Plugin 'csexton/jekyll.vim'                                 " Automate common Jekyll tasks https://github.com/csexton/jekyll.vim
Plugin 'ctrlpvim/ctrlp.vim'                                 " Full path fuzzy file, buffer, mru, tag, ... finder for Vim https://github.com/ctrlpvim/ctrlp.vim
Plugin 'editorconfig/editorconfig-vim'                      " EditorConfig Vim Plugin https://github.com/editorconfig/editorconfig-vim
Plugin 'godlygeek/tabular'                                  " Aligning text https://github.com/godlygeek/tabular
Plugin 'ledger/vim-ledger'                                  " Ledger filetype for Vim https://github.com/ledger/vim-ledger
Plugin 'mileszs/ack.vim'                                    " Usage :Ack [options] {pattern} [{directories}] https://github.com/mileszs/ack.vim/
Plugin 'neo4j-contrib/cypher-vim-syntax'                    " Cypher Vim Syntax https://github.com/neo4j-contrib/cypher-vim-syntax
Plugin 'ngmy/vim-rubocop'                                   " Runs RuboCop and displays the results in Vim https://github.com/ngmy/vim-rubocop
Plugin 'rainerborene/vim-reek'                              " Code smell detector for Ruby https://github.com/rainerborene/vim-reek
Plugin 'reedes/vim-lexical'                                 " Build on Vim’s spell/thes/dict completion https://github.com/reedes/vim-lexical
Plugin 'scrooloose/nerdtree'                                " A tree explorer plugin https://github.com/scrooloose/nerdtree
Plugin 'scrooloose/syntastic'                               " Syntax checking hacks https://github.com/vim-syntastic/syntastic
Plugin 'taglist.vim'                                        " Source code browser  https://www.vim.org/scripts/script.php?script_id=273
Plugin 'tpope/vim-endwise'                                  " Adding end after if, do, def https://github.com/tpope/vim-endwise

" Theme
Plugin 'tomasr/molokai'

call vundle#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader=","               "Set the leader key

set timeout timeoutlen=500 ttimeoutlen=100

set autoread                    " Set autoread when files changed from outside
set mouse=a                     " Enable use of the mouse for all modes

" Turn backup off, since most stuff is in SVN, git et.c anyway...
"set nobackup
"set noswapfile
"set nowritebackup
"set noundofile

set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" Set backup file name to ORIGINALFILENAME-YYYYMMDD-HHMMSS.vimbackup
au BufWritePre * let &bex = '-' . strftime("%Y%m%d-%H%M%S") . '.vimbackup'

" Enable syntax highlighting
syntax enable

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Better command line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

"" Searching
set hlsearch                      " highlight matches
set incsearch                     " incremental searching
set ignorecase                    " searches are case insensitive...
set smartcase                     " ... Unless they contain at least one capital letter
nnoremap <CR> :noh<CR><CR>        " This unsets the last search pattern register by hitting return
" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" " mapping of <C-L> below)

" Attempt to determine the type of a file based on its name and possibly its
" " contents. Use this to allow intelligent auto indenting for each file type,
" " and for plugins that are file type specific.
filetype indent plugin on

" When opening a new line and no file type specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent
set smartindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Remember info about open buffers on close
set viminfo^=%

" Always display the status line, even if only one window is displayed
set laststatus=2

" Format the status line
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ Line:\ %l

" now set it up to change the status line based on mode
"if version >= 700
"  au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=undercurl guisp=Magenta
"  au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse
"endif

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
"set t_vb=

" Indentation settings for using 2 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set wrap                        " wrap lines
set shiftwidth=2                " a tab is two spaces
set softtabstop=8               " a tab is two spaces
set expandtab                   " use spaces, not tabs
set backspace=indent,eol,start  " backspace through everything in insert mode

" Encoding
set encoding=utf-8

"" user interface
" Set the window title
set icon
auto BufEnter * let &iconstring = "vim " . expand("%:t")
set showmatch                   " Show matching brackets when text indicator is over them
set magic                       " Set magic on, for regular expressions
set number                      " Display line numbers on the left
set cursorline                  " highlight current line
set ruler                       " Always show current position
set ls=2                        " Always show filename
set wildmenu                    " show menu with tab completion
set wildmode=list:longest,full  " command <Tab> completion, list matches, then longest common part, then all.
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.DS_Store
set whichwrap=b,s,h,l,<,>,[,]   " backspace and cursor keys wrap to
set scrolloff=3                 " minimum lines to keep above and below cursor
set list
set listchars=tab:,.            " Highlight problematic white space

" Save all files on losing focus
au FocusLost * :wa

" Change help key to escape
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Remap CTRL+N to <Tab><Tab> for word completion
imap <Tab><Tab> <C-n>

" Remap :q to <ESC>:q for quick quit
imap :q <ESC>:q<CR>
vmap :q <ESC>:q<CR>
nmap :q :q<CR>

" Remap :w to <ESC>:w for quick save
imap :w <ESC>:w<CR>
vmap :w <ESC>:w<CR>
nmap :w :w<CR>

"Remap dw to <ESC>dw for quick delete
imap dw <ESC>dw

"Remap cw to <ESC>cw for quick change
imap cw <ESC>cw

" Remap 90 to ()
imap 90 ()

" Manage Tab
" CTRL + N to open a new tab
map <C-n> :tabnew<CR>
" Create new tab
nmap nt :tabe<CR>
" Close current tab
nmap ct :tabc<CR>
" Next tab
"nmap gt gt
"" Previous tab
nmap pt gT

" Map U or r to redo
nmap U :redo<CR>
nmap r :redo<CR>

" Map CTRL+r to reload
nmap <C-r> :e<CR>
imap <C-r> <ESC>:e<CR>

" Map CTRL+C to copy to clipboard
"vnoremap <C-c> :w !pbcopy<CR>
" Map CTRL+V to past from clipboard
"imap <C-v> <ESC>:r !pbpaste<CR>$a

" Use tab instead of % for moving between brackets
nnoremap <tab> %
vnoremap <tab> %

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"use different color schemes and fonts in gui or terminal
if has("gui_running")
  set guioptions=aiA
  " color superman
  color desert
  set guifont=monaco\ 10
  set lines=65 columns=84
else
  colorscheme molokai
endif

" fix colors in terminal
"let g:molokai_original = 1
let g:rehash256 = 1

" file type mapping
autocmd BufNewFile,BufReadPost Guardfile set filetype=ruby
autocmd BufNewFile,BufReadPost Gemfile set filetype=ruby

" Add a bit extra margin to the left
"set foldcolumn=1

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    else
        return ''
    endif
endfunction

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vim-ruby
autocmd FileType ruby compiler ruby     " Set the default ruby compiler
filetype indent on                      " Enable filetype-specific indenting
filetype on                             " Enable filetype detection
filetype plugin on                      " Enable filetype-specific plugins

" CTRL-P
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_map = '<c-p>'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe

" NerdTree
map <F8> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'

" NerdTree-Git
let g:NERDTreeIndicatorMapCustom = {
    \ "Clean"     : "~",
    \ "Deleted"   : "‼",
    \ "Dirty"     : "⌂",
    \ "Modified"  : "*",
    \ "Renamed"   : "→",
    \ "Staged"    : "+",
    \ "Unknown"   : "?",
    \ "Unmerged"  : "=",
    \ "Untracked" : "•"
    \ }

" JekyllVim
let g:jekyll_path = "/home/sfeuga/Documents/Development/sfeuga.com/blog.sfeuga.com" " Change this path to your jekyll blog directory

" Delete trailing white space on save, useful for Python, Ruby and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.coffee :call DeleteTrailingWS()
autocmd BufWrite *.css :call DeleteTrailingWS()
autocmd BufWrite *.haml :call DeleteTrailingWS()
autocmd BufWrite *.js :call DeleteTrailingWS()
autocmd BufWrite *.ledger :call DeleteTrailingWS()
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.rake :call DeleteTrailingWS()
autocmd BufWrite *.rb :call DeleteTrailingWS()

" Add shebang automatically on new files
augroup Shebang
  autocmd BufNewFile *.\(cc\|hh\) 0put =\"//\<nl>// \".expand(\"<afile>:t\").\" -- \<nl>//\<nl>\"|2|start!
  autocmd BufNewFile *.\(ldg\|ledger\|journal\) 0put =\"# -*- ledger -*-\<nl># -*- coding: utf-8 -*-\<nl>\"|$
  autocmd BufNewFile *.py 0put =\"#!/usr/bin/env python\<nl># -*- coding: iso-8859-15 -*-\<nl>\"|$
  autocmd BufNewFile *.rb 0put =\"#!/usr/bin/env ruby\<nl># -*- coding: None -*-\<nl>\"|$
  autocmd BufNewFile *.sh 0put =\"#!/usr/bin/env bash\<nl>\"|$
  autocmd BufNewFile *.tex 0put =\"%&plain\<nl>\"|$
augroup END

" Syntastic parameters
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ruby_checkers = ['rubocop', 'mri']
let g:syntastic_ruby_rubocop_exec = '/home/sfeuga/.rvm/rubies/default/bin/rubocop'
set statusline+=%#warningmsg#
set statusline+=%*
set statusline+=%{SyntasticStatuslineFlag()}


" Taglist parameters
map <F7> :TlistToggle<CR>

" Disable Reek launching at load/save time
let g:reek_on_loading = 0
let g:reek_line_limit = 1000 " Disable reek for > 1000 lines files
map <F6> :RunReek<CR>

" Rubocop parameters
let g:vimrubocop_keymap = 0
map <F5> :RuboCop<CR>

" Rubocop all modified files
"function! RubocopMyFiles()
"  exec :tabe | 0read !echo "Rubocop :";for f in $(git status -s | awk '{print $NF}' | grep .rb); do;echo '';echo "--- test du fichier : $f ---";reek $f;done;echo<CR>
"endfunc
"map <F6> :<C-U>RubocopMyFiles()<CR>

" vim-lexical parameters
augroup lexical
  autocmd!
  autocmd FileType ledger call lexical#init()
  autocmd FileType markdown,mkd,md call lexical#init()
  autocmd FileType tex call lexical#init()
  autocmd FileType text call lexical#init()
  autocmd FileType textile call lexical#init()
augroup END

let g:lexical#spelllang = ['en', 'fr',]
let g:lexical#thesaurus = ['~/.vim/thesaurus/mthesaur.txt',]
let g:lexical#dictionary = ['/usr/share/dict/words',]
" toggle spelling with F3 key
map <F3> :set spell!<CR><Bar>:echo "Spell Check: " . strpart("OffOn", 3 * &spell, 3)<CR>

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
map <F2> :<C-U>call MyOwnSpell()<CR>

" vim-ledger parameters
au BufNewFile,BufRead *.ldg,*.ledger,*.journal setf ledger | comp ledger
let g:ledger_maxwidth = 80
" Map :da to <ESC>:put =strftime('%Y/%m/%d') for quick insert current date
"   Use '$' to move at the end of insertions
"   Use 'a' to chane ti append mode
imap :da <ESC>:put =strftime('%Y/%m/%d ')<CR>$a
vmap :da <ESC>:put =strftime('%Y/%m/%d ')<CR>$a
nmap :da :put =strftime('%Y/%m/%d ')<CR>$a
