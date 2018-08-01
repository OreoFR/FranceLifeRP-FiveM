-- client side handcuff script

local handCuffed = false -- store wether we are handcuffed or not

RegisterNetEvent('mHandCuff') -- register that this is a valid event

-- register a function to be called when we recieve the event
AddEventHandler('mHandCuff', function()
  -- set handCuffed equal to the oposite of its current value (true or false)
  handCuffed = not handCuffed
end)


Citizen.CreateThread(function() -- create a thread
  while true do -- loop through this code infinitely
    Citizen.Wait(1) -- required in an infinite loop or it will crash

    if (handCuffed == true) then -- we are handcuffed
      RequestAnimDict('mp_arresting') -- tell the game to load this animation dictionary

      -- check if the animation dictionary has loaded, if not, wait
      while not HasAnimDictLoaded('mp_arresting') do
        Citizen.Wait(0)
      end

      local myPed = PlayerPedId() -- get our ped identifier
      local animation = 'idle' -- animation to play
      local flags = 49 -- only play the animation on the upper body

      -- play the animation
      TaskPlayAnim(myPed, 'mp_arresting', animation, 8.0, -8, -1, flags, 0, 0, 0, 0)
    end
  end
end)
