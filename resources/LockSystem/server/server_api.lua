-- This is an information file. No code of this file is called in the game.
-- This is an information file. No code of this file is called in the game.
-- This is an information file. No code of this file is called in the game.

---- Check if a player has the keys to a vehicle
-- Works with a callback. This function is therefore not available on the client side. (I'll let you adapt !)
-- @param int target
-- @param string vehPlate
-- @return boolean
TriggerEvent("ls:hasKey", target, vehPlate, function(cb)
    print(cb) -- print true or false
end)
