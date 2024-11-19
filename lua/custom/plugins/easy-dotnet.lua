-- https://github.com/GustavEikaas/easy-dotnet.nvim?tab=readme-ov-file#package-autocomplete
-- https://github.com/GustavEikaas/nvim-config/blob/main/lua/plugins/easy-dotnet.lua
-- lazy.nvim
local function add_dotnet_mappings()
  local dotnet = require 'easy-dotnet'

  vim.api.nvim_create_user_command('Secrets', function()
    dotnet.secrets()
  end, {})

  vim.keymap.set('n', '<A-t>', function()
    vim.cmd 'Dotnet testrunner'
  end)

  vim.keymap.set('n', '<C-p>', function()
    dotnet.run_with_profile(true)
  end)

  vim.keymap.set('n', '<C-b>', function()
    dotnet.build_default_quickfix()
  end)
end

return {
  {
    'GustavEikaas/easy-dotnet.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' },
    config = function()
      require('easy-dotnet').setup()
    end,
  },
}
