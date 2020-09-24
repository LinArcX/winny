#Persistent
; maximize special windows
SetTitleMatchMode, 2 ;A window's title can contain WinTitle anywhere inside

GroupAdd, WinMaximize, ahk_class Notepad
GroupAdd, WinMaximize, ahk_exe firefox.exe
GroupAdd, WinMaximize, ahk_exe nvim.exe
GroupAdd, WinMaximize, ahk_exe pwsh.exe
GroupAdd, WinMaximize, ahk_exe far.exe

SetTimer, Max, 1
Return

Max:
IfWinActive, ahk_group WinMaximize
{
	WinGet, MinMax, MinMax
	WinGet, ID, ID
	If !MinMax And !MinMax%ID%
	{
		WinMaximize
		MinMax%ID% := True
	}
}
Return

; f=far
!f::run, "C:\Program Files\Far Manager\Far.exe \\"D:\\\" \\"E:\\\""
#NoTrayIcon

; b=firefox
!b::run, "C:\Program Files\Mozilla Firefox\firefox.exe"
#NoTrayIcon

; e=nvim
!e::run, "C:\tools\neovim\Neovim\bin\nvim.exe"
#NoTrayIcon

!p::
    run, "C:\Program Files\PowerShell\7\pwsh.exe"
    SetWorkingDir, D:\
Return
#NoTrayIcon

run, "C:\Program Files\PowerShell\7\pwsh.exe"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;SendInput, {Esc}cls{Enter}
;Send cls{Enter}

;!p::run, "C:\Program Files\PowerShell\7\pwsh.exe ; cd C:\"
;+Up::WinMaximize, A
;+Down::WinRestore, A
;+Left::WinMinimize, A

; disable win keys
;LWin::return
;RWin::return
