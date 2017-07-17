# autocrystal
Lua script for TAS-like of Pokémon Crystal

## Project goals:
* Create a Lua collection for the [BizHawk](https://github.com/TASVideos/BizHawk) emulator to automatically generate an input file for optimally playing Pokémon Crystal [U] Any%.
* Document RNG call timings and outcomes.

## Subtasks:
* Optimize overworld movement to minimize optional battles, including wild encounters and trainers.
* Manipulate battle RNG to make battles both safe and fast.
* Find previously-undiscovered glitches which could be manipulated to break sequence (i.e. wrong warps, ACE).  For example, if an object in the field has an invalid object type (between 7 and 15), the map object will be executed when talked to.  If such a map object can be spawned and manipulated, we could use it to execute arbitrary code (including a credits warp).  ([Source](https://github.com/pret/pokecrystal/blob/master/engine/events.asm#L578))

## How to use:
* Clone this repository.
* Download BisHawk.
* Open the BizHawk emulator and set it up to boot paused from BIOS.
* Open the Lua consol and load main.lua.
