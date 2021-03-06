function love.load()
	sun = {}
	sun['x'] = 10
	sun['y'] = 10
	
	wind = 'e'

	grass_size = 120
	
	sun_time = love.timer.getMicroTime( )
	
	day_time = love.timer.getMicroTime( )
	
	time_step = 1
	
	colors = {}
	colors['empty_dirt'] = {35,24,17}
	colors['dirt'] = {110,85,56}
	colors['seed'] = {117,137,24}
	colors['rain'] = {0,0,255}

   radicles = {}   -- table which will hold our stars
   max_size = 100   -- how many stars we want
   for i=1, 1 do   -- generate the coords of our stars
      local x = math.random(5, love.graphics.getWidth()-5)   -- generate a "random" number for the x coord of this star
      local y = math.random(5, love.graphics.getHeight()-5)   -- both coords are limited to the screen size, minus 5 pixels of padding
      radicles[i] = {x, y}   -- stick the values into the table
   end
	
	dirt_dots = {}
	max_dirt = math.random(100,600)

   for i=1, max_dirt do   -- generate the coords of our dirt specks
      local x = math.random(0, love.graphics.getWidth()-1)   -- generate a "random" number for the x coord of this star
      local y = math.random((love.graphics.getHeight()-grass_size)+1, love.graphics.getHeight()-1)   -- both coords are limited to the screen size, minus 5 pixels of padding
      dirt_dots[i] = {x, y}   -- stick the values into the table
   end

	more_dirt_dots = {}
	more_max_dirt = math.random(100,600)

   for i=1, more_max_dirt do   -- generate the coords of our dirt specks
      local x = math.random(0, love.graphics.getWidth()-1)   -- generate a "random" number for the x coord of this star
      local y = math.random((love.graphics.getHeight()-grass_size)+1, love.graphics.getHeight()-1)   -- both coords are limited to the screen size, minus 5 pixels of padding
      more_dirt_dots[i] = {x, y}   -- stick the values into the table
   end

end
function love.draw()

	day_time = love.timer.getTime( )
	next_time = love.timer.getMicroTime( )
	love.graphics.print( string.sub(day_time, 0,2), 700, 20, 0, 1, 1 )
	
	
	if next_time-sun_time > time_step then 
		sun['x'] = sun['x'] + 1
		sun_time = love.timer.getMicroTime( )
	end

	love.graphics.setBackgroundColor( 103, 195, 245 )
	
	love.graphics.setColor(colors['dirt'])
	love.graphics.rectangle( 'fill', 0, (love.graphics.getHeight()-grass_size), love.graphics.getWidth(), grass_size )
	
	if(sun['x'] < love.graphics.getWidth()+40) then
		love.graphics.setColor( 255,255,0, 255 )
		love.graphics.circle( 'fill', sun['x'], sun['y'], 80, 20 )
	else
		-- This will be the moon!

	end

	love.graphics.setColor(73,40,31 )
	for i=1, #dirt_dots do   -- loop through all of our dirt
	   love.graphics.point(dirt_dots[i][1], dirt_dots[i][2])   -- draw each point
	end
	
	-- Draw Seed
	love.graphics.setColor(colors['seed'])
	love.graphics.point(120, love.graphics.getHeight()-(grass_size-20))
	love.graphics.point(122, love.graphics.getHeight()-(grass_size-20))
	love.graphics.point(120, love.graphics.getHeight()-(grass_size-22))
	love.graphics.point(122, love.graphics.getHeight()-(grass_size-22))
	
	love.graphics.setColor(colors['rain'])
	for i=1, 60 do   -- generate the coords of our dirt specks
		local x = math.random(0, love.graphics.getWidth()-1)   -- generate a "random" number for the x coord of this star
		local y = math.random(0, love.graphics.getHeight()-1)   -- both coords are limited to the screen size, minus 5 pixels of padding
		
		x2 = x
		y2 = y+5
		
		if wind == 'w' then
			x2 = x+10
			y2 = y+10
		end
		
		if wind == 'e' then
			x2 = x-10
			y2 = y+10
		end

		love.graphics.line( x, y, x2, y2)
   end
	
end