if string.find(vim.o.runtimepath, "nerdtree") then
    vim.keymap.set('n', '<F1>', ':NERDTreeToggle<CR>', { noremap = true, silent = true })

    -- Quit vim if NerdTree is the last opened window
    vim.api.nvim_create_autocmd('bufenter', {
            callback = function()
                if vim.fn.winnr("$") == 1
                    and vim.b.NERDTree
                    and vim.b.NERDTree.isTabTree then
                        vim.cmd("q")
                end
            end
        }
    )
end
