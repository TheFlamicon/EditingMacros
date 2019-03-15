#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SetWorkingDir C:\AHK\2nd-keyboard\Corsair\
;;This is my directory on my machine but you can set this to be whatever you want
;;Just be sure ANY included files and other scripts are included in this directory or they will not be found

#NoEnv
SendMode Input
#InstallKeybdHook
#UseHook On
#SingleInstance force ;only one instance of this script may run at a time!
#MaxHotkeysPerInterval 2000

;;The lines below are optional. Delete them if you need to.
#HotkeyModifierTimeout 60 ; https://autohotkey.com/docs/commands/_HotkeyModifierTimeout.htm
#KeyHistory 200 ; https://autohotkey.com/docs/commands/_KeyHistory.htm ; useful for debugging.
#MenuMaskKey vk07 ;https://autohotkey.com/boards/viewtopic.php?f=76&t=57683
#WinActivateForce ;https://autohotkey.com/docs/commands/_WinActivateForce.htm ;prevent taskbar flashing.
;;The lines above are optional. Delete them if you need to.

#include C:\AHK\2nd-keyboard\Corsair\PremiereHotTextFix.ahk
;;I will not host this on my GitHub because it is NOT my script, nor did I report this issue.
;;You can find the script here: https://github.com/TaranVH/2nd-keyboard/blob/master/Taran's_Premiere_Mods/PREMIERE_BUG_FIX_for_stubborn_hot_text.ahk
#include C:\AHK\2nd-keyboard\Corsair\Window_Select.ahk
#include C:\AHK\2nd-keyboard\Corsair\PremiereMacros.ahk

;;Some scripts and function names were borrowed from Taran Hemert such as Monomaker and InstantVFX
;;While my background is automation testing, I only edit as a hobby so Taran's scripts were too complex for my liking so my scripts are written for the average newbie editor and as "out of the box" as possible
;;(If I wanted to test Premiere Taran's scripts are MARVELOUS(with exception with very little or no indenting) but this is for hobby use not professional)
;;Be sure to check YOUR preferences in premiere and use the built in window spy for any pixel colours, mouse positions, and shortcuts. Many of MY preferences are still the same as the default but you should still confirm your settings so these scripts work as intented.


;;=====================================;;
;;   CORSAIR K63 RGB Second Keyboard   ;;
;;=====================================;;

#if (getKeyState("F24", "P")) ;<--Everything after this line will only happen on the secondary keyboard that uses F24.
F24::return ;this line is mandatory for proper functionality


;;==================;;
;;   NUM ROW KEYS   ;;
;;==================;;

;;Assigning the Global key variable in this way seems to work more smoothly than assigning it in the function itself. I'm not sure why either, I've even tried something like this with AutoIT and it also can't seem to make up it's mind

`::
1::
	Global CropKey = "1"
	CropVFX("LeftCrop")
	return
2::
	Global CropKey = "2"
	CropVFX("RightCrop")
	return
3::
	Global CropKey = "3"
	CropVFX("TopCrop")
	return
4::
	Global CropKey = "4"
	CropVFX("BottomCrop")
	return
5::
	Global CropKey = "5"
	CropVFX("EdgeFeather")
	return
6::
7::
8::
9::
0::
-::
=::



;;=========================;;
;;      FUNCTION KEYS      ;;
;;=========================;;

;;Assigning the Global key variable in this way seems to work more smoothly than assigning it in the function itself. I'm not sure why either, I've even tried something like this with AutoIT and it also can't seem to make up it's mind

F1::
	Global VFXKey = "F1"
	instantVFX("PositionH")
	return
F2::
	Global VFXKey = "F2"
	instantVFX("PositionV")
	return
F3::
	Global VFXKey = "F3"
	instantVFX("Scale")
	return
F4::
	Global VFXKey = "F4"
	instantVFX("Rotation")
	return
F5::
	Global VFXKey = "F5"
	instantVFX("APHor")
	return
F6::
	Global VFXKey = "F6"
	instantVFX("APVer")
	return
F7::ClickPosition()
F8::ClickCropPosition()
F9::OpenPremiere()
F10::OpenChrome()
F11::OpenNotepadPlusPlus()
F12::OpenPhotoshop()

;;=========================;;
;;    EXTRA FUNCTION KEYS  ;;
;;=========================;;
;;I only use a Corsair profile as a secondary keyboard so if you're using a Hasu to Hasu USB you SHOULD use different keys if you want to assing problematic keys like Pause Break or Scroll Lock. But for MY purposes F13-F23 are more than enough

F13::ReverseClip() 
	;;Assigned to Insert Key;;
F14:: SetToFrame()
	;;Assigned to Home Key;;
F15:: AddFrameHold()
	;;Assigned to Page Up Key;;
F16:: 
	;;Assigned to Delete Key;;
F17:: 
	;;Assigned to End Key;;
F18:: 
	;;Assigned to Page Down Key;;
F19::
F20:: MonoMaker("Left")
	;;Assigned to Print Screen Key
F21:: MonoMaker("Right")
	;;Assigned to Scroll Lock Key
F22::
F23::


;;=========================;;
;;         NUMPAD          ;;
;;=========================;;

;; [numpadhome = 7]   [numpadup = 8]   [numpadpgup = 9]
;; [numpadleft = 4]   [numpadclear = 5]   [numpadright = 6]
;; [numpadend = 1]   [numpaddown = 2]   [numpadpgdn = 3]
;; [numpadins = 0]   [numpad]
;;This commented list is just to visualize what each key represents on the numpad when numlock if OFF

numpadhome:: ApplyFX("Basiccrop")
numpadup:: ApplyFX("VerticalFlip")
numpadpgup:: ApplyFX("HorizontalFlip")
numpadleft:: ApplyFX("DefaultCameraBlur")
numpadclear:: ApplyFX("GaussianBlur")
numpadright:: ApplyFX("BasicLowPassFilter")
numpadend:: ApplyFX("MotionBlur")
numpaddown::
numpadpgdn::
numpadins::
numpaddel::

