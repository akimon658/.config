return {
  upgrade = function()
    os.execute "pdm update --global"
  end,
}
