local crouched = false
local GUI							= {}
GUI.Time							= 0

Citizen.CreateThread( function()
    while true do 
        Citizen.Wait( 1 )

        local ped = GetPlayerPed( -1 )

        if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
            DisableControlAction( 1, Config.crouch.clavier, true )
            DisableControlAction( 2, Config.crouch.manette, true )

            if ( not IsPauseMenuActive() ) then 
                if ( IsDisabledControlJustPressed( 1, Config.crouch.clavier ) ) or ( IsDisabledControlJustPressed( 2, Config.crouch.manette ) ) then 
                    RequestAnimSet( "move_ped_crouched" )

                    while ( not HasAnimSetLoaded( "move_ped_crouched" ) ) do 
                        Citizen.Wait( 100 )
                    end 

                    if ( crouched == true ) then 
                        ResetPedMovementClipset( ped, 0 )
                        crouched = false 
                    elseif ( crouched == false ) then
                        SetPedMovementClipset( ped, "move_ped_crouched", 0.25 )
                        crouched = true 
                    end 
					
					GUI.Time  = GetGameTimer()
                end
            end 
        end 
    end
end )