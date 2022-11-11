paddle = {}


function paddle.draw()
  love.graphics.rectangle("fill", 50, p1y, 5, paddleHeight)
  love.graphics.rectangle("fill", width - 50, p2y, 5, paddleHeight)
end

function paddle.update()
  local joysticks = love.joystick.getJoysticks()
  local joystick = joysticks[1]
  p2y = midHeight - paddleHeight / 2 + joystick:getGamepadAxis("righty") * (midHeight - paddleHeight / 2)
  p1y = midHeight - paddleHeight / 2 + joystick:getGamepadAxis("lefty") * (midHeight  - paddleHeight / 2)
end