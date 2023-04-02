if (not vim.g.vscode) then
    local timer = vim.loop.new_timer()
    timer:start(1, 0, vim.schedule_wrap(function()
        vim.api.nvim_exec("Copilot setup", false);
        vim.api.nvim_exec("Copilot enable", false);
    end))

    vim.g.copilot_no_tab_map = false;
    vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
end
