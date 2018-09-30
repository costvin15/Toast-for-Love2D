toast = require("toast")

function love.load()
    love.graphics.setBackgroundColor(255, 0, 0);
    testing = toast:new("Hello, World!");
end

function love.update(dt)
    testing.update(dt);
end

function love.draw()
    testing.draw();
end