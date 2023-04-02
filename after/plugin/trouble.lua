if (not vim.g.vscode) then
    require("trouble").setup();
    vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
        { silent = true, noremap = true }
    )

    vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
        { silent = true, noremap = true }
    )
end
