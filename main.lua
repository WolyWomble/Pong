require("paddle")
require("paddle2")
require("ball")

function love.load()
  ball:load()
  paddle:load()
  paddle2:load()
  width = love.graphics.getWidth()
  height = love.graphics.getHeight()
  midHeight = height / 2
  midWidth = width / 2
  paddleHeight = 50
end

function love.draw()
  paddle:draw()
  paddle2:draw()
  ball:draw()

end

function love.update(dt)
  joysticks = love.joystick.getJoysticks()
  joystick = joysticks[1]
  paddle.update()
  paddle2:update()
  ball.update(dt)
end

function checkCollision(a, b)

  if a.x + a.width > b.x and 
  a.x < b.x + b.width and 
  a.y + a.height > b.y and 
  a.y < b.y + b.height then
    return true
  else
    return false
  end
end