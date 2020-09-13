-- Speedometer
function text(content)
    SetTextFont(2)
    SetTextProportional(0)
    SetTextScale(0.8,0.8)
    SetTextEntry("STRING")
    AddTextComponentString(content .. " MPH")
    DrawText(0.175,0.8)
end

Citizen.CreateThread(function()

    while true do
        Citizen.Wait(2)

        --[[
            kps's factor = 3.6
            mph's factor = 2.2369
            ]]

        local speed = GetEntitySpeed(GetVehiclePedIsIn(PlayerPedId(),false))*2.2369
        -- Check if the ped is in a vehicle
        if (IsPedInAnyVehicle(PlayerPedId(), false)) then
            text(math.floor(speed))
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsPedInAnyVehicle(PlayerPedId(),false) then
            if IsPedInAnyPlane(PlayerPedId()) then 
            elseif IsPedInAnyHeli(PlayerPedId()) then
            elseif IsPedInAnyBoat(PlayerPedId()) then
            elseif IsPedInAnySub(PlayerPedId()) then
            elseif IsPedInAnyTrain(PlayerPedId()) then
            else 
                if GetEntitySpeed(GetVehiclePedIsIn(PlayerPedId(),false))*2.2369 >= 100 then
                    SetTextFont(2)
                    SetTextScale(0.8,0.8)
                    SetTextColour(255, 0, 0, 255)
                    SetTextEntry("String")
                    AddTextComponentString("Slow Down")
                    DrawText(0.25,0.8)
                end
            end
        end
    end
end)
