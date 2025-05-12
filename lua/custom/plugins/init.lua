-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
-- https://lazy.folke.io/spec

--[[
winget install -e 
  --id=JesseDuffield.lazygit
  --id=BurntSushi.ripgrep.MSVC
  --id=sharkdp.fd
--]]
-- Define a global function to change the working directory to the current file's directory
function ChangeCWDToFileDir()
  local file_path = vim.fn.expand '%:p:h' -- Get the path of the current file's directory
  if file_path ~= '' then
    vim.cmd('cd ' .. vim.fn.fnameescape(file_path)) -- Change the working directory
    print('Working directory changed to: ' .. file_path)
  else
    print 'No file is open to determine the directory.'
  end
end

if vim.fn.argc() == 1 then
  vim.api.nvim_create_autocmd('VimEnter', {
    pattern = '*',
    callback = ChangeCWDToFileDir,
  })
end

return {
  -- HarlTest = function()
  --   print 'hello'
  -- end,
}
