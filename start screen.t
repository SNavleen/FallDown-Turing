%SETS THE BACKGROUND COLOUR TO BLACK
colorback (255)
cls

proc title
    %DRAWS THE TITLE AND THE FIRST TWO OPPTIONS ONCE THE PROCDURES IS RUN
    Font.Draw ("Fall Down!", font (1).x, font (1).y, F, 10)
    Font.Draw ("Play", font (2).x, font (2).y, F2, 14)
    Font.Draw ("Settings", font (3).x, font (3).y, F2, 12)
end title

proc setting
    %DRAW THE NEXT THREE OPPTIONS IF SETTINGS IS PRESSED
    Font.Draw ("Power", font (4).x, font (4).y, F2, 45)
    Font.Draw ("Platform Color", font (5).x, font (5).y, F2, 52)
    Font.Draw ("Ball color", font (6).x, font (6).y, F2, 13)
end setting

proc POWER
    %IF POWER OPPTION THE IT OPENS THE NEXT TWO OPPTIONS (ON&OFF)
    %THE DEFAULT IS ON
    %CHECKS IF THE LAST OPPTIONS WAS ON OR OFF
    if on = true and off = false then
	Font.Draw ("On", font (7).x, font (7).y, F2, 42)
	Font.Draw ("OFF", font (8).x, font (8).y, F2, 9)
    elsif off = true and on = false then
	Font.Draw ("On", font (7).x, font (7).y, F2, 9)
	Font.Draw ("OFF", font (8).x, font (8).y, F2, 42)
    end if
end POWER

proc Pcolor
    %FOR THE OPPTION PLATFORMS COLOUR
    %THE COLOUR BOXES ARE DRAWN FOR THE PLATFORMS
    Draw.FillBox (340, 200, 370, 220, black)
    Draw.FillBox (390, 200, 420, 220, black)
    Draw.FillBox (440, 200, 470, 220, black)
    Draw.FillBox (490, 200, 520, 220, black)
    Draw.FillBox (540, 200, 570, 220, black)
    Draw.Box (340, 200, 370, 220, 10)
    Draw.Box (390, 200, 420, 220, 12)
    Draw.Box (440, 200, 470, 220, 14)
    Draw.Box (490, 200, 520, 220, 13)
    Draw.Box (540, 200, 570, 220, 41)
end Pcolor

proc Bcolor
    %FOR THE OPPTION BALL COLOUR
    %THE COLOUR BOXES ARE DRAWN FOR THE PLAYERS COLOUR
    Draw.FillBox (340, 125, 370, 145, black)
    Draw.FillBox (390, 125, 420, 145, black)
    Draw.FillBox (440, 125, 470, 145, black)
    Draw.FillBox (490, 125, 520, 145, black)
    Draw.FillBox (540, 125, 570, 145, black)
    Draw.Box (340, 125, 370, 145, 10)
    Draw.Box (390, 125, 420, 145, 12)
    Draw.Box (440, 125, 470, 145, 14)
    Draw.Box (490, 125, 520, 145, 13)
    Draw.Box (540, 125, 570, 145, 41)
end Bcolor


%RUNS THE PROCEDURE TITLE
title
loop
    %WAIT FOR MOUSE BUTTON DOWN
    buttonwait ("down", mouse.x, mouse.y, mouse.b, mouse.b)
    if mouse.x > font (2).x and mouse.x < font (2).x + 90 and mouse.y > font (2).y - 15 and mouse.y < font (2).y + 35 then
	%EXIT WHEN THE PLAY OPPTION IS CLICKED
	exit
    elsif mouse.x > font (3).x and mouse.x < font (3).x + 145 and mouse.y > font (3).y - 15 and mouse.y < font (3).y + 30 then
	%RUN THE PROCEDURE NAMED (SETTING) WHEN THE SETTING OPPTION IS CLICKED
	setting
	%UPDATE THE SCREEN SO YOU CAN SEE THE NEXT SET OF OPPTIONS
	View.Update
	loop
	    %WAIT FOR MOUSE BUTTON DOWN FOR THE NEXT SET OF OPPTIONS
	    buttonwait ("down", mouse.x, mouse.y, mouse.b, mouse.b)
	    if mouse.x > font (4).x and mouse.x < font (4).x + 115 and mouse.y > font (4).y - 5 and mouse.y < font (4).y + 30 then
		%RUN PROCEDURE(POWER) IF THE POWER OPPTION IS PRESSED
		POWER
		%UPDATE THE SCREEN
		View.Update
		loop
		    %WAIT FOR BUTTON TO BE PRESSED
		    buttonwait ("down", mouse.x, mouse.y, mouse.b, mouse.b)
		    if mouse.x > font (7).x and mouse.x < font (7).x + 50 and mouse.y > font (7).y and mouse.y < font (7).y + 35 then
			%WHEN THE ON BUTTON IS SELECTED THEN THE ON FUNCTION IS TRUE AND THE OFF FUNCTION IS FALSE
			cls
			%RUN ALL THE PROCEDURES SO EVERYTHING IS STILL IS THERE AFTER THE (CLS)
			title
			setting
			on := true
			off := false
			Font.Draw ("On", font (7).x, font (7).y, F2, 42)
			Font.Draw ("OFF", font (8).x, font (8).y, F2, 9)
			%UPDATE THE SCREEN
			View.Update
		    elsif mouse.x > font (8).x and mouse.x < font (8).x + 100 and mouse.y > font (8).y - 10 and mouse.y < font (8).y + 35 then
			%WHEN THE OFF BUTTON IS SELECTED THEN THE OFF FUNCTION IS TRUE AND THE ON FUNCTION IS FALSE
			cls
			%RUN ALL THE PROCEDURES SO EVERYTHING IS STILL IS THERE AFTER THE (CLS)
			title
			setting
			on := false
			off := true
			Font.Draw ("On", font (7).x, font (7).y, F2, 9)
			Font.Draw ("OFF", font (8).x, font (8).y, F2, 42)
			%UPDATE THE SCREEN
			View.Update
		    elsif mouse.x > font (4).x and mouse.x < font (4).x + 115 and mouse.y > font (4).y - 5 and mouse.y < font (4).y + 30 then
			%WHEN THE POWER OPPTION IS SELECTED AGAIN THEN EXIT OUT OF THE POWER OPPTION
			cls
			title
			setting
			View.Update
			exit
		    end if
		end loop
	    elsif mouse.x > font (5).x and mouse.x < font (5).x + 265 and mouse.y > font (5).y - 15 and mouse.y < font (4).y + 35 then
		%RUN THE PROCEDURE (Pcolor)
		Pcolor
		%DEFINE EACH COLOR
		if colors (1).outside = 10 then
		    Draw.FillBox (340, 200, 370, 220, 10)
		elsif colors (1).outside = 12 then
		    Draw.FillBox (390, 200, 420, 220, 12)
		elsif colors (1).outside = 14 then
		    Draw.FillBox (440, 200, 470, 220, 14)
		elsif colors (1).outside = 13 then
		    Draw.FillBox (490, 200, 520, 220, 13)
		elsif colors (1).outside = 41 then
		    Draw.FillBox (540, 200, 570, 220, 41)
		end if
		View.Update
		loop
		    %SELECT THE COLOR YOU WHISH FOR THE PLATFORMS
		    buttonwait ("down", mouse.x, mouse.y, mouse.b, mouse.b)
		    if mouse.x > 340 and mouse.x < 370 and mouse.y > 200 and mouse.y < 220 then
			/*10-GREEN*/
			Pcolor
			Draw.FillBox (340, 200, 370, 220, 10)
			View.Update
			colors (1).outside := 10
			colors (1).inside := 18
		    elsif mouse.x > 390 and mouse.x < 420 and mouse.y > 200 and mouse.y < 220 then
			/*12-RED*/
			Pcolor
			Draw.FillBox (390, 200, 420, 220, 12)
			View.Update
			colors (1).outside := 12
			colors (1).inside := 18
		    elsif mouse.x > 440 and mouse.x < 470 and mouse.y > 200 and mouse.y < 220 then
			/*14-YELLOW*/
			Pcolor
			Draw.FillBox (440, 200, 470, 220, 14)
			View.Update
			colors (1).outside := 14
			colors (1).inside := 18
		    elsif mouse.x > 490 and mouse.x < 520 and mouse.y > 200 and mouse.y < 220 then
			/*13-PURPLE*/
			Pcolor
			Draw.FillBox (490, 200, 520, 220, 13)
			View.Update
			colors (1).outside := 13
			colors (1).inside := 18
		    elsif mouse.x > 540 and mouse.x < 570 and mouse.y > 200 and mouse.y < 220 then
			/*41-ORANGE*/
			Pcolor
			Draw.FillBox (540, 200, 570, 220, 41)
			View.Update
			colors (1).outside := 41
			colors (1).inside := 18
		    elsif mouse.x > font (5).x and mouse.x < font (5).x + 265 and mouse.y > font (5).y - 15 and mouse.y < font (4).y + 35 then
			%WHEN THE Pcolor OPPTION IS SELECTED AGAIN THEN EXIT OUT OF THE PLATFORMS OPPTION
			cls
			title
			setting
			View.Update
			exit
		    end if
		end loop
	    elsif mouse.x > font (6).x and mouse.x < font (6).x + 165 and mouse.y > font (6).y - 5 and mouse.y < font (4).y + 35 then
		%RUN THE (Bcolor)PROCEDURE
		Bcolor
		%DEFINE EACH COLOUR
		if ball (1).c1 = 10 then
		    Draw.FillBox (340, 125, 370, 145, 10)
		elsif ball (1).c1 = 12 then
		    Draw.FillBox (390, 125, 420, 145, 12)
		elsif ball (1).c1 = 14 then
		    Draw.FillBox (440, 125, 470, 145, 14)
		elsif ball (1).c1 = 13 then
		    Draw.FillBox (490, 125, 520, 145, 13)
		elsif ball (1).c1 = 41 then
		    Draw.FillBox (540, 125, 570, 145, 41)
		end if
		View.Update
		loop
		    %SELECT THE COLOR YOU WHISH FOR THE PLAYER'S BALL TO BE
		    buttonwait ("down", mouse.x, mouse.y, mouse.b, mouse.b)
		    if mouse.x > 340 and mouse.x < 370 and mouse.y > 125 and mouse.y < 145 then
			/*10-GREEN*/
			Bcolor
			Draw.FillBox (340, 125, 370, 145, 10)
			View.Update
			ball (1).c1 := 10
			ball (1).c2 := 120
		    elsif mouse.x > 390 and mouse.x < 420 and mouse.y > 125 and mouse.y < 145 then
			/*12-RED*/
			Bcolor
			Draw.FillBox (390, 125, 420, 145, 12)
			View.Update
			ball (1).c1 := 12
			ball (1).c2 := 112
		    elsif mouse.x > 440 and mouse.x < 470 and mouse.y > 125 and mouse.y < 145 then
			/*14-YELLOW*/
			Bcolor
			Draw.FillBox (440, 125, 470, 145, 14)
			View.Update
			ball (1).c1 := 14
			ball (1).c2 := 115
		    elsif mouse.x > 490 and mouse.x < 520 and mouse.y > 125 and mouse.y < 145 then
			/*13-PURPLE*/
			Bcolor
			Draw.FillBox (490, 125, 520, 145, 13)
			View.Update
			ball (1).c1 := 13
			ball (1).c2 := 108
		    elsif mouse.x > 540 and mouse.x < 570 and mouse.y > 125 and mouse.y < 145 then
			/*41-ORANGE*/
			Bcolor
			Draw.FillBox (540, 125, 570, 145, 41)
			View.Update
			ball (1).c1 := 41
			ball (1).c2 := 114
		    elsif mouse.x > font (6).x and mouse.x < font (6).x + 165 and mouse.y > font (6).y - 5 and mouse.y < font (4).y + 35 then
			%WHEN THE Bcolor OPPTION IS SELECTED AGAIN THEN EXIT OUT OF THE BALL COLOUR OPPTION
			cls
			title
			setting
			View.Update
			exit
		    end if
		end loop
	    elsif mouse.x > font (3).x and mouse.x < font (3).x + 145 and mouse.y > font (3).y - 15 and mouse.y < font (3).y + 30 then
		%WHEN THE setting OPPTION IS SELECTED AGAIN THEN EXIT OUT OF THE SETTING OPPTION
		cls
		title
		View.Update
		exit
	    end if
	end loop
    end if
end loop
