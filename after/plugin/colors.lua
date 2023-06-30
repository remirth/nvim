if (not vim.g.vscode) then
  function ColorMyPencils(color)
    vim.cmd.set("background=dark")
    color = color or "catppuccin-mocha"
    vim.cmd.colorscheme(color)

    -- vim.api.nvim_set_hl(0, "Normal", { bg = "white" })
    -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "white" })
  end

  ColorMyPencils()
end
