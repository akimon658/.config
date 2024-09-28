---@param pkg string
local function info(pkg)
  os.execute("brew info " .. pkg)
end

---@param pkg string
local function install(pkg)
  os.execute("brew install " .. pkg)
end

---@param pkg string
local function uninstall(pkg)
  os.execute("brew uninstall " .. pkg)
end

---@param pkg string
local function why(pkg)
  os.execute("brew uses --installed " .. pkg)
end

return {
  info = info,
  install = install,
  upgrade = function()
    os.execute "brew upgrade"
  end,
  outdated = function()
    os.execute "brew outdated"
  end,
  list = function()
    os.execute "brew list"
  end,
  uninstall = uninstall,
  why = why,
}
