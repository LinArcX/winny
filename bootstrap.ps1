# Bootstrapper - v 0.1.0

write-host "Welcome to bootstrapper!"
""
write-host "USERPROFILE: $env:USERPROFILE"`n"APPDATA: $env:APPDATA"`n"LOCALAPPDATA: $env:LOCALAPPDATA"
""

# Create Directory
$dest_nvim = "$env:LOCALAPPDATA\nvim"
If(!(test-path $dest_nvim))
{
    New-Item -ItemType Directory -Path $dest_nvim

    If(!(test-path $dest_nvim\plugin))
    {
        New-Item -ItemType Directory -Path $dest_nvim\plugin
    }
    If(!(test-path $dest_nvim\functions))
    {
        New-Item -ItemType Directory -Path $dest_nvim\functions
    }
    If(!(test-path $dest_nvim\autoload))
    {
        New-Item -ItemType Directory -Path $dest_nvim\autoload
    }
    If(!(test-path $dest_nvim\after))
    {
        New-Item -ItemType Directory -Path $dest_nvim\after
    }
    If(!(test-path $dest_nvim\after\ftplugin))
    {
        New-Item -ItemType Directory -Path $dest_nvim\after\ftplugin
    }

    get-childitem ".config\.nvim" -recurse | where {$_.extension -eq ".vim"} | % {
        $FullPath = $_.FullName 
        $RealPath = $_.FullName -split ".nvim\\" 
        #New-Item -ItemType SymbolicLink -Path $env:LOCALAPPDATA\nvim\$RealPath[1] -Target $FullPath

        Write-Host $_.BaseName
        Write-Host $_.FullName
        Write-Host $RealPath[1]
        ""
        #$MyPath = "C:\winny\.config\.nvim\init.vim"
        #New-Item -ItemType SymbolicLink -Path $env:LOCALAPPDATA\nvim\$real_path[1] -Target $_.FullName
    }
}

#new-item -itemtype SymbolicLink -path $env:LOCALAPPDATA\nvim -value C:\winny\.config\.nvim\plugin\vim_session.vim
#$source_nvim = "C:\winny\.config\.nvim"
#Dir -Recurse $source_nvim | Get-Childitem
#Get-ChildItem $source_nvim -Filter *.vim | 
#Foreach-Object {
#	$content = Get-Content $_.FullName
#
#	#write-host $content
#	Get-ChildItem $source_nvim | select BaseName
#	
#        # filter and save content to the original file
#	# $content | Where-Object {$_ -match 'step[49]'} | Set-Content $_.FullName
#	# filter and save content to a new file 
#	# $content | Where-Object {$_ -match 'step[49]'} | Set-Content ($_.BaseName + '_out.log')
#}
