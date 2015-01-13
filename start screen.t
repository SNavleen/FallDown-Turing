colorback (black)
cls

proc title
    Font.Draw ("Fall Down!", font (1).x, font (1).y, F, 10)
    Font.Draw ("Play", font (2).x, font (2).y, F2, 14)
    Font.Draw ("Settings", font (3).x, font (3).y, F2, 12)
end title

proc setting
    Font.Draw ("Sound", font (4).x, font (4).y, F2, 45)
    Font.Draw ("Platform Color", font (5).x, font (5).y, F2, 52)
    Font.Draw ("Ball color", font (6).x, font (6).y, F2, 13)
end setting

proc sounds
    if on = true and off = false then
	Font.Draw ("On", font (7).x, font (7).y, F2, 42)
	Font.Draw ("OFF", font (8).x, font (8).y, F2, 9)
    elsif off = true and on = false then
	Font.Draw ("On", font (7).x, font (7).y, F2, 9)
	Font.Draw ("OFF", font (8).x, font (8).y, F2, 42)
    end if
end sounds

proc Pcolor
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



title
loop
    buttonwait ("down", mouse.x, mouse.y, mouse.b, mouse.b)
    if mouse.x > font (2).x and mouse.x < font (2).x + 90 and mouse.y > font (2).y - 15 and mouse.y < font (2).y + 35 then
	exit
    elsif mouse.x > font (3).x and mouse.x < font (3).x + 145 and mouse.y > font (3).y - 15 and mouse.y < font (3).y + 30 then
	setting
	View.Update
	loop
	    buttonwait ("down", mouse.x, mouse.y, mouse.b, mouse.b)
	    if mouse.x > font (4).x and mouse.x < font (4).x + 115 and mouse.y > font (4).y - 5 and mouse.y < font (4).y + 30 then
		sounds
		View.Update
		loop
		    buttonwait ("down", mouse.x, mouse.y, mouse.b, mouse.b)
		    if mouse.x > font (7).x and mouse.x < font (7).x + 50 and mouse.y > font (7).y and mouse.y < font (7).y + 35 then
			cls
			title
			setting
			on := true
			off := false
			Font.Draw ("On", font (7).x, font (7).y, F2, 42)
			Font.Draw ("OFF", font (8).x, font (8).y, F2, 9)
			View.Update
		    elsif mouse.x > font (8).x and mouse.x < font (8).x + 100 and mouse.y > font (8).y - 10 and mouse.y < font (8).y + 35 then
			cls
			title
			setting
			on := false
			off := true
			Font.Draw ("On", font (7).x, font (7).y, F2, 9)
			Font.Draw ("OFF", font (8).x, font (8).y, F2, 42)
			View.Update
		    elsif mouse.x > font (4).x and mouse.x < font (4).x + 115 and mouse.y > font (4).y - 5 and mouse.y < font (4).y + 30 then
			cls
			title
			setting
			View.Update
			exit
		    end if
		end loop
	    elsif mouse.x > font (5).x and mouse.x < font (5).x + 265 and mouse.y > font (5).y - 15 and mouse.y < font (4).y + 35 then
		Pcolor
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
		    buttonwait ("down", mouse.x, mouse.y, mouse.b, mouse.b)
		    if mouse.x > 340 and mouse.x < 370 and mouse.y > 200 and mouse.y < 220 then
			Pcolor
			Draw.FillBox (340, 200, 370, 220, 10)
			View.Update
			colors (1).outside := 10
			colors (1).inside := 18
		    elsif mouse.x > 390 and mouse.x < 420 and mouse.y > 200 and mouse.y < 220 then
			Pcolor
			Draw.FillBox (390, 200, 420, 220, 12)
			View.Update
			colors (1).outside := 12
			colors (1).inside := 18
		    elsif mouse.x > 440 and mouse.x < 470 and mouse.y > 200 and mouse.y < 220 then
			Pcolor
			Draw.FillBox (440, 200, 470, 220, 14)
			View.Update
			colors (1).outside := 14
			colors (1).inside := 18
		    elsif mouse.x > 490 and mouse.x < 520 and mouse.y > 200 and mouse.y < 220 then
			Pcolor
			Draw.FillBox (490, 200, 520, 220, 13)
			View.Update
			colors (1).outside := 13
			colors (1).inside := 18
		    elsif mouse.x > 540 and mouse.x < 570 and mouse.y > 200 and mouse.y < 220 then
			Pcolor
			Draw.FillBox (540, 200, 570, 220, 41)
			View.Update
			colors (1).outside := 41
			colors (1).inside := 18
		    elsif mouse.x > font (5).x and mouse.x < font (5).x + 265 and mouse.y > font (5).y - 15 and mouse.y < font (4).y + 35 then
			cls
			title
			setting
			View.Update
			exit
		    end if
		end loop
	    elsif mouse.x > font (6).x and mouse.x < font (6).x + 165 and mouse.y > font (6).y - 5 and mouse.y < font (4).y + 35 then
		Bcolor
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
		    buttonwait ("down", mouse.x, mouse.y, mouse.b, mouse.b)
		    if mouse.x > 340 and mouse.x < 370 and mouse.y > 125 and mouse.y < 145 then
			Bcolor
			Draw.FillBox (340, 125, 370, 145, 10)
			View.Update
			ball (1).c1 := 10
			ball (1).c2 := 120
		    elsif mouse.x > 390 and mouse.x < 420 and mouse.y > 125 and mouse.y < 145 then
			Bcolor
			Draw.FillBox (390, 125, 420, 145, 12)
			View.Update
			ball (1).c1 := 12
			ball (1).c2 := 112
		    elsif mouse.x > 440 and mouse.x < 470 and mouse.y > 125 and mouse.y < 145 then
			Bcolor
			Draw.FillBox (440, 125, 470, 145, 14)
			View.Update
			ball (1).c1 := 14
			ball (1).c2 := 115
		    elsif mouse.x > 490 and mouse.x < 520 and mouse.y > 125 and mouse.y < 145 then
			Bcolor
			Draw.FillBox (490, 125, 520, 145, 13)
			View.Update
			ball (1).c1 := 13
			ball (1).c2 := 108
		    elsif mouse.x > 540 and mouse.x < 570 and mouse.y > 125 and mouse.y < 145 then
			Bcolor
			Draw.FillBox (540, 125, 570, 145, 41)
			View.Update
			ball (1).c1 := 41
			ball (1).c2 := 114
		    elsif mouse.x > font (6).x and mouse.x < font (6).x + 165 and mouse.y > font (6).y - 5 and mouse.y < font (4).y + 35 then
			cls
			title
			setting
			View.Update
			exit
		    end if
		end loop
	    elsif mouse.x > font (3).x and mouse.x < font (3).x + 145 and mouse.y > font (3).y - 15 and mouse.y < font (3).y + 30 then
		cls
		title
		View.Update
		exit
	    end if
	end loop
    end if
end loop
