local wezterm = require("wezterm")

---@class Named
---@field name string

---@class WSLDomain : Named
---@field distribution string

--- Merge two tables
---@generic T : table
---@param t1 T
---@param t2 T
---@return T
local function tbl_merge(t1, t2)
  local merged = {}
  for _, t in pairs({ t1, t2 }) do
    for k, v in pairs(t) do
      merged[k] = v
    end
  end
  return merged
end

---@generic T : Named
---@param name string A name to find it out
---@param list T[]
---@return T
local function find_name(name, list)
  for _, dom in ipairs(list) do
    if dom.name == name then
      return dom
    end
  end
  return nil
end

local function build_domains()
  ---@type WSLDomain[]
  local wsl_domains = wezterm.default_wsl_domains()

  local arch = find_name("WSL:ArchLinux", wsl_domains)
  if arch ~= nil then
    table.insert(wsl_domains, 1, tbl_merge(arch, { name = "WSL:Neovim", default_prog = { "/bin/zsh", "-l", "-c", "nvim" }, default_cwd = "~" }))
    table.insert(wsl_domains, tbl_merge(arch, { name = "WSL:Vim", default_prog = { "/bin/zsh", "-l", "-c", "vim" }, default_cwd = "~" }))
  end

  return {
    unix_domains = {},
    ssh_domains = {},
    wsl_domains = wsl_domains,
    default_domain = "WSL:Neovim",
  }
end

return tbl_merge(build_domains(), {
  initial_cols = 120,
  initial_rows = 36,
  font = wezterm.font("PlemolJP Console NF"),
  color_scheme = "momiji",
  hide_tab_bar_if_only_one_tab = true,
  window_padding = { left = 0, right = 0, top = 0, bottom = 0 },
  keys = {
    { key = "n", mods = "ALT", action = wezterm.action.SpawnWindow },
    { key = "l", mods = "ALT", action = wezterm.action.ShowLauncherArgs({ flags = "FUZZY|DOMAINS" }) },
    { key = "p", mods = "ALT", action = wezterm.action.ActivateCommandPalette },
    { key = "t", mods = "SHIFT|ALT", action = wezterm.action.SpawnCommandInNewWindow({ label = "Start new nvim-test", args = {}, domain = { DomainName = "WSL:Neovim-test" } }) },
  },
  front_end = "WebGpu",
  adjust_window_size_when_changing_font_size = false,
})
