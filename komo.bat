powershell -command "sudo Set-ItemProperty 'HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem' -Name 'LongPathsEnabled' -Value 1"
powershell -command "scoop install komorebi whkd"
pause
