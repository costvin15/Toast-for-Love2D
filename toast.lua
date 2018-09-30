--[[
MIT License

Copyright (c) 2018 Vinicius Costa Castro

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
]]

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
    current.textfont (varargs[3] and varargs[4]) and love.graphics.newFont(varargs[3], varargs[4]) or love.graphics.newFont()

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
                else
                    error("Expected number or a string equal to \"infinite\". Was received \"" .. current.duration "\" with type \"" .. type(current.duration) .. "\"")
                end
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
                (windowHeight / 2) - (textHeight / 2) - 25,
                (windowHeight - 150) - (textHeight / 2) - 25,
                textHeight + 50,
                textWidth + 25
            )

            if (current.backgroundcolor[1] == 0) and (current.backgroundcolor[2] == 0) and (current.backgroundcolor[3] == 0) then
                love.graphics.setColor(255, 255, 255)
            else
                love.graphics.setColor(0, 0, 0);
            end

            love.graphics.printf(current.text, (windowWidth / 2) - (textWidth / 2), (windowHeight - 150) - (textHeight / 2))
        end
    end

    return current
end

return toast