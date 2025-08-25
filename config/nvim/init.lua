-- Disable Python 3 provider
vim.cmd('let g:loaded_python3_provider = 0')

-- Disable Perl provider
vim.cmd('let g:loaded_perl_provider = 0')

-- Disable Node.js provider
vim.cmd('let g:loaded_node_provider = 0')

require('functions')
require('options')
require('keymaps')
require('plugins')
require('nerdtree')
