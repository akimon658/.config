---@param pkg string
local function install(pkg)
  os.execute("bun add -g " .. pkg)
end

---@param pkg string
local function uninstall(pkg)
  os.execute("bun remove -g " .. pkg)
end

return {
  install = install,
  uninstall = uninstall,
}
