local player = {}
local zoom = 3;

player.image = love.graphics.newImage('images/panda.png');

player.x = 300

player.y = 20

player.speed = 300

player.width = player.image:getWidth() * zoom

player.height = player.image:getHeight() * zoom

function player.draw()
    love.graphics.draw(player.image, player.x, player.y, 0, zoom, zoom)
end

function player.update(dt)
    if love.keyboard.isDown("left") then
        player.x = player.x - player.speed * dt
    elseif love.keyboard.isDown("right") then
        player.x = player.x + player.speed * dt
    end

     --Get the width of the window
     local window_width = love.graphics.getWidth()

     --If the x is too far too the left then..
     if player.x < 0 then
         --Set x to 0
         player.x = 0
 
     --Else, if the x is too far to the right then..
     elseif player.x + player.width > window_width then
         --Set the x to the window's width.
         player.x = window_width - player.width
     end
end

return player