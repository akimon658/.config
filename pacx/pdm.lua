local function list()
  os.execute "pdm list --global"
end

---@param pkg string
local function upgrade(pkg)
  os.execute("pdm update --global " .. pkg)
end

return {
  list = list,
  upgrade = upgrade,
}
