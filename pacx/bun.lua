---@param pkg string
local function install(pkg)
  os.execute("bun add -g " .. pkg)
end

local function list()
  os.execute "bun pm ls --global"
end

---@param pkg string
local function uninstall(pkg)
  os.execute("bun remove -g " .. pkg)
end

return {
  install = install,
  list = list,
  uninstall = uninstall,
}
