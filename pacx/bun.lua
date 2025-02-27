---@param pkg string
local function install(pkg)
  os.execute("bun add -g " .. pkg)
end

return {
  install = install,
}
