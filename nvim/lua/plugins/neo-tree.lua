---@type LazyPluginSpec
local neo_tree = {
  'nvim-neo-tree/neo-tree.nvim',
  config = function()
    vim.g.neo_tree_remove_legacy_commands = 1

    require('neo-tree').setup({
      close_if_last_window = true,
      filesystem = {
        filtered_items = { visible = true },
        follow_current_file = true,
        use_libuv_file_watcher = true
      },
      view = { relativenumber = true },
      window = { width = 30 }
    })
  end,
  dependencies = {
    require('plugins.devicons'),
    require('plugins.nui'),
    require('plugins.plenary')
  },
  keys = { {
    '<C-e>',
    function()
      require('neo-tree.command')._command('toggle')
    end
  } }
}

return neo_tree