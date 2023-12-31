powershell -command "Set-ExecutionPolicy RemoteSigned -Scope CurrentUser"
powershell -command "iwr -useb get.scoop.sh | iex"
echo Manually run scoop and come back to this window afterwards
pause

powershell -command "scoop install gsudo"
powershell -command "scoop install scoop-search"
powershell -command "scoop install starship"
powershell -command "scoop install zoxide"
powershell -command "sudo Rename-Computer -NewName 'WINDOWS'"

powershell -command "sudo Install-Module PSReadLine -Force"
powershell -command "sudo Install-Module PSWindowsUpdate"

powershell -command "sudo Install-WindowsUpdate"

powershell -command "scoop install git"
powershell -command "scoop bucket add extras"
powershell -command "scoop bucket add nonportable"
powershell -command "scoop bucket add versions"

powershell -command "sudo scoop install nonportable/mullvadvpn-np"
echo Set up vpn and come back to this window afterwards
pause

powershell -command "scoop install aria2"
powershell -command "scoop config aria2-enabled false"
powershell -command "scoop install chezmoi"
powershell -command "scoop install extras/lazygit"
powershell -command "scoop install extras/librewolf"
powershell -command "scoop install extras/vcredist"
powershell -command "scoop install versions/neovim-nightly"
powershell -command "scoop install versions/windows-terminal-preview"

pause
