ball = {}

function ball.load()
  ball.width = 5
  ball.height = 5
  newBall()
end

function newBall()
  ball.speed = 200
  ball.x = love.graphics.getWidth() / 2
  ball.y = love.graphics.getHeight() / 2
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
    if score > hiScore then
      hiScore = score
    end
    score = 0
    newBall()
    gameStatus = "TitleScreen"
  end

  checkCollision(ball, paddle)
  checkCollision(ball, paddle2)

end