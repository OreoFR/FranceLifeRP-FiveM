local jobmenu = {
  opened = false,
  title = "Pôle Emploi", -- ENGLISH : "Employment Center"
  currentmenu = "main",
  lastmenu = nil,
  currentpos = nil,
  selectedbutton = 0,
  marker = { r = 0, g = 155, b = 255, a = 200, type = 1 },
  menu = {
    x = 0.9,
    y = 0.28,
    width = 0.2,
    height = 0.04,
    buttons = 10,
    from = 1,
    to = 10,
    scale = 0.4,
    font = 0,
    ["main"] = {
      title = "CHOISIR UN METIER", -- ENGLISH : Choise your job
      name = "main",
      buttons = {
        {title = "Mineur", name = "Mineur", id = 4}, -- ENGLISH : Minor
        {title = "Pêcheur", name = "Pêcheur", id = 7}, -- ENGLISH : Fisherman
        {title = "Chauffeur de taxi", name = "Taxi", id = 5}, -- ENGLISH : Taxi Driver
        -- EXAMPLE : {title = "Name Job", name = "Name Short", id = ID in base SQL},
      }
    },
  }
}

---------------------------------- VAR ----------------------------------

local jobmenu_locations = {{entering = {-268.801,-962.38,30.2231}, inside = {-268.801,-962.38,30.2231}, outside = {-268.801,-962.38,30.2231}}}
local jobmenu_blips ={}
local inrangeofjobmenu = false
local currentlocation = nil
local boughtJob = false
local backlock = false
local firstspawn = 0


---------------------------------- FUNCTIONS ----------------------------------

function drawTxt(text,font,centre,x,y,scale,r,g,b,a)
  SetTextFont(font)
  SetTextProportional(0)
  SetTextScale(scale, scale)
  SetTextColour(r, g, b, a)
  SetTextDropShadow(0, 0, 0, 0,255)
  SetTextEdge(1, 0, 0, 0, 255)
  SetTextDropShadow()
  SetTextOutline()
  SetTextCentre(centre)
  SetTextEntry("STRING")
  AddTextComponentString(text)
  DrawText(x , y)
end

function IsPlayerInRangeOfjobmenu()
return inrangeofjobmenu
end

function DisplayHelpText(str)
  SetTextComponentFormat("STRING")
  AddTextComponentString(str)
  DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end


function ShowJobBlips(bool)
  if bool and #jobmenu_blips == 0 then
    for station,pos in pairs(jobmenu_locations) do
      local loc = pos
      pos = pos.entering
      local blip = AddBlipForCoord(pos[1],pos[2],pos[3])
      -- 60 58 137
      SetBlipSprite(blip,351)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString('Pôle Emploi')
      EndTextCommandSetBlipName(blip)
      SetBlipAsShortRange(blip,true)
      SetBlipColour(blip, 15)
      SetBlipAsMissionCreatorBlip(blip,true)
      table.insert(jobmenu_blips, {blip = blip, pos = loc})
    end
    Citizen.CreateThread(function()
      while #jobmenu_blips > 0 do
        Citizen.Wait(0)
        local inrange = false
        for i,b in ipairs(jobmenu_blips) do
                DrawMarker(1,b.pos.entering[1],b.pos.entering[2],b.pos.entering[3],0,0,0,0,0,0,2.001,2.0001,0.5001,0,155,255,200,0,0,0,0)
                if jobmenu.opened == false and IsPedInAnyVehicle(LocalPed(), true) == false and  GetDistanceBetweenCoords(b.pos.entering[1],b.pos.entering[2],b.pos.entering[3],GetEntityCoords(LocalPed())) < 2 then
            DisplayHelpText("Appuyer sur ~g~ENTRER~s~ choisir un métier !")
            currentlocation = b
            inrange = true
          end
        end
        inrangeofjobmenu = inrange
      end
    end)
  elseif bool == false and #jobmenu_blips > 0 then
    for i,b in ipairs(jobmenu_blips) do
      if DoesBlipExist(b.blip) then
        SetBlipAsMissionCreatorBlip(b.blip,false)
        Citizen.InvokeNative(0x86A652570E5F25DD, Citizen.PointerValueIntInitialized(b.blip))
      end
    end
    jobmenu_blips = {}
  end
end

function f(n)
  return n + 0.0001
end

function LocalPed()
  return GetPlayerPed(-1)
end

function try(f, catch_f)
  local status, exception = pcall(f)
  if not status then
    catch_f(exception)
  end
end

function firstToUpper(str)
    return (str:gsub("^%l", string.upper))
end

--local veh = nil
function OpenCreator()
  boughtJob = false
  local ped = GetPlayerPed(-1)
  FreezeEntityPosition(ped,true)
  jobmenu.currentmenu = "main"
  jobmenu.opened = true
  jobmenu.selectedbutton = 0
end

function CloseCreator()
  Citizen.CreateThread(function()
    local ped = GetPlayerPed(-1)
    if not boughtJob then
      FreezeEntityPosition(ped,false)
      jobmenu.opened = false
      jobmenu.menu.from = 1
      jobmenu.menu.to = 10
    end
  end)
end

function drawMenuButton(button,x,y,selected)
  local menu = jobmenu.menu
  SetTextFont(menu.font)
  SetTextProportional(0)
  SetTextScale(menu.scale, menu.scale)
  if selected then
    SetTextColour(0, 0, 0, 255)
  else
    SetTextColour(255, 255, 255, 255)
  end
  SetTextCentre(0)
  SetTextEntry("STRING")
  AddTextComponentString(button.title)
  if selected then
    DrawRect(x,y,menu.width,menu.height,255,255,255,255)
  else
    DrawRect(x,y,menu.width,menu.height,0,0,0,150)
  end
  DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)
end

function drawMenuInfo(text)
  local menu = jobmenu.menu
  SetTextFont(menu.font)
  SetTextProportional(0)
  SetTextScale(0.45, 0.45)
  SetTextColour(255, 255, 255, 255)
  SetTextCentre(0)
  SetTextEntry("STRING")
  AddTextComponentString(text)
  DrawRect(0.675, 0.95,0.65,0.050,0,0,0,150)
  DrawText(0.365, 0.934)
end

function drawMenuRight(txt,x,y,selected)
  local menu = jobmenu.menu
  SetTextFont(menu.font)
  SetTextProportional(0)
  SetTextScale(menu.scale, menu.scale)
  SetTextRightJustify(1)
  if selected then
    SetTextColour(0, 0, 0, 255)
  else
    SetTextColour(255, 255, 255, 255)
  end
  SetTextCentre(0)
  SetTextEntry("STRING")
  AddTextComponentString(txt)
  DrawText(x + menu.width/2 - 0.03, y - menu.height/2 + 0.0028)
end

function drawMenuTitle(txt,x,y)
local menu = jobmenu.menu
  SetTextFont(2)
  SetTextProportional(0)
  SetTextScale(0.5, 0.5)
  SetTextColour(255, 255, 255, 255)
  SetTextEntry("STRING")
  AddTextComponentString(txt)
  DrawRect(x,y,menu.width,menu.height,0,0,0,150)
  DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)
end

function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

function Notify(text)
SetNotificationTextEntry('STRING')
AddTextComponentString(text)
DrawNotification(false, false)
end

function DoesPlayerHaveWeapon(button,y,selected, source)
    drawMenuRight(jobmenu.menu.x,y,selected)
end

function round(num, idp)
  if idp and idp>0 then
    local mult = 10^idp
    return math.floor(num * mult + 0.5) / mult
  end
  return math.floor(num + 0.5)
end

function ButtonSelected(button)
  local ped = GetPlayerPed(-1)
  local this = jobmenu.currentmenu
  local btn = button.name
  if this == "main" then
    boughtJob = false
    CloseCreator()
    TriggerServerEvent("jobssystem:jobs", button.id)
  end
end

function OpenMenu(menu)
  jobmenu.lastmenu = jobmenu.currentmenu
  jobmenu.menu.from = 1
  jobmenu.menu.to = 10
  jobmenu.selectedbutton = 0
  jobmenu.currentmenu = menu
end

function Back()
  if backlock then
    return
  end
  backlock = true
  if jobmenu.currentmenu == "main" then
    boughtJob = false
    CloseCreator()
  else
    OpenMenu(jobmenu.lastmenu)
  end

end

function stringstarts(String,Start)
   return string.sub(String,1,string.len(Start))==Start
end


---------------------------------- CITIZEN ----------------------------------

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if IsControlJustPressed(1,201) and IsPlayerInRangeOfjobmenu() then
      if jobmenu.opened then
        CloseCreator()
      else
        OpenCreator()
      end
    end
    if jobmenu.opened then
      local ped = LocalPed()
      local menu = jobmenu.menu[jobmenu.currentmenu]
      drawTxt(jobmenu.title,1,1,jobmenu.menu.x,jobmenu.menu.y,1.0, 255,255,255,255)
      drawMenuTitle(menu.title, jobmenu.menu.x,jobmenu.menu.y + 0.08)
      drawTxt(jobmenu.selectedbutton.."/"..tablelength(menu.buttons),0,0,jobmenu.menu.x + jobmenu.menu.width/2 - 0.0385,jobmenu.menu.y + 0.067,0.4, 255,255,255,255)
      local y = jobmenu.menu.y + 0.12
      buttoncount = tablelength(menu.buttons)
      local selected = false

      for i,button in pairs(menu.buttons) do
        if i >= jobmenu.menu.from and i <= jobmenu.menu.to then

          if i == jobmenu.selectedbutton then
            selected = true
          else
            selected = false
          end
          drawMenuButton(button,jobmenu.menu.x,y,selected)
          if button.costs ~= nil then
            DoesPlayerHaveWeapon(button,y,selected,ped)
          end
          y = y + 0.04
          if selected and IsControlJustPressed(1,201) then
            ButtonSelected(button)
          end
        end
      end
    end
    if jobmenu.opened then
      if IsControlJustPressed(1,202) then
        Back()
      end
      if IsControlJustReleased(1,202) then
        backlock = false
      end
      if IsControlJustPressed(1,188) then
        if jobmenu.selectedbutton > 1 then
          jobmenu.selectedbutton = jobmenu.selectedbutton -1
          if buttoncount > 10 and jobmenu.selectedbutton < jobmenu.menu.from then
            jobmenu.menu.from = jobmenu.menu.from -1
            jobmenu.menu.to = jobmenu.menu.to - 1
          end
        end
      end
      if IsControlJustPressed(1,187)then
        if jobmenu.selectedbutton < buttoncount then
          jobmenu.selectedbutton = jobmenu.selectedbutton +1
          if buttoncount > 10 and jobmenu.selectedbutton > jobmenu.menu.to then
            jobmenu.menu.to = jobmenu.menu.to + 1
            jobmenu.menu.from = jobmenu.menu.from + 1
          end
        end
      end
    end

  end
end)

---------------------------------- EVENEMENT ----------------------------------

RegisterNetEvent('jobssystem:updateJob')
AddEventHandler('jobssystem:updateJob', function(nameJob)
  SendNUIMessage({
    updateJob = true,
    job = nameJob
  })
end)

AddEventHandler('playerSpawned', function(spawn)
if firstspawn == 0 then
  ShowJobBlips(true)
  firstspawn = 1
end
end)
