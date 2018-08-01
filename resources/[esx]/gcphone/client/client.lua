--====================================================================================
-- #Author: Jonathan D @ Gannon
--====================================================================================
-- Configuration

local Keys = {
  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
  ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
  ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
  ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
  ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
  ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
  ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
  ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

ESX              = nil
local PlayerData = {}

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer   
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

-- Configuration
local KeyToucheCloseEvent = {
  { code = 172, event = 'ArrowUp' },
  { code = 173, event = 'ArrowDown' },
  { code = 174, event = 'ArrowLeft' },
  { code = 175, event = 'ArrowRight' },
  { code = 176, event = 'Enter' },
  { code = 177, event = 'Backspace' },
}

local menuIsOpen = false
local contacts = {}
local messages = {}
local myPhoneNumber = ''
local isDead = false
--====================================================================================
--  
--====================================================================================

function UpMiniMapNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(0, 1)
end

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
	
    if IsControlJustPressed(1, Keys['Y']) then
      ESX.TriggerServerCallback('gcphone:getItemAmount', function(qtty)
		  if qtty > 0 then
          TooglePhone()
          TriggerServerEvent("gcphone:allUpdate")
        else
          UpMiniMapNotification("Vous n'avez pas de ~r~téléphone~s~")
        end
      end, 'phone')

    end
    
    if menuIsOpen == true then
      DeadCheck()
      for _, value in ipairs(KeyToucheCloseEvent) do
        if IsControlJustPressed(1, value.code) then
          Citizen.Trace('Event: ' .. value.event)
          SendNUIMessage({keyUp = value.event})
        end
      end
    end
  end
end)
 
function DeadCheck() 
  local dead = IsEntityDead(GetPlayerPed(-1))
  if dead ~= isDead then 
    isDead = dead
    SendNUIMessage({event = 'updateDead', isDead = isDead})
  end
end

--====================================================================================
--  Events
--====================================================================================
RegisterNetEvent("gcphone:myPhoneNumber")
AddEventHandler("gcphone:myPhoneNumber", function(_myPhoneNumber)
  myPhoneNumber = _myPhoneNumber
  SendNUIMessage({event = 'updateMyPhoneNumber', myPhoneNumber = myPhoneNumber})
end)

RegisterNetEvent("gcphone:contactList")
AddEventHandler("gcphone:contactList", function(_contacts)
  SendNUIMessage({event = 'updateContacts', contacts = _contacts})
  contacts = _contacts
end)

RegisterNetEvent("gcphone:allMessage")
AddEventHandler("gcphone:allMessage", function(allmessages)
  SendNUIMessage({event = 'updateMessages', messages = allmessages})
  messages = allmessages
end)

RegisterNetEvent("gcphone:receiveMessage")
AddEventHandler("gcphone:receiveMessage", function(message)
  table.insert(messages, message)
  SendNUIMessage({event = 'updateMessages', messages = messages})
  Citizen.Trace('sendMessage: ' .. json.encode(messages))
    if message.owner == 0 then
        SetNotificationTextEntry("STRING");
        AddTextComponentString(message.message);
		TriggerEvent('InteractSound_CL:PlayOnOne', 'demo', 1.0)
        SetNotificationMessage("CHAR_CHAT_CALL", "CHAR_CHAT_CALL", false, 1, "~y~Nouveau message :~s~", "");
        DrawNotification(false, true);
        --SetNotificationTextEntry("STRING")
        --AddTextComponentString('~o~Nouveau message')
        --DrawNotification(false, false)
        PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0, 0, 1)
        Citizen.Wait(300)
        PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0, 0, 1)
        Citizen.Wait(300)
        PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0, 0, 1)
    end
end)

RegisterNetEvent("OpenTel")
AddEventHandler("OpenTel", function()
  
  menuIsOpen = true
  
  if menuIsOpen == true then 
    Citizen.Trace('open')
    ePhoneInAnim()
    Wait(1000)
    SendNUIMessage({show = menuIsOpen})
  else
    ePhoneOutAnim()
  end
  --ShowNotificationMenuCivil2("~h~~g~TooglePhone !")
end)

function ShowNotificationMenuCivil2(text)
  SetNotificationTextEntry("STRING")
  AddTextComponentString(text)
  DrawNotification(false, false)
end

RegisterNetEvent('esx:setAccountMoney')
AddEventHandler('esx:setAccountMoney', function(account)
  if account.name == 'bank' then
    SendNUIMessage({event = 'updateBankbalance', banking = account.money})
  end 
end)

--====================================================================================
--  Function client | Contacts
--====================================================================================
function addContact(display, num) 
    TriggerServerEvent('gcphone:addContact', display, num)
end

function deleteContact(num) 
    TriggerServerEvent('gcphone:deleteContact', num)
end
--====================================================================================
--  Function client | Messages
--====================================================================================
function sendMessage(num, message)
  TriggerServerEvent('gcphone:sendMessage', num, message)
end

function deleteMessage(msgId)
  Citizen.Trace('deleteMessage' .. msgId)
  TriggerServerEvent('gcphone:deleteMessage', msgId)
  for k, v in ipairs(messages) do 
    if v.id == msgId then
      table.remove(messages, k)
      SendNUIMessage({event = 'updateMessages', messages = messages})
      return
    end
  end
end

function deleteMessageContact(num)
  TriggerServerEvent('gcphone:deleteMessageNumber', num)
end

function deleteAllMessage()
  TriggerServerEvent('gcphone:deleteAllMessage')
end

function setReadMessageNumber(num)
  TriggerServerEvent('gcphone:setReadMessageNumber', num)
  for k, v in ipairs(messages) do 
    if v.transmitter == num then
      v.isRead = true
    end
  end
end

function requestAllMessages()
  TriggerServerEvent('gcphone:requestAllMessages')
end

function requestAllContact()
  TriggerServerEvent('gcphone:requestAllContact')
end























--====================================================================================
--  Function client | Appels
--====================================================================================
local inCall = false
local aminCall = false

RegisterNetEvent("gcphone:waitingCall")
AddEventHandler("gcphone:waitingCall", function(infoCall)
  SendNUIMessage({event = 'waitingCall', infoCall = infoCall})
  if infoCall.transmitter_num == myPhoneNumber then
    aminCall = true
    ePhoneStartCall()
  end
end)

RegisterNetEvent("gcphone:acceptCall")
AddEventHandler("gcphone:acceptCall", function(infoCall)
  if inCall == false then
    inCall = true
    NetworkSetVoiceChannel(infoCall.id + 1)
    NetworkSetTalkerProximity(0.0)
  end
  if aminCall == false then
    aminCall = true
    ePhoneStartCall()
  end
  SendNUIMessage({event = 'acceptCall', infoCall = infoCall})
end)

RegisterNetEvent("gcphone:rejectCall")
AddEventHandler("gcphone:rejectCall", function(infoCall)
  if inCall == true then
    inCall = false
    Citizen.InvokeNative(0xE036A705F989E049)
    NetworkSetTalkerProximity(2.5)
  end
  if aminCall == true then
    ePhoneStopCall()
    aminCall = false
  end
  SendNUIMessage({event = 'rejectCall', infoCall = infoCall})
end)


RegisterNetEvent("gcphone:historiqueCall")
AddEventHandler("gcphone:historiqueCall", function(historique)
  SendNUIMessage({event = 'historiqueCall', historique = historique})
end)

function startCall (phone_number)
  TriggerServerEvent('gcphone:startCall', phone_number)
end

function acceptCall (infoCall)
  TriggerServerEvent('gcphone:acceptCall', infoCall)
end

function rejectCall(infoCall)
  TriggerServerEvent('gcphone:rejectCall', infoCall)
end

function ignoreCall(infoCall)
  TriggerServerEvent('gcphone:ignoreCall', infoCall)
end

function requestHistoriqueCall() 
  TriggerServerEvent('gcphone:getHistoriqueCall')
end

function appelsDeleteHistorique (num)
  TriggerServerEvent('gcphone:appelsDeleteHistorique', num)
end

function appelsDeleteAllHistorique ()
  TriggerServerEvent('gcphone:appelsDeleteAllHistorique')
end
  

--====================================================================================
--  Event - Appels
--====================================================================================

RegisterNUICallback('startCall', function (data, cb)
  startCall(data.numero)
  cb()
end)

RegisterNUICallback('acceptCall', function (data, cb)
  acceptCall(data.infoCall)
  cb()
end)

RegisterNUICallback('rejectCall', function (data, cb)
  rejectCall(data.infoCall)
  cb()
end)

RegisterNUICallback('ignoreCall', function (data, cb)
  ignoreCall(data.infoCall)
  cb()
end)

RegisterNUICallback('appelsDeleteHistorique', function (data, cb)
  appelsDeleteHistorique(data.numero)
  cb()
end)

RegisterNUICallback('appelsDeleteAllHistorique', function (data, cb)
  appelsDeleteAllHistorique(data.infoCall)
  cb()
end)































































--====================================================================================
--  Gestion des evenements NUI
--==================================================================================== 
function tprint (t, s)
  for k, v in pairs(t) do
      local kfmt = '["' .. tostring(k) ..'"]'
      if type(k) ~= 'string' then
          kfmt = '[' .. k .. ']'
      end
      local vfmt = '"'.. tostring(v) ..'"'
      if type(v) == 'table' then
          tprint(v, (s or '')..kfmt)
      else
          if type(v) ~= 'string' then
              vfmt = tostring(v)
          end
          print(type(t)..(s or '')..kfmt..' = '..vfmt)
      end
  end
end
RegisterNUICallback('log', function(data, cb)
  -- print(data)
  -- tprint(data)
  cb()
end)
RegisterNUICallback('focus', function(data, cb)
  cb()
end)
RegisterNUICallback('blur', function(data, cb)
  cb()
end)
RegisterNUICallback('reponseText', function(data, cb)
  local limit = data.limit or 255
  local text = data.text or ''
  
  DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "", text, "", "", "", limit)
  while (UpdateOnscreenKeyboard() == 0) do
      DisableAllControlActions(0);
      Wait(0);
  end
  if (GetOnscreenKeyboardResult()) then
      text = GetOnscreenKeyboardResult()
  end
  cb(json.encode({text = text}))
end)
--====================================================================================
--  Event - Messages
--====================================================================================
RegisterNUICallback('getMessages', function(data, cb)
  cb(json.encode(messages))
end)
RegisterNUICallback('sendMessage', function(data, cb)
  if data.message == '%pos%' then
    local myPos = GetEntityCoords(GetPlayerPed(-1))
    data.message = 'GPS: ' .. myPos.x .. ', ' .. myPos.y
  end
  TriggerServerEvent('gcphone:sendMessage', data.phoneNumber, data.message)
end)
RegisterNUICallback('deleteMessage', function(data, cb)
  deleteMessage(data.id)
  cb()
end)
RegisterNUICallback('deleteMessageNumber', function (data, cb)
  deleteMessageContact(data.number)
  cb()
end)
RegisterNUICallback('deleteAllMessage', function (data, cb)
  deleteAllMessage()
  cb()
end)
RegisterNUICallback('setReadMessageNumber', function (data, cb)
  setReadMessageNumber(data.number)
  cb()
end)
--====================================================================================
--  Event - Contacts
--====================================================================================
RegisterNUICallback('addContact', function(data, cb) 
  TriggerServerEvent('gcphone:addContact', data.display, data.phoneNumber)
end)

RegisterNUICallback('updateContact', function(data, cb)
  TriggerServerEvent('gcphone:updateContact', data.id, data.display, data.phoneNumber)
end)

RegisterNUICallback('deleteContact', function(data, cb)
  TriggerServerEvent('gcphone:deleteContact', data.id)
end)

RegisterNUICallback('getContacts', function(data, cb)
  cb(json.encode(contacts))
end)

RegisterNUICallback('setGPS', function(data, cb)
  SetNewWaypoint(tonumber(data.x), tonumber(data.y))
  cb()
end)
RegisterNUICallback('callEvent', function(data, cb)
  local plyPos = GetEntityCoords(GetPlayerPed(-1), true)
  if data.eventName ~= 'cancel' then
    if data.data ~= nil then 
      --TriggerServerEvent("call:makeCall", "police", {x=plyPos.x,y=plyPos.y,z=plyPos.z},ResultMotifAdd,GetPlayerServerId(player))
      TriggerServerEvent("call:makeCall", data.eventName, {x=plyPos.x,y=plyPos.y,z=plyPos.z}, data.data, GetPlayerServerId(player))
      if data.eventName == "police" then
        ShowNotificationMenuCivil2("~h~Vous avez appelé la ~b~Police")
      elseif data.eventName == "taxi" then
        ShowNotificationMenuCivil2("~h~Vous avez appelé un ~b~Taxi")
      elseif data.eventName == "mecano" then
        ShowNotificationMenuCivil2("~h~Vous avez appelé un ~b~Mécano")
      elseif data.eventName == "journaliste" then
        ShowNotificationMenuCivil2("~h~Vous avez appelé un ~b~Journaliste")
      elseif data.eventName == "ambulance" then
        ShowNotificationMenuCivil2("~h~Vous avez appelé un ~b~Ambulancier")
      elseif data.eventName == "unicorn" then
        ShowNotificationMenuCivil2("~h~Vous avez appelé le ~b~Unicorn")
	  elseif data.eventName == "state" then
        ShowNotificationMenuCivil2("~h~Vous avez appelé un ~b~agent du Gouvernement")
	  elseif data.eventName == "pilot" then
        ShowNotificationMenuCivil2("~h~Vous avez appelé un ~b~Pilot")
	  elseif data.eventName == "fib" then
        ShowNotificationMenuCivil2("~h~Vous avez appelé un ~b~agent du FBI")
	  elseif data.eventName == "army" then
        ShowNotificationMenuCivil2("~h~Vous avez appelé un ~b~Millitaire")
	  elseif data.eventName == "realestateagent" then
        ShowNotificationMenuCivil2("~h~Vous avez appelé un ~b~Agent Immobillier")
	  elseif data.eventName == "pilot" then
        ShowNotificationMenuCivil2("~h~Vous avez appelé un ~b~Pilot")
	  elseif data.eventName == "epicerie" then
        ShowNotificationMenuCivil2("~h~Vous avez appelé un ~b~Épicier")
	  elseif data.eventName == "brinks" then
        ShowNotificationMenuCivil2("~h~Vous avez appelé un ~b~agent de la Brinks")
	  elseif data.eventName == "bahama" then
        ShowNotificationMenuCivil2("~h~Vous avez appelé le ~b~Bahama mamas")
      end
	  
	  
	
	
    else
      local limit = data.limit or 255
      local text = data.text or ''
      if data.eventName ~= "RESPAWN" then
        DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "", text, "", "", "", limit)
        while (UpdateOnscreenKeyboard() == 0) do
            DisableAllControlActions(0);
            Wait(0);
        end
        if (GetOnscreenKeyboardResult()) then
            text = GetOnscreenKeyboardResult()
        end
        TriggerServerEvent("call:makeCall", data.eventName, {x=plyPos.x,y=plyPos.y,z=plyPos.z}, text, GetPlayerServerId(player))
      if data.eventName == "police" then
        ShowNotificationMenuCivil2("~h~Vous avez appelé la ~b~Police")
      elseif data.eventName == "taxi" then
        ShowNotificationMenuCivil2("~h~Vous avez appelé un ~b~Taxi")
      elseif data.eventName == "mecano" then
        ShowNotificationMenuCivil2("~h~Vous avez appelé un ~b~Mécano")
      elseif data.eventName == "journaliste" then
        ShowNotificationMenuCivil2("~h~Vous avez appelé un ~b~Journaliste")
      elseif data.eventName == "ambulance" then
        ShowNotificationMenuCivil2("~h~Vous avez appelé un ~b~Ambulancier")
      elseif data.eventName == "unicorn" then
        ShowNotificationMenuCivil2("~h~Vous avez appelé le ~b~Unicorn")
	  elseif data.eventName == "state" then
        ShowNotificationMenuCivil2("~h~Vous avez appelé un ~b~agent du Gouvernement")
	  elseif data.eventName == "pilot" then
        ShowNotificationMenuCivil2("~h~Vous avez appelé un ~b~Pilot")
	  elseif data.eventName == "fib" then
        ShowNotificationMenuCivil2("~h~Vous avez appelé un ~b~agent du FBI")
	  elseif data.eventName == "army" then
        ShowNotificationMenuCivil2("~h~Vous avez appelé un ~b~Millitaire")
	  elseif data.eventName == "realestateagent" then
        ShowNotificationMenuCivil2("~h~Vous avez appelé un ~b~Agent Immobillier")
	  elseif data.eventName == "pilot" then
        ShowNotificationMenuCivil2("~h~Vous avez appelé un ~b~Pilot")
	  elseif data.eventName == "epicerie" then
        ShowNotificationMenuCivil2("~h~Vous avez appelé un ~b~Épicier")
	  elseif data.eventName == "brinks" then
        ShowNotificationMenuCivil2("~h~Vous avez appelé un ~b~agent de la Brinks")
	  elseif data.eventName == "bahama" then
        ShowNotificationMenuCivil2("~h~Vous avez appelé le ~b~Bahama mamas")
      end
      else
        TriggerEvent('esx_ambulancejob:heal')
      end
    end
    cb()
  end
end)

RegisterNUICallback('deleteALL', function(data, cb)
  TriggerServerEvent('gcphone:deleteALL')
  cb()
end)

RegisterNUICallback('callEvent', function(data, cb)
  if data.data ~= nil then 
    TriggerEvent(data.eventName, data.data)
  else
    TriggerEvent(data.eventName)
  end
  cb()
end)

function TooglePhone()

      menuIsOpen = not menuIsOpen
      SendNUIMessage({show = menuIsOpen})
      if menuIsOpen == true then 
        Citizen.Trace('open')
        ePhoneInAnim()
      else
        ePhoneOutAnim()
      end


end

RegisterNUICallback('closePhone', function(data, cb)
  menuIsOpen = false
  SendNUIMessage({show = false})
  ePhoneOutAnim()
  cb()
end)

RegisterNUICallback('takePhoto', function(data, cb)
  menuIsOpen = false
  SendNUIMessage({show = false})
  cb()
  TriggerEvent('camera:open')
end)