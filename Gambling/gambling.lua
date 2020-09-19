gamblinglocations = {
  vector4(280.44921875,-1003.7591552734,28.355,179.91227722168) -- x: 280.44921875 y: -1003.7591552734 z: 29.35399055481 h: 179.91227722168
}

gamblinglocations3dtxt = {
  vector4(280.44921875,-1003.7591552734,29,179.91227722168) -- x: 280.44921875 y: -1003.7591552734 z: 29.35399055481 h: 179.91227722168
}

Citizen.CreateThread(function()
    for i,v in pairs(gamblinglocations) do
        local gamblingblip = AddBlipForCoord(v[1],v[2])
        -- sets the blip id (which icon will be desplayed)
        SetBlipSprite(gamblingblip, 500)
        -- sets where the blip to be shown on both the minimap and the menu map
        SetBlipColour(gamblingblip, 69)
        -- colour of blip
        SetBlipDisplay(gamblingblip, 6)
        -- how big the blip will be
        SetBlipScale(gamblingblip, 0.9)
        -- blip entry type
        SetBlipAsShortRange(gamblingblip, true)
        -- Sets whether or not the specified blip should only be displayed when nearby, or on the minimap.
        BeginTextCommandSetBlipName("STRING")
        -- The title of the blip
        AddTextComponentString("Backstreet Gambling")
        EndTextCommandSetBlipName(gamblingblip)
        end
        Wait(0)
end)

Citizen.CreateThread(function()
  while true do
    for i,v in pairs(gamblinglocations) do -- i = index so going through the diffrent parts of the table and v = the value in the decleration
       DrawMarker(9,v[1],v[2],v[3], 0.0, 0.0, 0.0, 0.0, 0.0, 180.0, 2.0, 2.0, 2.0, 255, 225, 0, 25, false, false, 2, nil, nil, false)
    end
    Wait(0)
  end
end)

function notify(text)
    BeginTextCommandThefeedPost("STRING")
    AddTextComponentString(text)
    DrawNotification(true, true)
end

function loadAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict( dict )
        Citizen.Wait(5)
    end
end

function Draw3DText(x, y, z, scl_factor, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local p = GetGameplayCamCoords()
    local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
    local scale = (0.25 / distance) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov * scl_factor
    if onScreen then
        SetTextScale(0.0, scale)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end

bool = true
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    for i,v in pairs(gamblinglocations3dtxt) do
    local strlocs = vector3(v[1],v[2],v[3])
    local plrpos = GetEntityCoords(PlayerPedId())
    local distance = #(plrpos - strlocs)
      if distance <= 2.5 then
        if bool == true then
          Draw3DText(v[1],v[2],v[3], 1.5, "Press ~g~ E ~w~ to roll dice")
        end
      end
    end
  end
end)

-- notify("Press ~g~ E ~w~ to roll dice")

yay = "Congrats!!!"
nay = "Better luck next time"

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
      for i,v in pairs(gamblinglocations) do
        local strlocs = vector3(v[1],v[2],v[3])
        local plrpos = GetEntityCoords(PlayerPedId())
        local distance = #(plrpos - strlocs)
          if distance <= 2.5 then
            if IsControlJustReleased(0, 46) then
              ThefeedRemoveItem()
              bool = false
              dicenumreq = math.random(1,6)
              notify("You need to roll a: " .. dicenumreq)
              Wait(500)
              exports['ProgressBar']:startUI(1500, "Rolling")
              loadAnimDict("anim@mp_player_intcelebrationmale@wank")
              TaskPlayAnim(GetPlayerPed(-1), "anim@mp_player_intcelebrationmale@wank", "wank", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
              Citizen.Wait(1500)
              ClearPedTasks(GetPlayerPed(-1))
              diceroll = math.random(1,6)
              if diceroll == dicenumreq then 
              notify("You rolled a ~g~" .. diceroll .. " ~w~" .. yay)
              else 
                notify("You rolled a ~r~" .. diceroll .. " ~w~" .. nay)
              end
              Wait(5000)
              bool = true
            end
          end
      end
  end
end)
