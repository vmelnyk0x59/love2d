local Bomb = {}

local zoom = 1

local bombImage = love.graphics.newImage('images/bomb.png')

local width = bombImage:getWidth() * zoom

local height = bombImage:getHeight() * zoom


function Bomb:new (x, y)
    local bomb = {}
    bomb.image = bombImage;

    bomb.x = x or 300

    bomb.y = y or 300

    bomb.speed = 300

    bomb.width = width

    bomb.height = height

    setmetatable(bomb, self)

    self.__index = self
    
    return bomb
end

function Bomb:draw ()
    love.graphics.draw(self.image, self.x, self.y, 0, zoom, zoom)
end

function Bomb:update (dt)
    self.y = self.y + self.speed * dt
end

return Bomb