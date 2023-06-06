local wezterm = require("wezterm")

---@class Named
---@field name string
local _ = nil
---@class WSLDomain : Named
---@field distribution string
local _ = nil

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

  local ubuntu = find_name("WSL:Ubuntu", wsl_domains)
  if ubuntu == nil then
    return {}
  end

  table.insert(wsl_domains, tbl_merge(ubuntu, { name = "WSL:Neovim", default_prog = { "/bin/zsh", "-l", "-c", "nvim" } }))
  table.insert(wsl_domains, tbl_merge(ubuntu, { name = "WSL:Neovim-test", default_prog = { "/bin/zsh", "-l", "-c", "NVIM_APPNAME=nvim-test nvim" }, default_cwd = "~/Projects/github.com/kyoh86/dotfiles" }))
  table.insert(wsl_domains, tbl_merge(ubuntu, { name = "WSL:Vim", default_prog = { "/bin/zsh", "-l", "-c", "vim" } }))

  return { wsl_domains = wsl_domains, default_domain = "WSL:Neovim" }
end

return tbl_merge(build_domains(), {
  font = wezterm.font_with_fallback({ "PlemolJP Console NF" }),
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
