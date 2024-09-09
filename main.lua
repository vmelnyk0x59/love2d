io.stdout:setvbuf("no")

if arg[2] == "debug" then
    require("lldebugger").start()
end

local loveErrorhandler = love.errorhandler or love.errhand
function love.errorhandler(msg)
    if debugMode then
        error(msg, 2)
    else
        return loveErrorhandler(msg)
    end
end

-- import
local tick = require('lib.tick')

local player = require('player')

local monster = require('monster')
-- end of import

local function checkCollision(a, b)
    --With locals it's common usage to use underscores instead of camelCasing
    local a_left = a.x
    local a_right = a.x + a.width
    local a_top = a.y
    local a_bottom = a.y + a.height

    local b_left = b.x
    local b_right = b.x + b.width
    local b_top = b.y
    local b_bottom = b.y + b.height

    --Directly return this boolean value without using if-statement
    return  a_right > b_left
        and a_left < b_right
        and a_bottom > b_top
        and a_top < b_bottom
end

function love.load()
    
end

function love.update(dt)
    player.update(dt)

    monster.update(dt)
end

function love.draw()
    player.draw()

    monster.draw()
end
