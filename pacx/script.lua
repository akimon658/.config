---@param pkg string
local function upgrade(pkg)
  if pkg == "" then
    error "package not specified"
  end

  if pkg == "pnpm" then
    os.execute "curl -fsSL https://get.pnpm.io/install.sh | sh -"
  end
end

return {
  upgrade = upgrade,
}
