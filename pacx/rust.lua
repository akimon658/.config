local function upgrade()
  os.execute "rustup update"
end

return {
  upgrade = upgrade,
}
