---@param pkg string
local function install(pkg)
  if pkg:find "https://" then
    pkg = "--git " .. pkg
  end

  os.execute("cargo install " .. pkg)
end

---@param pkg string
local function uninstall(pkg)
  os.execute("cargo uninstall " .. pkg)
end

return {
  install = install,
  uninstall = uninstall,
  upgrade = install,
}
