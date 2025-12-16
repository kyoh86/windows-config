# windows-config

## インストール

インストール時の大まかな流れは次の通り

1. 基本的なツールのインストール
2. wingetを使ったインストール
3. 設定
4. WSLのインストール
5. その他のツールのインストール


### 1. 基本インストール

Windows Terminalのデフォルト（PowerShell）か、PowerShellの管理者権限じゃないとwingetにアクセスできないので、
まずWindows Terminalを使えるようにする。
また、各種設定が前提となるフォントを仮定しているので、フォントもインストールする。

- Windows Terminalのインストール
    1. PowerToysをインストール
    2. PowerToys Runで管理者権限でPowerShellを起動
    3. winget install Microsoft.WindowsTerminal
    4. 再起動

- Fontのインストール
  - PlemolJP HS: https://github.com/yuru7/PlemolJP

- Sudo for Windowsの有効化
    - https://learn.microsoft.com/ja-jp/windows/advanced-settings/sudo/#how-to-enable-sudo-for-windows
    - > Sudo for Windows を有効にするには、Settings > System > For Developers を開き、[sudo を有効にする] を [オン] に設定します。

- ATOKのインストール

- zenhan.exeのインストール
    - https://github.com/kyoh86/zenhan/releases

再起動する

### 2. wingetを使ったインストール


```console
$ winget install SlackTechnologies.Slack
$ winget install AgileBits.1Password
$ winget install wez.wezterm
$ winget install Microsoft.WSL
$ winget install Git.Git
$ winget install Microsoft.VisualStudioCode
$ winget install 7zip.7zip
$ winget install Docker.DockerDesktop
$ winget install VideoLAN.VLC
$ winget install Elgato.StreamDeck
$ winget install Logitech.OptionsPlus
$ winget install Amazon.Kindle
$ winget install OBSProject.OBSStudio
$ winget install Valve.Steam
$ winget install Nota.Gyazo
$ winget install Tailscale.Tailscale
$ winget install Notion.Notion
$ winget install Discord.Discord
$ winget install Figma.Figma
$ winget install Zoom.Zoom.EXE
$ winget install --id=equalsraf.win32yank -e
```

### 3. 設定

- タスクバーの整理
- コントロールパネル > キーボード で入力速度の調整
- このリポジトリを `C:\Users\kyoh86\.config` にCloneする
- PowerToysの設定
    - 詳細はpower-toys-config.md

### 4. WSL Setup

```console
$ wsl --install --distribution="Ubuntu-24.04"
```

https://learn.microsoft.com/ja-jp/windows/wsl/wsl-config#wslconfig

### 5. その他のツールのインストール

- Adobe
- DLSite Viewer
- JDownloader2 (edited) 
- Minecraft
- LINE
- YAMAHA AG Controller
