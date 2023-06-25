;Autohotkey version 2

#DllLoad NtosKrnl.exe	;for QueryPerformanceCounter (I am using Windows.)
InstallKeybdHook
#UseHook

fileappend "Log starts.`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"

SetKeyDelay 0	;for remappings to feel normal

DllCall("QueryPerformanceCounter", "Int64*", &tim0 := 0)	;set time0 to take delta time

time() {	;delta_t*100ns has passed since the line 9 executed
	DllCall("QueryPerformanceCounter", "Int64*", &tim := 0)
	Return tim - tim0	;delta_t
	}

;;special shortcuts for myself...
^"::	{
	SendText "->"	;Turkish keyboard does not have > character (shift+<) so -> is not ergonomic in C and C++
	fileappend time() "	->`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
	}
insert:: {	;Turkish keyboard does not have = character and I do not use insert... remap insert to =
	SendText "="
	fileappend time() "	=`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
	}
~*insert::	fileappend time() "	in	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"	
*~insert up::	fileappend time() "	in	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
#insert:: {	;Turkish keyboard does not have ! character without modifiers...
	SendText "!="
	fileappend time() "	!=`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
	}
*PrintScreen:: {	;My keyboard does not have the "end" key without modifiers
	Send "{Blind}{End down}"
	fileappend time() "	end	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
	}
*PrintScreen up:: {
	Send "{Blind}{End up}"
	fileappend time() "	end	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
	}
~*End::		fileappend time() "	end	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*End up::	fileappend time() "	end	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"


;time	key_name	(up|down)\n 
;;	real time = time*100n

;All code below is for logging the keyactions.

*~LButton::		fileappend time() "	so	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
*~LButton up::	fileappend time() "	so	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*RButton::		fileappend time() "	sa	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*RButton up::	fileappend time() "	sa	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"

~*XButton1::		fileappend time() "	ge	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*XButton1 up::	fileappend time() "	ge	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*XButton2::		fileappend time() "	il	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*XButton2 up::	fileappend time() "	il	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"

~*0::		fileappend time() "	0	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*0 up::	fileappend time() "	0	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*1::		fileappend time() "	1	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*1 up::	fileappend time() "	1	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*2::		fileappend time() "	2	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*2 up::	fileappend time() "	2	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*3::		fileappend time() "	3	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*3 up::	fileappend time() "	3	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*4::		fileappend time() "	4	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*4 up::	fileappend time() "	4	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*5::		fileappend time() "	5	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*5 up::	fileappend time() "	5	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*6::		fileappend time() "	6	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*6 up::	fileappend time() "	6	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*7::		fileappend time() "	7	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*7 up::	fileappend time() "	7	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*8::		fileappend time() "	8	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*8 up::	fileappend time() "	8	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*9::		fileappend time() "	9	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*9 up::	fileappend time() "	9	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"

~*q::		fileappend time() "	q	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*q up::	fileappend time() "	q	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*w::		fileappend time() "	w	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*w up::	fileappend time() "	w	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*e::		fileappend time() "	e	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*e up::	fileappend time() "	e	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*r::		fileappend time() "	r	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*r up::	fileappend time() "	r	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*t::		fileappend time() "	t	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*t up::	fileappend time() "	t	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*y::		fileappend time() "	y	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*y up::	fileappend time() "	y	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*u::		fileappend time() "	u	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*u up::	fileappend time() "	u	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*o::		fileappend time() "	o	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*o up::	fileappend time() "	o	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*p::		fileappend time() "	p	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*p up::	fileappend time() "	p	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*a::		fileappend time() "	a	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*a up::	fileappend time() "	a	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*s::		fileappend time() "	s	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*s up::	fileappend time() "	s	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*d::		fileappend time() "	d	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*d up::	fileappend time() "	d	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*f::		fileappend time() "	f	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*f up::	fileappend time() "	f	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*g::		fileappend time() "	g	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*g up::	fileappend time() "	g	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*h::		fileappend time() "	h	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*h up::	fileappend time() "	h	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*j::		fileappend time() "	j	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*j up::	fileappend time() "	j	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*k::		fileappend time() "	k	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*k up::	fileappend time() "	k	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*l::		fileappend time() "	l	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*l up::	fileappend time() "	l	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*z::		fileappend time() "	z	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*z up::	fileappend time() "	z	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*x::		fileappend time() "	x	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*x up::	fileappend time() "	x	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*c::		fileappend time() "	c	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*c up::	fileappend time() "	c	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*v::		fileappend time() "	v	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*v up::	fileappend time() "	v	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*b::		fileappend time() "	b	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*b up::	fileappend time() "	b	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*n::		fileappend time() "	n	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*n up::	fileappend time() "	n	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*m::		fileappend time() "	m	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*m up::	fileappend time() "	m	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"

~*Space::		fileappend time() "	bo	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*Space up::	fileappend time() "	bo	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"

~*Tab::		fileappend time() "	ta	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*Tab up::	fileappend time() "	ta	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"

~*Enter::		fileappend time() "	er	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*Enter up::	fileappend time() "	er	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"

~*Esc::		fileappend time() "	es	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*Esc up::	fileappend time() "	es	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
	
~*Backspace::		fileappend time() "	<-	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*Backspace up::	fileappend time() "	<-	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"

~*Up::		fileappend time() "	yu	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*Up up::	fileappend time() "	yu	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*Down::		fileappend time() "	aş	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*Down up::	fileappend time() "	aş	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*Left::		fileappend time() "	so	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*Left up::	fileappend time() "	so	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*Right::		fileappend time() "	sa	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*Right up::	fileappend time() "	sa	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"

~*Numpad0::		fileappend time() "	n0	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*Numpad0 up::	fileappend time() "	n0	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*Numpad1::		fileappend time() "	n1	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*Numpad1 up::	fileappend time() "	n1	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*Numpad2::		fileappend time() "	n2	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*Numpad2 up::	fileappend time() "	n2	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*Numpad3::		fileappend time() "	n3	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*Numpad3 up::	fileappend time() "	n3	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*Numpad4::		fileappend time() "	n4	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*Numpad4 up::	fileappend time() "	n4	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*Numpad5::		fileappend time() "	n5	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*Numpad5 up::	fileappend time() "	n5	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*Numpad6::		fileappend time() "	n6	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*Numpad6 up::	fileappend time() "	n6	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*Numpad7::		fileappend time() "	n7	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*Numpad7 up::	fileappend time() "	n7	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*Numpad8::		fileappend time() "	n8	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*Numpad8 up::	fileappend time() "	n8	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*Numpad9::		fileappend time() "	n9	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*Numpad9 up::	fileappend time() "	n9	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"

~*NumpadDot::		fileappend time() "	n,	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*NumpadDot up::	fileappend time() "	n,	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"

~*NumLock::		fileappend time() "	nl	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*NumLock up::	fileappend time() "	nl	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"

~*NumpadDiv::		fileappend time() "	n/	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*NumpadDiv up::	fileappend time() "	n/	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*NumpadMult::		fileappend time() "	n*	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*NumpadMult up::	fileappend time() "	n*	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*NumpadAdd::		fileappend time() "	n+	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*NumpadAdd up::	fileappend time() "	n+	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*NumpadSub::		fileappend time() "	n-	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*NumpadSub up::	fileappend time() "	n-	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"


~*NumpadEnter::		fileappend time() "	ner	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*NumpadEnter up::	fileappend time() "	ner	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"

~*LAlt::		fileappend time() "	<a	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*LAlt up::	fileappend time() "	<a	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*RAlt::		fileappend time() "	>a	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*RAlt up::	fileappend time() "	>a	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"

~*LShift::		fileappend time() "	<s	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*LShift up::	fileappend time() "	<s	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*RShift::		fileappend time() "	>s	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*RShift up::	fileappend time() "	>s	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
	
~*Volume_Mute::		fileappend time() "	su	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*Volume_Mute up::	fileappend time() "	su	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*Volume_Down::		fileappend time() "	s-	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*Volume_Down up::	fileappend time() "	s-	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*Volume_Up::		fileappend time() "	s+	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*Volume_Up up::	fileappend time() "	s+	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"

~*Launch_App2::		fileappend time() "	ca	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*Launch_App2 up::	fileappend time() "	ca	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"

~*Browser_Refresh::		fileappend time() "	sy	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*Browser_Refresh up::	fileappend time() "	sy	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"

~*Home::		fileappend time() "	ho	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*Home up::	fileappend time() "	ho	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"

~*SC01A::		fileappend time() "	gg	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"	;ğ
~*SC01A up::	fileappend time() "	gg	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"	;ğ
~*SC01B::		fileappend time() "	ü	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*SC01B up::	fileappend time() "	ü	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*SC027::		fileappend time() "	ş	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*SC027 up::	fileappend time() "	ş	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*SC017::		fileappend time() "	ı	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*SC017 up::	fileappend time() "	ı	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*SC028::		fileappend time() "	i	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*SC028 up::	fileappend time() "	i	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*SC033::		fileappend time() "	ö	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*SC033 up::	fileappend time() "	ö	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*SC034::		fileappend time() "	ç	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*SC034 up::	fileappend time() "	ç	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"

~*,::		fileappend time() "	,	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*, up::	fileappend time() "	,	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*.::		fileappend time() "	.	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*. up::	fileappend time() "	.	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*SC056::		fileappend time() "	<	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*SC056 up::	fileappend time() "	<	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*"::		fileappend time() "	`"	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*" up::	fileappend time() "	`"	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~**::		fileappend time() "	*	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~** up::	fileappend time() "	*	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*-::		fileappend time() "	-	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*- up::	fileappend time() "	-	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"

~*CapsLock::		fileappend time() "	cl	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*CapsLock up::	fileappend time() "	cl	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"

~*LControl::		fileappend time() "	<c 	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*LControl up::	fileappend time() "	<c 	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*RControl::		fileappend time() "	>c	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*RControl up::	fileappend time() "	>c	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"

~*LWin::		fileappend time() "	<w	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*LWin up::	fileappend time() "	<w	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*RWin::		fileappend time() "	>w	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*RWin up::	fileappend time() "	>w	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"

~*NumpadDel::		fileappend time() "	nde	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*NumpadDel up::	fileappend time() "	nde	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"

~*Delete::		fileappend time() "	de	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*Delete up::	fileappend time() "	de	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"


~*F1::		fileappend time() "	f1	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*F1 up::	fileappend time() "	f1	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*F2::		fileappend time() "	f2	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*F2 up::	fileappend time() "	f2	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*F3::		fileappend time() "	f3	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*F3 up::	fileappend time() "	f3	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*F4::		fileappend time() "	f4	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*F4 up::	fileappend time() "	f4	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*F5::		fileappend time() "	f5	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*F5 up::	fileappend time() "	f5	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*F6::		fileappend time() "	f6	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*F6 up::	fileappend time() "	f6	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*F7::		fileappend time() "	f7	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*F7 up::	fileappend time() "	f7	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*F8::		fileappend time() "	f8	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*F8 up::	fileappend time() "	f8	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*F9::		fileappend time() "	f9	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*F9 up::	fileappend time() "	f9	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*F10::		fileappend time() "	f10	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*F10 up::	fileappend time() "	f10	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*F11::		fileappend time() "	f11	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*F11 up::	fileappend time() "	f11	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*F12::		fileappend time() "	f12	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*F12 up::	fileappend time() "	f12	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*F13::		fileappend time() "	f13	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*F13 up::	fileappend time() "	f13	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*F14::		fileappend time() "	f14	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*F14 up::	fileappend time() "	f14	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*F15::		fileappend time() "	f15	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*F15 up::	fileappend time() "	f15	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*F16::		fileappend time() "	f16	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*F16 up::	fileappend time() "	f16	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*F17::		fileappend time() "	f17	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*F17 up::	fileappend time() "	f17	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*F18::		fileappend time() "	f18	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*F18 up::	fileappend time() "	f18	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*F19::		fileappend time() "	f19	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*F19 up::	fileappend time() "	f19	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*F20::		fileappend time() "	f20	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*F20 up::	fileappend time() "	f20	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*F21::		fileappend time() "	f21	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*F21 up::	fileappend time() "	f21	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*F22::		fileappend time() "	f22	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*F22 up::	fileappend time() "	f22	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*F23::		fileappend time() "	f23	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*F23 up::	fileappend time() "	f23	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*F24::		fileappend time() "	f24	do`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"
~*F24 up::	fileappend time() "	f24	up`n", "C:\Users\ahmet\OneDrive\Desktop\log.txt"


