---@param pkg string
---@param flags string
---@param version? string
local function install(pkg, flags, version)
  if version then
    pkg = string.format("%s@%s", pkg, version)
  end

  os.execute(string.format("deno install --global %s %s", flags, pkg))
end

local function list()
  os.execute "ls $DENO_INSTALL_ROOT/bin"
end

---@param pkg string
local function uninstall(pkg)
  os.execute("deno uninstall --global " .. pkg)
  os.execute(string.format("rm $DENO_INSTALL_ROOT/bin/.%s.lock.json", pkg))
end

---@param pkg string
---@param version? string
local function upgrade(pkg, _, version)
  if not version then
    error "error: version is required for deno package upgrade"
  end

  local deno_install_root = os.getenv "DENO_INSTALL_ROOT"

  if not deno_install_root then
    deno_install_root = os.getenv "HOME" .. "/.deno"
  end

  local script_path = string.format("%s/bin/%s", deno_install_root, pkg)

  local file = io.open(script_path, "r")

  if not file then
    error(string.format("error: no such package '%s' installed", pkg))
  end

  ---@type string
  local content = file:read "*a"

  file:close()

  ---@type string?
  local exec_line

  for line in content:gmatch "[^\r\n]+" do
    if line:find "^exec deno run" then
      exec_line = line
      break
    end
  end

  if not exec_line then
    error("error: could not find exec line in " .. script_path)
  end

  -- The line is `exec deno run [FLAGS] '[PACKAGE_NAME]' "$@"`
  ---@type string?
  local flags_and_pkg_str = exec_line:match '^exec deno run (.*) "$@"'

  if not flags_and_pkg_str then
    error("error: could not parse exec line in " .. script_path)
  end

  local all_flags_str = ""
  local package_name = flags_and_pkg_str
  local last_space_idx = flags_and_pkg_str:find " %S+$"

  if last_space_idx then
    all_flags_str = flags_and_pkg_str:sub(1, last_space_idx - 1)
    package_name = flags_and_pkg_str:sub(last_space_idx + 1)
  end

  ---@type string[]
  local permission_flags = {}

  if all_flags_str then
    for word in all_flags_str:gmatch "%S+" do
      if word:find "^--allow%-" then
        table.insert(permission_flags, word)
      end
    end
  end

  local permission_flags_str = table.concat(permission_flags, " ")

  uninstall(pkg)
  install(package_name, permission_flags_str, version)
end

return {
  install = install,
  list = list,
  uninstall = uninstall,
  upgrade = upgrade,
}
