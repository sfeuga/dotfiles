-- Display Runtime Paths
vim.api.nvim_create_user_command('RuntimePath', function()
    print('Runtime Paths:')
    for path in vim.o.runtimepath:gmatch('[^,]+') do
        print('  - ' .. path)
    end
end, {
    desc = 'Display all runtime path'
})

-- Auto remove trailing white space on all buffers before saving
vim.api.nvim_create_autocmd('BufWritePre', {
    group = vim.api.nvim_create_augroup('TrimWhitespaceOnSave', { clear = true }),
    pattern = '*',
    callback = function(ctx)
        vim.cmd([[%s/\s\+$//e]]) -- remove trailing white space
    end,
    desc = 'Trim trailing whitespace before saving',
})

-- Auto wipe buffer when quitting a terminal
vim.api.nvim_create_autocmd({ 'TermClose', 'TermLeave' }, {
    callback = function(args)
        local buf = args.buf

        -- delay check until after window closes
        vim.defer_fn(function()
            local is_visible = false

            -- check if buffer is still visible in any window
            for _, win in ipairs(vim.api.nvim_list_wins()) do
                if vim.api.nvim_win_get_buf(win) == buf then
                    is_visible = true
                    break
                end
            end

            -- wipe out if not visible and not modified
            if not is_visible and vim.api.nvim_buf_is_loaded(buf) and not vim.bo[buf].modified then
                vim.api.nvim_buf_delete(buf, { force = true })
            end
        end, 50) -- wait 50ms for neovim to update state
    end,
    desc = 'Auto-wipe hidden terminal buffers after 50 miliseconds',
})

-- Auto enter Insert mode in terminals
vim.api.nvim_create_autocmd('TermOpen', {
    callback = function()
        local buftype = vim.bo.buftype
        if buftype == 'terminal' then
            vim.cmd("startinsert")
        end
    end,
    desc = 'Auto enter in insert mode when opening a terminal',
})

-- Re-enter Insert mode whenever you switch back to a terminal buffer
vim.api.nvim_create_autocmd({ 'BufEnter', 'WinEnter' }, {
    callback = function()
        local bufname = vim.api.nvim_buf_get_name(0)
        if vim.bo.buftype == 'terminal' and not bufname:match('lazygit') then
            vim.cmd("startinsert")
        end
    end,
    desc = 'Auto re-enter insert mode when switching to terminal',
})

-- Write all buffers visible in current tab windows
vim.api.nvim_create_user_command('TabWrite', function()
    local current_tab = vim.api.nvim_get_current_tabpage()
    local wins = vim.api.nvim_tabpage_list_wins(current_tab)
    local bufs = {}

    for _, win in ipairs(wins) do
        local buf = vim.api.nvim_win_get_buf(win)
        bufs[buf] = true
    end

    for buf, _ in pairs(bufs) do
        -- skip terminal buffers, unlisted, or read-only
        local buftype = vim.api.nvim_buf_get_option(buf, 'buftype')
        local readonly = vim.api.nvim_buf_get_option(buf, 'readonly')
        local modified = vim.api.nvim_buf_get_option(buf, 'modified')

        if buftype == '' and not readonly and modified then
            vim.api.nvim_buf_call(buf, function()
                vim.cmd('write')
            end)
        end
    end
end, {
    desc = 'Write all buffers visible in current tab windows'
})

-- Show word and character count (excluding spaces) of current buffer
vim.api.nvim_create_user_command('BufferStats', function(opts)
    -- get all lines in the buffer
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

    -- get commentstring (e.g. "# %s", "// %s", etc.)
    local commentstring = vim.bo.commentstring or ''
    local comment_prefix = commentstring:match('^%s*(.-)%s*%%s')

    local code_lines = 0
    local comment_lines = 0
    local word_count_code = 0
    local char_count_code = 0
    local word_count_total = 0
    local char_count_total = 0

    for _, line in ipairs(lines) do
        -- trim leading/trailing whitespace
        local trimmed = line:match('^%s*(.-)%s*$')

        -- skip blank lines
        if trimmed ~= '' then
            local is_comment = false

            if comment_prefix then
                local pattern = '^' .. vim.pesc(comment_prefix)
                if trimmed:find(pattern) then
                    is_comment = true
                end
            end

            -- count words in this line
            local word_count = select(2, trimmed:gsub('%S+', ''))
            -- count non-whitespace characters
            local char_count = #trimmed:gsub('%s+', '')

            word_count_total = word_count_total + word_count
            char_count_total = char_count_total + char_count

            if is_comment then
                comment_lines = comment_lines + 1
            else
                code_lines = code_lines + 1
                word_count_code = word_count_code + word_count
                char_count_code = char_count_code + char_count
            end
        end
    end

    -- if a path is passed in, try to export
    if opts and opts.args and opts.args ~= '' then
        local folder = vim.fn.expand(opts.args) -- expand ~, $HOME, etc.
        local bufname = vim.api.nvim_buf_get_name(0)

        if bufname == '' then
            vim.notify('Current buffer has no name; cannot export stats.', vim.log.levels.WARN)
            return
        end

        local filename = vim.fn.fnamemodify(bufname, ':t') -- base filename
        local filedir = vim.fn.fnamemodify(bufname, ':h') -- directory path only

        local stat_file = folder .. '/' .. filename .. '.stats.csv'

        -- create folder if it doesn't exist
        vim.fn.mkdir(folder, 'p')

        local csv_header = 'filepath,filename,code_lines,comment_lines,words_in_code,chars_in_code,total_words,total_chars\n'
        local csv_line = string.format('%s,%s,%d,%d,%d,%d,%d,%d\n',
            filedir, filename, code_lines, comment_lines, word_count_code, char_count_code, word_count_total, char_count_total
        )

        local ok, err = pcall(function()
            local f = assert(io.open(stat_file, 'w'))
            f:write(csv_header)
            f:write(csv_line)
            f:close()
        end)

        if ok then
            vim.notify('📁 Stats exported to: ' .. stat_file, vim.log.levels.INFO)
        else
            vim.notify('❌ Failed to write stats: ' .. err, vim.log.levels.ERROR)
        end
    else
        print(string.format([[

📊 Buffer Stats:
    - Code lines        : %d
    - Comment lines     : %d

    - Words in code     : %d
    - Chars in code     : %d

    - Total words       : %d
    - Total characters  : %d
]], code_lines, comment_lines, word_count_code, char_count_code, word_count_total, char_count_total))
    end
end, {
    desc = 'Show detailed stats (words, chars, lines, comments) and optionally export as a CSV to a folder',
    nargs = '?',
    complete = 'dir', -- tab complete file paths
})
