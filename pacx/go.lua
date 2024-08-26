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
}
