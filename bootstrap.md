## Windows basic
Default user directory is here:
`C:\Users\<user-name>`
You can switch to it by:
`cd ~`

Switch to root of current partition:
`cd /`

You may notice that `cd %AppData%` won't work in powershell. Then you should use:
cd $env:APPDATA


If you want to config mpv, vim, ... you should know that their config files reside here:
`C:\Users\saeed\AppData\Local`

You can switch to it:
`cd $env:LOCALAPPDATA`

## Tor
- `git clone https://github.com/r0oth3x49/Tor`
- `python -m pip install --upgrade pip` 
- `pip install PySocks  colorama requests`
- `python .\tor_services.py`

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

- Create shortcut:
set-shortcut "D:\winny\p.lnk" "C:\Users\saeed\Documents\PowerShell\Microsoft.PowerShell_profile.ps1" 

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

- Move file to a directory:
`Move-Item -Path <source-file> -Destination <dest-directory>`

Alt+F7: Clears the command history.
Ctrl+C: Break out of the subprompt or terminate execution.
Ctrl + End : Delete all the characters in the line after the cursor.
Ctrl + Left Arrow || Ctrl + Right Arrow : Move left or right one word at a time.
Ctrl + S: Pause||resume the display of output.
Esc Clear the current line.
F1 Moves the cursor one character to the right on the command line. At the end of the line, inserts one character from the text of your last command.
F2 Creates a new command line by copying your last command line up to the character you type.
F3 Completes the command line with the content from your last command line, starting from the current cursor position to the end of the line.
F4 Deletes characters from your current command line, starting from the current cursor position up to the character you type.
F5 Scans backward through your command history.
F7: Similar to get-history. Displays a pop-up window with your command history and allows you to select a command. Use the arrow keys to scroll through the list. Press Enter to select a command to run, or press the Right arrow to place the text on the command line.
F8 Uses text you’ve entered to scan backward through your command history for commands that match the text you’ve typed so far on the command line.
F9 Runs a specific numbered command from your command history. Command numbers are listed when you press F7 or get-history.
Page Up / Page Down: Gets the first/last command in the command history.
Right-click If QuickEdit is disabled, displays an editing shortcut menu with Mark, Copy, Paste, Select All, Scroll, and Find options. To copy the screen buffer to the Clipboard, right-click, choose Select, and then press Enter.
Tab / Shift+Tab: Press the Tab key or press Shift+Tab to access the tab expansion function, which include folder or filename autocompletion.

## Services
Search for a service:
` Get-Service  | grep Event`

Start Service:
`Start-Service EventLog`


## links
https://github.com/git-for-windows/git/wiki/Symbolic-Links#allowing-non-administrators-to-create-symbolic-links
https://superuser.com/questions/327401/is-there-a-windows-command-line-with-smart-bash-like-autocompletions-command-h/327422
