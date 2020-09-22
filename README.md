Tips and tricks to make windows less bloated and more productive.

# Start bug.n on system startup
You should put it's shortcut here:

`C:\Users\saeed\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup`

To do that, type: Win+R and type: `shell:startup`

# Default Shortcuts

# Create symbolic links
`New-Item -ItemType SymbolicLink -Path "C:\Users\saeed\AppData\Local\nvim" -Name "init.lnk" -Value "init.vim"`
