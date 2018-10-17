; # - windows key
; ^ - control
; +  - shift
; ! - alt

;set hotstrings to work only with TAB
#Hotstring EndChars `t


;path customization
work_machine := true  
dropbox_folder := ""


;// run at startup everywhere
;Run %dropbox_folder%utilities\mouseemu\mousemu.exe
;Run %dropbox_folder%utilities\ddm\ddmm.exe

dropbox_folder := "c:\dropbox\"
Run c:\Program Files\ConEmu\conemu64.exe 
Run %dropbox_folder%utilities\winsplit\winsplit.exe
Run %dropbox_folder%utilities\arsclip\arsclip.exe
Run %dropbox_folder%utilities\mouseemu\mousemu.exe


^#F1::Run ::{645ff040-5081-101b-9f08-00aa002f954e}
^#F2::Run control
^#F3::Run control Sysdm.cpl
^#F4::Run control ncpa.cpl
^#F5::Run control appwiz.cpl
^#F6::Run control desk.cpl
^#F7::Run control admintools



^+h::
{	
	if toggle := !toggle
	{
		  WinHide ahk_class Shell_TrayWnd
		  WinHide Start ahk_class Button
	}
	else
	{
		  WinShow ahk_class Shell_TrayWnd
	 	 WinShow Start ahk_class Button
	}
	return
}


^#s::
{

	IfWinExist, Conemu
	{
		 WinActivate  
		 return
	}

	Run C:\Program Files\ConEmu\conemu64.exe
	Return
}


^#t::
{
	IfWinExist, musikcube
	{
		 WinActivate  
		 return
	}
	
	Run %dropbox_folder%utilities\musikcube\musikcube.exe
	return
}


^#9::Run chrome.exe
^#2::Run opera.exe
^#5::Run inetmgr.exe
^#6::Run %dropbox_folder%utilities\database\database4.exe

^#z::Run C:\Program Files\Microsoft VS Code\Code.exe
^#v::Run C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\Common7\IDE\devenv.exe /nosplash
^#i::Run powershell.exe "start microsoft-edge:"
^#n::Run %dropbox_folder%utilities\notepad2.exe
^#g::Run C:\Program Files\Mozilla Firefox\firefox.exe
^#w::Run %dropbox_folder%utilities\foobar2000\foobar2000.exe

^#q::
{
	if(main_machine = true)
	{
		Run %dropbox_folder%utilities\totalcmd\totalcmd64.exe /i=%dropbox_folder%utilities\totalcmd\wincmd_home.ini
	}
	else
	{
		Run %dropbox_folder%utilities\totalcmd\totalcmd64.exe /i=%dropbox_folder%utilities\totalcmd\wincmd_work.ini
	}
	Return
}


;//restart explorer
^+#e::
{
	Run pskill explorer
	Sleep 50
	Run explorer.exe
	return
}



;search selected text on google
^+c::
{
	Send, ^c
	Sleep 50
	Run, https://www.google.com/search?q=%clipboard%
	Return
}


;open selected text in browser
^+v::
{
	Send, ^c
	Sleep 50
	Run %clipboard%
	Return
}



;mute 
^+End::
{
	Send {Volume_Mute}
	return
}

;volume up/down
^+PgUp::
{
	Send {Volume_Up}
	return
}


^+PgDn::
{
	Send {Volume_Down}
	return
}

;turn off monitor
;^+#s::
;{
;	;Sleep 1000
;	;SendMessage,0x112,0xF170,1,,Program Manager
;	run, %dropbox_folder%utilities\nircmd cmdwait 1000 monitor off	
;	return
;}


;windowed full screen implementation
^+#F1::
{
	WinGet, TempWindowID, ID, A
	If (WindowID != TempWindowID)
	{
	  WindowID:=TempWindowID
	  WindowState:=0
	}
	If (WindowState != 1)
	{
	  WinGetPos, WinPosX, WinPosY, WindowWidth, WindowHeight, ahk_id %WindowID%
	  WinSet, Style, ^0xC40000, ahk_id %WindowID%
	  WinMove, ahk_id %WindowID%, , 0, 0, A_ScreenWidth, A_ScreenHeight
	}
	Else
	{
	  WinSet, Style, ^0xC40000, ahk_id %WindowID%
	  WinMove, ahk_id %WindowID%, , WinPosX, WinPosY, WindowWidth, WindowHeight
	}
	WindowState:=!WindowState
	return
}

;//select word
!+^a::
{
	Send, {LButton 2}^c
	return
}

;//select entire paragraph
!+^s::
{
	Send {LButton}
	Send {LButton 2}^c
	return
}


;//always on top switchable
^+#t::
{
    ActiveHwnd := WinExist("A")
    WinGetTitle, WindowTitle, ahk_id %ActiveHwnd%
    WinGet, ExStyle, ExStyle, ahk_id %ActiveHwnd%
    if (ExStyle & 0x8)
        OnTop=1
    else
        OnTop=0
    Winset, AlwaysOnTop, Toggle, ahk_id %ActiveHwnd%

    StringReplace, WindowTitle, WindowTitle, %A_Space%- (Pinned)
    if not OnTop
      WindowTitle:=WindowTitle . " - (Pinned)"

}


;//empty recycle bin
^+#1::
{
	FileRecycleEmpty, C:\ 
	FileRecycleEmpty, D:\ 
	Return
}



;//hotstrings
::br::
(
Best regards,
Marius
)


;//hide titlebar
!+^h::
{
  WinSet, Style, -0xC00000, A

  return
;
}


;//edit this file
#^+f12:: Edit

;//reload autohotkey config file
#^+f11::
  SoundPlay *64
  Reload
  Sleep 1000
  MsgBox 4, , Script reloaded unsuccessful, open it for editing?
  IfMsgBox Yes, Edit
return
