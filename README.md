# Windows Basics
- Default user directory: `C:\Users\<user-name>`
- Switch to it: `cd ~`
- Switch to root of current partition: `cd /`
- `cd %AppData%` won't work in powershell. You should use: `cd $env:APPDATA`
- Default config folder (equivalent to `~/.config` in *nix-based os):

    `C:\Users\linarcx\AppData\Local`
- Switch to it:

    `cd $env:LOCALAPPDATA`
- To start an application at start-up, you should put it's shortcut here:

    `C:\Users\linarcx\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup`
    To do that, hit: `Win+R` and type: `shell:startup`

## SymLinks, HardLinks, ShortCuts
1. Create symlinks: 

`new-item -itemtype SymbolicLink -path <path to location> -name <the name> -value <path to target>`

For example:

`New-Item -ItemType SymbolicLink -Path "C:\Users\linarcx\AppData\Local\nvim" -Name "init.lnk" -Value "init.vim"`

`new-item -itemtype HardLink -path C:\Users\linarcx\AppData\Local\nvim\ -name init.vim -value C:\winny\.config\.nvim\init.vim`

2. Create shortcut/alias(.lnk files):
Paste this function inside your `$profile`:

```
function set-shortcut {
param ( [string]$SourceLnk, [string]$DestinationPath )
    $WshShell = New-Object -comObject WScript.Shell
    $Shortcut = $WshShell.CreateShortcut($SourceLnk)
    $Shortcut.TargetPath = $DestinationPath
    $Shortcut.Save()
}
```

And use it like this:
`set-shortcut "D:\winny\profile.lnk" "C:\Users\linarcx\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"`

## Services
Search for a service:
` Get-Service  | grep Event`

Start Service:
`Start-Service EventLog`

# Configuring Special Software
## Chocolatey
As of version 0.9.8.24, binaries, libraries and Chocolatey components will install:
`C:\ProgramData\chocolatey`

* (environment variable %ProgramData%) by default.

## Tor
- Download Tor-Expert-Bundle:
https://www.torproject.org/dist/torbrowser/10.0/tor-win32-0.4.3.6.zip

- Unzip it, and install as as service:
`C:\Tor\tor.exe --service install`

- To check if the service with the settings file starts (it does not contain errors), you can use this command:
`C:\Tor\tor.exe -f "C:\Tor\torrc"`

- Now install the Tor service, which will read the settings from the C:\Tor\torrc file:
`C:\Tor\tor.exe --service install -options -f "C:\Tor\torrc"`

* Remember that you must specify options after the -options flag, otherwise they will be ignored.
- To start and stop the service, use the following commands:

```
C:\Tor\tor.exe --service start
C:\Tor\tor.exe --service stop
```

- To remove the service:
```
C:\Tor\tor.exe --service stop
C:\Tor\tor.exe --service remove
```

* Note that you must first stop the service and then delete it.
* By default, the Tor service listens on port 9050, so you can check whether it is started by a command that shows if port 9050 is listened:
`netstat -aon | findstr ":9050"`

# PowerShell
## List
`Get-AppxPackage | Select Name, PackageFullName`

## Remove
`Get-AppxPackage *windowsstore* | Remove-AppxPackage`

Tip: Some apps like microsoft-edge can't uninstall from your system and throw this error:
> Remove-AppxPackage: Deployment failed with HRESULT: 0x80073CFA, Removal failed. Please contact your software vendor. (0x80073CFA)
error 0x80070032: AppX Deployment Remove operation on package Microsoft.MicrosoftEdge_44.18362.267.0_neutral__8wekyb3d8bbwe from: C:\Windows\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe failed.
This app is part of Windows and cannot be uninstalled on a per-user basis.
An administrator can attempt to remove the app from the computer using Turn Windows Features on or off. However, it may not be possible to uninstall the app.                                                                          NOTE: For additional information, look for [ActivityId] e1738bb4-9178-0007-c48f-73e17891d601 in the Event Log or use the command line Get-AppPackageLog -ActivityID e1738bb4-9178-0007-c48f-73e17891d601 

The workaround:
http://woshub.com/remove-appxpackage-0x80073cfa-removal-failed/

## Create per-user config file for powershell
`New-Item $profile -Type File -Force`

It will create a file called `Microsoft.PowerShell_profile.ps1` here:
`C:\Users\<user-name>\Documents\PowerShell`

You can open it like this: `nvim $profile`

## Create new alias
`new-alias grep findstr`

## Add new variable to environment variables list
`$env:Path += ";C:\tools\neovim\Neovim\bin"`

## Refresh environment variables without close terminal
`refreshenv`

## Move file to a directory
`Move-Item -Path <source-file> -Destination <dest-directory>`

- `Alt + F7`: Clears the command history.
- `Ctrl + C`: Break out of the subprompt or terminate execution.
- `Ctrl + End` : Delete all the characters in the line after the cursor.
- `Ctrl + Left Arrow || Ctrl + Right Arrow` : Move left or right one word at a time.
- `Ctrl + S: Pause||resume the display of output.
- `Esc`: Clear the current line.
- `F1`: Moves the cursor one character to the right on the command line.
    At the end of the line, inserts one character from the text of your last command.
- `F2`: Creates a new command line by copying your last command line up to the character you type.
- `F3`: Completes the command line with the content from your last command line, starting from the current cursor position to the end of the line.
- `F4`: Deletes characters from your current command line, starting from the current cursor position up to the character you type.
- `F5`: Scans backward through your command history.
- `F7`: Similar to get-history. Displays a pop-up window with your command history and allows you to select a command.
    Use the arrow keys to scroll through the list. Press Enter to select a command to run, or press the Right arrow to place the text on the command line.
- `F8`: Uses text you’ve entered to scan backward through your command history for commands that match the text you’ve typed so far on the command line.
- `F9`: Runs a specific numbered command from your command history. Command numbers are listed when you press F7 or get-history.
- `Page Up / Page Down`: Gets the first/last command in the command history.
- `Right-click`: If QuickEdit is disabled, displays an editing shortcut menu with Mark, Copy, Paste, Select All, Scroll, and Find options.
    To copy the screen buffer to the Clipboard, right-click, choose Select, and then press Enter.
- `Tab / Shift+Tab`: Press the Tab key or press Shift+Tab to access the tab expansion function, which include folder or filename autocompletion.

# Applications
## Necessary
- 7zip
- autohotkey
- chocolatey
- Far
- Firefox
- git
- gsudo
- imageglass
- lavfilters
- libreoffice-fresh
- mpv
- musikcube
- neovim
- powershell-core
- python
- rufus
- screencloud
- skype
- sqlitebrowser
- sumatrapdf
- transmission
- uget
- unar

# Development
## C/C++ Development without VisualStudio
First install these base packages via chocolatey:

```
visualstudio-installer
visualstudio2019community
visualstudio2019buildtools
visualstudio2019-workload-vctools
```

Above packages will install these indiviaul components on your machine:
- C++ 2019 Redistributable update
- C++ CMake tools for windows
- MSVC v142 - VS 2019 C++ x86/64 build tools(v14.27)
- C++ AddressSanitizer
- Testing tools core features - Build Tools
- C++ Build Tools core features
- Windows 10 SDK(10.0.18362.0)
- Windows Universal C Runtime
Tip: You can check them in indivual components tab in visual-studio-installer.

For Command-line development:
`windows-sdk-10.1`

Above package will install these indivisual components on your machine:
- .NET Framework 4.6.1 targeting pack
- .NET Framework 4.8 SDK

For Native-Desktop development:
`visualstudio2019-workload-nativedesktop`

Packages directory:
`C:\ProgramData\Microsoft\VisualStudio\Packages`

Shared components, tools, sdk:
`C:\Program Files (x86)\Microsoft Visual Studio\Shared`

Build Tools:
`C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools`

# Alternatives
- [ ] ranger
- [ ] htop

## Other
Don't install these applications via chocolately:
- cygwin
- games

Don't install these apps ever:
- steam


# TODO
## Packages
Remove:
- [ ] chromium
- [ ] microsoft edge
- [x] microsoft store

Install via choco:
- [ ] chrome
- [ ] steam

## Neovim Issue
- [ ] can't go to end
- [ ] can't go to start
- [ ] numpad not working

## Powershell
- [ ] keep history after close a powershell terminal

# References
- https://www.thetopsites.net/article/54098567.shtml
- https://miloserdov.org/?p=1839
- https://github.com/git-for-windows/git/wiki/Symbolic-Links#allowing-non-administrators-to-create-symbolic-links
- https://superuser.com/questions/327401/is-there-a-windows-command-line-with-smart-bash-like-autocompletions-command-h/327422
- https://ss64.com/ps/syntax-env.html

# Garbage
Invoke-CmdScript "C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools\VC\Auxiliary\Build\vcvars64.bat"

## Will install as dependencies
- DotNet4.5
- chocolatey-core.extension
- chocolatey-windowsupdate.extension
- vcredist140
- vcredist2013 
- vcredist2015
- KB2919355 
- KB2919442 
- KB2999226  
- KB3033929
- KB3035131  
- KB3118401

- FullScree current window:
`mode 300`
