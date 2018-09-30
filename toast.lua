toast = {}

function toast:new(text, ...)
    -- receive the arguments
    local varargs = { ... }

    -- storing current data 
    local current = {}

    -- current data
    -- @text to print
    current.text = text
    -- @duration on screen -> receive varargs[1] if this is not false, or infinite
    current.duration = varargs[1] or "infinite"
    -- @window background color -> receive varargs[2] if this is not false, or the color below
    current.backgroundcolor = varargs[2] or { 0, 0, 0, 0.8 };
    -- @Typographic font of text to be printed -> receive the return of love.graphics.newfont(varargs[3], varargs[4]) if varargs[3] and varargs[4] are not false, or the return of love.graphics.newFont() 
    current.textfont = (varargs[3] and varargs[4]) and love.graphics.newFont(varargs[3], varargs[4]) or love.graphics.newFont()

    current.isVisible = false
    current.createdAt = false

    -- Window presets
    local windowWidth = love.graphics.getWidth()
    local windowHeight = love.graphics.getHeight()
    -- Text presets
    local textWidth = current.textfont:getWidth(text)
    local textHeight = current.textfont:getHeight(text)

    -- returns the current window visibility
    current.visibility = function()
        return current.isVisible
    end

    -- displays the window
    current.show = function()
        current.isVisible = true
        current.createdAt = os.time()
    end

    -- callback function required by Love2D
    -- here is made sure of the time on screen
    current.update = function(dt)
        -- hides the window if your time on screen is over
        if (type(current.duration) == "number") then
            if (type(current.createdAt) == "number") then
                if (os.difftime(os.time(), current.createdAt) > current.duration) then
                    current.isVisible = false
                end
            end
        -- displays on screen forever if the duration is infinite
        elseif (type(current.duration) == "string") then
            if (current.duration == "infinite") then
                if (current.visibility() ~= true) then
                    current.isVisible = true
                end
            else
                error("Expected number or a string equal to \"infinite\". Was received \"" .. current.duration "\" with type \"" .. type(current.duration) .. "\"")
            end
        else
            error("Expected number or a string equal to \"infinite\". Was received \"" .. current.duration "\" with type \"" .. type(current.duration) .. "\"")
        end
    end

    -- callback function required by Love2D
    -- here the magic begins (and is draw)
    current.draw = function()
        if (current.visibility()) then
            love.graphics.setColor(current.backgroundcolor)
            love.graphics.setFont(current.textfont)
            love.graphics.rectangle("fill",
                (windowWidth / 2) - (textWidth / 2) - 25,
                (windowHeight - 150) - (textHeight / 2) - 25 / 2,
                textWidth + 50,
                textHeight + 25
            )

            if (current.backgroundcolor[1] == 0) and (current.backgroundcolor[2] == 0) and (current.backgroundcolor[3] == 0) then
                love.graphics.setColor(255, 255, 255)
            else
                love.graphics.setColor(0, 0, 0);
            end

            love.graphics.print(current.text, (windowWidth / 2) - (textWidth / 2), (windowHeight - 150) - (textHeight / 2))
        end
    end

    return current
end

return toast