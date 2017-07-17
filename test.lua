--
-- Created by IntelliJ IDEA.
-- User: scott
-- Date: 7/17/2017
-- Time: 8:23 AM
-- To change this template use File | Settings | File Templates.
--

require "utils"

guid1 = nil
guid2 = nil

function print_frame_count_at()
    print("Current frame: "..emu.framecount())
    event.unregisterbyid(guid1)
end

function print_frame_count_at_bank39()
    if memory.readbyte(0xff9d) == 0x39 then
        console.write("Current frame: "..emu.framecount())
        event.unregisterbyid(guid2)
    end
end

console.clear()
guid1 = event.onmemoryexecute(print_frame_count_at, 0x100)
guid2 = event.onmemoryexecute(print_frame_count_at_bank39, 0x45c0)
