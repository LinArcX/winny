## Windows basic
Default user directory is here:
`C:\Users\<user-name>`

## Chocolatey
As of version 0.9.8.24, binaries, libraries and Chocolatey components install in C:\ProgramData\chocolatey (environment variable %ProgramData%) by default.

## Best applications
### Image viewer
- [quick-picture-viewer](www.github.com/ModuleArt/quick-picture-viewer)
- [qView](www.github.com/jurplel/qView)

### Essential
- chocolatey
- unar
- 7zip    
- git
- neovim
- vifm
- mpv
- musikcube
- firefox
- python
- uget
- transmission
- sumatrapdf
- autohotkey
- libreoffice
- sqlitebrowser
- rufus
- postman

## PowerShell
- Create per-user config file for powershell:
`New-Item $profile -Type File -Force`
It will create a file called `Microsoft.PowerShell_profile.ps1` here:
`C:\Users\<user-name>\Documents\PowerShell   

You can open it like this:
`nvim $profile`

- Create new alias:
`new-alias grep findstr`

- Create new symlink:
`new-item -itemtype symboliclink -path <path to location> -name <the name> -value <path to target>`

For example to create symlink to $profile to current directory:
`new-item -itemtype symboliclink -path . -name .profile -value C:\Users\saeed\Documents\PowerShell\Microsoft.PowerShell_profile.ps1`

- FullScree current window:
`mode 300`

- Add new variable to environment variables list:
$env:Path += ";C:\tools\neovim\Neovim\bin" 

- Refresh environment variables without close terminal:
`refreshenv`

## Services
