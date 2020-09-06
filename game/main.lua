function love.load()

    require "global"
    local util = require "helper.util"

    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT,
        { resizable = true, vsync = false, minwidth = WINDOW_WIDTH, minheight = WINDOW_HEIGHT })

    local joysticks = love.joystick.getJoysticks()
    joystick = joysticks[1]

    love.mouse.setVisible(not love.mouse.isVisible())

    local isDice = false
    diceImage = love.graphics.newImage("image/sprite/Dice.png")
    local width = diceImage:getWidth()
    local height = diceImage:getHeight()
    diceFrames = {}
    for i = 1, DICE_NUM do
        table.insert(diceFrames, love.graphics.newQuad((i - 1) * WINDOW_WIDTH, 0, WINDOW_WIDTH, WINDOW_HEIGHT, width, height))
    end
    currentFrame = 1

    sfx = love.audio.newSource("audio/Holzwürfel_auf_Holztisch_1.flac", "static")
    sfx:setLooping(true)
end

function love.update(dt)

    --[[    if joystick then
            if joystick:isGamepadDown("dpleft") or
                    joystick:isGamepadDown("dpright") or
                    joystick:isGamepadDown("dpup") or
                    joystick:isGamepadDown("dpdown") or
                    joystick:isGamepadDown("a") or
                    joystick:isGamepadDown("b") or
                    joystick:isGamepadDown("x") or
                    joystick:isGamepadDown("y") then
                isDice = not isDice
            end
        end]]

    if joystick then
        if joystick:isGamepadDown("dpleft") then
            isDice = not isDice
        end
        if joystick:isGamepadDown("back") then
            love.event.quit()
        end
    end

    if isDice then
        random = sumdigits(dt)
        currentFrame = mapdigitonarray(random, DICE_NUM)
        sfx:play()
    else
        sfx:stop()
    end
end

function love.keypressed(key)
    if key == "space" then
        isDice = not isDice
    end
    if key == 'q' then
        love.event.quit()
    end
end

function love.draw()
    love.graphics.draw(diceImage, diceFrames[currentFrame], 0, 0)
end