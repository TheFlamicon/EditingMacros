SetWorkingDir, C:\AHK\2nd-keyboard\Corsair
;;This is my directory on my machine but you can set this to be whatever you want
;;Just be sure ANY included files and other scripts are included in this directory or they will not be found
#NoEnv
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
#SingleInstance force ;only one instance of this script may run at a time!
#MaxHotkeysPerInterval 2000
#WinActivateForce ;https://autohotkey.com/docs/commands/_WinActivateForce.htm

#IfWinActive ahk_exe Adobe Premiere Pro.exe
;;Functions below will only run if premiere is the active window
;;You should leave this be as running these command in other programs can cause failures and you may need to force the script to close

;;Some scripts and function names were borrowed from Taran Hemert such as Monomaker and InstantVFX
;;While my background is automation testing, I only edit as a hobby so Taran's scripts were too complex for my liking so my scripts are written for the average newbie editor and as "out of the box" as possible
;;(If I wanted to test Premiere Taran's scripts are MARVELOUS(with exception with very little or no indenting) but this is for hobby use not professional)
;;Be sure to check YOUR preferences in premiere and use the built in window spy for any pixel colours, mouse positions, and shortcuts. Many of MY preferences are still the same as the default but you should still confirm your settings so these scripts work as intented.
;;(Alternatively you could download my preferences settings I've added to this very repository ^_^ "Out of the box" is the goal here)

;;In my scripts I chose to end Modifier keys in wrapped & written form.
;;I could make the excuse that it's easier to read for a newcomer to AutoHotKey, the real reason is that; in my experience; premiere didn't play nicely with them and sometimes would even run shortcuts GROSSLY different then what I coded.
::(for example I created a function that used the select panel function, and then simply clicked the position box, and for some reason the shortcut to render was input instead. Very frustrating)

;;Maybe this is a local machine issue but if you see numerous "Sleep" commands and want to call this script too cautious, that's not an unfair assumption I wish I didn't need them. But in this instance where I have placed them is because the script flat out failed or did unwanted steps if I didn't set them
;;I set local variables to match global variables as this caused much less compatibility problems between the Keyboard script and the functions script

;;From this point forward I will only comment on functions and steps that are not related to every step and function. There are unique things you will need to change but again this should be an "out of the box" solution and you should only need to change minor things like mouse positions and colours, all of which are labeled and should be easy for you to use window spy and easily identify
;;Also note I have assigned macros to some functions set as shortcuts in premiere.  I know some would say this is blasphemous but I have small hands and a family history of arthritis and already suffer from carpal tunnel. So most keys are out of my reach as it is and hitting long shortcut keys is painful. so reaching for a macro is quicker and painless. YOU do not need to do this, but I DO.
;;Please do not try and use these functions with AutoIT, it is UNBELIEVABLY rigid, undocumented, and just not as fluid and simple as AutoHotKey
;;Best of luck and have fun.

;;=========================;;
;;   Functions Begin HERE  ;;
;;=========================;;

ReverseClip()
{
	Send {Ctrl Down}r{Ctrl Up}
		Sleep 20
	Send {Tab}{Tab}{Space}{Enter}
return
}

SetToFrame()
{
	Send {Shift Down}{Alt Down}y{Shift Up}{Alt Up}
		Sleep 20
	;;I could memorize this shortcut but I find having a dedicated button is easier on my hands
return
}

AddFrameHold()
{
	Send {Ctrl Down}{Shift Down}^+q{Ctrl Up}{Shift Up}
		Sleep 20
return
}

MonoMaker(Mono)
{
	Channel = %Mono%
	MouseGetPos, OrgPosX, OrgPosY
	Send {Shift Down}g{Shift Up}
		Sleep 420
		;;Time it takes for the 'Modify Clip' window to appear on MY machine, this will take tinkering on your end.

	if Channel = Left
	{
		MouseMove, 112, 252
			Sleep 10
		MouseClick left
	}
	
	if Channel = Right
	{
		MouseMove, 137, 226
			Sleep 10
		MouseClick left
	}
	
	Sleep 5
	Send {Enter}
	
return
}


SelectPanel(Panel) ;;This is NOT assigned to a key but I've written it out as its own function because it is used enough times repeatedly it saves script space
{	
	PremierePanel = %Panel%
	if PremierePanel = Timeline
	{
		Send {Shift Down}3{Shift Up}	
			Sleep 2
	}
	if PremierePanel = Effects
	{
		Send {Shift Down}7{Shift Up}
			Sleep 2
	}
	if PremierePanel = EffectsControl
	{
		SendInput {Shift Down}5{Shift Up}
			Sleep 2
	}	
	
;Endof SelectPanel
return
}



SearchFX(FX) ;;Again NOT assigned to any key but is written as its own function to save script space and IN CASE I want to use it for new functions in future
{
	Searched = %FX%
	BlockInput, sendandmouse
	BlockInput, MouseMove
	BlockInput, On

	SelectPanel("Effects")
		Sleep 5
	Send {Ctrl Down}{Shift Down}b{Shift Up}{Ctrl Up}
		Sleep 20
	Send {Ctrl Down}a{Ctrl Up}
		Sleep 20
	Send {Shift Down}{Backspace}{Shift Up}
		Sleep 20
	Send %FX%
		Sleep 20
	
	BlockInput, MouseMoveOff
	BlockInput Off
	
return
}


ApplyFX(FX2)
{
	BlockInput, sendandmouse
	BlockInput, MouseMove
	BlockInput, On
	MouseGetPos OrgPosX, OrgPosY
	
	SearchedFX = %FX2%
	SearchFX(SearchedFX)
		Sleep 10
	MouseClickDrag, Left, 80, 150, OrgPosX, OrgPosY
		Sleep 20
	
	SelectPanel("Effects")
	Send {Ctrl Down}{Shift Down}b{Shift Up}{Ctrl Up}
		Sleep 20
	Send {Ctrl Down}a{Ctrl Up}
		Sleep 20
	Send {Shift Down}{Backspace}{Shift Up}
		Sleep 20 
	MouseClick Left
	
	SelectPanel("Timeline")
		Sleep 20
	MouseMove, OrgPosX, OrgPosY

	BlockInput, MouseMoveOff
	BlockInput Off
return
}

;;The next two below function are script savers BUT these could be used and changed around for ANY twirl/untwirl button but I haven't thouroughly used them for most effets controls as of yet.
TwirlUntwirl()
{
	MouseGetPos, TwirlBegX, TwirlBegY
	MouseMove, 328, 160
	PixelGetColor, Colour, 328, 160
	if (Colour = "0x303030") ;;This means Motion Effect is twirled and needs to be untwirled
	{
		MouseClick Left
			Sleep 20
		return
	}
	else if (Colour = "0x1D1D1D") ;;This means motion effect is untwirled and program can proceed
	{
		;;Do Nothing
	}
	return
}

ReverseTwirlUntwirl() ;;Does what TwirlUntwirl() does, just in reverse
{
	MouseGetPos, TwirlBegX, TwirlBegY
	MouseMove, 328, 160
	PixelGetColor, Colour, 328, 160
	if (Colour = "0x1D1D1D") ;;This means Motion Effect is twirled and needs to be untwirled
	{
		MouseClick Left
			Sleep 20
		return
	}
	else if (Colour = "0x303030") ;;This means motion effect is untwirled and program can proceed
	{
		ToolTip, TwirledToolTip, 100, 150
		ToolTip, Motion is Twirled
		SetTimer, RemoveToolTip2, -400
		return
		
		RemoveToolTip2:
		ToolTip
		return
	}
	return
}
	
InstantVFX(foobar)
{
	BlockInput, MouseMove
	BlockInput, sendandmouse
	BlockInput, On
	MouseGetPos, StartX, StartY
	HotText = %foobar%
	
	SelectPanel("EffectsControl")
		Sleep 20
	
	TwirlUntwirl()
	
	if HotText = PositionH
	{
		MouseMove, 538, 181
	}
	
	if HotText = PositionV
	{
		MouseMove, 587, 181
	}
	
	if HotText = Scale
	{
		MouseMove, 538, 201
	}
	
	if HotText = Rotation
	{
		MouseMove, 531, 265
	}
	
	if HotText = APHor
	{
		MouseMove, 392, 180
			Sleep 200
		MouseClick Left
			Sleep 200
		MouseMove, 536, 286
	}
	
	if HotText = APVer
	{
		MouseMove, 392, 180
			Sleep 200
		MouseClick Left
			Sleep 200
		MouseMove, 585, 286
	}
	
	
	Click Down Left
	
	GetKeyState, VFXPressed, %VFXKey%, P

	if VFXPressed = U
	{
		Click Up Left
			Sleep 20
		goto EndOfInstantVFX
	}
	
	Loop
	{
		BlockInput, Off
		BlockInput, MouseMoveOff
			Sleep 20
		GetKeyState, State, %VFXKey%, P
		
		if State = U
		{
			Click Up Left
				Sleep 20
			goto EndOfInstantVFX
		}
	}
	
	EndofInstantVFX:
	SelectPanel("Timeline")
		Sleep 20
	MouseMove, StartX, StartY
	return
}


CropVFX(CropBar) ;;May require changes down the line as this function assumes the effect "Crop" is the only effect I have added to a clip. Normally while I am editing this IS the case I normally crop what I need before anything else, but this is not a futureproofed function.
{
	BlockInput, MouseMove
	BlockInput, sendandmouse
	BlockInput, On
	MouseGetPos, StartX, StartY
	CropHotText = %CropBar%
	
	SelectPanel("EffectsControl")
		Sleep 20
	
	ReverseTwirlUntwirl()
	
	if CropHotText = LeftCrop
	{
		MouseMove, 536, 349
	}
	
	if CropHotText = RightCrop
	{
		MouseMove, 536, 392
	}
	
	if CropHotText = TopCrop
	{
		MouseMove, 536, 370
	}
	
	if CropHotText = BottomCrop
	{
		MouseMove, 536, 411
	}
	
	if CropHotText = EdgeFeather
	{
		MouseMove, 528, 454
	}
	
	Click Down Left
	
	GetKeyState, CropKeyPressed, %CropKey%, P

	if CropKeyPressed = U
	{
		Click Up Left
			Sleep 20
		goto EndOfCropVFX
	}
	
	Loop
	{
		BlockInput, Off
		BlockInput, MouseMoveOff
			Sleep 20
		GetKeyState, CropState, %CropKey%, P
		
		if CropState = U
		{
			Click Up Left
				Sleep 20
			goto EndOfCropVFX
		}
	}
	
	EndOfCropVFX:
	TwirlUntwirl()
	SelectPanel("Timeline")
		Sleep 20
	MouseMove, StartX, StartY
	return
}

ClickPosition() ;;For times when I just want full control in the preview window over the position of a clip.
{
	SelectPanel("EffectsControl")
	MouseGetPos, XX,YY
	MouseMove, 392, 180
		Sleep 200
	MouseClick Left
		Sleep 20
	SelectPanel("Timeline")
	MouseMove, XX, YY
return
}

ClickCropPosition() ;;More times than not I end up adjusting the crop manually in the preview window.
{
	SelectPanel("EffectsControl")
	MouseGetPos, XX,YY
	ReverseTwirlUntwirl()
	MouseMove, 402, 307
		Sleep 20
	MouseClick Left
		Sleep 20
	SelectPanel("Timeline")
	MouseMove, XX, YY
return
}
