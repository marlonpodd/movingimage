-----------------------------------------------------------------------------------------
--
-- main.lua
--
-- Created by: Marlon
-- Created on: Feb 25 2019
-- 
-- This file makes an object scroll across the screen
-----------------------------------------------------------------------------------------
local sanicscrollspeed = -1

local hadusscrollspeed = 1

local hadusseethru = 0.0000000000000001

local sanicseethru = 0.005
-- background image with width and height
local heavenImage = display.newImageRect("./assets/heaven.jpg", 720, 1080)
heavenImage.x = display.contentCenterX
heavenImage.y = display.contentCenterY
heavenImage.ID = "heaven image"

-- character image with width and height
local sanic = display.newImageRect("./assets/sanic.png", 193, 210)
sanic.x = 160
sanic.y = display.contentHeight - 0 -- note I am using not the center but the height of the display
sanic.ID = "sanic"
sanic.alpha = 0

local hadus = display.newImageRect("./assets/hadus.jpg", 193, 210)
hadus.x = 160
hadus.y = display.contentHeight - 480 -- note I am using not the center but the height of the display
hadus.ID = "hadus"
hadus.alpha = 1

local function MoveImage(event)
	-- add the scroll speed to the x-value of the image
    sanic.y = sanic.y + sanicscrollspeed
    print( display.fps )  -- note this displays how fast the current refresh is
end

local function HMoveImage(event)
	-- add the scroll speed to the x-value of the image
    hadus.y = hadus.y + hadusscrollspeed
   
end

local function HOpacity(event)

	hadus.alpha = hadus.alpha - hadusseethru
end

local function SOpacity(event)

	sanic.alpha = sanic.alpha + sanicseethru
end

-- MoveSnowman will be called at program start over and over (60 frames or times per second)
Runtime:addEventListener("enterFrame", MoveImage)

Runtime:addEventListener("enterFrame", HMoveImage)

Runtime:addEventListener("enterFrame", HOpacity)

Runtime:addEventListener("enterFrame", SOpacity)