local event = require "vim_event"

---@type LazyPluginSpec
local indent_blankline = {
  "lukas-reineke/indent-blankline.nvim",
  config = function()
    local link_to_non_text = { link = "NonText" }
    vim.api.nvim_set_hl(0, "IblIndent", link_to_non_text)
    vim.api.nvim_set_hl(0, "IblScope", { fg = "#dcdcaa" })
    vim.api.nvim_set_hl(0, "IblWhitespace", link_to_non_text)
    require "ibl".setup {
      indent = {
        char = "│",
      },
    }
  end,
  dependencies = { require "plugins_not_vscode.treesitter" },
  event = {
    event.buf_new_file,
    event.buf_read_pre,
  },
}

return indent_blankline
