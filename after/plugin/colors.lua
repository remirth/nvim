function ColorMyPencils(color)
  -- vim.cmd.set("background=dark")
  if color ~= "none" then
    color = color or "vscode"
    vim.cmd.colorscheme(color)
  else
    NoColor()
  end

  -- vim.api.nvim_set_hl(0, "Normal", { bg = "white" })
  -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "white" })
end

function NoColor()
  -- Disable vim's built-in color schemes to use terminal colors
  vim.opt.termguicolors = false

  -- Use terminal background
  vim.cmd([[
  highlight Normal ctermbg=NONE guibg=NONE
  highlight LineNr ctermbg=NONE guibg=NONE
  highlight SignColumn ctermbg=NONE guibg=NONE
  highlight VertSplit ctermbg=NONE guibg=NONE
  highlight EndOfBuffer ctermbg=NONE guibg=NONE
]])

  -- Ensure transparency
  vim.cmd('hi Normal guibg=NONE ctermbg=NONE')

  -- Enable syntax highlighting while using terminal colors
  vim.cmd('syntax enable')

  -- Optional: if you want line numbers to be subtle
  vim.cmd('highlight LineNr ctermfg=8')

  -- Make sure vim doesn't override terminal background
  vim.api.nvim_set_option("background", "")
end

if (not vim.g.vscode) then
  ColorMyPencils("none")
end
