---@param pkg string
local function info(pkg)
  os.execute("pacman -Si " .. pkg)
end

---@param pkg string
local function install(pkg)
  os.execute("pacman -S " .. pkg)
end

local function list()
  os.execute "pacman -Q"
end

---@param pkg string
local function uninstall(pkg)
  os.execute("pacman -Rs " .. pkg)
end

local function upgrade()
  os.execute "pacman -Syu"
end

return {
  info = info,
  install = install,
  list = list,
  uninstall = uninstall,
  upgrade = upgrade,
}
