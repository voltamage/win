powershell -command "Set-ExecutionPolicy RemoteSigned -Scope CurrentUser"
powershell -command "iwr -useb get.scoop.sh | iex"
echo Manually run scoop and come back to this window afterwards
pause

powershell -command "scoop install gsudo"
powershell -command "sudo Rename-Computer -NewName 'WINDOWS'"

powershell -command "sudo Install-Module PSWindowsUpdate"
powershell -command "sudo Install-WindowsUpdate"

powershell -command "scoop install aria2"
powershell -command "scoop config aria2-enabled false"
powershell -command "scoop config aria2-max-connection-per-server 16"
powershell -command "scoop config aria2-min-split-size 1M"
powershell -command "scoop config aria2-split 16"

powershell -command "scoop install git"
powershell -command "scoop bucket add extras"
powershell -command "scoop bucket add nonportable"
powershell -command "scoop bucket add versions"

powershell -command "sudo scoop install nonportable/mullvadvpn-np"
echo Set up vpn and come back to this window afterwards
pause

powershell -command "scoop install extras/vcredist"
powershell -command "scoop install extras/librewolf"
powershell -command "scoop install extras/lazygit"
powershell -command "scoop install versions/neovim-nightly"

pause
