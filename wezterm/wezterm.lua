local wezterm = require("wezterm")

local default_prog = { "wsl.exe", "--distribution", "Ubuntu", "--cd", "~", "--exec", "/bin/zsh", "-l", "-c", "nvim" }
return {
  font = wezterm.font_with_fallback({ "PlemolJP Console", "Symbols NF 1000-em" }),
  default_prog = default_prog,
  launch_menu = {
    {
      label = "Neovim",
      args = default_prog,
    },
    {
      label = "Neovim for test",
      args = { "wsl.exe", "--distribution", "Ubuntu", "--cd", "~", "--exec", "/bin/zsh", "-l", "-c", "NVIM_APPNAME=nvim-test nvim" },
    },
  },
  color_scheme = "momiji",
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
  keys = {
    {
      key = "t",
      mods = "ALT",
      action = wezterm.action.ShowLauncherArgs({ flags = "FUZZY|LAUNCH_MENU_ITEMS" }),
    },
  },
  front_end = "WebGpu",
  -- hide_tab_bar_if_only_one_tab = true,
  adjust_window_size_when_changing_font_size = false,
}
