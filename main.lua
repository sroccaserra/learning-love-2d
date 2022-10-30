local maid64 = require 'maid64'

local rotate
local mire
local gradient
local x
local W = 288
local H = 224
local K = 4

function love.load()
  love.window.setMode(W*K, H*K, {resizable=true, vsync=false, minwidth=200, minheight=200})

  maid64.setup(W,H)

  mire = maid64.newImage("mire.png")
  gradient = maid64.newImage("gradient.png")
  rotate = 0
  x = 0
end

function love.update(dt)
  rotate = rotate + dt
  x = x + dt*60
  if x >= W then
    x = x - W
  end
end

function love.draw()
  maid64.start()

  love.graphics.draw(gradient,x,0)
  love.graphics.draw(gradient,x,0)
  love.graphics.draw(gradient,x-W,0)
  love.graphics.draw(mire,144,112,rotate,1,1,32,32)

  maid64.finish()
end

function love.resize(w, h)
  maid64.resize(w,h)
end

function love.keypressed(key, scancode, isrepeat)
  if key == "return" and love.keyboard.isDown('lalt') then
    fullscreen = not fullscreen
    love.window.setFullscreen(fullscreen, "desktop")
  end
end
