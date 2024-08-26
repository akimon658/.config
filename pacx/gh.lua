return {
  upgrade = function(pkg)
    os.execute("gh extension upgrade " .. pkg)
  end,
}
