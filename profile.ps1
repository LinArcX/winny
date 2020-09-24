#cd c:\winny
function prompt { '' + (get-location) + '> '}
Set-PSReadlineKeyHandler -Key ctrl+q -Function ViExit

function set-shortcut {
param ( [string]$SourceLnk, [string]$DestinationPath )
    $WshShell = New-Object -comObject WScript.Shell
    $Shortcut = $WshShell.CreateShortcut($SourceLnk)
    $Shortcut.TargetPath = $DestinationPath
    $Shortcut.Save()
}


function Git-Status {
    git status
}

function Git-Diff {
    git diff
}

function Git-Add-All {
    git add .
}

function Git-Commit {
    param ( [string]$CommitMsg )
    git commit -m $CommitMsg
}

function Git-Push {
    git push
}

function Choco-List {
    choco list --local-only
}

function ChocoFullUpgrade {
    choco upgrade all
}

function ChangeToC {
    cd c:\
}

function ChangeToD {
    cd d:\
}

function ChangeToE {
    cd e:\
}

function Invoke-CmdScript {
    param(
        [String] $scriptName
    )

    $cmdLine = """$scriptName"" $args & set"
    & $env:SystemRoot\system32\cmd.exe /c $cmdLine |
    Select-String '^([^=]*)=(.*)$' | ForEach-Object {
        $varName = $_.Matches[0].Groups[1].Value
        $varValue = $_.Matches[0].Groups[2].Value
        Set-Item Env:$varName $varValue
    }
}

function Set-MSVC {
    Invoke-CmdScript "C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools\VC\Auxiliary\Build\vcvars64.bat"
}

new-alias grep findstr
New-Alias -Name "ch" choco
Set-Alias gis Git-Status 
Set-Alias gid Git-Diff
Set-Alias giaa Git-Add-All
Set-Alias gic Git-Commit
Set-Alias gip Git-Push
Set-Alias chol Choco-List
Set-Alias chou ChocoFullUpgrade
Set-Alias c ChangeToC
Set-Alias d ChangeToD
Set-Alias e ChangeToE
Set-Alias sm Set-MSVC


### Garbage ###
#Set-Alias stor Start-Tor
#Set-Alias cat Get-Content

#mode 300

#function clear-entire-screen {
#    cls
#}
#Set-PSReadlineKeyHandler -Key ctrl+u -Function clear-entire-screen

# clear screen in response to ctrl+L, unix style 
#register-hotkeyevent "ctrl+L" -action { cls; write-host -nonewline (prompt) }

#bind '"\e":kill-whole-line'
#Set-PSReadlineKeyHandler -Key Ctrl+u -Function DeleteChar

#function Start-Tor {
#    #python C:\Tor\tor_services.py
#    cd C:\Tor\
#    python .\tor_services.py
#}
