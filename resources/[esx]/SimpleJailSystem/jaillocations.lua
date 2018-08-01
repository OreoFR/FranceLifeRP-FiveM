jaillocation = {
    { 462.77, -993.73, 24.91},
	{ 462.77, -998.28, 24.91},
	{ 462.90,  -1001.88, 24.91},
	{ 463.69, -991.85, 24.91},
	{ 464.29, -1004.47, 24.91}
} 



Citizen.CreateThread(function ()
	while true do
	        Citizen.Wait(0)
                        for i = 1, #jaillocation do
                              jailCoords2 = jaillocation[i]
                             if(GetDistanceBetweenCoords(jailCoords2[1], jailCoords2[2], jailCoords2[3],GetEntityCoords(PlayerPedId())) < 1)then

		     TriggerServerEvent('JustToJail', PlayerId())
                             end
                        end   
                end
end)

RegisterNetEvent('detainedOrNot')
AddEventHandler('detainedOrNot', function(user)
	SetEntityCoords(GetPlayerPed(-1), 459.741, -994.561, 24.914, 1, 0, 0, 1)
	states.frozenPos = pos
end)

