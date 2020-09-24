# Tips and tricks to make windows less bloated and more productive.

## Manage pre-installed applications
### List
`Get-AppxPackage | Select Name, PackageFullName`

### Remove
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

## Bug.n
### Start bug.n on system startup
You should put it's shortcut here:

`C:\Users\saeed\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup`

To do that, type: Win+R and type: `shell:startup`

## Default Shortcuts

## Create symbolic links
`New-Item -ItemType SymbolicLink -Path "C:\Users\saeed\AppData\Local\nvim" -Name "init.lnk" -Value "init.vim"`

## Applications
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

## Maybe needed
chocolatey-core.extension
chocolatey-windowsupdate.extension
DotNet4.5

vcredist140
vcredist2013 
vcredist2015

KB2919355 
KB2919442 
KB2999226  
KB3033929
KB3035131  
KB3118401

## Tips
Don't install these applications via chocolately:
- cygwin
- games

Don't install these apps ever:
- steam

## C/C++ Development without VisualStudio
First install these packages via chocolatey:

```
visualstudio-installer
visualstudio2019community
visualstudio2019buildtools
visualstudio2019-workload-vctools
```

For Command-line development:
`windows-sdk-10.1`

For Native-Desktop development:
`visualstudio2019-workload-nativedesktop`


Above commands will install these indiviaul components on your machine:
- C++ 2019 Redistributable update
- C++ CMake tools for windows
- MSVC v142 - VS 2019 C++ x86/64 build tools(v14.27)
- C++ AddressSanitizer
- Testing tools core features - Build Tools
- C++ Build Tools core features
- Windows 10 SDK(10.0.18362.0)
- Windows Universal C Runtime

Tip: You can check them in indivual components tab in visual-studio-installer.

Packages directory:
`C:\ProgramData\Microsoft\VisualStudio\Packages`

Shared components, tools, sdk:
`C:\Program Files (x86)\Microsoft Visual Studio\Shared`

Build Tools:
`C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools`

Invoke-CmdScript "C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools\VC\Auxiliary\Build\vcvars64.bat"

# References
https://www.thetopsites.net/article/54098567.shtml
