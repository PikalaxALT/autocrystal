--
-- Created by IntelliJ IDEA.
-- User: scott
-- Date: 7/17/2017
-- Time: 8:23 AM
-- To change this template use File | Settings | File Templates.
--

dofile("utils.lua")
dofile("inputs.lua")
wMenuCursorY = 0xcfa9
wTileMap = 0xc4a0
wJumptableIndex = 0xcf63
wMapStatus = 0xd432
toBeDestroyed = nil

-- This value must be a multiple of 4 not less than 644.
-- 644 is the earliest frame that can be reached by TAS.
-- If this is set to any frame that is not a multiple of 4,
-- the game will ignore the A input on that frame.
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
    if frame_delta() == frame_target + frame_offset[which_array] then
        pressbutton(input)
        current_scene = current_scene + 1
        return true
    end
    return false
end

function title_and_new_game()
    if current_scene <= table.getn(input_mapper[which_array]) then
        press_on_frame(input_mapper[which_array][current_scene][1],
                       input_mapper[which_array][current_scene][2])
    elseif which_array <= table.getn(input_mapper) then
        if which_array == 1 then
            event.onmemoryexecute(get_id, 0x5b44, "IDHasBeenSampled")
            savestate.saveslot(0)
        end
        which_array = which_array + 1
        current_scene = 1
    else
        while event.unregisterbyname("TitleAndNewGame") do end
        event.onmemoryexecute(pause_savestate, 0xa57, "WaitButtonPollFrame")
    end
end

function pause_savestate()
    print_frame_count_at()
    client.pause()
    while event.unregisterbyname("WaitButtonPollFrame") do end
end

function get_id()
    local player_id = memory.read_u16_le(0xd47b)
    local lotto_id = memory.read_u16_le(0xdc9f)
    if player_id ~= lotto_id then
        game_start_frame = game_start_frame + 4
        current_scene = table.getn(input_mapper[1])
        which_array = 1
        console.writeline("Trying start at frame "..game_start_frame)
        savestate.loadslot(0)
    else
        client.pause()
    end
    console.writeline("Player ID: "..player_id)
    console.writeline("Lotto ID: "..lotto_id)
    while event.unregisterbyname("IDHasBeenSampled") do end
end

reset()
