if (not vim.g.vscode) then
    vim.keymap.set("n", "<leader>gs", vim.cmd.Git);
    vim.keymap.set("n", "<leader>gd", function() vim.cmd.Git("diff") end);
end
