--
-- Created by IntelliJ IDEA.
-- User: scott
-- Date: 7/17/2017
-- Time: 8:22 AM
-- To change this template use File | Settings | File Templates.
--

function cycles_since_div_tick()
    return emu.totalexecutedcycles() % 256
end

function cycles_to_next_div_tick()
    return (-emu.totalexecutedcycles()) % 256
end

function pressbutton(button)
    joy.set({button = true})
end

function release(button)
    joy.set({button = false})
end
