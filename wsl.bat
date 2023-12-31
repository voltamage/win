powershell -command "sudo dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart"

powershell -command "sudo dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart"
echo RESTART NOW
pause

powershell -command "wsl --update"

powershell -command "scoop install extras/archwsl"
echo Start arch and hard kill fail loop, update keyring before full system, come back to this window after
pause
