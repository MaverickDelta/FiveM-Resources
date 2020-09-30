local cruiseactive = false
local cruisespeed

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(0)
        local ped = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(ped,false)
        local carspeed = GetEntitySpeed(GetVehiclePedIsIn(ped, false))
        local speed = GetEntitySpeed(GetVehiclePedIsIn(ped, false))
        cruisespeed = carspeed
        if vehicle and IsPedInAnyVehicle(ped,false) and speed*2.2369 > 20 and not IsPedInAnyBoat(ped) and not IsPedInAnyPlane(ped) and IsControlJustReleased(0, 246) then
            if not cruiseactive then
                ThefeedFlushQueue()
                notify("Cruise control ~g~active ~w~at " .. math.floor(speed*2.2369).. " mph")
                cruiseactive = true
                cruisecontrol()
            else
				notify("Cruise control ~r~disabled")
				cruiseactive = false
            end
        end
        if cruiseactive == true then
            local carspeed = GetEntitySpeed(vehicle)
            if IsControlJustPressed(0, 20) or IsControlJustPressed(0, 72) or IsControlJustPressed(0, 22) then 
                ThefeedFlushQueue()
                notify("Cruise control ~r~disabled")
                cruiseactive = false
            end
            if HasEntityCollidedWithAnything(vehicle) then
                ThefeedFlushQueue()
                notify("Cruise control ~r~disabled")
                cruiseactive = false
            end
            if IsControlPressed(0, 71) then
				cruiseactive = false
				accelerate()
            end
            if speed*2.23694 < 20 then
                ThefeedFlushQueue()
                notify("Cruise control ~r~disabled")
                cruiseactive = false
		    end
        end
    end
end)

function notify(text)
    BeginTextCommandThefeedPost("STRING")
    AddTextComponentString(text)
    DrawNotification(true, true)
end

function cruisecontrol()
	Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            local ped = PlayerPedId()
            local vehicle = GetVehiclePedIsIn(ped,false)
			if cruiseactive and IsVehicleOnAllWheels(vehicle) then
				SetVehicleForwardSpeed(vehicle, cruisespeed)
			end
		end
	end)
end

function accelerate()
    Citizen.CreateThread(function()
        local speed = GetEntitySpeed(GetVehiclePedIsIn(PlayerPedId(), false))
		while IsControlPressed(27, 71) do
			Citizen.Wait(1)
		end
		cruiseactive = true
        cruisecontrol()
	end)
end
