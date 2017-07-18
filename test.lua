--
-- Created by IntelliJ IDEA.
-- User: scott
-- Date: 7/17/2017
-- Time: 8:23 AM
-- To change this template use File | Settings | File Templates.
--

dofile("utils.lua")
wMenuCursorY = 0xcfa9
wTileMap = 0xc4a0
wJumptableIndex = 0xcf63

local current_scene = 1
memory.usememorydomain("System Bus")

function print_frame_count_at()
    console.writeline("Current frame: "..frame_delta())
    event.unregisterbyname("Start")
end

function print_frame_count_at_bank()
    if memory.readbyte(hRomBank) == target_bank then
        console.writeline("Current frame: "..frame_delta())
        event.unregisterbyname("Gamefreak")
    end
end

function press_on_frame(frame_target, input)
    if frame_delta() == frame_target then
        pressbutton(input)
        current_scene = current_scene + 1
        return true
    end
    return false
end

local input_mapper = {
    {406, "A"}, -- Skip intro
    {476, "A"}, -- Title screen
    {530, "Down"}, -- Highlight OPTIONS
    {534, "A"}, -- Select OPTIONS
    {564, "Left"}, -- Fast text
    {567, "Down"}, -- Battle Scene
    {570, "Left"}, -- Off
    {573, "Down"}, -- Battle Style
    {576, "Left"}, -- Set
    {579, "B"}, -- Confirm
    {644, "A"} -- NEW GAME
}

function do_current_event()
    if current_scene <= table.getn(input_mapper) then
        press_on_frame(input_mapper[current_scene][1],
                       input_mapper[current_scene][2])
    else
        console.writeline("Frame: "..frame_delta())
    end
end

console.clear()
client.unpause()
while event.unregisterbyname("MainEventLoop") do end
event.onframeend(do_current_event, "MainEventLoop")
