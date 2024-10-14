local function install()
  os.execute "pnpm env add --global lts"
  os.execute "pnpm env use --global lts"
end

local function upgrade()
  ---@type string
  local current_version = io.popen "pnpm env list --global":read()

  os.execute("pnpm env remove --global " .. current_version)
  install()

  package.path = package.path .. ";" .. os.getenv "XDG_CONFIG_HOME" .. "/pacx/json/?.lua"
  local json = require "json"

  ---@type string
  local pnpm_list = io.popen "pnpm list --global --json":read "*a"
  local obj = json.decode(pnpm_list)

  ---@type string[]
  local packages = {}
  for k, _ in pairs(obj[1].dependencies) do
    table.insert(packages, k)
  end

  os.execute("pnpm add --global " .. table.concat(packages, " "))
end

return {
  install = install,
  upgrade = upgrade,
}
