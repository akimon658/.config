---@param pkg string
local function install(pkg)
  os.execute("pnpm add -g " .. pkg)
end

---@param pkg string
local function uninstall(pkg)
  os.execute("pnpm remove -g " .. pkg)
end

return {
  install = install,
  list = function()
    os.execute "pnpm list -g"
  end,
  uninstall = uninstall,
}
