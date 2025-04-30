-- Disable Python 3 provider
vim.cmd('let g:loaded_python3_provider = 0')

-- Disable Perl provider
vim.cmd('let g:loaded_perl_provider = 0')

-- Disable Node.js provider
vim.cmd('let g:loaded_node_provider = 0')


-- Display Runtime Paths
local function runtime_paths()
	print("Runtime Paths:")
	for path in vim.o.runtimepath:gmatch("[^,]+") do
		print("  - " .. path)
	end
end

vim.api.nvim_create_user_command("RuntimePath", runtime_paths, {})

