-- function love.load()
--   love.graphics.setDefaultFilter("nearest", "nearest")
--   -- local oldNewImage = love.graphics.newImage
-- 
--   -- function love.graphics.newImage(...)
--   --   local img = oldNewImage(...)
--   --   img:setFilter("nearest", "nearest")
--   --   return img
--   -- end
--   print("loaded.............")
-- end

local x = 0
local s = 20

-- function love.draw()
--   love.graphics.push()
--   love.graphics.scale(s, s)
--   love.graphics.print("Hello World!", x, 0)
--   love.graphics.pop()
--   x = x + 0.1
-- end

function love.load()
  --optional settings for window
  love.window.setMode(640, 640, {resizable=true, vsync=false, minwidth=200, minheight=200})

  --initilizing maid64 for use and set to 64x64 mode
  maid64(64)

  --loading test sprite
  maid = love.graphics.newImage("mire.png")
  --setting the test sprite's filter so it wont do any anti-aliasing
  maid:setFilter("nearest","nearest")

  rotate = 0

end

function love.update(dt)
  --rotation for test sprite
  rotate = rotate + dt
end

function maid64_draw()
  --this is where you do image drawing
   love.graphics.print("Hello World!", x, 0)

  --test sprite
  love.graphics.draw(maid,32,32,rotate,1,1,32,32)
end

function maid64(pixels)
  maid64 = {}
  maid64.size = pixels or 64 
  maid64.scaler = love.graphics.getHeight() / maid64.size
  maid64.x = love.graphics.getWidth()/2-(maid64.scaler*(maid64.size/2))
  maid64.y = love.graphics.getHeight()/2-(maid64.scaler*(maid64.size/2))
  maid64.canvas = love.graphics.newCanvas(maid64.size, maid64.size)
  maid64.canvas:setFilter("nearest","nearest")
end

function love.draw()
  love.graphics.setCanvas(maid64.canvas)
  love.graphics.clear()
  maid64_draw()
  love.graphics.setCanvas()
  love.graphics.draw(maid64.canvas, maid64.x,maid64.y,0,maid64.scaler,maid64.scaler)
end

function love.resize(w, h)
  if h < w then
    maid64.scaler = h / maid64.size
  else
    maid64.scaler = w / maid64.size
  end
  maid64.x = w/2-(maid64.scaler*(maid64.size/2))
  maid64.y = h/2-(maid64.scaler*(maid64.size/2))
end
