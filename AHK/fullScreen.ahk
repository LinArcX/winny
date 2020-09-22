#Persistent
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