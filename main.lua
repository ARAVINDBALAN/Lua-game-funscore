-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
--require
json=require("json")
physics=require("physics")
physics.start( )
--globals
score=0
kick=audio.loadSound( "boing-1.wav" )
blast=audio.loadSound(  "blast.mp3" )
high_s=0
Highscore={}
tap=0
path= system.pathForFile( "high.json" ,system.DocumentsDirectory )
--functions
function level_1(  )
	for i=1,10 do
		rect=display.newRoundedRect( math.random( 2*x ),math.random( 5 ),10,10,10 )
		rect:setFillColor( 0 )
		physics.addBody( rect,"dynamic",{density=5} )
		rect.gravityScale=35
	end
	-- body
end
function level_2(  )
	-- body
	ball.xScale=.9
	ball.yScale=.9

end

function level_3(  )
	-- body
	for i=1,6 do
		rect_3=display.newRoundedRect( math.random( 2*x ),0,30,20,10 )
		rect_3:setFillColor( 0 )
		physics.addBody( rect_3,"dynamic",{density=5} )
		rect_3.gravityScale=5
	end
end

function score_f( event )
	-- body
	if (event.phase==began) then
		ball_1:applyLinearImpulse( math.random( 70,100 ),math.random( -400,-290 ), ball_1.x,ball_1.y )
		score=score+1
		score1.text=score
		
	end
end
function level_4(  )
	ball_1=display.newCircle(x,y,45)
	ball_1:setFillColor( 0 )
	physics.addBody( ball_1, "dynamic" )
	ball_1:addEventListener( "tap", score_f )
	-- body
end

 function level_5()
 	ball.gravityScale=50
 	-- body
 end
 function level_6()
 	-- body
 	background:setFillColor( math.random( 1 ),math.random( 1 ),math.random( 1 ) )
 	level_2()
 	level_1()
 	level_3()
 	--level_4()

 end
function update( event )
	if (event.phase==began) then
		score=score+1
		ball:applyLinearImpulse( math.random( 50,100), math.random( -400,-290 ), ball.x,ball.y )
		score1.text=score
		audio.play(  kick )
		if (score>5 and score<=10) then
			level_1()
			
		end
		if (score>10 and score<=15) then
			level_2()
			
		end
		if (score>15 and score<=20) then
		level_3()
			
		end
		if (score>20 and score<=25) then
			--level_4()			
		end
		if (score>25 and score<=30) then
			level_5()
		end
		if (score>30) then
			level_6()
			
		end

	end
	return true
	-- body
end
function taps1()
		if (ball.y>400) then
			end_text=display.newText( score,x,y,"native.systemFontBold",98 )
			end_text:setFillColor( 0 )
		end
			
	-- body
end
function re_menu()
	background=display.newRect(  x, y,320,600)
	background:setFillColor(.1)
	rect_start=display.newRoundedRect( x,y+25,90,40,40 )
	rect_start:setFillColor( 0 )
	start_button=display.newText("Start",x,y+22,"tahoma",30 )
	start_button:setFillColor( 1)
	rect_start:addEventListener( "tap", change_color)
	exit_rect=display.newRoundedRect(x,y+100,90,40,40)
	exit_rect:setFillColor( 0 ) 
	exit_button=display.newText( "Exit",x,y+100,"tahoma",30)
	exit_rect:addEventListener( "tap", change_color)
	--body
end

function tap3(event )

	if (score<=20) then
		if (ball.y>400) then
			background=display.newRect(  x, y, 320,600)
			re_menu()
			cs=display.newText( "score",x,y-120,"native.systemFont",35 )
			cs:setFillColor( 1 )
			
			
			end_text=display.newText( score,x,y-53,"native.systemFontBold",98 )
			end_text:setFillColor( 1 )
			
		end
			
	end		
	return true
	-- body
end
function taps( event )
	timer.performWithDelay( 500, tap3 )
	return true
	-- body
end

function set(event)
	if (ball.y>400 and ball_1>400) then
		background=display.newRect(  x, y, 320,600)
		re_menu()
		cs=display.newText( "score",x,y-120,"native.systemFont",35 )
		cs:setFillColor( 1 )
		
		
		end_text=display.newText( score,x,y-53,"native.systemFontBold",98 )
		end_text:setFillColor( 1)
		
 		
	end
	-- body
end

function start_game( event )
	-- body
	if (event.phase==began) then
		score=0
		background=display.newRect( x,y,w,h+90 )
		background:setFillColor( 1 )
		score_text=display.newText( "score",x,-25,"tahoma",24 )
		score_text:setFillColor( 0 )
		score1=display.newText( score,x,8,"tahoma",50 )
		score1:setFillColor( 0 )
		right_side=display.newRect( 0,y,10,h+90)
		right_side:setFillColor( 1 )
		left_side=display.newRect( 2*x,y,10,h+90)
		left_side:setFillColor( 1 )
		upper_side=display.newRect(x,-43,w,10)
		upper_side:setFillColor( 1 )
		physics.addBody( upper_side,"static" )
		physics.addBody( left_side, "static")
		physics.addBody( right_side,"static" )
		ball=display.newCircle( x,y,50)
		ball:setFillColor( 0 )
		physics.addBody( ball,"dynamic",{density=1} )
		physics.setGravity( 0, 20 ) 
		--if (score<=20) then
		background:addEventListener( "tap", taps )	
		--end
		ball:addEventListener( "tap", update )
	end

	
	
	return true
end

function end_game( event )
	if (event.phase==began) then
		os.exit( 0 )
		
	end
	-- body
end
function change_color(event)
	if (event.phase==began and event.target==rect_start) then
		start_button:setFillColor( 0 )
		rect_start:setFillColor( 1,1,1 )
		timer.performWithDelay( 500,start_game )
		
	end
	if (event.phase==began and event.target==exit_rect) then
		exit_rect:setFillColor( 1 )
		exit_button:setFillColor( 0 )
		timer.performWithDelay( 500, end_game )
		
	end
end

function about_game( event )
	if (event.phase==began) then
		background_about=display.newRect(x,y,w,h+90 )
		background_about:setFillColor( .4,.4,.4 )
		about1=display.newText( "About",x,0,"tahoam",34 )
		about1:setFillColor( 1 )
		about_text="Developed by : Kgamers \n\n Tools 		 : corona sdk \n\n Rules 		 : Tap the ball to earn score \n\n Rate us on amazon"

		txt=display.newText( about_text,x,y,"tahoma",20 )
		txt:setFillColor( 1 )
		back_button=display.newRect(25,0,40,40)
		back_button:setFillColor( 1 )
		back_button.alpha=.5
		back_symbol=display.newText( "<--",25,0,"tahoma",24 )
		back_symbol:setFillColor( 1 )
		back_button:addEventListener( "tap", start_screen )
	end
	-- body
	return true
end


function start_screen( )
	-- body
	x=display.contentCenterX
	y=display.contentCenterY
	h=display.contentHeight
	w=display.contentWidth
	background1=display.newRect( x,y,w,h+90 )
	background1:setFillColor( 1 )
--	covering=display.newRect( x,y/2+110,250,450)
--	covering:setFillColor( 1 )
--	covering.strokeWidth=7
--	covering:setStrokeColor( 0 ) */
	ver={x-160,y, 0,y+650, 320,y+650}
	f=display.newPolygon(  x,y, ver)
	f.strokeWidth=10
	f:setStrokeColor(.4,.4,.4)
	f:setFillColor(.4,.4,.4)
	about_rect=display.newRect( 2*x-14,-20,20,30 )
	about_rect:setFillColor( 1 )
	about_rect:addEventListener( "tap", about_game)
	about_symbol=display.newText( "?",2*x-14,-20,"tahoma",30 )
	about_symbol:setFillColor( 0 )
	circle=display.newCircle( x,y/2-10,80 )
	circle:setFillColor( 0 )
	rect1=display.newRect( x,y/2-8,200,45 )
	rect1:setFillColor( 1 )
	title=display.newText( "FunScore",x,y/2-10,"tahoma",45 )
	title:setFillColor(0)
	rect_start=display.newRoundedRect( x,y+25,90,40,40 )
	rect_start:setFillColor( 0 )
	start_button=display.newText("Start",x,y+22,"tahoma",30 )
	start_button:setFillColor( 1)
	rect_start:addEventListener( "tap", change_color)
	exit_rect=display.newRoundedRect(x,y+100,90,40,40)
	exit_rect:setFillColor( 0 ) 
	exit_button=display.newText( "Exit",x,y+100,"tahoma",30)
	exit_rect:addEventListener( "tap", change_color)
	
	
end
start_screen()