paddle2 = {}

function paddle2.load()
  paddle2.height = 100
  paddle2.width = 5
  paddle2.x = love.graphics.getWidth() - 50
end

function paddle2.draw()
  love.graphics.rectangle("fill", paddle2.x, paddle2.y, paddle2.width, paddle2.height)
end

function paddle2.update()
  paddle2.y = midHeight - paddle2.height / 2 + joystick:getGamepadAxis("righty") * (midHeight - paddle2.height/ 2)
end