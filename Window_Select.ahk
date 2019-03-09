#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance force

;;I chose to keep this list of functions seperate from the Premiere Macros mostly because I like to have everything organized for specific use cases, I'm a tester sue me

OpenPremiere()
{
IfWinNotExist, ahk_class Premiere Pro
	Run Adobe Premiere Pro.exe
if WinActive("ahk_class Premiere Pro")
	WinActivate ahk_class Premiere Pro
else
	WinActivate ahk_class Premiere Pro
return
}

OpenPhotoshop()
{
IfWinNotExist, ahk_class Photoshop
	Run, Photoshop.exe
if WinActive("ahk_class Photoshop")
	WinActivate ahk_class Photoshop
else
	WinActivate ahk_class Photoshop
return
}

OpenNotepadPlusPlus()
{
IfWinNotExist, ahk_class Notepad++
	Run, notepad++.exe
if WinActive("ahk_exe notepad++")
	WinActivate ahk_class Notepad++
else
	WinActivate ahk_class Notepad++
return
}

OpenChrome()
{
IfWinNotExist, ahk_class Chrome_WidgetWin_1
	Run, chrome.exe
if WinActive("ahk_exe chrome.exe")
	Sendinput ^{tab}
else
	WinActivate ahk_class Chrome_WidgetWin_1
return
}