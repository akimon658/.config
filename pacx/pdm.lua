---@param pkg string
local function install(pkg)
  os.execute("pdm add --global " .. pkg)
end

local function list()
  os.execute "pdm list --global"
end

---@param pkg string
local function upgrade(pkg)
  os.execute("pdm update --global " .. pkg)
end

return {
  install = install,
  list = list,
  upgrade = upgrade,
}
