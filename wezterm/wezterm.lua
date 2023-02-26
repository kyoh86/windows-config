local wezterm = require("wezterm")
return {
  font = wezterm.font("PlemolJP Console NF"),
  default_prog = { "wsl.exe", "--distribution", "Ubuntu", "--cd", "~", "--exec", "/bin/zsh", "-l", "-c", "nvim" },
}
