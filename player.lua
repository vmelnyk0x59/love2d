local inspect = require('lib.inspect')
local Bomb = require('bomb');

local Player = {}
local zoom = 3;

Player.image = love.graphics.newImage('images/panda.png');

Player.x = 300

Player.y = 20

Player.speed = 300

Player.width = Player.image:getWidth() * zoom

Player.height = Player.image:getHeight() * zoom

function Player.keypressed(key)
    if key == 'space' then
        local bomb = Bomb:new(Player.x, Player.y)

        print(inspect(bomb));

        table.insert(bombsList, bomb);
    end
end

function Player.draw()
    love.graphics.draw(Player.image, Player.x, Player.y, 0, zoom, zoom)
end

function Player.update(dt)
    if love.keyboard.isDown("left") then
        Player.x = Player.x - Player.speed * dt
    elseif love.keyboard.isDown("right") then
        Player.x = Player.x + Player.speed * dt
    end

     --Get the width of the window
     local window_width = love.graphics.getWidth()

     --If the x is too far too the left then..
     if Player.x < 0 then
         --Set x to 0
         Player.x = 0
 
     --Else, if the x is too far to the right then..
     elseif Player.x + Player.width > window_width then
         --Set the x to the window's width.
         Player.x = window_width - Player.width
     end
end

return Player