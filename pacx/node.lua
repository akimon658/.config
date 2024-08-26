return {
  upgrade = function()
    ---@type string
    local current_version = io.popen "pnpm env list --global":read()

    os.execute("pnpm env remove --global " .. current_version)
    os.execute "pnpm env add --global lts"
    os.execute "pnpm env use --global lts"

    local pnpm_list = io.popen "pnpm list --global"
    if not pnpm_list then
      error "failed to execute pnpm list --global"
    end

    local in_dependencies = false
    ---@type string[]
    local packages = {}
    for line in pnpm_list:lines() do
      if in_dependencies then
        table.insert(packages, line:match "%S+")
      end

      if line == "dependencies:" then
        in_dependencies = true
      end
    end

    os.execute("pnpm add --global " .. table.concat(packages, " "))
  end,
}
