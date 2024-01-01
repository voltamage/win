powershell -command "Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name AppsUseLightTheme -Value 0"
powershell -command "Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name SystemUsesLightTheme -Value 0"

powershell -command "Set-ExecutionPolicy RemoteSigned -Scope CurrentUser"
powershell -command "iwr -useb get.scoop.sh | iex"
echo Restart script from the main user folder
pause

powershell -command "scoop install git"
powershell -command "$env:Path = [System.Environment]::GetEnvironmentVariable('Path','Machine') + ';' + [System.Environment]::GetEnvironmentVariable('Path','User')"
powershell -command "git clone git@github.com:voltamage/win.git"

powershell -command "scoop install gsudo"
powershell -command "sudo Rename-Computer -NewName 'WINDOWS'"
REM powershell -command "sudo Install-Module PSWindowsUpdate"
REM echo Don't restart when asked during the windows update, wait until WSL features come online
REM pause
REM powershell -command "sudo Install-WindowsUpdate"

powershell -command "sudo dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart"
powershell -command "sudo dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart"
echo Restart system now, rerun script after
pause

powershell -command "wsl --update"
powershell -command "wsl --update"
pause

powershell -command "scoop bucket add extras"
powershell -command "scoop bucket add nerd-fonts"

powershell -command "scoop install extras/archwsl"
echo Start arch and hard kill fail loop, update keyring before full system, come back to this window after
pause

powershell -command "scoop install chezmoi nerd-fonts/JetBrainsMono-NF-Mono extras/psreadline scoop-search starship extras/windows-terminal zoxide"
powershell -command "chezmoi apply"

powershell -command "C:\Users\main\scoop\apps\7zip\current\install-context.reg"
powershell -command "C:\Users\main\scoop\apps\windows-terminal-preview\current\install-context.reg"
pause
