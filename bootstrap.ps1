# Bootstrapper - v 0.1.0

write-host "Welcome to bootstrapper!"
""
write-host "USERPROFILE: $env:USERPROFILE"`n"APPDATA: $env:APPDATA"`n"LOCALAPPDATA: $env:LOCALAPPDATA"
""

$dest_nvim = "$env:LOCALAPPDATA\nvim"
write-host ">>> Copying neovim configs to $dest_nvim"
""
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
        $PathArray = $_.FullName -split ".nvim\\"
	    $RealPath = $PathArray[1]
        New-Item -ItemType SymbolicLink -Path $env:LOCALAPPDATA\nvim\$RealPath -Target $FullPath

        Write-Host $_.BaseName
        Write-Host $_.FullName
        Write-Host $RealPath
        ""
    }
}
