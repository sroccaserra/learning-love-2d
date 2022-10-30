local maid64 = require 'maid64'

local rotate
local mire
local gradient

function love.load()
  love.window.setMode(1152, 896, {resizable=true, vsync=false, minwidth=200, minheight=200})

  maid64.setup(288,224)

  mire = maid64.newImage("mire.png")
  gradient = maid64.newImage("gradient.png")
  rotate = 0
end

function love.update(dt)
  rotate = rotate + dt
end

function love.draw()
  maid64.start()

  love.graphics.draw(gradient,0,0)
  love.graphics.print("Hello World!", 0, 0)
  love.graphics.draw(mire,144,112,rotate,1,1,32,32)

  maid64.finish()
end

function love.resize(w, h)
  maid64.resize(w,h)
end
