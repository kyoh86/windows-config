local wezterm = require("wezterm")
return {
  font = wezterm.font("PlemolJP Console NF"),
  default_prog = { "wsl.exe", "--distribution", "Ubuntu", "--cd", "~", "--exec", "/bin/zsh", "-l", "-c", "nvim" },
  color_scheme = "momiji",
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
  hide_tab_bar_if_only_one_tab = true,
  adjust_window_size_when_changing_font_size = false,
}
