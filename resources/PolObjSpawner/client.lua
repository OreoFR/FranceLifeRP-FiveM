-- Created by Murtaza
-- V 1.1
-- Requested by @Dillon_Dobusz on forum.fivem.net

-- Clientside

RegisterNetEvent('murtaza:cone')
RegisterNetEvent('murtaza:herse')
RegisterNetEvent('murtaza:barrier')
RegisterNetEvent('murtaza:polbarrier')
RegisterNetEvent('murtaza:insuffPerms')

AddEventHandler('murtaza:insuffPerms', function()
	notification('~r~You have insufficient permissions to place this object!')
end)

AddEventHandler('murtaza:cone', function()
	local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
	local heading = GetEntityHeading(GetPlayerPed(-1))
	
	RequestModel('prop_roadcone01a')
	
	while not HasModelLoaded('prop_roadcone01a') do
		Citizen.Wait(1)
	end
	
	local cone = CreateObject('prop_roadcone01a', x, y, z-2, true, true, true)
	PlaceObjectOnGroundProperly(cone)
	SetEntityHeading(cone, heading)
	notification('~g~Le plot est placer!')
end)

AddEventHandler('murtaza:herse', function()
	local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
	local heading = GetEntityHeading(GetPlayerPed(-1))
	
	RequestModel('p_ld_stinger_s')
	
	while not HasModelLoaded('p_ld_stinger_s') do
		Citizen.Wait(1)
	end
	
	local herse = CreateObject('p_ld_stinger_s', x, y, z-2, true, true, true)
	--local cone = CreateObject('p_ld_stinger_s', x, y, z-2, true, true, true)
	PlaceObjectOnGroundProperly(herse)
	--PlaceObjectOnGroundProperly(cone)
	SetEntityHeading(herse, heading)
	notification('~g~La herse est placer!')
end)

AddEventHandler('murtaza:barrier', function()
	local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
	local heading = GetEntityHeading(GetPlayerPed(-1))
	
	RequestModel('prop_barrier_work06a')
	
	while not HasModelLoaded('prop_barrier_work06a') do
		Citizen.Wait(1)
	end
	
	local barrier = CreateObject('prop_barrier_work06a', x, y, z, true, true, true)
	--local cone = CreateObject('prop_barrier_work05', x, y, z-2, true, true, true)
	PlaceObjectOnGroundProperly(barrier)
	--PlaceObjectOnGroundProperly(cone)
	SetEntityHeading(barrier, heading)
	notification('~g~La barrier est placer!')
end)

AddEventHandler('murtaza:polbarrier', function()
	local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
	local heading = GetEntityHeading(GetPlayerPed(-1))
	
	RequestModel('prop_barrier_work05')
	
	while not HasModelLoaded('prop_barrier_work05') do
		Citizen.Wait(1)
	end
	
	local polbarrier = CreateObject('prop_barrier_work05', x, y, z-2, true, true, true)
	--local cone = CreateObject('prop_barrier_work02a', x, y, z-2, true, true, true)
	PlaceObjectOnGroundProperly(polbarrier)
	--PlaceObjectOnGroundProperly(cone)
	SetEntityHeading(polbarrier, heading)
	notification('~g~La barrier est placer!')
end)

function notification(msg)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(msg)
	DrawNotification(false, false)
end