echo Install Scoop
powershell -command "Set-ExecutionPolicy RemoteSigned -Scope CurrentUser"
powershell -command "iwr -useb get.scoop.sh | iex"

REM echo Install VPN
REM powershell -command "scoop install main/git"
REM powershell -command "scoop install main/gsudo"
REM powershell -command "scoop bucket add nonportable"
REM powershell -command "sudo scoop install nonportable/mullvadvpn-np"
REM
REM echo Set up vpn and come back to this window when you are ready
REM pause
REM
REM echo Install Browser
REM powershell -command "scoop bucket add extras"
REM powershell -command "scoop install librewolf"
REM
REM echo Install Neovim
REM powershell -command "scoop bucket add extras"
REM powershell -command "scoop bucket add versions"
REM powershell -command "scoop install extras/vcredist"
REM powershell -command "scoop install neovim-nightly"
REM pause
