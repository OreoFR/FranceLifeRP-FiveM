-- Created by Murtaza
-- V 1.1
-- Requested by @Dillon_Dobusz on forum.fivem.net

-- Serverside

------ CONFIG ------

local everyoneAllowed = false -- If true, everyone is allowed and you do not need to add steam/ip identifiers. If false, you need to add steam/ip identifiers so they can use the command.

local allowed =  
{
	-- Pompier
	"steam:110000109674557", -- Enter your steam ids and ips as such. DO NOT forget the commas and do not add a comma at the end.
	"steam:110000112087f35",
	"steam:110000112e0e3b7",
	"steam:1100001345bca87",
	"steam:110000110836c4c",
	"steam:110000113b09176",
	"steam:110000131fa26e6",
	"steam:1100001108c56e0",
	"steam:11000011a7467b4",
	-- Police
	"steam:110000109f47e49",
	"steam:110000104a61f2c",
	"steam:11000010f2c6eab",
	"steam:1100001098b7dc8",
	"steam:110000110a54a04",
	"steam:1100001081b30e8",
	"steam:11000011299a056",
	"steam:11000010b991fe3",
	"steam:110000104ccdd08",
	"steam:1100001078b25d9",
	"steam:11000010c89a0ff",
    -- Mecano
    "steam:11000010be73d97",
    "steam:110000107975578",
    "steam:11000011c4d9319",
    "steam:110000118569837",
    "steam:11000011b283506",
	-- Armurier
	"steam:110000119d18d87",
	"steam:110000103010f03",
	"steam:11000013202a27e"
	
}

------ CODE DO NOT TOUCH UNLESS YOU KNOW WHAT YOU ARE DOING :) ------

AddEventHandler('chatMessage', function(source, n, msg)
	local msg = string.lower(msg)
	local identifier = GetPlayerIdentifiers(source)[1]
	
	if msg == '/cone' then
		CancelEvent()
		
		if everyoneAllowed then
			TriggerClientEvent('murtaza:cone', source)
		else
			if checkAllowed(identifier) then
				TriggerClientEvent('murtaza:cone', source)
			else
				TriggerClientEvent('murtaza:insuffPerms', source)	
			end
		end
		
	elseif msg == '/herse' then
	
		CancelEvent()
		
		if everyoneAllowed then
			TriggerClientEvent('murtaza:herse', source)
		else
			if checkAllowed(identifier) then
				TriggerClientEvent('murtaza:herse', source)
			else
				TriggerClientEvent('murtaza:insuffPerms', source)	
			end
		end

		elseif msg == '/polbarrier' then
	
		CancelEvent()
		
		if everyoneAllowed then
			TriggerClientEvent('murtaza:polbarrier', source)
		else
			if checkAllowed(identifier) then
				TriggerClientEvent('murtaza:polbarrier', source)
			else
				TriggerClientEvent('murtaza:insuffPerms', source)	
			end
		end
		
	elseif msg == '/barrier' then
	
		CancelEvent()
		
		if everyoneAllowed then
			TriggerClientEvent('murtaza:barrier', source)
		else
			if checkAllowed(identifier) then
				TriggerClientEvent('murtaza:barrier', source)
			else
				TriggerClientEvent('murtaza:insuffPerms', source)	
			end
		end
		
	end
end)

function checkAllowed(id)
	for k, v in pairs(allowed) do
		if id == v then
			return true
		end
	end
	
	return false
end