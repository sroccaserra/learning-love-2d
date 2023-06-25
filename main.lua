local love = love
local gfx = love.graphics

local fullscreen = false

local canvas
local canvas_w = 288
local canvas_h = 224
local canvas_x, canvas_y

local K = 4
local scaler

local sheet
local spr_1
local spr_2
local spr_pointer
local x, y

function love.load()
  love.mouse.setVisible(false)

  local window_w = canvas_w*K
  local window_h = canvas_h*K
  love.window.setMode(window_w, window_h, {resizable=true, vsync=false, minwidth=200, minheight=200})

  if canvas_w < canvas_h then
    scaler = window_h / canvas_h
  else
    scaler = window_w / canvas_w
  end

  canvas_x = window_w/2 - scaler*canvas_w/2
  canvas_y = window_h/2 - scaler*canvas_h/2
  canvas = gfx.newCanvas(canvas_w, canvas_h)
  canvas:setFilter('nearest')

  sheet = gfx.newImage('assets/sheet.png')
  sheet:setFilter('nearest')
  spr_1 = gfx.newQuad(16, 0, 8, 8, sheet)
  spr_2 = gfx.newQuad(24, 0, 8, 8, sheet)
  spr_pointer = gfx.newQuad(0, 0, 16, 16, sheet)

  x = 10
  y = 10
end

function love.update(_dt)
  local mouse_x = math.floor((love.mouse.getX() - canvas_x) /
  (scaler * canvas_w) * canvas_w)
  local mouse_y = math.floor((love.mouse.getY() - canvas_y) /
  (scaler * canvas_h) * canvas_h)

  x = mouse_x
  y = mouse_y
end

function love.draw()
  gfx.setCanvas(canvas)
  gfx.clear()

  gfx.draw(sheet, spr_pointer, x, y)
  gfx.draw(sheet, spr_1, canvas_w/2-4, canvas_h/2-4)
  gfx.draw(sheet, spr_2, 50, 60)

  gfx.setCanvas()
  gfx.draw(canvas, canvas_x, canvas_y, 0, scaler)
end

function love.resize(w, h)
  if h/canvas_h < w/canvas_w then
    scaler = h / canvas_h
  else
    scaler = w / canvas_w
  end
  canvas_x = w/2 - (scaler * (canvas_w/2))
  canvas_y = h/2 - (scaler * (canvas_h/2))
end

function love.keypressed(key, _scancode, _isrepeat)
  if key == "return" and love.keyboard.isDown('lalt') then
    fullscreen = not fullscreen
    love.window.setFullscreen(fullscreen, "desktop")
  end
end
