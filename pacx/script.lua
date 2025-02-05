---@param pkg string
local function install(pkg)
  if pkg == "" then
    error "package not specified"
  end

  if pkg == "gocryptfs" then
    local tmpdir = os.getenv "TMPDIR" .. "gocryptfs"

    os.execute(string.format(
      "mkdir -p %s && cd %s && git clone https://github.com/rfjakob/gocryptfs.git && cd gocryptfs && ./build-without-openssl.bash",
      tmpdir, tmpdir))

    return
  end

  if pkg == "pnpm" then
    os.execute "curl -fsSL https://get.pnpm.io/install.sh | sh -"

    return
  end
end

return {
  install = install,
  upgrade = install,
}
