--
-- Created by IntelliJ IDEA.
-- User: scott
-- Date: 7/17/2017
-- Time: 8:22 AM
-- To change this template use File | Settings | File Templates.
--

hRomBank = 0xFF9D
target_bank = 0
wait_execute_name = ""
startframe = 0
which_array = 1
current_scene = 1
game_start_frame = 644

function cycles_since_div_tick()
    return emu.totalexecutedcycles() % 256
end

function cycles_to_next_div_tick()
    return (-emu.totalexecutedcycles()) % 256
end

function pressbutton(input)
    local value = {}
    for i, button in pairs(input) do
        value[button] = true
        console.writeline("Pressed "..button.." at frame "..frame_delta())
    end
    joypad.set(value)
end

function releasebutton(input)
    local value = {}
    for i, button in pairs(input) do
        value[button] = false
        console.writeline("Released "..button.." at frame "..frame_delta())
    end
    joypad.set(value)
end

function reset()
    console.clear()
    local tmp_input = {}
    tmp_input["Power"] = true
    joypad.set(tmp_input)
    client.unpause()
    startframe = emu.framecount()
    while event.unregisterbyname("TitleAndNewGame") do end
    current_scene = 1
    which_array = 1
    frame_offset = {0, game_start_frame}
    event.onframeend(title_and_new_game, "TitleAndNewGame")
end

function frame_delta()
    return emu.framecount() - startframe
end

function on_rom_execute(func, gbaddr, name)
    local bank = bit.rshift(gbaddr, 14)
    local addr = bit.band(gbaddr, 0x3fff)
    if bank ~= 0 then addr = bit.bor(addr, 0x4000) end
    target_bank = bank
    event.onmemoryexecute(func, addr, name)
    wait_execute_name = name
end