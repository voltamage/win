powershell -command "Set-ExecutionPolicy RemoteSigned -Scope CurrentUser"
powershell -command "iwr -useb get.scoop.sh | iex"
echo Close this window and restart this script
pause

powershell -command "scoop install chezmoi git gsudo"
echo Close this window and restart this script
pause

powershell -command "git clone git@github.com:voltamage/win.git"
powershell -command "chezmoi apply"

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

powershell -command "scoop bucket add extras"
powershell -command "scoop install extras/archwsl"
echo Start arch and hard kill fail loop, update keyring before full system, come back to this window after
pause
