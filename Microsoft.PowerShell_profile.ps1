#---------- Initialize ----------#
Clear-Host
Set-PSReadlineKeyHandler -Key ctrl+q -Function ViExit

function Prompt {
    # Prompt Colors
    # Black DarkBlue DarkGreen DarkCyan DarkRed DarkMagenta DarkYellow
	# Gray DarkGray Blue Green Cyan Red Magenta Yellow White

	$prompt_text = "White"
	$prompt_background = "DarkMagenta"
	$prompt_git_background = "Yellow"	
	$prompt_git_text = "Black"	
	
	# Grab Git Branch
	$git_string = "";
	git branch | foreach {
		if ($_ -match "^\* (.*)"){
			$git_string += $matches[1]
		}
	}
	
	# Grab Git Status
	$git_status = "";
	git status --porcelain | foreach {
		$git_status = $_ #just replace other wise it will be empty
	}
	
	if (!$git_string)	{
		$prompt_text = "White"
		$prompt_background = "DarkMagenta"
	}
	
	if ($git_status){
		$prompt_git_background = "DarkGreen"
	}

    $path = PWD
    Write-Host $path -foregroundColor $prompt_text -backgroundColor $prompt_background -NoNewLine

    if ($git_string){
    	Write-Host  "$([char]57520)" -foregroundColor $prompt_background -NoNewLine -backgroundColor $prompt_git_background
    	Write-Host  " $([char]57504) " -foregroundColor $prompt_git_text -backgroundColor $prompt_git_background -NoNewLine 	
    	Write-Host ($git_string)  -NoNewLine -foregroundColor $prompt_git_text -backgroundColor $prompt_git_background
    	Write-Host  "$([char]57520)" -foregroundColor $prompt_git_background 
    }
    else{
    	Write-Host  "$([char]57520)" -foregroundColor $prompt_background
    }
    Write-Host -NoNewLine ">" -foregroundColor Green 
    $host.UI.RawUI.WindowTitle = "PS >> User: $curUser >> Current DIR: $((Get-Location).Path)"
    Return " "
}

#---------- Basics ----------#
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

function Set-Shortcut {
    param ( 
        [string]$SourceLnk,
        [string]$DestinationPath
    )

    $WshShell = New-Object -comObject WScript.Shell
    $Shortcut = $WshShell.CreateShortcut($SourceLnk)
    $Shortcut.TargetPath = $DestinationPath
    $Shortcut.Save()
}

#---------- Windows ----------#
new-alias grep findstr

function Change-C {
    cd c:\
}
Set-Alias c Change-C

function Change-D {
    cd d:\
}
Set-Alias d Change-D

function Change-E {
    cd e:\
}
Set-Alias e Change-E

function PowerShell-Version {
    $PSVersionTable.PSVersion
}
Set-Alias ver PowerShell-Version

function Get-Env {
    Get-ChildItem Env: | Format-Table -Wrap -AutoSize
}
Set-Alias env Get-Env

function Get-History {
    $h = [System.Environment]::ExpandEnvironmentVariables("%userprofile%\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadline\ConsoleHost_history.txt")
    cat $h | select -Last 100
}
Set-Alias history Get-History

function Update-Profile {
    Set-Shortcut "D:\winny\profile.lnk" "C:\Users\saeed\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
}
Set-Alias up Update-Profile

#---------- Git ----------#
function Git-Status {
    git status
}
Set-Alias gis Git-Status 

function Git-Diff {
    git diff
}
Set-Alias gid Git-Diff

function Git-Add-All {
    git add .
}
Set-Alias giaa Git-Add-All

function Git-Commit {
    param ( [string]$CommitMsg )
    git commit -m $CommitMsg
}
Set-Alias gic Git-Commit

function Git-Push {
    git push
}
Set-Alias gip Git-Push

#---------- Choco ----------#
New-Alias -Name "ch" choco

function Choco-List {
    choco list --local-only
}
Set-Alias chl Choco-List

function Choco-Upgrade {
    choco upgrade all
}
Set-Alias chu Choco-Upgrade

#---------- Development ----------#
function Set-MSVC-Environment {
    Invoke-CmdScript "C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools\VC\Auxiliary\Build\vcvars64.bat"
}
Set-Alias sme Set-MSVC-Environment

#---------------- Garbage ---------------#
#function prompt { '' + (get-location) + '> '}

#$global:foregroundColor = 'white'
#$time = Get-Date
#$psVersion= $host.Version.Major
#$curUser= (Get-ChildItem Env:\USERNAME).Value
#$curComp= (Get-ChildItem Env:\COMPUTERNAME).Value
#Write-Host "Hello, $curUser! " -foregroundColor $foregroundColor -NoNewLine; Write-Host "$([char]9829) " -foregroundColor Red
#Write-Host "I am: $curComp" -foregroundColor Green
#$curtime = Get-Date

#Write-Host "Today is: $($time.ToLongDateString())"
#Write-Host "Welcome to PowerShell version: $psVersion" -foregroundColor Green
#Write-Host "¡Let's program!" `n

# Write-Host -NoNewLine "[" -foregroundColor Yellow
# Write-Host -NoNewLine ("{0:HH}:{0:mm}:{0:ss}" -f (Get-Date)) -foregroundColor $foregroundColor
# Write-Host -NoNewLine "]" -foregroundColor Yellow
#Write-Host -NoNewLine "$([char]955)" -foregroundColor Green
 
#Invoke-Expression (&starship init powershell)
#mode 300
#Set-Alias stor Start-Tor
#Set-Alias cat Get-Content

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
