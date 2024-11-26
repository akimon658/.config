---@param pkg string
local function install(pkg)
  if pkg:find "https://" then
    pkg = "--git " .. pkg
  end

  os.execute("cargo install " .. pkg)
end

local function list()
  os.execute "cargo install --list"
end

---@param pkg string
local function uninstall(pkg)
  os.execute("cargo uninstall " .. pkg)
end

return {
  install = install,
  list = list,
  uninstall = uninstall,
  upgrade = install,
}
