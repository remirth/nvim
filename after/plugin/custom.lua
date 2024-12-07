local script_path = "C:\\Users\\exsjabe\\AppData\\Local\\nvim\\node\\find_and_replace.mjs"
find_and_replace = function(...)
  local args = { ... }
  -- Check if exactly three arguments are provided
  if #args == 3 then
    -- Your logic with the three arguments
    local arg1, arg2, arg3 = unpack(args)
    local handle = io.popen("node " .. script_path .. " " .. arg1 .. " " .. arg2 .. " " .. arg3)
    local result = handle:read("*a")
    handle:close()
  else
    vim.cmd('echoerr "Missing arguments"')
  end
end
vim.api.nvim_command("command! -nargs=* FSED lua find_and_replace(<f-args>)")
