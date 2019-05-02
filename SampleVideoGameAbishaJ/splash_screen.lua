-----------------------------------------------------------------------------------------
--
-- splash_screen.lua
-- Created by: Your Name
-- Date: Month Day, Year
-- Description: This is the splash screen of the game. It displays the 
-- company logo that...
-----------------------------------------------------------------------------------------

-- Use Composer Library
local composer = require( "composer" )

-- Name the Scene
sceneName = "splash_screen"

-----------------------------------------------------------------------------------------

-- Create Scene Object
local scene = composer.newScene( sceneName )

---------------------------------------------------------------------------------------------------
-- SOUNDS
---------------------------------------------------------------------------------------------------
local DogBarkingSound = audio.loadSound( "Sounds/DogBarking.mp3") -- setting a variable to an mp3 file
local DogBarkingSoundChannel
local RocketshipSound = audio.loadSound( "Sounds/Rocketship.mp3") -- setting a variable to an mp3 file
local RocketshipSoundChannel

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------
-- background image with width and height
local CompLogo 
-- charector width and height
local Rocketship 

--------------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
--------------------------------------------------------------------------------------------
-- The function that will go to the main menu 
local function gotoMainMenu()
    composer.gotoScene( "main_menu" )
end

local function hideLogo()
    CompLogo.isVisible = false
    Rocketship.isVisible = false
end

-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -- set the background to be black
    display.setDefault("background", 0, 0, 0)

    CompLogo = display.newImageRect("Images/CompanyLogoAbishaJStars@2x.png", 600, 600)
    Rocketship = display.newImageRect("Images/CompanyLogoAbishaJRocketship@2x.png", 400, 200)

end -- function scene:create( event )

--------------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )
    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    -- Called when the scene is still off screen (but is about to come on screen).
    if ( phase == "will" ) then
       
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
          DogBarkingSoundChannel = audio.play(DogBarkingSound)
         RocketshipSoundChannel = audio.play(RocketshipSound)

         -- set the initial x and y postion of CompanyLogo
         CompLogo.x = 500
         CompLogo.y = display.contentHeight/2

         -- set the initial x and y position of the Rocketship
         Rocketship.x = 1024
         Rocketship.y = 350

         transition.to(Rocketship, {x=525, y=350, time=1500})

         -- moveship will be called over and over again
        --Runtime:addEventListener("enterFrame", FadeinRocketship)

        -- Go to the main menu screen after the given time.
        timer.performWithDelay ( 3000, gotoMainMenu) 
        timer.performWithDelay ( 3000, hideLogo)         
    end

end --function scene:show( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -----------------------------------------------------------------------------------------

    -- Called when the scene is on screen (but is about to go off screen).
    -- Insert code here to "pause" the scene.
    -- Example: stop timers, stop animation, stop audio, etc.
    if ( phase == "will" ) then  

    -----------------------------------------------------------------------------------------

    -- Called immediately after scene goes off screen.
    elseif ( phase == "did" ) then
       
    end

end --function scene:hide( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------


    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.
end -- function scene:destroy( event )

-----------------------------------------------------------------------------------------
-- EVENT LISTENERS
-----------------------------------------------------------------------------------------

-- Adding Event Listeners
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )


-----------------------------------------------------------------------------------------
return scene