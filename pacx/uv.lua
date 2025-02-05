---@param pkg string
local function install(pkg)
  os.execute("uv tool install " .. pkg)
end

local function list()
  os.execute "uv tool list"
end

---@param pkg string
local function upgrade(pkg)
  os.execute("uv tool upgrade " .. pkg)
end

return {
  install = install,
  list = list,
  upgrade = upgrade,
}
