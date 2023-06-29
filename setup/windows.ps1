Set-ExecutionPolicy RemoteSigned -scope CurrentUser

iwr -useb get.scoop.sh | iex
scoop install sudo
scoop install win32yank

winget install 7zip.7zip
winget install AgileBits.1Password
winget install Discord.Discord
winget install Git.Git
winget install Google.Chrome
winget install Google.Drive
winget install JannisX11.Blockbench
winget install Microsoft.PowerShell
winget install Microsoft.VisualStudioCode
winget install Microsoft.WindowsTerminal
winget install Nota.Gyazo
winget install OBSProject.OBSStudio
winget install RARLab.WinRAR
winget install SlackTechnologies.Slack
winget install Valve.Steam
winget install Xmind.Xmind
winget install inkdrop
winget install wez.wezterm
winget upgrade --all
Set-content -Path ~/wslconfig -Value "[wsl2]","localhostForwarding = true","memory = 16GB","","[interop]","appendWindowsPath = true"

# Import .config/WindowsTerminal/settings.json

