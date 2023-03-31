if (not vim.g.vscode) then
    vim.cmd.Copilot("setup")
    vim.cmd.Copilot("enable")

    vim.g.copilot_no_tab_map = false;
    vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
    
end
