local monster = {}
local zoom = 3;

monster.image = love.graphics.newImage('images/monster.png');

monster.x = 300

monster.y = 20

monster.speed = 300

monster.width = monster.image:getWidth() * zoom

monster.height = monster.image:getHeight() * zoom

function monster.draw()
    love.graphics.draw(monster.image, monster.x, monster.y, 0, zoom, zoom)
end

function monster.update(dt)
    if love.keyboard.isDown("left") then
        monster.x = monster.x - monster.speed * dt
    elseif love.keyboard.isDown("right") then
        monster.x = monster.x + monster.speed * dt
    end

     --Get the width of the window
     local window_width = love.graphics.getWidth()

     --If the x is too far too the left then..
     if monster.x < 0 then
         --Set x to 0
         monster.x = 0
 
     --Else, if the x is too far to the right then..
     elseif monster.x + monster.width > window_width then
         --Set the x to the window's width.
         monster.x = window_width - monster.width
     end
end

return player