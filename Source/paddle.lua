paddle = {}

function paddle.load()
  paddle.height = 100
  paddle.width = 5
  paddle.x = 50
end

function paddle.draw()
  love.graphics.rectangle("fill", paddle.x, paddle.y, paddle.width, paddle.height)
end

function paddle.update()
paddle.y = midHeight - paddle.height / 2 + joystick:getGamepadAxis("lefty") * (midHeight  - paddle.height / 2)
end