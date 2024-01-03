powershell -command "Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name AppsUseLightTheme -Value 0"
powershell -command "Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name SystemUsesLightTheme -Value 0"

powershell -command "Set-ExecutionPolicy RemoteSigned -Scope CurrentUser"
powershell -command "iwr -useb get.scoop.sh | iex"
echo Restart script from the main user folder
pause

powershell -command "scoop install git"
powershell -command "$env:Path = [System.Environment]::GetEnvironmentVariable('Path','Machine') + ';' + [System.Environment]::GetEnvironmentVariable('Path','User')"
powershell -command "git clone git@github.com:voltamage/win.git  C:\Users\main\win"

powershell -command "scoop bucket add ACooper81_scoop-apps https://github.com/ACooper81/scoop-apps"
powershell -command "scoop bucket add extras"
powershell -command "scoop bucket add games"
powershell -command "scoop bucket add nerd-fonts"
powershell -command "scoop bucket add nonportable"
powershell -command "scoop bucket add sysinternals"
powershell -command "scoop bucket add versions"

powershell -command "scoop install main/gsudo"
powershell -command "sudo Rename-Computer -NewName 'WINDOWS'"
powershell -command "sudo powercfg -h off"

powershell -command "scoop install ACooper81_scoop-apps/PSWindowsUpdate-PSModule"
echo Don't restart when asked during the windows update, wait until WSL features come online
pause
powershell -command "sudo Install-WindowsUpdate"

powershell -command "sudo dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart"
powershell -command "sudo dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart"
echo Restart system now, rerun script after
pause

powershell -command "wsl --update"
powershell -command "wsl --update"

powershell -command "scoop install extras/bulk-crap-uninstaller"
powershell -command "sudo C:\Users\main\win\uninstall.bat"

powershell -command "scoop install extras/shutup10"
echo Enable recommended settings in ShutUp10, reboot after
pause

powershell -command "scoop install extras/archwsl"
echo Start arch and hard kill fail loop, update keyring before full system, come back to this window after
pause

powershell -command "sudo scoop install nonportable/mullvadvpn-np"
echo Set up vpn and return to this window
pause

powershell -command "scoop install extras/vcredist"
powershell -command "sudo scoop install nonportable/nvidia-display-driver-dch-np"

powershell -command "scoop install main/chezmoi"

powershell -command "scoop install extras/lazygit"
powershell -command "scoop install extras/psreadline"
powershell -command "scoop install main/neovim"
powershell -command "scoop install main/scoop-search"
powershell -command "scoop install main/starship"
powershell -command "scoop install main/zoxide"
powershell -command "scoop install nerd-fonts/JetBrainsMono-NF-Mono"
powershell -command "scoop install versions/windows-terminal-preview"

powershell -command "chezmoi apply"

powershell -command "scoop install extras/librewolf"
powershell -command "scoop install extras/spotify"
powershell -command "scoop install games/prismlauncher"
powershell -command "scoop install games/steam"

powershell -command "scoop install sysinternals/autoruns"
powershell -command "scoop install sysinternals/process-explorer"

powershell -command "C:\Users\main\scoop\apps\7zip\current\install-context.reg"
powershell -command "C:\Users\main\scoop\apps\windows-terminal-preview\current\install-context.reg"
pause
