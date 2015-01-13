setscreen ("offscreenonly;position:center;middle;nobuttonbar;title: Fall Down;graphics:600;600")
colorback (black)
cls
var drawn : boolean := false
var down : flexible array 1 .. 0 of int
type barries :
    record
	left, right, inside, outside, r : int
	top, bottom : real
    end record
var platforms, ran : flexible array 1 .. 0 of barries
var colors : array 1 .. 1 of barries
colors (1).inside := 18
colors (1).outside := 10
var a : array 1 .. 12 of int

proc random
    new ran, 12
    for i : 1 .. upper (ran) by 6
	randint (ran (i).r, 0, 390)
    end for
    for i : 2 .. upper (ran) by 6
	randint (ran (i).r, 0, 190)
    end for
    for i : 3 .. upper (ran) by 6
	randint (ran (i).r, 0, 432)
    end for
    for i : 4 .. upper (ran) by 6
	randint (ran (i).r, 0, 382)
    end for
    for i : 5 .. upper (ran) by 6
	randint (ran (i).r, 0, 489)
    end for
    for i : 6 .. upper (ran) by 6
	randint (ran (i).r, 0, 132)
    end for
end random

proc level1
    random
    new down, 12

    for j : 1 .. upper (down)
	down (j) := 550
	down (j) := down (j) - (j * 100)
    end for


    if drawn = false then
	new platforms, 14

	platforms (1).left := 0
	platforms (1).bottom := down (1)
	platforms (1).right := ran (1).r
	platforms (1).top := down (1) + 15

	platforms (2).left := ran (1).r + 35
	platforms (2).bottom := down (1)
	platforms (2).right := 600
	platforms (2).top := down (1) + 15

	platforms (3).left := 0
	platforms (3).bottom := down (2)
	platforms (3).right := ran (2).r
	platforms (3).top := down (2) + 15

	platforms (4).left := ran (2).r + 35
	platforms (4).bottom := down (2)
	platforms (4).right := 600
	platforms (4).top := down (2) + 15

	platforms (5).left := 0
	platforms (5).bottom := down (3)
	platforms (5).right := ran (3).r
	platforms (5).top := down (3) + 15

	platforms (6).left := ran (3).r + 35
	platforms (6).bottom := down (3)
	platforms (6).right := 600
	platforms (6).top := down (3) + 15

	platforms (7).left := 0
	platforms (7).bottom := down (4)
	platforms (7).right := ran (4).r
	platforms (7).top := down (4) + 15

	platforms (8).left := ran (4).r + 35
	platforms (8).bottom := down (4)
	platforms (8).right := 600
	platforms (8).top := down (4) + 15

	platforms (9).left := 0
	platforms (9).bottom := down (5)
	platforms (9).right := ran (5).r
	platforms (9).top := down (5) + 15

	platforms (10).left := ran (5).r + 35
	platforms (10).bottom := down (5)
	platforms (10).right := 600
	platforms (10).top := down (5) + 15

	platforms (11).left := 0
	platforms (11).bottom := down (6)
	platforms (11).right := ran (6).r
	platforms (11).top := down (6) + 15

	platforms (12).left := ran (6).r + 35
	platforms (12).bottom := down (6)
	platforms (12).right := 600
	platforms (12).top := down (6) + 15

	platforms (13).left := 0
	platforms (13).bottom := down (7)
	platforms (13).right := ran (7).r
	platforms (13).top := down (7) + 15

	platforms (14).left := ran (7).r + 35
	platforms (14).bottom := down (7)
	platforms (14).right := 600
	platforms (14).top := down (7) + 15

	drawn := true

    end if

    /*for i : 1 .. upper (platforms)
     if ball (1).x >= platforms (i).left and ball (1).x <= platforms (i).right and
     ball (1).y >= platforms (i).bottom and ball (1).y <= platforms (i).top + ball (1).r + 2 then
     ball (1).y := round (platforms (i).top) + ball (1).r + 4
     vel (1).y := 0
     ground (1) := true
     end if
     end for*/
    for i : 1 .. upper (platforms)
	Draw.FillBox (platforms (i).left, round (platforms (i).bottom), platforms (i).right, round (platforms (i).top), colors (1).inside)
	Draw.Box (platforms (i).left + 1, round (platforms (i).bottom) + 1, platforms (i).right - 1, round (platforms (i).top) - 1, colors (1).outside)
	if platforms (i).bottom >= maxy then
	    random
	    platforms (i).bottom := -100
	    platforms (i).top := -100 + 15
	end if
	platforms (i).top += 0.5
	platforms (i).bottom += 0.5
    end for

end level1
loop
    level1
    View.Update
    Time.DelaySinceLast (10)
    cls
end loop
