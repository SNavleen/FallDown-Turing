var drawn : boolean := false


proc level
    random
    new down, 30

    for i : 1 .. upper (down)
	down (i) := 500
	down (i) := down (i) - (i * 100)
    end for

    if drawn = false then
	new platforms, 30

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

	platforms (15).left := 0
	platforms (15).bottom := down (8)
	platforms (15).right := ran (8).r
	platforms (15).top := down (8) + 15

	platforms (16).left := ran (8).r + 35
	platforms (16).bottom := down (8)
	platforms (16).right := 600
	platforms (16).top := down (8) + 15

	platforms (17).left := 0
	platforms (17).bottom := down (9)
	platforms (17).right := ran (9).r
	platforms (17).top := down (9) + 15

	platforms (18).left := ran (9).r + 35
	platforms (18).bottom := down (9)
	platforms (18).right := 600
	platforms (18).top := down (9) + 15

	platforms (19).left := 0
	platforms (19).bottom := down (10)
	platforms (19).right := ran (10).r
	platforms (19).top := down (10) + 15

	platforms (20).left := ran (10).r + 35
	platforms (20).bottom := down (10)
	platforms (20).right := 600
	platforms (20).top := down (10) + 15

	platforms (21).left := 0
	platforms (21).bottom := down (11)
	platforms (21).right := ran (11).r
	platforms (21).top := down (11) + 15

	platforms (22).left := ran (11).r + 35
	platforms (22).bottom := down (11)
	platforms (22).right := 600
	platforms (22).top := down (11) + 15

	platforms (23).left := 0
	platforms (23).bottom := down (12)
	platforms (23).right := ran (12).r
	platforms (23).top := down (12) + 15

	platforms (24).left := ran (12).r + 35
	platforms (24).bottom := down (12)
	platforms (24).right := 600
	platforms (24).top := down (12) + 15

	platforms (25).left := 0
	platforms (25).bottom := down (13)
	platforms (25).right := ran (13).r
	platforms (25).top := down (13) + 15

	platforms (26).left := ran (13).r + 35
	platforms (26).bottom := down (13)
	platforms (26).right := 600
	platforms (26).top := down (13) + 15

	platforms (27).left := 0
	platforms (27).bottom := down (14)
	platforms (27).right := ran (14).r
	platforms (27).top := down (14) + 15

	platforms (28).left := ran (14).r + 35
	platforms (28).bottom := down (14)
	platforms (28).right := 600
	platforms (28).top := down (14) + 15

	platforms (29).left := 0
	platforms (29).bottom := down (15)
	platforms (29).right := ran (15).r
	platforms (29).top := down (15) + 15

	platforms (30).left := ran (15).r + 35
	platforms (30).bottom := down (15)
	platforms (30).right := 600
	platforms (30).top := down (15) + 15

	/*platforms (1).left := 0
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

	 platforms (15).left := 0
	 platforms (15).bottom := down (8)
	 platforms (15).right := ran (8).r
	 platforms (15).top := down (8) + 15

	 platforms (16).left := ran (8).r + 35
	 platforms (16).bottom := down (8)
	 platforms (16).right := 600
	 platforms (16).top := down (8) + 15*/


	drawn := true

    end if

end level
