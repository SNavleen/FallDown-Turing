View.Set ("graphics:640;500")
var myrow, mycol : int %counts the rows
myrow := 1
mycol := 1
for a : 0 .. 255
    color (a)
    colorback (29)
    if mycol >= maxcol - 1 then
	myrow := myrow + 1
	mycol := 1
    end if
    locate (myrow, mycol)
    put a
    mycol := mycol + 4
end for
mycol := 1
for a : 0 .. 255
    color (0)
    colorback (a)
    if mycol >= maxcol - 1 then
	myrow := myrow + 1
	mycol := 1
    end if
    locate (myrow, mycol)
    put a
    mycol := mycol + 4
end for
