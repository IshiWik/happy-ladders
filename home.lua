-----------------------------------------------------


-----------------------------------------------------

local _CX = display.contentCenterX
local _CY = display.contentCenterY
local imgW = 727 -- width of image 
local imgH = 1417-- height of image
local imgR = imgH / imgW
local screenW = display.contentWidth - 2 * display.screenOriginX 
local screenH = display.contentHeight - 2 * display.screenOriginY 
local screenR = screenH / screenW
local factor = imgR > screenR and screenW / imgW or screenH / imgH

local background = display.newImageRect( 'img/welcome.png', imgW * factor, imgH * factor )
background .x, background .y = _CX, _CY

local _M = {}

local capture

function _M.start()
    capture = display.captureScreen()
    capture.x, capture.y = display.contentCenterX, display.contentCenterY
    capture.fill.effect = "filter.blurGaussian"
    capture.fill.effect.horizontal.blurSize = 20
    capture.fill.effect.vertical.blurSize = 20
end

function _M.stop()
    display.remove(capture)
    capture = nil
end

return _M