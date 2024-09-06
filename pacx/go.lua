---@param pkg string
local function install(pkg)
  local pkgName = ""
  if pkg ~= "." then
    pkgName = pkg .. "@latest"
  end

  os.execute("go install -ldflags='-s -w' -trimpath " .. pkgName)
end

return {
  install = install,
  list = function()
    os.execute "ls $(go env GOPATH)/bin"
  end,
  ---@param pkg string
  uninstall = function(pkg)
    os.execute("rm $(go env GOPATH)/bin/" .. pkg)
  end,
  ---@param pkg string
  upgrade = function(pkg)
    local pkginfo = io.popen("go version -m $(go env GOPATH)/bin/" .. pkg)
    if not pkginfo then
      error("failed to execute go version -m " .. pkg)
    end

    _ = pkginfo:read()
    ---@type string
    local pkgpath = string.match(pkginfo:read(), "path%s+(%S+)")
    install(pkgpath)
  end,
}
