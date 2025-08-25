local opt = vim.opt
local api = vim.api
local fn = vim.fn

-- Hint: use `:h <option>` to figure out the meaning if needed
opt.backspace = 'indent,eol,start'  -- make backspace work as expected in some situations
opt.clipboard = 'unnamedplus'       -- use system clipboard
opt.complete = '.,b,u,t,i,d,kspell' -- https://neovim.io/doc/user/options.html#'cpt'
opt.completeopt = {                 -- https://neovim.io/doc/user/options.html#'cot'
    'menu',
    'preview'
}
opt.foldenable = false              -- files will open with everything folded
opt.foldmethod = 'indent'           -- fold based on indentation: indent, marker, manual, expr, syntax, diff
opt.syntax = 'on'                   -- syntax highlighting; also does an implicit file-type on
opt.wildignore:append(
    '*.*~,' ..
    '*.swp,' ..
    '*.bak,' ..
    '*.pyc,' ..
    '*.class,' ..
    '*.DS_Store,' ..
    '.svn,CVS,.git,' ..
    '*.o,*.a,*.so,' ..
    '*.mo,*.la,' ..
    '*.obj,' ..
    '*.jpg,*.jpeg,' ..
    '*.png,*.gif,' ..
    '*.bmp,*.xmp,' ..
    '*.zip,*.7z,' ..
    '*.tar,*.gz,*.tgz' ..
    '*.exe,*.dll,' ..
    '*\\tmp\\*,*/tmp/*'
) -- ignore these when autocompletion
opt.wildmenu = true                 -- make tab completion for files/buffers act like bash
opt.wildmode = 'list:full'          -- show a list when pressing tab; complete first full match

-- Tab
opt.expandtab = true                -- tabs are spaces, mainly because of python
opt.shiftwidth = 4                  -- insert 4 spaces on a tab
opt.showtabline = 2                 -- Always show tab-line
opt.smartindent = true              -- smart auto-indenting when starting a new line
opt.smarttab = true                 -- insert spaces according to shift-width at the beginning of each line
opt.softtabstop = 4                 -- number of spaces in tab when editing
opt.tabstop = 4                     -- number of visual spaces per TAB

-- UI config
api.nvim_set_hl(0, 'Normal', { bg = 'NONE' }) -- set Normal highlight background to none (transparent)
api.nvim_set_hl(0, 'NormalNC', { bg = 'NONE' })
api.nvim_set_hl(0, 'NormalFloat', { bg = 'NONE' })
api.nvim_set_hl(0, 'FloatBorder', { bg = 'NONE' })
api.nvim_set_hl(0, 'VertSplit', { bg = 'NONE' })
api.nvim_set_hl(0, 'Visual', { fg = 'White', bg = '#576F72' }) -- set Visual highlight group
api.nvim_set_hl(0, 'TabLine', { fg = '#999999', bg = '#2e2e2e' }) -- inactive tabs
api.nvim_set_hl(0, 'TabLineFill', { bg = 'NONE' }) -- background/fill space after last tab
api.nvim_set_hl(0, 'TabLineSel', { fg = '#000000', bg = '#42ef42', bold = true }) -- active tab (selected)
api.nvim_set_hl(0, 'StatusLine', { fg = '#FFFFFF', bg = '#576F72' }) -- active tab (selected)
api.nvim_set_hl(0, 'StatusLineNC', { fg = '#666666', bg = 'NONE' }) -- active tab (selected)
opt.cursorline = true               -- highlight cursor line underneath the cursor horizontally
opt.laststatus = 2                  -- always show the status-line
opt.lazyredraw = true               -- redraw only when we need to
opt.list = true                     -- show non-printing characters
opt.listchars = 'trail:·'           -- this will show a `·` symbol for trailing spaces
opt.number = true                   -- show absolute number to each line on the left side
opt.numberwidth = 5                 -- minimal number of columns to use for the line number
opt.relativenumber = true           -- add relative numbers to each line on the left side
opt.ruler = true                    -- always show current position
opt.scrolloff = 3                   -- keep some lines above and below cursor to keep it visible
opt.showmatch = true                -- show matching parentheses
opt.showmode = false                -- we are experienced, we don't need the "-- INSERT --" mode hint
opt.signcolumn = 'yes'              -- always show the sign-column
opt.splitbelow = true               -- open new vertical split bottom
opt.splitright = true               -- open new horizontal splits right
opt.statusline = '[%n] %r%m%f [%{&fenc}]%=%{&spell ? "[Spell\\: " .. &spelllang .. "]" : ""} %l/%L|%c' -- Statusline Items
opt.termguicolors = true            -- enable 24-bit RGB color in the TUI
opt.textwidth = 80                  -- line wrap at 80 characters
opt.updatetime = 50                 -- milliseconds nothing is typed the swap file will be written

-- Searching
opt.hlsearch = true                 -- highlight matches
opt.ignorecase = true               -- ignore case in searches by default
opt.incsearch = true                -- search as characters are entered
opt.smartcase = true                -- but make it case sensitive if an uppercase is entered

-- Backup files
local tmp_dir = fn.expand('~/.local/share/nvim/') -- directory for swap, backup, and undo files
opt.backupdir = tmp_dir .. '/backup//' -- backup file dir (Double slashes enable nested directories)
opt.backup = true                   -- use backup files
opt.directory = tmp_dir .. '/swap//' -- swap file dir (Double slashes enable nested directories)
opt.swapfile = true                 -- use swap files
opt.undodir = tmp_dir .. '/undo//'  -- undo file dir (Double slashes enable nested directories)
opt.undofile = true                 -- persistent undo after close Vim
opt.undolevels = 100                -- undo history length

-- Spell
opt.spelllang = { 'en', 'fr', 'cjk' }
