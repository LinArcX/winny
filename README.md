Tips and tricks to make windows less bloated and more productive.

# List of all installed software on windows
`Get-AppxPackage | Select Name, PackageFullName`

# Remove default applications in windows
`Get-AppxPackage *windowsstore* | Remove-AppxPackage`

Tip: Some apps like microsoft-edge can't uninstall from your system and throw this error:
```
Remove-AppxPackage: Deployment failed with HRESULT: 0x80073CFA, Removal failed. Please contact your software vendor. (0x80073CFA)
error 0x80070032: AppX Deployment Remove operation on package Microsoft.MicrosoftEdge_44.18362.267.0_neutral__8wekyb3d8bbwe from: C:\Windows\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe failed.
This app is part of Windows and cannot be uninstalled on a per-user basis.
An administrator can attempt to remove the app from the computer using Turn Windows Features on or off. However, it may not be possible to uninstall the app.                                                                          NOTE: For additional information, look for [ActivityId] e1738bb4-9178-0007-c48f-73e17891d601 in the Event Log or use the command line Get-AppPackageLog -ActivityID e1738bb4-9178-0007-c48f-73e17891d601 
```

The workaround:
http://woshub.com/remove-appxpackage-0x80073cfa-removal-failed/

# Start bug.n on system startup
You should put it's shortcut here:

`C:\Users\saeed\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup`

To do that, type: Win+R and type: `shell:startup`

# Default Shortcuts

# Create symbolic links
`New-Item -ItemType SymbolicLink -Path "C:\Users\saeed\AppData\Local\nvim" -Name "init.lnk" -Value "init.vim"`

# Applications
7zip
autohotkey
chocolatey
Far
Firefox
git
gsudo
imageglass
lavfilters
libreoffice-fresh
mpv
musikcube
neovim
postman
powershell-core
python
rufus
screencloud
skype
sqlitebrowser
sumatrapdf
transmission
uget
unar

# Maybe needed
chocolatey-core.extension
chocolatey-windowsupdate.extension
DotNet4.5
vcredist140
KB2919355 
KB2919442 
KB2999226  
KB3033929
KB3035131  
KB3118401
