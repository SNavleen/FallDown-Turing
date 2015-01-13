/*By: Navleen Singh
 Started: Thursday, April 12,2012
 Time: 5:52pm
 Title: Game as of right now*/


%Setup the screen
var Falldown : int := Window.Open ("offscreenonly;position:center;middle;nobuttonbar;title: Fall Down;graphics:600;600")

%Platforms and barries
type barries :
    record
	left, right, inside, outside, r : int
	top, bottom : real
    end record
var platforms, ran : flexible array 1 .. 0 of barries
var colors : array 1 .. 1 of barries

%Balls variables
var ball, vel, grav : array 1 .. 1 of
    record
	c1, c2, x, r : int
	y : real
    end record

%Wall variables
var wall : array 1 .. 2 of
    record
	x, y, c : int
    end record

%Angles variables
var angles : array 1 .. 4 of
    record
	angle : int
    end record

var F := Font.New ("Brush Script MT:75")
var F2 := Font.New ("Brush Script MT:40")
var font : array 1 .. 10 of
    record
	x, y : int
    end record

var mouse :
    record
	x, y, b : int
    end record

var key : array char of boolean
var ground, ballmovment : array 1 .. 1 of boolean
var song : flexible array 1 .. 0 of boolean
var down : flexible array 1 .. 0 of int
var count : string
var score, points, speed := 0
var boxspeed : real
var on, off : boolean
const bounce : string := "bounce.wav"

%Defining all the variables
proc info

    for i : 1 .. 1
	ball (i).x := 20
	ball (i).y := maxy - 20
	ball (i).r := 10
	ball (i).c1 := 10
	ball (i).c2 := 120
	vel (i).x := 0
	vel (i).y := 0
	grav (i).y := 3
	colors (i).inside := 18
	colors (i).outside := 10
	ground (i) := true
	ballmovment (i) := false
    end for

    angles (1).angle := 0
    angles (2).angle := 90
    angles (3).angle := 180
    angles (4).angle := 270

    wall (1).x := 0
    wall (2).x := maxx
    wall (1).y := 0
    wall (2).y := maxy
    wall (1).c := 145

    font (1).x := maxx div 5
    font (1).y := 500
    font (2).x := 20
    font (2).y := 425
    font (3).x := 15
    font (3).y := 350
    font (4).x := 50
    font (4).y := 275
    font (5).x := 50
    font (5).y := 200
    font (6).x := 50
    font (6).y := 125
    font (7).x := 275
    font (7).y := 275
    font (8).x := 425
    font (8).y := 275

    boxspeed := 1

    on := true
    off := false
end info

%Drawing the balls
proc drawball
    for i : 1 .. 1
	Draw.FillArc (ball (i).x, round (ball (i).y), ball (i).r, ball (i).r, angles (1).angle, angles (2).angle, ball (i).c1)
	Draw.FillArc (ball (i).x, round (ball (i).y), ball (i).r, ball (i).r, angles (2).angle, angles (3).angle, ball (i).c2)
	Draw.FillArc (ball (i).x, round (ball (i).y), ball (i).r, ball (i).r, angles (3).angle, angles (4).angle, ball (i).c1)
	Draw.FillArc (ball (i).x, round (ball (i).y), ball (i).r, ball (i).r, angles (4).angle, angles (1).angle, ball (i).c2)
	Draw.Oval (ball (i).x, round (ball (i).y), ball (i).r + 1, ball (i).r + 1, ball (i).c1)
    end for
end drawball

%Setting the max and min velocity
proc velocity
    %Max
    for i : 1 .. 1
	if vel (i).x > 5 then
	    vel (i).x := 5
	elsif vel (i).x < -5 then
	    vel (i).x := -5
	end if
	if vel (i).y > 5 then
	    vel (i).y := 5
	elsif vel (i).y < -5 then
	    vel (i).y := -5
	end if

	%Min
	if vel (i).x > 0 then
	    vel (i).x -= 1
	elsif vel (i).x < 0 then
	    vel (i).x += 1
	end if
	if vel (i).y > 0 then
	    vel (i).y -= 1
	elsif vel (i).y < 0 then
	    vel (i).y += 1
	end if
    end for
    if ballmovment (1) = false then
	vel (1).x := 0
    end if
    ball (1).x += vel (1).x
    ball (1).y += vel (1).y

end velocity

%Walls of the game
proc walls
    vel (1).y -= grav (1).y
    ball (1).y += vel (1).y

    if ball (1).y > 20 then
	ground (1) := false
    end if

    if ball (1).x >= wall (2).x - 12 then
	ball (1).x := wall (2).x - 12
    elsif ball (1).x <= wall (1).x + 12 then
	ball (1).x := wall (1).x + 12
    end if
    if ball (1).y >= wall (2).y - 12 then
	ball (1).y := wall (2).y - 12
    elsif ball (1).y <= wall (1).y + 12 then
	ball (1).y := wall (1).y + 12
	ground (1) := true
    end if
end walls


proc random
    new ran, 30
    for i : 1 .. upper (ran) by 6
	randint (ran (i).r, 0, 490)
    end for
    for i : 2 .. upper (ran) by 6
	randint (ran (i).r, 0, 90)
    end for
    for i : 3 .. upper (ran) by 6
	randint (ran (i).r, 0, 350)
    end for
    for i : 4 .. upper (ran) by 6
	randint (ran (i).r, 0, 88)
    end for
    for i : 5 .. upper (ran) by 6
	randint (ran (i).r, 0, 520)
    end for
    for i : 6 .. upper (ran) by 6
	randint (ran (i).r, 0, 150)
    end for
end random

%Moving the balls
proc moveball
    velocity
    Input.KeyDown (key)
    ballmovment (1) := false
    if key (KEY_RIGHT_ARROW) then
	ballmovment (1) := true
	vel (1).x += 2
	for i : 1 .. 4
	    angles (i).angle -= 25
	end for
    elsif key (KEY_LEFT_ARROW) then
	ballmovment (1) := true
	vel (1).x -= 2
	for i : 1 .. 4
	    angles (i).angle += 25
	end for
    end if
    if points = 1000 then
	score += 1
	points := 0
    end if
    if speed = 1000 then
	boxspeed += 0.1
	grav (1).y += 0.1
	speed := 0
    end if

    for i : 1 .. upper (platforms)
	if ball (1).x >= platforms (i).left and ball (1).x <= platforms (i).right and
		ball (1).y >= platforms (i).bottom and ball (1).y <= platforms (i).top + ball (1).r + 2 then
	    ball (1).y := round (platforms (i).top) + ball (1).r + 4
	    vel (1).y := 0
	    ground (1) := true
	end if
    end for

    for i : 1 .. upper (platforms)
	Draw.FillBox (platforms (i).left, round (platforms (i).bottom), platforms (i).right, round (platforms (i).top), colors (1).inside)
	Draw.Box (platforms (i).left + 1, round (platforms (i).bottom) + 1, platforms (i).right - 1, round (platforms (i).top) - 1, colors (1).outside)
	if platforms (i).bottom >= maxy then
	    random
	    platforms (i).bottom := -900
	    platforms (i).top := -900 + 15
	end if
	platforms (i).top += boxspeed
	platforms (i).bottom += boxspeed
    end for
end moveball



%Run all the procedures
info
include "Levels\level.t"
include "start screen.t"
drawball
loop
    level
    colorback (black)
    moveball
    walls
    drawball
    vel (1).y += boxspeed
    Input.Flush
    if ball (1).y >= wall (2).y - 22 then
	exit
    end if
    locate (1, 1)
    color (white)
    put score
    View.Update
    Time.DelaySinceLast (10)
    points += 10
    speed += 10
    cls
end loop
Window.Close (Falldown)

