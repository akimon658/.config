return {
  ---@param pkg string
  install = function(pkg)
    local pkgName = ""
    if pkg ~= "." then
      pkgName = pkg .. "@latest"
    end

    os.execute("go install -ldflags='-s -w' -trimpath " .. pkgName)
  end,
  list = function()
    os.execute "ls $(go env GOPATH)/bin"
  end,
  ---@param pkg string
  uninstall = function(pkg)
    os.execute("rm $(go env GOPATH)/bin/" .. pkg)
  end,
}
