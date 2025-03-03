---@type LazyPluginSpec
local copilot = {
  "zbirenbaum/copilot.lua",
  cond = function()
    return string.find(vim.fn.getcwd(), "AtCoder") == nil and string.find(vim.fn.getcwd(), "project%-euler") == nil
  end,
  event = require "vim_event".buf_read_post,
  opts = {
    filetypes = {
      markdown = true,
      yaml = true,
    },
    suggestion = {
      auto_trigger = true,
      keymap = {
        accept = "<C-f>",
      },
    },
  },
}

return copilot
