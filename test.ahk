﻿#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%


RemoveToolTip(){
	ToolTip
	Return
}

CenteredToolTip(text, duration = 999){ ; Duration in ms (MilliSeconds). Default value can be optionally overridden
	ToolTip, %text%, A_ScreenWidth/2, A_ScreenHeight/2
	SetTimer, RemoveToolTip, -%duration% ; Negative to only trigger once
	Return
}


^1::
	MsgBox, test1
	;CenteredToolTip("test")
	CoordMode, Pixel, Screen
	loop { 
		;pixelSearch, PX, PY, 1010, 600, 1040, 640, 0xCA4538, 14, Fast RGB ; Detect if shard has appeared
		;PixelSearch, PX, PY, 1175, 415, 1230, 450, 0x6C9983, 11, Fast ; Find CR garry limb (working)
		; 1175, 415, 1230 450
		PixelSearch, PX, PY, 900, 480, 1020, 540, 0x00F7FF, 3, Fast ; Find white crit number
		;pixelSearch, PX, PY, 1080, 860, 1120, 900, 0xC6EAFF, 14, Fast RGB ; Detect if shard has appeared
		;PixelSearch, PX, PY, 600, 320, 680, 360, 0xFFFFFF, 3, Fast ; Find CL white crit number
	} until (ErrorLevel == 0)
	MsgBox, pog
	DllCall("SetCursorPos", "int", PX, "int", PY)
	CenteredToolTip(PX)
	Sleep, 1000
	CenteredToolTip(PY)
	;1040 860 ;0xCFEEFF
Return

^2::
	MsgBox, test2
	CoordMode, Pixel, Screen
	Loop, {
		ImageSearch, PX, PY, 0, 0, 1920, 1080, *50 1.png
	} until (ErrorLevel == 0)
	MsgBox, pog
	DllCall("SetCursorPos", "int", PX, "int", PY)
	CenteredToolTip(PX)
	Sleep, 1000
	CenteredToolTip(PY)

^4::
    Reload
Return
