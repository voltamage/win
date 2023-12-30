powershell -command "rm setup.bat"

powershell -command "Set-ExecutionPolicy RemoteSigned -Scope CurrentUser"
powershell -command "iwr -useb get.scoop.sh | iex"

powershell -command "scoop install git"
powershell -command "git clone git@github.com:voltamage/win.git"

powershell -command "scoop install gsudo"
powershell -command "sudo Rename-Computer -NewName 'WINDOWS'"

powershell -command "sudo Install-Module PSWindowsUpdate"
powershell -command "sudo Install-WindowsUpdate"

