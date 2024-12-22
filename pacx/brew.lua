---@param pkg string
---@param flags string
local function info(pkg, flags)
  os.execute(string.format("brew info %s %s", pkg, flags))
end

---@param pkg string
local function install(pkg)
  os.execute("brew install " .. pkg)
end

---@param pkg string
local function uninstall(pkg)
  os.execute("brew uninstall " .. pkg)
end

local function upgradable()
  os.execute "brew outdated"
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
  list = function()
    os.execute "brew list"
  end,
  uninstall = uninstall,
  upgradable = upgradable,
  why = why,
}
