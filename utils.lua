--
-- Created by IntelliJ IDEA.
-- User: scott
-- Date: 7/17/2017
-- Time: 8:22 AM
-- To change this template use File | Settings | File Templates.
--

local hRomBank = 0xFF9D
local target_bank = 0

function cycles_since_div_tick()
    return emu.totalexecutedcycles() % 256
end

function cycles_to_next_div_tick()
    return (-emu.totalexecutedcycles()) % 256
end

function pressbutton(input)
    local value = {}
    value[input] = true
    joypad.set(value)
    console.writeline("Pressed "..input.." at frame "..frame_delta())
end

function releasebutton(input)
    local value = {}
    value[input] = false
    joypad.set(value)
    console.writeline("Released "..input.." at frame "..frame_delta())
end

local startframe = emu.framecount()

function frame_delta()
    return emu.framecount() - startframe
end

function on_rom_execute(func, gbaddr, name)
    local bank = bit.rshift(gbaddr, 14)
    local addr = bit.band(gbaddr, 0x3fff)
    if bank ~= 0 then addr = bit.bor(addr, 0x4000) end
    target_bank = bank
    event.onmemoryexecute(func, addr, name)
end