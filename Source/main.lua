require("paddle")
require("paddle2")
require("ball")
require("intro")

function love.load()
  love.window.setFullscreen(true, "desktop")
  ball:load()
  paddle:load()
  paddle2:load()
  intro:load()
  width = love.graphics.getWidth()
  height = love.graphics.getHeight()
  midHeight = height / 2
  midWidth = width / 2
  score = 0
  hiScore = 0
  gameStatus = "TitleScreen"

end

function love.draw()

  if gameStatus == "TitleScreen" then
    intro:draw()
  end

  if gameStatus == "Gameplay" then
    paddle:draw()
    paddle2:draw()
    ball:draw()
    love.graphics.print("Score: " .. score, love.graphics.getWidth() / 4, 50)
    love.graphics.print("HiScore: " .. hiScore, love.graphics.getWidth() * 0.75, 50)
  end

end

function love.update(dt)
  joysticks = love.joystick.getJoysticks()
  joystick = joysticks[1]
  anyDown = joystick:isGamepadDown("a", "start")
  if gameStatus == "TitleScreen" then
    if anyDown then
      gameStatus = "Gameplay"
    end
  end
  if gameStatus == "Gameplay" then
    paddle:update()
    paddle2:update()
    ball.update(dt)
  end
end

function checkCollision(a, b)

  if a.x + a.width > b.x and 
  a.x < b.x + b.width and 
  a.y + a.height > b.y and 
  a.y < b.y + b.height then
    paddleLocation = (b.y + b.height / 2) / 20
    ballLocation = (a.y + a.height / 2) / 20
    collisionDetected(ballLocation - paddleLocation)
  end

  function collisionDetected(collisionLocation)
    ball.xDirection = -ball.xDirection
    ball.speed = ball.speed + 5
    score = score + 1
    ballAngle = collisionLocation

  end
end
