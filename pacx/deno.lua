---@param pkg string
---@param flags string
local function install(pkg, flags)
  os.execute(string.format("deno install --global %s %s", flags, pkg))
end

local function list()
  os.execute "ls $DENO_INSTALL_ROOT/bin"
end

---@param pkg string
local function uninstall(pkg)
  os.execute("deno uninstall --global " .. pkg)
end

return {
  install = install,
  list = list,
  uninstall = uninstall,
}
