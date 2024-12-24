;;using KRaKR constructor.py to generate the key up-down pairs

#DllLoad NtosKrnl.exe
InstallKeybdHook 
;;InstallMouseHook
#UseHook

SetKeyDelay 0	;because we send the key's signals when a key is pressed. The default delay may slow down the signals
A_MaxHotkeysPerInterval:=77
A_HotkeyInterval:=1111


;;;remappings start here

;;brightness remappings start here
GetCurrentBrightNess()
	{
	for property in ComObjGet( "winmgmts:\\.\root\WMI" ).ExecQuery( "SELECT * FROM WmiMonitorBrightness" )
		cub := property.CurrentBrightness	
	return cub
	}
#WheelDown::
	{
	ChangeBrightness(Max(0, GetCurrentBrightNess()-5))	; decrease brightness
	}
#WheelUp::	
	{
	ChangeBrightness(Min(100, GetCurrentBrightNess()+5))	; increase brightness
	}

g := Gui("+AlwaysOnTop -Caption +ToolWindow")
g.BackColor := "ffffff"
g.AddProgress("w60 h5 cBlack vbar", GetCurrentBrightNess())
gs := 0
showg()
	{
	global gs
	if (gs>0)
		gs--
	else
		{	
		g.Show("Hide")
		SetTimer showg,0
		}
	}

ChangeBrightness(b)
	{
	global gs
	if ( b >= 0 && b <= 100 )
	{
		for property in ComObjGet( "winmgmts:\\.\root\WMI" ).ExecQuery( "SELECT * FROM WmiMonitorBrightnessMethods" )
			property.WmiSetBrightness( 0, b )	;1 is the timeout. What is that?
	}
	g["bar"].Value := b
	g.Show("NA")
	gs:=22
	SetTimer showg,55
	}
;;brightness remappings end here


;^!k::	;will be used when the embedded and SEPERATE keyboard differs in the FUTURE
;	{
;	global layo
;	layo:=!layo
;	}

insert::	;copy
	{
	Send "^{c}"
	}


;;Numpad Block Remappings start here

;		/
;	run		GA
;	+	↑
;	←	↓	→
;	↞		↠
;	end		enter

NumpadAdd::	;run
	{
	Send "^{b}"
	}

*NumpadHome::
	{
	Send "{Blind}{NumpadAdd down}"
	}
*NumpadHome up::
	{
	Send "{Blind}{NumpadAdd up}"
	}

*NumpadClear::
	{
	Send "{Blind}{Down down}"
	}
*NumpadClear up::
	{
	Send "{Blind}{Down up}"
	}
;~*NumpadClear::		fileappend time() "	no	do`n", logfile, "UTF-8"	;işlevsiz numpad 5
;~*NumpadClear up::	fileappend time() "	no	up`n", logfile, "UTF-8"	;işlevsiz numpad 5

;end
*NumpadIns::
	{
	Send "{Blind}{End down}"
	}
*NumpadIns up::
	{
	Send "{Blind}{End up}"
	}
;~*NumpadIns::		fileappend time() "	nin	do`n", logfile, "UTF-8"
;~*NumpadIns up::	fileappend time() "	nin	up`n", logfile, "UTF-8"

;word left
*NumpadEnd::
	{
	Send "{Blind}{Ctrl down}{Left Down}"
	}
*NumpadEnd up::
	{
	Send "{Blind}{Ctrl up}{Left up}"
	}
;~*NumpadEnd::		fileappend time() "	nend	do`n", logfile, "UTF-8"
;~*NumpadEnd up::	fileappend time() "	nend	up`n", logfile, "UTF-8"

;word right
*NumpadPgDn::
	{
	Send "{Blind}{Ctrl down}{Right Down}"
	}
*NumpadPgDn up::
	{
	Send "{Blind}{Ctrl up}{Right up}"
	}
;~*NumpadPgDn::		fileappend time() "	npd	do`n", logfile, "UTF-8"
;~*NumpadPgDn up::	fileappend time() "	npd	up`n", logfile, "UTF-8"

;;amine
*NumpadDown::
	{
	Send "{Blind}{s down}"
	}
*NumpadDown up::
	{
	Send "{Blind}{s up}"
	}
*NumpadLeft::
	{
	Send "{Blind}{a down}"
	}
*NumpadLeft up::
	{
	Send "{Blind}{a up}"
	}
*NumpadRight::
	{
	Send "{Blind}{d down}"
	}
*NumpadRight up::
	{
	Send "{Blind}{d up}"
	}
*NumpadUp::
	{
	Send "{Blind}{w down}"
	}
*NumpadUp up::
	{
	Send "{Blind}{w up}"
	}
;;amine end
