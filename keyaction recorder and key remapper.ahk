;;using KRaKR constructor.py to generate the key up-down pairs
layo:=0	;layout: 0 is my laptop's layout, 1 is my external keyboard's layout

#DllLoad NtosKrnl.exe
InstallKeybdHook 
;;InstallMouseHook
#UseHook

SetKeyDelay 0	;because we send the key's signals when a key is pressed. The default delay may slow down the signals
A_MaxHotkeysPerInterval:=77
A_HotkeyInterval:=1111

logfile:="C:\filerings of john\keyaction records\rest.txt"

fileappend DateDiff(A_NowUTC,"1970","Seconds") "`n", logfile, "UTF-8"

DllCall("QueryPerformanceCounter", "Int64*", &tim0 := 0)	;set time0 to take dt

time() {	;dt*100ns has passed since the line 7 executed
	DllCall("QueryPerformanceCounter", "Int64*", &tim := 0)
	Return tim - tim0	;dt
	}


cubr 	:= GetCurrentBrightNess()	;current brightness

; brightness
#WheelDown::
	{
	global cubr
	cubr := Max(0, cubr-5)
	ChangeBrightness() ; decrease brightness
	}
#WheelUp::
	{
	global cubr
	cubr := Min(100, cubr+5)
	ChangeBrightness() ; decrease brightness
	}

; Functions
g := Gui("+AlwaysOnTop -Caption +ToolWindow")
g.AddProgress("w200 h20 cBlue vbar", 80)
gs := 0
showg()
	{
	global gs
	if (gs>0)
		gs--
	else
		g.Show("Hide")
	}
SetTimer(showg, 55)
ChangeBrightness(  )
{
	global gs
	if ( cubr >= 0 && cubr <= 100 )
	{
		for property in ComObjGet( "winmgmts:\\.\root\WMI" ).ExecQuery( "SELECT * FROM WmiMonitorBrightnessMethods" )
			property.WmiSetBrightness( 0, cubr )	;1 is the timeout. What is that?
	}
	g["bar"].Value := cubr
	g.Show("NA")
	gs:=22
}

GetCurrentBrightNess()
{
	for property in ComObjGet( "winmgmts:\\.\root\WMI" ).ExecQuery( "SELECT * FROM WmiMonitorBrightness" )
		currentBrightness := property.CurrentBrightness	

	return currentBrightness
}


;;special shortcuts...

^"::	{
	SendText "->"
	fileappend time() " ->`n", logfile, "UTF-8"
	}
insert:: {
	SendText "="
	fileappend time() "	=`n", logfile, "UTF-8"
	}
#insert:: {
	SendText "!="
	fileappend time() "	!=`n", logfile, "UTF-8"
	}
~*insert::	fileappend time() "	in	do`n", logfile, "UTF-8"
*~insert up::	fileappend time() "	in	up`n", logfile, "UTF-8"

*PrintScreen:: {	;end
	Send "{Blind}{End down}"
	fileappend time() "	end	do`n", logfile, "UTF-8"
	}
*PrintScreen up:: {
	Send "{Blind}{End up}"
	fileappend time() "	end	up`n", logfile, "UTF-8"
	}
~*End::		fileappend time() "	end	do`n", logfile, "UTF-8"
~*End up::	fileappend time() "	end	up`n", logfile, "UTF-8"

#CapsLock::
	{
	if GetKeyState("CapsLock","T")
		{
		SetCapsLockState 0
		fileappend time() "	cl	0`n", logfile, "UTF-8"
		}
	else
		{
		SetCapsLockState 1
		fileappend time() "	cl	1`n", logfile, "UTF-8"
		}
	}
#HotIf !layo
*CapsLock::	;home
	{
	Send "{Blind}{Home down}"
	fileappend time() "	ho	do`n", logfile, "UTF-8"
	}
*CapsLock up:: {	;home
	Send "{Blind}{Home up}"
	fileappend time() "	ho	up`n", logfile, "UTF-8"
	}
#HotIf
#HotIf layo
~*CapsLock::		fileappend time() "	cl	do`n", logfile, "UTF-8"
~*CapsLock up::	fileappend time() "	cl	up`n", logfile, "UTF-8"
#HotIf

~*Home::		fileappend time() "	ho	do`n", logfile, "UTF-8"
~*Home up::	fileappend time() "	ho	up`n", logfile, "UTF-8"

#p:: {	;normally it pops a screen to duplicate the screen etc...	now click that button with ctrl then it works
	Send "{F5 down}"
	fileappend time() "	f5	do	`n", logfile, "UTF-8"
	}
#p up:: {	;normally it pops a screen to duplicate the screen etc...
	Send "{F5 up}"
	fileappend time() "	f5	up	`n", logfile, "UTF-8"
	}

NumLock::
	{	;for build fn. in sublime text, and anything
	Send "{F7 down}"
	fileappend time() "	f7	do	`n", logfile, "UTF-8"
	}
NumLock up::
	{
	Send "{F7 up}"
	fileappend time() "	f7	up	`n", logfile, "UTF-8"
	}
~*NumLock::	fileappend time() "	nl	up`n", logfile, "UTF-8"
~*NumLock up::	fileappend time() "	nl	up`n", logfile, "UTF-8"

;;special shortcuts...

;time	key name	(up|down)		 
;	real time = time*100n

~*Sleep::		fileappend time() "	uy	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*Sleep up::	fileappend time() "	uy	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"

*~LButton::		fileappend time() "	so	do`n", logfile, "UTF-8"
*~LButton up::	fileappend time() "	so	up`n", logfile, "UTF-8"
~*RButton::		fileappend time() "	sa	do`n", logfile, "UTF-8"
~*RButton up::	fileappend time() "	sa	up`n", logfile, "UTF-8"

~*XButton1::		fileappend time() "	ge	do`n", logfile, "UTF-8"
~*XButton1 up::	fileappend time() "	ge	up`n", logfile, "UTF-8"
~*XButton2::		fileappend time() "	il	do`n", logfile, "UTF-8"
~*XButton2 up::	fileappend time() "	il	up`n", logfile, "UTF-8"

~*0::		fileappend time() "	0	do`n", logfile, "UTF-8"
~*0 up::	fileappend time() "	0	up`n", logfile, "UTF-8"
~*1::		fileappend time() "	1	do`n", logfile, "UTF-8"
~*1 up::	fileappend time() "	1	up`n", logfile, "UTF-8"
~*2::		fileappend time() "	2	do`n", logfile, "UTF-8"
~*2 up::	fileappend time() "	2	up`n", logfile, "UTF-8"
~*3::		fileappend time() "	3	do`n", logfile, "UTF-8"
~*3 up::	fileappend time() "	3	up`n", logfile, "UTF-8"
~*4::		fileappend time() "	4	do`n", logfile, "UTF-8"
~*4 up::	fileappend time() "	4	up`n", logfile, "UTF-8"
~*5::		fileappend time() "	5	do`n", logfile, "UTF-8"
~*5 up::	fileappend time() "	5	up`n", logfile, "UTF-8"
~*6::		fileappend time() "	6	do`n", logfile, "UTF-8"
~*6 up::	fileappend time() "	6	up`n", logfile, "UTF-8"
~*7::		fileappend time() "	7	do`n", logfile, "UTF-8"
~*7 up::	fileappend time() "	7	up`n", logfile, "UTF-8"
~*8::		fileappend time() "	8	do`n", logfile, "UTF-8"
~*8 up::	fileappend time() "	8	up`n", logfile, "UTF-8"
~*9::		fileappend time() "	9	do`n", logfile, "UTF-8"
~*9 up::	fileappend time() "	9	up`n", logfile, "UTF-8"

~*Space::		fileappend time() "	bo	do`n", logfile, "UTF-8"
~*Space up::	fileappend time() "	bo	up`n", logfile, "UTF-8"

~*Tab::		fileappend time() "	ta	do`n", logfile, "UTF-8"
~*Tab up::	fileappend time() "	ta	up`n", logfile, "UTF-8"

~*Enter::		fileappend time() "	er	do`n", logfile, "UTF-8"
~*Enter up::	fileappend time() "	er	up`n", logfile, "UTF-8"

~*Esc::		fileappend time() "	es	do`n", logfile, "UTF-8"
~*Esc up::	fileappend time() "	es	up`n", logfile, "UTF-8"
	
~*Backspace::		fileappend time() "	<-	do`n", logfile, "UTF-8"
~*Backspace up::	fileappend time() "	<-	up`n", logfile, "UTF-8"

~*Up::		fileappend time() "	up	do`n", logfile, "UTF-8"
~*Up up::	fileappend time() "	up	up`n", logfile, "UTF-8"
~*Down::		fileappend time() "	do	do`n", logfile, "UTF-8"
~*Down up::	fileappend time() "	do	up`n", logfile, "UTF-8"
~*Left::		fileappend time() "	le	do`n", logfile, "UTF-8"
~*Left up::	fileappend time() "	le	up`n", logfile, "UTF-8"
~*Right::		fileappend time() "	ri	do`n", logfile, "UTF-8"
~*Right up::	fileappend time() "	ri	up`n", logfile, "UTF-8"

~*Numpad0::		fileappend time() "	n0	do`n", logfile, "UTF-8"
~*Numpad0 up::	fileappend time() "	n0	up`n", logfile, "UTF-8"
~*Numpad1::		fileappend time() "	n1	do`n", logfile, "UTF-8"
~*Numpad1 up::	fileappend time() "	n1	up`n", logfile, "UTF-8"
~*Numpad2::		fileappend time() "	n2	do`n", logfile, "UTF-8"
~*Numpad2 up::	fileappend time() "	n2	up`n", logfile, "UTF-8"
~*Numpad3::		fileappend time() "	n3	do`n", logfile, "UTF-8"
~*Numpad3 up::	fileappend time() "	n3	up`n", logfile, "UTF-8"
~*Numpad4::		fileappend time() "	n4	do`n", logfile, "UTF-8"
~*Numpad4 up::	fileappend time() "	n4	up`n", logfile, "UTF-8"
~*Numpad5::		fileappend time() "	n5	do`n", logfile, "UTF-8"
~*Numpad5 up::	fileappend time() "	n5	up`n", logfile, "UTF-8"
~*Numpad6::		fileappend time() "	n6	do`n", logfile, "UTF-8"
~*Numpad6 up::	fileappend time() "	n6	up`n", logfile, "UTF-8"
~*Numpad7::		fileappend time() "	n7	do`n", logfile, "UTF-8"
~*Numpad7 up::	fileappend time() "	n7	up`n", logfile, "UTF-8"
~*Numpad8::		fileappend time() "	n8	do`n", logfile, "UTF-8"
~*Numpad8 up::	fileappend time() "	n8	up`n", logfile, "UTF-8"
~*Numpad9::		fileappend time() "	n9	do`n", logfile, "UTF-8"
~*Numpad9 up::	fileappend time() "	n9	up`n", logfile, "UTF-8"

~*NumpadDot::		fileappend time() "	n,	do`n", logfile, "UTF-8"
~*NumpadDot up::	fileappend time() "	n,	up`n", logfile, "UTF-8"

~*NumpadDiv::		fileappend time() "	n/	do`n", logfile, "UTF-8"
~*NumpadDiv up::	fileappend time() "	n/	up`n", logfile, "UTF-8"
~*NumpadMult::		fileappend time() "	n*	do`n", logfile, "UTF-8"
~*NumpadMult up::	fileappend time() "	n*	up`n", logfile, "UTF-8"
~*NumpadAdd::		fileappend time() "	n+	do`n", logfile, "UTF-8"
~*NumpadAdd up::	fileappend time() "	n+	up`n", logfile, "UTF-8"
~*NumpadSub::		fileappend time() "	n-	do`n", logfile, "UTF-8"
~*NumpadSub up::	fileappend time() "	n-	up`n", logfile, "UTF-8"


~*NumpadEnter::		fileappend time() "	ner	do`n", logfile, "UTF-8"
~*NumpadEnter up::	fileappend time() "	ner	up`n", logfile, "UTF-8"

~*LAlt::		fileappend time() "	<a	do`n", logfile, "UTF-8"
~*LAlt up::	fileappend time() "	<a	up`n", logfile, "UTF-8"
~*RAlt::		fileappend time() "	>a	do`n", logfile, "UTF-8"
~*RAlt up::	fileappend time() "	>a	up`n", logfile, "UTF-8"

~*LShift::		fileappend time() "	<s	do`n", logfile, "UTF-8"
~*LShift up::	fileappend time() "	<s	up`n", logfile, "UTF-8"
~*RShift::		fileappend time() "	>s	do`n", logfile, "UTF-8"
~*RShift up::	fileappend time() "	>s	up`n", logfile, "UTF-8"
	
~*Volume_Mute::		fileappend time() "	su	do`n", logfile, "UTF-8"
~*Volume_Mute up::	fileappend time() "	su	up`n", logfile, "UTF-8"
~*Volume_Down::		fileappend time() "	s-	do`n", logfile, "UTF-8"
~*Volume_Down up::	fileappend time() "	s-	up`n", logfile, "UTF-8"
~*Volume_Up::		fileappend time() "	s+	do`n", logfile, "UTF-8"
~*Volume_Up up::	fileappend time() "	s+	up`n", logfile, "UTF-8"

~*Launch_App2::		fileappend time() "	ca	do`n", logfile, "UTF-8"
~*Launch_App2 up::	fileappend time() "	ca	up`n", logfile, "UTF-8"

~*Browser_Refresh::		fileappend time() "	sy	do`n", logfile, "UTF-8"
~*Browser_Refresh up::	fileappend time() "	sy	up`n", logfile, "UTF-8"

~*SC01A::		fileappend time() "	ğ	do`n", logfile, "UTF-8"
~*SC01A up::	fileappend time() "	ğ	up`n", logfile, "UTF-8"
~*SC01B::		fileappend time() "	ü	do`n", logfile, "UTF-8"
~*SC01B up::	fileappend time() "	ü	up`n", logfile, "UTF-8"
~*SC027::		fileappend time() "	ş	do`n", logfile, "UTF-8"
~*SC027 up::	fileappend time() "	ş	up`n", logfile, "UTF-8"
~*SC017::		fileappend time() "	ı	do`n", logfile, "UTF-8"
~*SC017 up::	fileappend time() "	ı	up`n", logfile, "UTF-8"
~*SC028::		fileappend time() "	i	do`n", logfile, "UTF-8"
~*SC028 up::	fileappend time() "	i	up`n", logfile, "UTF-8"
~*SC033::		fileappend time() "	ö	do`n", logfile, "UTF-8"
~*SC033 up::	fileappend time() "	ö	up`n", logfile, "UTF-8"
~*SC034::		fileappend time() "	ç	do`n", logfile, "UTF-8"
~*SC034 up::	fileappend time() "	ç	up`n", logfile, "UTF-8"

~*,::		fileappend time() "	,	do`n", logfile, "UTF-8"
~*, up::	fileappend time() "	,	up`n", logfile, "UTF-8"
~*.::		fileappend time() "	.	do`n", logfile, "UTF-8"
~*. up::	fileappend time() "	.	up`n", logfile, "UTF-8"
~*SC056::		fileappend time() "	<	do`n", logfile, "UTF-8"
~*SC056 up::	fileappend time() "	<	up`n", logfile, "UTF-8"
~*"::		fileappend time() "	`"	do`n", logfile, "UTF-8"
~*" up::	fileappend time() "	`"	up`n", logfile, "UTF-8"
~**::		fileappend time() "	*	do`n", logfile, "UTF-8"
~** up::	fileappend time() "	*	up`n", logfile, "UTF-8"
~*-::		fileappend time() "	-	do`n", logfile, "UTF-8"
~*- up::	fileappend time() "	-	up`n", logfile, "UTF-8"

~*LControl::		fileappend time() "	<c	do`n", logfile, "UTF-8"
~*LControl up::	fileappend time() "	<c	up`n", logfile, "UTF-8"
~*RControl::		fileappend time() "	>c	do`n", logfile, "UTF-8"
~*RControl up::	fileappend time() "	>c	up`n", logfile, "UTF-8"

~*LWin::		fileappend time() "	<w	do`n", logfile, "UTF-8"
~*LWin up::	fileappend time() "	<w	up`n", logfile, "UTF-8"
~*RWin::		fileappend time() "	>w	do`n", logfile, "UTF-8"
~*RWin up::	fileappend time() "	>w	up`n", logfile, "UTF-8"

~*NumpadDel::		fileappend time() "	nde	do`n", logfile, "UTF-8"
~*NumpadDel up::	fileappend time() "	nde	up`n", logfile, "UTF-8"

~*Delete::		fileappend time() "	de	do`n", logfile, "UTF-8"
~*Delete up::	fileappend time() "	de	up`n", logfile, "UTF-8"

~*q::		fileappend time() "	q	do`n", logfile, "UTF-8"
~*q up::	fileappend time() "	q	up`n", logfile, "UTF-8"
~*w::		fileappend time() "	w	do`n", logfile, "UTF-8"
~*w up::	fileappend time() "	w	up`n", logfile, "UTF-8"
~*e::		fileappend time() "	e	do`n", logfile, "UTF-8"
~*e up::	fileappend time() "	e	up`n", logfile, "UTF-8"
~*r::		fileappend time() "	r	do`n", logfile, "UTF-8"
~*r up::	fileappend time() "	r	up`n", logfile, "UTF-8"
~*t::		fileappend time() "	t	do`n", logfile, "UTF-8"
~*t up::	fileappend time() "	t	up`n", logfile, "UTF-8"
~*y::		fileappend time() "	y	do`n", logfile, "UTF-8"
~*y up::	fileappend time() "	y	up`n", logfile, "UTF-8"
~*u::		fileappend time() "	u	do`n", logfile, "UTF-8"
~*u up::	fileappend time() "	u	up`n", logfile, "UTF-8"
~*o::		fileappend time() "	o	do`n", logfile, "UTF-8"
~*o up::	fileappend time() "	o	up`n", logfile, "UTF-8"
~*p::		fileappend time() "	p	do`n", logfile, "UTF-8"
~*p up::	fileappend time() "	p	up`n", logfile, "UTF-8"
~*a::		fileappend time() "	a	do`n", logfile, "UTF-8"
~*a up::	fileappend time() "	a	up`n", logfile, "UTF-8"
~*s::		fileappend time() "	s	do`n", logfile, "UTF-8"
~*s up::	fileappend time() "	s	up`n", logfile, "UTF-8"
~*d::		fileappend time() "	d	do`n", logfile, "UTF-8"
~*d up::	fileappend time() "	d	up`n", logfile, "UTF-8"
~*f::		fileappend time() "	f	do`n", logfile, "UTF-8"
~*f up::	fileappend time() "	f	up`n", logfile, "UTF-8"
~*g::		fileappend time() "	g	do`n", logfile, "UTF-8"
~*g up::	fileappend time() "	g	up`n", logfile, "UTF-8"
~*h::		fileappend time() "	h	do`n", logfile, "UTF-8"
~*h up::	fileappend time() "	h	up`n", logfile, "UTF-8"
~*j::		fileappend time() "	j	do`n", logfile, "UTF-8"
~*j up::	fileappend time() "	j	up`n", logfile, "UTF-8"
~*k::		fileappend time() "	k	do`n", logfile, "UTF-8"
~*k up::	fileappend time() "	k	up`n", logfile, "UTF-8"
~*l::		fileappend time() "	l	do`n", logfile, "UTF-8"
~*l up::	fileappend time() "	l	up`n", logfile, "UTF-8"
~*z::		fileappend time() "	z	do`n", logfile, "UTF-8"
~*z up::	fileappend time() "	z	up`n", logfile, "UTF-8"
~*x::		fileappend time() "	x	do`n", logfile, "UTF-8"
~*x up::	fileappend time() "	x	up`n", logfile, "UTF-8"
~*c::		fileappend time() "	c	do`n", logfile, "UTF-8"
~*c up::	fileappend time() "	c	up`n", logfile, "UTF-8"
~*v::		fileappend time() "	v	do`n", logfile, "UTF-8"
~*v up::	fileappend time() "	v	up`n", logfile, "UTF-8"
~*b::		fileappend time() "	b	do`n", logfile, "UTF-8"
~*b up::	fileappend time() "	b	up`n", logfile, "UTF-8"
~*n::		fileappend time() "	n	do`n", logfile, "UTF-8"
~*n up::	fileappend time() "	n	up`n", logfile, "UTF-8"
~*m::		fileappend time() "	m	do`n", logfile, "UTF-8"
~*m up::	fileappend time() "	m	up`n", logfile, "UTF-8"

~*F1::		fileappend time() "	f1	do`n", logfile, "UTF-8"
~*F1 up::	fileappend time() "	f1	up`n", logfile, "UTF-8"
~*F2::		fileappend time() "	f2	do`n", logfile, "UTF-8"
~*F2 up::	fileappend time() "	f2	up`n", logfile, "UTF-8"
~*F3::		fileappend time() "	f3	do`n", logfile, "UTF-8"
~*F3 up::	fileappend time() "	f3	up`n", logfile, "UTF-8"
~*F4::		fileappend time() "	f4	do`n", logfile, "UTF-8"
~*F4 up::	fileappend time() "	f4	up`n", logfile, "UTF-8"
~*F5::		fileappend time() "	f5	do`n", logfile, "UTF-8"
~*F5 up::	fileappend time() "	f5	up`n", logfile, "UTF-8"
~*F6::		fileappend time() "	f6	do`n", logfile, "UTF-8"
~*F6 up::	fileappend time() "	f6	up`n", logfile, "UTF-8"
~*F7::		fileappend time() "	f7	do`n", logfile, "UTF-8"
~*F7 up::	fileappend time() "	f7	up`n", logfile, "UTF-8"
~*F8::		fileappend time() "	f8	do`n", logfile, "UTF-8"
~*F8 up::	fileappend time() "	f8	up`n", logfile, "UTF-8"
~*F9::		fileappend time() "	f9	do`n", logfile, "UTF-8"
~*F9 up::	fileappend time() "	f9	up`n", logfile, "UTF-8"
~*F10::		fileappend time() "	f10	do`n", logfile, "UTF-8"
~*F10 up::	fileappend time() "	f10	up`n", logfile, "UTF-8"
~*F11::		fileappend time() "	f11	do`n", logfile, "UTF-8"
~*F11 up::	fileappend time() "	f11	up`n", logfile, "UTF-8"
~*F12::		fileappend time() "	f12	do`n", logfile, "UTF-8"
~*F12 up::	fileappend time() "	f12	up`n", logfile, "UTF-8"
~*F13::		fileappend time() "	f13	do`n", logfile, "UTF-8"
~*F13 up::	fileappend time() "	f13	up`n", logfile, "UTF-8"
~*F14::		fileappend time() "	f14	do`n", logfile, "UTF-8"
~*F14 up::	fileappend time() "	f14	up`n", logfile, "UTF-8"
~*F15::		fileappend time() "	f15	do`n", logfile, "UTF-8"
~*F15 up::	fileappend time() "	f15	up`n", logfile, "UTF-8"
~*F16::		fileappend time() "	f16	do`n", logfile, "UTF-8"
~*F16 up::	fileappend time() "	f16	up`n", logfile, "UTF-8"
~*F17::		fileappend time() "	f17	do`n", logfile, "UTF-8"
~*F17 up::	fileappend time() "	f17	up`n", logfile, "UTF-8"
~*F18::		fileappend time() "	f18	do`n", logfile, "UTF-8"
~*F18 up::	fileappend time() "	f18	up`n", logfile, "UTF-8"
~*F19::		fileappend time() "	f19	do`n", logfile, "UTF-8"
~*F19 up::	fileappend time() "	f19	up`n", logfile, "UTF-8"
~*F20::		fileappend time() "	f20	do`n", logfile, "UTF-8"
~*F20 up::	fileappend time() "	f20	up`n", logfile, "UTF-8"
~*F21::		fileappend time() "	f21	do`n", logfile, "UTF-8"
~*F21 up::	fileappend time() "	f21	up`n", logfile, "UTF-8"
~*F22::		fileappend time() "	f22	do`n", logfile, "UTF-8"
~*F22 up::	fileappend time() "	f22	up`n", logfile, "UTF-8"
~*F23::		fileappend time() "	f23	do`n", logfile, "UTF-8"
~*F23 up::	fileappend time() "	f23	up`n", logfile, "UTF-8"

~*PgUp::		fileappend time() "	pu	do`n", logfile, "UTF-8"
~*PgUp up::	fileappend time() "	pu	up`n", logfile, "UTF-8"
~*PgDn::		fileappend time() "	pd	do`n", logfile, "UTF-8"
~*PgDn up::	fileappend time() "	pd	up`n", logfile, "UTF-8"
