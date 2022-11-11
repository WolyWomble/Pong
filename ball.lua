ball = {}

function ball.load()
  ball.x = love.graphics.getWidth() / 2
  ball.y = love.graphics.getHeight() / 2
  ball.width = 5
  ball.height = 5
  ball.speed = 100
  ballAngle = love.math.random() * love.math.random(-3, 2)
  ball.xDirection = 1
  if love.math.random() < 0.5 then
    ball.xDirection = -ball.xDirection
  end
end



function ball.draw()
  love.graphics.rectangle("fill", ball.x, ball.y, ball.width, ball.height) 
end

function ball.update(dt)
  ball.y = ball.y + ballAngle * ball.speed * dt
  ball.x = ball.x + ball.xDirection * ball.speed * dt

  if ball.y < 0 or ball.y > love.graphics.getHeight() - ball.width then
    ballAngle = -ballAngle
  end

  if ball.x < 0 or ball.x > love.graphics.getWidth() - ball.width then
    ball.xDirection = -ball.xDirection
  end

  if checkCollision(ball, paddle) or checkCollision(ball, paddle2) then
    ball.xDirection = -ball.xDirection
    ball.speed = ball.speed + 5
  end
end