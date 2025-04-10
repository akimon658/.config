local event = require "vim_event"

---@type LazyKeysSpec[]
local keys = {
  {
    "<leader>c",
    "<Cmd>BufferClose<CR>",
  },
  {
    "<leader>.",
    "<Cmd>BufferNext<CR>",
  },
  {
    "<leader>,",
    "<Cmd>BufferPrevious<CR>",
  },
  {
    "<leader>>",
    "<Cmd>BufferMoveNext<CR>",
  },
  {
    "<leader><",
    "<Cmd>BufferMovePrevious<CR>",
  },
  {
    "<leader>t0",
    "<Cmd>BufferLast<CR>",
  },
}
for i = 1, 9 do
  table.insert(keys, {
    string.format("<leader>t%d", i),
    string.format("<Cmd>BufferGoto %d<CR>", i),
  })
end

---@type LazyPluginSpec
local barbar = {
  "romgrk/barbar.nvim",
  config = function()
    vim.api.nvim_set_hl(0, "BufferTabpageFill", {})
  end,
  dependencies = { require "plugins.devicons" },
  event = {
    event.buf_new_file,
    event.buf_read_pre,
    event.term_open,
  },
  keys = keys,
}

return barbar
