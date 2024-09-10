local Monster = {}
local zoom = 3;

Monster.image = love.graphics.newImage('images/monster.png');

Monster.x = 300

Monster.y = 400

Monster.speed = 200

Monster.width = Monster.image:getWidth() * zoom

Monster.height = Monster.image:getHeight() * zoom

Monster.direction = 1;

function Monster.draw()
    love.graphics.draw(Monster.image, Monster.x, Monster.y, 0, zoom, zoom)
end

function Monster.update(dt)
    --Get the width of the window
    local window_width = love.graphics.getWidth()

    --If the x is too far too the left then..
    if Monster.x < 0 then
        Monster.direction = 1
    --Else, if the x is too far to the right then..
    elseif Monster.x + Monster.width > window_width then
        Monster.direction = -1
    end

    Monster.x = Monster.x + Monster.speed * Monster.direction * dt
end

return Monster