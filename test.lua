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
wMapStatus = 0xd432
toBeDestroyed = nil

local current_scene = 1
memory.usememorydomain("System Bus")

function print_frame_count_at()
    console.writeline("Current frame: "..frame_delta())
    event.unregisterbyname(wait_execute_name)
end

function print_frame_count_at_bank()
    if target_bank == 0 or memory.readbyte(hRomBank) == target_bank then
        print_frame_count_at()
    end
end

function spam_a()
    if bit.band(frame_delta(), 1) then
        pressbutton({"A"})
    else
        pressbutton({"B"})
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

function title_and_new_game()
    local input_mapper = {
        { 406, {"A"}}, -- Skip intro
        { 476, {"A"}}, -- Title screen
        { 530, {"Down"}}, -- Highlight OPTIONS
        { 534, {"A"}}, -- Select OPTIONS
        { 564, {"Left"}}, -- Fast text
        { 567, {"Down"}}, -- Battle Scene
        { 570, {"Left"}}, -- Off
        { 573, {"Down"}}, -- Battle Style
        { 576, {"Left"}}, -- Set
        { 579, {"B"}}, -- Confirm
        { 644, {"A"}}, -- NEW GAME
        { 756, {"Down"}}, -- Hover over girl
        { 760, {"A"}}, -- I'm a girl
        { 903, {"A"}}, -- ..........................................
        { 957, {"A"}}, -- Zzz... Hm? Wha...? You woke me up!
        {1014, {"A"}}, -- Will you check the clock for me?
        {1045, {"Up"}}, -- DAY 10 o'clock
        {1051, {"Up"}}, -- DAY 11 o'clock
        {1057, {"Up"}}, -- DAY 12 o'clock
        {1063, {"Up"}}, -- DAY 1 o'clock
        {1069, {"Up"}}, -- DAY 2 o'clock
        {1075, {"Up"}}, -- DAY 3 o'clock
        {1081, {"Up"}}, -- DAY 4 o'clock
        {1087, {"A"}}, -- DAY 5 o'clock
        {1117, {"A"}}, -- Confirm hour
        {1169, {"Down"}}, -- 0 min.
        {1175, {"Down"}}, -- 59 min.
        {1181, {"Down"}}, -- 58 min.
        {1187, {"Down"}}, -- 57 min.
        {1193, {"Down"}}, -- 56 min.
        {1199, {"Down"}}, -- 55 min.
        {1205, {"Down"}}, -- 54 min.
        {1211, {"Down"}}, -- 53 min.
        {1217, {"Down"}}, -- 52 min.
        {1223, {"Down"}}, -- 51 min.
        {1229, {"A"}}, -- 50 min.
        {1253, {"A"}}, -- Confirm minute.
        {1300, {"A"}}, -- DAY 5:50! Yikes I over-
        {1318, {"A"}}, -- slept!
    }
    if current_scene <= table.getn(input_mapper) then
        press_on_frame(input_mapper[current_scene][1],
                       input_mapper[current_scene][2])
    else
        while event.unregisterbyname("TitleAndNewGame") do end
        event.onmemoryexecute(pause_savestate, 0xa57, "WaitButtonPollFrame")
    end
end

function pause_savestate()
    print_frame_count_at()
    client.pause()
    savestate.saveslot(0)
    while event.unregisterbyname("WaitButtonPollFrame") do end
end

console.clear()
local tmp_input = {}
tmp_input["Power"] = true
joypad.set(tmp_input)
client.unpause()
while event.unregisterbyname("TitleAndNewGame") do end
event.onframeend(title_and_new_game, "TitleAndNewGame")
