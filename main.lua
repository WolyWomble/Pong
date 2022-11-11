require("paddle")
require("ball")

function love.load()
  ball:load()
  width = love.graphics.getWidth()
  height = love.graphics.getHeight()
  midHeight = height / 2
  midWidth = width / 2
  paddleHeight = 50
end

function love.draw()
  paddle:draw()
  ball:draw()

end

function love.update(dt)
  paddle.update()
  ball.update(dt)
end

