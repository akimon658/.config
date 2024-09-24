local function list()
  os.execute "pdm list --global"
end

return {
  list = list,
  upgrade = function()
    os.execute "pdm update --global"
  end,
}
