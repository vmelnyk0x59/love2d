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

    bomb.dead = false

    setmetatable(bomb, self)

    self.__index = self
    
    return bomb
end

function Bomb:checkCollision(obj)
    local self_left = self.x
    local self_right = self.x + self.width
    local self_top = self.y
    local self_bottom = self.y + self.height

    local obj_left = obj.x
    local obj_right = obj.x + obj.width
    local obj_top = obj.y
    local obj_bottom = obj.y + obj.height

    if  self_right > obj_left
    and self_left < obj_right
    and self_bottom > obj_top
    and self_top < obj_bottom then
        self.dead = true

        --Increase enemy speed
        obj.speed = obj.speed + 50
    end
end

function Bomb:draw ()
    love.graphics.draw(self.image, self.x, self.y, 0, zoom, zoom)
end

function Bomb:update (dt)
    self.y = self.y + self.speed * dt
end

return Bomb