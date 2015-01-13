/*By: Navleen Singh*/

/*THIS GAME IS BASED ON THE PHONE APP FALL DOWN*/

%SET THE SCREEN TO A CERTAIN PLACE AND SIZE ALSO THE TITLE ON THE PROGRAME
var FallDown : int := Window.Open ("offscreenonly;position:center;middle;nobuttonbar;title: FALL DOWN;graphics:600;600")

%PLATFORMS AND BARRIES ALL THERE POINT ON A GRAPH
type barries :
    record
	%LEFT, RIGHT, TOP, BOTTOM POINTS ON THE GRAPH AND THE COLOURS
	%THE (r) IS FOR THE RANDOM HOLES IN A PLATFORM SO THE BALL CAN GET PAST
	left, right, inside, outside, r : int
	top, bottom : real
    end record
var platforms, ran : flexible array 1 .. 0 of barries
var colors : array 1 .. 1 of barries

%BALL,GRAVITY,VELOCITY-CORDINATS
var ball, vel, grav : array 1 .. 1 of
    record
	%THE BALLS COLOURS, X&Y POINTS, AND THE RADIUS
	%(ma) IS THE MAXVELOCITY
	c1, c2, x, r : int
	y, ma : real
    end record

%EXTRA POWER UP'S (y) POINT
var powerups_y : flexible array 1 .. 0 of real
%(once) IF POWER UP IS USED
var once : boolean
var powerups : array 1 .. 10 of
%POWER UP'S ARE CIRCLE AND THE (r) IS THE RADIUS
%(x) IS THE X-AXIES ON A GRAPH
%(c1,c2) ARE THE COLOURS OF THE POWER UP BALL1
    record
	x, r, c1, c2 : int
    end record

%WALL VARIABLES
var wall : array 1 .. 2 of
    record
	%X,Y POINTS OF THE WALL SO YOU DON'T GO RIGHT THROUGH THE WALL
	%(c) COLOUR OF THE WALL'S
	x, y, c : int
    end record

%ANGLE OF THE BALL
var angles : array 1 .. 4 of
    record
	%THE CUT IN THE PLAYERS BALL THAT THEY ARE PLAYING AS
	angle : int
    end record

%FONT TYPE AND THERE SIZES
var F := Font.New ("Brush Script MT:75")
var F2 := Font.New ("Brush Script MT:40")
var F3 := Font.New ("Brush Script MT:50")
%FONT WIDTH OF THE WORD "Finish" WITH THE FONT TYPE (F)
var width := Font.Width ("Finish", F)
var font : array 1 .. 10 of
    record
	%THE WORDS X&Y POINTS ON THE GRAPH
	x, y : int
    end record

%MOUSE LOCATION
var mouse :
    record
	%X&Y POINTS OF YOUR MOUSE
	%(b) IF THE MOUSE IS DOWN OR NOT
	x, y, b : int
    end record


/****************
 %ALL THE EXTRAS%
 ****************/
%INPUT KEY
var key : array char of boolean
%BALL IS MOVING OR ON THE GROUND
var ground, ballmovment : array 1 .. 1 of boolean
%DOWN- WHERE THE PLATFORMS IS LOCATED
var down : flexible array 1 .. 0 of int
var msg, best : string
var score, points, speed, boxcount, py, powercount := 0
var boxspeed : real
var file : int
%ON,OFF- IF POWER IS TURNED ON
var on, off, touch : boolean
%HIGH SCORE
const rec := "highscore.rec"

%ALL VARIABLES ARE DEFINED IN THIS PROCEDURE
proc info

    for i : 1 .. 1
	%BALL'S X, Y, R, COLOUR 1 AND COLOUR 2 ARE SET
	ball (i).x := 20
	ball (i).y := maxy - 20
	ball (i).r := 10
	ball (i).c1 := 10
	ball (i).c2 := 120
	%X, Y, MAX VELOCITY ARE SET
	vel (i).x := 0
	vel (i).y := 0
	vel (i).ma := 6
	%GRAVITY SO UP AND DOWN ARE SET
	grav (i).y := 2.5
	%PLATFORMS COLOUR, (INSIDE AND OUTSIDE) ARE SET
	colors (i).inside := 18
	colors (i).outside := 10
	%IF THE BALL IS ON THE GROUND OR MOVING IS SET AS (TRUE OR FALSE)
	ground (i) := true
	ballmovment (i) := false
    end for

    %HOW MANY POWER UP'S ARE THERE
    for i : 1 .. 3
	%THE RADIUS AND COLOUR'S ARE SET
	powerups (i).r := 10
	powerups (i).c1 := 14
	powerups (i).c2 := 255
	once := false
    end for

    %THE CUTS ARE SET HERE BY 90 DEGREES
    angles (1).angle := 0
    angles (2).angle := 90
    angles (3).angle := 180
    angles (4).angle := 270

    %WALLS X, Y, COLOUR ARE SET SO THE PLAYERS BALL DOES NOT GO THROUGH
    wall (1).x := 0
    wall (2).x := maxx
    wall (1).y := 0
    wall (2).y := maxy
    wall (1).c := 145

    %ALL FONT'S X&Y POINTS ON THE GRAPH FOR EIGHT DIFFERENT WORDS
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

    %WHAT IS THE PLATFORMS SPEED IN THE START
    boxspeed := 0.8

    %IF THE POWER UP'S ARE ON OR OFF
    on := true
    off := false
    %IF THE PLAYERS BALL TOUCHES THE POWER UP
    touch := false

end info

%SAVE THE HIGH SCORE
proc reset

    %OPENS THE FILE WHERE THE HIGHSCORE IS
    open : file, rec, get
    get : file, msg
    close : file
    best := msg

end reset

proc save

    %SAVES THE HIGHSCORE WHEN THE PLAYER S FINISHED PLAYING
    best := msg
    open : file, rec, get
    get : file, msg
    close : file
    %TURNS THE SCORE INTO A STRING SO IT CAN BE SAVED
    if (score > strint (msg)) then
	open : file, rec, put, mod
	put : file, score
	close : file
    end if

end save

%DRAWING THE PLAYER'S BALL
proc drawball

    for i : 1 .. 1
	%DRAW'S THE CUT/ANGLES IN THE BALL TO MAKE IT LOOK GOOD
	Draw.FillArc (ball (i).x, round (ball (i).y), ball (i).r, ball (i).r, angles (1).angle, angles (2).angle, ball (i).c1)
	Draw.FillArc (ball (i).x, round (ball (i).y), ball (i).r, ball (i).r, angles (2).angle, angles (3).angle, ball (i).c2)
	Draw.FillArc (ball (i).x, round (ball (i).y), ball (i).r, ball (i).r, angles (3).angle, angles (4).angle, ball (i).c1)
	Draw.FillArc (ball (i).x, round (ball (i).y), ball (i).r, ball (i).r, angles (4).angle, angles (1).angle, ball (i).c2)
	%DRAW THE CIRCLE AROUND THE ANGLES
	Draw.Oval (ball (i).x, round (ball (i).y), ball (i).r + 1, ball (i).r + 1, ball (i).c1)
    end for

end drawball

%DRAWING THE POWER UP'S
proc powers

    for i : 1 .. upper (powerups_y)
	%DRAW'S THREE DIFFERENT CIRCLES IN THE POWER UP'S
	Draw.FillArc (powerups (i).x, round (powerups_y (i)), powerups (1).r, powerups (1).r, 0, 360, ball (1).c1)
	Draw.FillArc (powerups (i).x, round (powerups_y (i)), powerups (1).r - 17, powerups (1).r - 17, 0, 360, colors (1).inside)
	Draw.FillArc (powerups (i).x, round (powerups_y (i)), powerups (1).r - 13, powerups (1).r - 13, 0, 360, ball (1).c2)
	%MAKES THE POWER UP GO UP AT THE SAME SPEED AS THE PLATFORMS SO IT LOOKS LIKE IT IS ON THE PLATFORMS
	powerups_y (i) += boxspeed
	%ONCE THE POWER UP IS PAST THE HIGHEST POINT ON THE GAME IT WILL:
	/*RESET- SO IT CAN BE USED AGAIN*/
	/*POSITION(X)- SO IT IS IN A RANDOM PLACE EVERY TIME IT HITS THE HIGHEST POINT OF THE SCREEN*/
	/*POSITION(Y)- SO IT IS ON A DIFFERENT PLATFORM EVERY TIME*/
	if powerups_y (i) >= maxy then
	    %RESET
	    once := false
	    %POSITION(X)
	    randint (powerups (i).x, 10, 590)
	    %POSITION(Y)
	    randint (py, 2, 10)
	    case py of
		label 2 :
		    powerups_y (i) := -200
		label 3 :
		    powerups_y (i) := -300
		label 4 :
		    powerups_y (i) := -400
		label 5 :
		    powerups_y (i) := -500
		label 6 :
		    powerups_y (i) := -600
		label 7 :
		    powerups_y (i) := -700
		label 8 :
		    powerups_y (i) := -800
		label 9 :
		    powerups_y (i) := -900
		label 10 :
		    powerups_y (i) := -1000
	    end case
	end if
	%CHECKS IF THE RESET OPPTION IS TRUE OR FALSE
	/*RESET OPPTION IS TRUE THEN IT WILL DO NOTHING*/
	/*RESET OPPTION IS FALSE THEN IT WILL GIVE THE PLAYER A DIFFERENT POWER UP*/
	if once = true then
	elsif once = false then
	    %CHECKS IF THE PLAYER TOUCHED THE POWER UP
	    if Math.Distance (powerups (i).x, round (powerups_y (i)), ball (1).x, ball (1).y) < 20 then
		touch := true
	    end if
	end if
    end for

end powers


%SETS THE MAX AND MIN VELOCITY
proc velocity

    for i : 1 .. 1
	%THE MAX X VELOCITY SO THE PLAYER DOES NOT GO ON FOR EVER
	if vel (i).x > round (vel (i).ma) then
	    vel (i).x := round (vel (i).ma)
	elsif vel (i).x < round (-1 * vel (i).ma) then
	    vel (i).x := round (-1 * vel (i).ma)
	end if
	%THE MAX Y VELOCITY SO THE PLAYER DOES NOT FALL FOR EVER
	if vel (i).y > 6 then
	    vel (i).y := 6
	elsif vel (i).y < -6 then
	    vel (i).y := -6
	end if

	%THE MIN X VELOCITY SO THE PLAYER WON'T GO SO SLOW THAT THE GAME WILL STOP BEING FUN
	if vel (i).x > 0 then
	    vel (i).x -= 1
	elsif vel (i).x < 0 then
	    vel (i).x += 1
	end if
	%THE MIN Y VELOCITY SO THE PLAYER WILL GO THROUGH THE HOLES IN THE PLATFORMS
	if vel (i).y > 0 then
	    vel (i).y -= 1
	elsif vel (i).y < 0 then
	    vel (i).y += 1
	end if
    end for
    %IF PLAYER IS NOT MOVING THEN THE X VELOCITY IS EQUAL TO ZERO
    if ballmovment (1) = false then
	vel (1).x := 0
    end if

    %WILL KEEP ADDING THE X AND Y VELOCITY TO THE PLAYERS MOVEMENT
    ball (1).x += vel (1).x
    ball (1).y += vel (1).y

end velocity

%WALL OF THE GAME
proc walls

    %Y VELOCITY MINIUS THE GRAVITY AND THEN ADDS IT TO THE PLAYERS Y VALUE'S
    vel (1).y -= grav (1).y
    ball (1).y += vel (1).y

    %PLAYERS Y VALUE IS GREATER THEN 20 OF THE WALL THEN THE GROUND IS FALSE
    if ball (1).y > 20 then
	ground (1) := false
    end if

    %SEES IF THE PLAYER IS ON THE LEFT OR RIGHT OF THE WALL'S
    if ball (1).x >= wall (2).x - 15 then
	ball (1).x := wall (2).x - 15
    elsif ball (1).x <= wall (1).x + 15 then
	ball (1).x := wall (1).x + 15
    end if
    %SEES IF THE PLAYER IS ON THE BOTTOM OR THE TOP WALL'S
    if ball (1).y >= wall (2).y - 15 then
	ball (1).y := wall (2).y - 15
    elsif ball (1).y <= wall (1).y + 15 then
	ball (1).y := wall (1).y + 15
	ground (1) := true
    end if

end walls


proc random

    %PICKS 100 RANDOM HOLES FOR THE PLATFORMS AND THEN REPEATS THEM
    new ran, 100
    for i : 1 .. upper (ran)
	randint (ran (i).r, 0, 565)
    end for

end random

proc moveball

    %RUNS THE PROCEDURE WHERE THE VELOCITYS ARE SET
    velocity
    %GETS THE INPUT OF THE KEY (LEFT OR RIGHT)
    Input.KeyDown (key)
    %IF THE LEFT AND RIGHT ARE NOT PRESSED THEN PLAYER IS NOT MOVING
    ballmovment (1) := false

    %RIGHT ARROW KEY
    if key (KEY_RIGHT_ARROW) then
	%THE PLAYER IS MOVING
	ballmovment (1) := true
	%ADDS THE VELOCITY BY 2 EACH TIME TO MAKE IT GO RIGHT
	vel (1).x += 2
	%ROTATING THE ARCS OF THE PALYER BY 25
	for i : 1 .. 4
	    angles (i).angle -= 25
	end for

	%LEFT ARROW KEY
    elsif key (KEY_LEFT_ARROW) then
	%THE PLAYER IS MOVING
	ballmovment (1) := true
	%SUBTRACTS 2 EACH TIME TO MAKE IT GO LEFT
	vel (1).x -= 2
	%ROTATING THE ARCS OF THE PALYER BY 25
	for i : 1 .. 4
	    angles (i).angle += 25
	end for
    end if

    %EVERY 1000 POINT'S IT GIVES YOU A SCORE OF 1 AND KEEPS ADDING ON TO THAT
    if points = 1000 then
	score += 1
	points := 0
    end if

    %EVERY TIME THE SPEED VARIABLE GET TO 5000 THE PLAYERS VELOCITY, THE SPEED OF THE BOX AND THE VELOCITY OF GRAVITY IS INCREASED
    if speed = 5000 then
	boxspeed += 0.2
	grav (1).y += 0.2
	vel (1).ma += 0.1
	speed := 0
    end if

    %FOR EVERY POWER UP
    for i : 1 .. upper (powerups_y)
	%CHECKS IF POWER UPS IS TOUCHED
	if touch = true then
	    %PICK'S A RANDOM NUMBER FROM 1-3 AND DOES THE POWER UP THAT IS DEFINED TO THAT NUMBER
	    randint (powercount, 1, 3)
	    case powercount of
		    %(#1) THE SPEED OF THE BOX SLOWES DOWN A LITTLE
		    %(#2) ADD 5 POINTS TO YOU FINAL SCORE
		    %(#3) THE SPEED OF THE PALYER IS INCREASED
		label 1 :
		    boxspeed -= 0.5
		    once := true
		label 2 :
		    score += 5
		    once := true
		label 3 :
		    vel (1).ma += 0.4
		    once := true
	    end case
	    touch := false
	end if
    end for

    %THE WALLS OF THE PLATFORMS SO THE PLAYER DOES NOT GO RIGHT THROUGH THE PLATFORM IT DOES IT FOR EVERY PLATFORM
    for i : 1 .. upper (platforms)
	%CHECKS IF THE PLAYERS X SIDE IS WHERE ON THE PLATFORMS
	if ball (1).x >= platforms (i).left and ball (1).x <= platforms (i).right and
		ball (1).y >= platforms (i).bottom and ball (1).y <= platforms (i).top + ball (1).r + 2 then
	    ball (1).y := round (platforms (i).top) + ball (1).r + 4
	    vel (1).y := 0
	    %MAKES THE PLATFORMS THE GROUND FOR THAT MOMENT
	    ground (1) := true
	end if
    end for

    %DRAWS EACH AND EVERY PLATFORM
    for i : 1 .. upper (platforms)
	Draw.FillBox (platforms (i).left, round (platforms (i).bottom), platforms (i).right, round (platforms (i).top), colors (1).inside)
	Draw.Box (platforms (i).left + 1, round (platforms (i).bottom) + 1, platforms (i).right - 1, round (platforms (i).top) - 1, colors (1).outside)
	%CHECKS IF THE PLATFORMS BOTTOM IS PASSED THE TOP OF THE SCREEN
	if platforms (i).bottom >= maxy then
	    %RUND THE RANDOM PROCEDURE
	    random
	    %PUTS THE PLATFORMS TOP AND BOTTOM UNDER THE LAST DRAWN PLATFORM
	    platforms (i).bottom := -900
	    platforms (i).top := -900 + 15
	end if
	%MAKES THE TOP AND BOTTOM OF THE PALTFORM GO UP BY THE SAME SPEED
	platforms (i).top += boxspeed
	platforms (i).bottom += boxspeed
    end for

    %CHECKS IF THE START THE PERSON RUNNING THE PROGRAM PICKED ON OR OFF TO RUN THE PROCEDURE POWERS
    if on = true and off = false then
	powers
    else
    end if

end moveball



%RUN ALL THE PROCEDURES THAT HAVE NOT BEEN RUNNED YET
reset
info
%INCLUDE THE LEVEL AND START SCREEN THAT ARE DIFFERENT PROGRAMS
include "level.t"
include "start screen.t"
%DRAWS THE BASIC PLAYER
drawball
%THE MAIN LOOP
loop

    %RUNS THE PROCEDURE LEVEL THAT IS IN THE PROGRAM (level.t)
    level
    %THE BACKGROUND COLOUR IS BLACK
    colorback (255)
    moveball
    walls
    drawball
    %ADDS THE Y VELOCITY WITH THE BOXSPEED EVERY TIME
    vel (1).y += boxspeed
    %IF THE SPEED OF THE BOX IS GREATER THE THE MAX VELOCITY THEN SPEED OF THE BOX SUBTRACT ONE
    if boxspeed >= vel (1).ma then
	boxspeed -= 1
    end if
    %SO THE SCREEN DOES NOT BLINK
    Input.Flush
    %LOCATES THE SCORE TOP LEFT CORNER
    locate (1, 1)
    %MAKES THE SCORE'S COLOUR WHITE
    color (0)
    put score

    %LOCATES THE WAHT POWER UP IN THE CENTER OF THE SCREEN AT THE TOP
    locate (1, round (maxcol / 3))
    if powercount = 1 then
	%MAKES THE COLOUR BLUE
	color (9)
	put "POWER: SLOW PLATFORMS"
    elsif powercount = 2 then
	%MAKES THE COLOUR GREEN
	color (10)
	put "POWER: +5 POINTS"
    elsif powercount = 3 then
	%MAKES THE COLOUR IS RED
	color (12)
	put "POWER: SPEED BALL"
    end if

    %SO THE SCREEN WON'T BLINK
    View.Update
    %SETS THE DELAY TO THE COMPUTERS SPEED
    Time.DelaySinceLast (10)
    points += 10
    speed += 10
    %CLEARS THE SCREEN
    cls

    %PLAYERS TOP POINT TOUCHES THE TOP OF THE SCRREN THE IT WILL END THE PROGRAM
    if ball (1).y >= wall (2).y - 22 then
	exit
    end if

end loop
%END THE LOOP

%IN THE FIRST SCREEN IT RIGHTS FINISH AFTER THE PLAYER LOSES
Font.Draw ("Finish", round (maxx / 2 - width / 2), round (maxy / 2), F, white)
%OPENS A NEW SCREEN
var high_score : int := Window.Open ("offscreenonly;position:center;bottom;nobuttonbar;title: FALL DOWN SCORES;graphics:600;200")
%MAKES THE COLOUR BLACK
colorback (255)
cls
%SAVES THE SCORE
save
%DRAWS THE SCORE OF THAT ROUND AND THE HIGEST SCORE OF ALL TIME
/*IF THAT ROUND YOU BEAT THE HIGHSCORE THE NEXT TIME YOU RUN THE PROGRAM THAT WILL BE YOUR HIGHSCORE*/
Font.Draw ("Score: ", 0, maxy - 75, F2, ball (1).c1)
Font.Draw (intstr (score), 120, maxy - 75, F2, ball (1).c2)
Font.Draw ("High Score: ", 5, maxy - 175, F2, ball (1).c1)
if score >= strint (best) then
    Font.Draw (intstr (score), 225, maxy - 175, F2, ball (1).c2)
else
    Font.Draw (best, 225, maxy - 175, F2, ball (1).c2)
end if
View.Update
