-- This is an information file. No code of this file is called in the game.
-- This is an information file. No code of this file is called in the game.
-- This is an information file. No code of this file is called in the game.

---- You can trigger this event when changing a number plate in another script to update the data
-- @param string oldPlate
-- @param string newPlate
TriggerClientEvent("ls:updateVehiclePlate", oldPlate, newPlate)

---- You can call this client event for generate the player's keys without having to press the key to "steal" them
-- e.g it's useful if it's the player's vehicle he's getting out of the garage
-- @param int id [opt]
-- @param string plate
-- @param string lockStatus [opt]
TriggerClientEvent("ls:newVehicle", id, plate, lockStatus)
    -- or
TriggerClientEvent("ls:newVehicle", nil, plate, nil)
