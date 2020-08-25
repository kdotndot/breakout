

--[[
    Represents a power up that will either spawn on a timer or when Ball hits a specific Block enough times
    Once collided with the Paddle, two more Balls should spawn and behave identically to the original, including all collision and scoring points for the player. Once the player wins and proceeds to the VictoryState for their current level, the Balls should reset so that there is only one active again.



]]
PowerUp = Class{}

POWERUP_GRAVITY = 100

function PowerUp:init(x,y)
    self.x = x
    self.y = y
    self.dy = POWERUP_GRAVITY
    self.width = 16
    self.height = 16

end

function PowerUp:update(dt)
    self.y = self.y + self.dy


end


function PowerUp:render()
    love.graphics.draw(gTextures['main'], gFrames['powerUps'][1], self.x, self.y)


end

function PowerUp:collides(target)
    -- first, check to see if the left edge of either is farther to the right
    -- than the right edge of the other
    if self.x > target.x + target.width or target.x > self.x + self.width then
        return false
    end

    -- then check to see if the bottom edge of either is higher than the top
    -- edge of the other
    if self.y > target.y + target.height or target.y > self.y + self.height then
        return false
    end 

    -- if the above aren't true, they're overlapping
    return true
end
