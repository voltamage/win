powershell -command "Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name AppsUseLightTheme -Value 0"
powershell -command "Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name SystemUsesLightTheme -Value 0"

powershell -command "Set-ExecutionPolicy RemoteSigned -Scope CurrentUser"
powershell -command "iwr -useb get.scoop.sh | iex"
echo Restart script from the main user folder
pause

powershell -command "scoop install gsudo"
powershell -command "sudo Rename-Computer -NewName 'WINDOWS'"
powershell -command "sudo Install-Module PSWindowsUpdate"
echo Don't restart when asked during the windows update, wait until WSL features come online
pause
powershell -command "sudo Install-WindowsUpdate"

powershell -command "sudo dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart"
powershell -command "sudo dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart"
echo Restart system now, rerun script after
pause

powershell -command "wsl --update"
powershell -command "wsl --update"

powershell -command "scoop bucket add extras"
powershell -command "scoop bucket add games"
powershell -command "scoop bucket add nerd-fonts"
powershell -command "scoop bucket add nonportable"
powershell -command "scoop bucket add versions"

powershell -command "scoop install extras/vcredist"

powershell -command "sudo scoop install nonportable/mullvadvpn-np"
echo Set up vpn and return to this window
pause

powershell -command "scoop install chezmoi"
powershell -command "scoop install extras/lazygit"
powershell -command "scoop install extras/psreadline"
powershell -command "scoop install git"
powershell -command "scoop install neovim"
powershell -command "scoop install nerd-fonts/JetBrainsMono-NF-Mono"
powershell -command "scoop install scoop-search"
powershell -command "scoop install starship"
powershell -command "scoop install versions/windows-terminal-preview"
powershell -command "scoop install zoxide"
powershell -command "$env:Path = [System.Environment]::GetEnvironmentVariable('Path','Machine') + ';' + [System.Environment]::GetEnvironmentVariable('Path','User')"

powershell -command "scoop install extras/nvcleanstall"
powershell -command "scoop install extras/librewolf"
powershell -command "scoop install extras/spotify"
powershell -command "scoop install games/prismlauncher"
powershell -command "scoop install games/steam"

powershell -command "git clone git@github.com:voltamage/win.git  C:\Users\main\win"
powershell -command "chezmoi apply"

powershell -command "scoop install extras/archwsl"
echo Start arch and hard kill fail loop, update keyring before full system, come back to this window after
pause

powershell -command "C:\Users\main\scoop\apps\7zip\current\install-context.reg"
powershell -command "C:\Users\main\scoop\apps\windows-terminal-preview\current\install-context.reg"
pause
