@echo off

echo Uninstalling Edge
"C:\Program Files (x86)\Microsoft\Edge\Application\92.0.902.67\Installer\setup.exe" --uninstall --msedge --system-level --verbose-logging
"C:\Users\main\scoop\apps\bulk-crap-uninstaller\current\StoreAppHelper.exe" /uninstall "Microsoft.MicrosoftEdge.Stable_92.0.902.67_neutral__8wekyb3d8bbwe"

echo Uninstalling OneDrive
C:\Users\main\AppData\Local\Microsoft\OneDrive\21.220.1024.0005\OneDriveSetup.exe  /uninstall 

echo Uninstalling Spotify
"C:\Users\main\scoop\apps\bulk-crap-uninstaller\current\StoreAppHelper.exe" /uninstall "SpotifyAB.SpotifyMusic_1.226.1187.0_x64__zpdnekdrzrea0"

pause
exit
