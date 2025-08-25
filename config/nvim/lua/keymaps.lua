local keymap = vim.keymap

-- Quick Save
keymap.set({ 'i', 'n', 'v', 't' }, ':wa', '<C-\\><C-n>:TabWrite<CR>', { noremap = false, silent = true })
keymap.set({ 'i', 'n', 'v' }, ':w', '<ESC>:w<CR>', { noremap = false, silent = true })

-- Quick Close
keymap.set({ 'i', 'n', 'v', 't' }, ':q', '<C-\\><C-n>:q<CR>', { noremap = false, silent = true })

-- Keep search match in the center of the window
keymap.set('n', 'n', 'nzzzv', { noremap = true, silent = true })
keymap.set('n', 'N', 'Nzzzv', { noremap = true, silent = true })
keymap.set({ 'n', 'v' }, '8', '<ESC>:noh<CR>', { noremap = true, silent = true }) -- unset the last search

-- Easy resize windows
keymap.set({ 'i', 'n', 'v', 't' }, '<A-h>', '<C-\\><C-n>:vertical resize +5<CR>', { noremap = true, silent = true })
keymap.set({ 'i', 'n', 'v', 't' }, '<A-j>', '<C-\\><C-n>:resize +5<CR>', { noremap = true, silent = true })
keymap.set({ 'i', 'n', 'v', 't' }, '<A-k>', '<C-\\><C-n>:resize -5<CR>', { noremap = true, silent = true })
keymap.set({ 'i', 'n', 'v', 't' }, '<A-l>', '<C-\\><C-n>:vertical resize -5<CR>', { noremap = true, silent = true })

-- Easy move between windows
keymap.set({ 'i', 'n', 'v', 't' }, '<C-h>', '<C-\\><C-n><C-W>h', { noremap = true, silent = true })
keymap.set({ 'i', 'n', 'v', 't' }, '<C-j>', '<C-\\><C-n><C-W>j', { noremap = true, silent = true })
keymap.set({ 'i', 'n', 'v', 't' }, '<C-k>', '<C-\\><C-n><C-W>k', { noremap = true, silent = true })
keymap.set({ 'i', 'n', 'v', 't' }, '<C-l>', '<C-\\><C-n><C-W>l', { noremap = true, silent = true })

-- Buffers
keymap.set({ 'n', 't' }, '<Leader>p', ':bprevious<CR>', { noremap = true, silent = true }) -- previous buffer
keymap.set({ 'n', 't' }, '<Leader>n', ':bnext<CR>', { noremap = true, silent = true }) -- next buffer

-- Terminal
keymap.set({ 't' }, '<Leader>e', '<ESC>', { noremap = true, silent = true }) -- send ESCAPE to terminal
keymap.set({ 't' }, '<Leader>l', '<C-l>', { noremap = true, silent = true }) -- send CTRL-L to terminal
keymap.set({ 't' }, '<Leader>k', '<C-k>', { noremap = true, silent = true }) -- send CTRL-K to terminal
keymap.set({ 'n' }, '<Leader>t', ':15split|te<CR>', { noremap = true, silent = true }) -- create a bottom terminal
keymap.set({ 'n' }, '<Leader>tt', ':vsplit|te<CR>', { noremap = true, silent = true }) -- create a side terminal

-- Spelling
keymap.set({ 'i', 'n' }, '<Leader>s', '<ESC>:set spell!<CR>', { noremap = true, silent = true }) -- toggle spell checking
keymap.set({ 'i', 'n' }, '<Leader>sa', '<ESC>:set spell spelllang=en,fr,cjk<CR>', { noremap = true, silent = true }) -- set spell lang to default values (EN, FR and CJK)
keymap.set({ 'i', 'n' }, '<Leader>se', '<ESC>:set spell spelllang=en<CR>', { noremap = true, silent = true }) -- set spell lang to english (EN)
keymap.set({ 'i', 'n' }, '<Leader>sf', '<ESC>:set spell spelllang=fr<CR>', { noremap = true, silent = true }) -- set spell lang to french (FR)
