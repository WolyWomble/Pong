intro = {}

function intro.load ()
  intro.background = love.graphics.newImage("background.png")
  intro.sx = love.graphics.getWidth() / intro.background:getWidth()
  intro.sy = love.graphics.getHeight() / intro.background:getHeight()
  print(intro.sx, intro.sy)
end

function intro.draw()
  love.graphics.draw(intro.background, 0, 0, 0, intro.sx, intro.sy)
end