local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- My favorite theme
Plug('tomasr/molokai')
-- Adds filetype glyphs to various vim plugins
Plug('nvim-tree/nvim-web-devicons')
-- A tree explorer plugin
Plug('preservim/nerdtree', { ['on'] = 'NERDTreeToggle' })
-- Add git status flags to NERDTree
Plug('xuyuanp/nerdtree-git-plugin', { ['on'] = 'NERDTreeToggle' })

vim.call('plug#end')

-- Set the molokai theme
vim.cmd('silent! colorscheme molokai')
