local cruiseactive = false
local cruisespeed

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(0)
        local carspeed = GetEntitySpeed(GetVehiclePedIsIn(PlayerPedId(), false))
        local speed = GetEntitySpeed(GetVehiclePedIsIn(PlayerPedId(), false))
        cruisespeed = carspeed
        if GetVehiclePedIsIn(PlayerPedId(),false) and IsPedInAnyVehicle(PlayerPedId(),false) and speed*2.2369 > 20 and not IsPedInAnyBoat(PlayerPedId()) and not IsPedInAnyPlane(PlayerPedId()) and IsControlJustReleased(0, 246) then
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
            local carspeed = GetEntitySpeed(GetVehiclePedIsIn(PlayerPedId(), false))
            if IsControlJustPressed(0, 20) or IsControlJustPressed(0, 72) or IsControlJustPressed(0, 22) then 
                ThefeedFlushQueue()
                notify("Cruise control ~r~disabled")
                cruiseactive = false
            end
            if HasEntityCollidedWithAnything(GetVehiclePedIsIn(PlayerPedId(),false)) then
                ThefeedFlushQueue()
                notify("Cruise control ~r~disabled")
                cruiseactive = false
            end
            if IsControlPressed(0, 71) then
				cruiseactive = false
				accelerate()
            end
            if speed*2.23694+0.5 < 20 then
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
			if cruiseactive and IsVehicleOnAllWheels(GetVehiclePedIsIn(PlayerPedId())) then
				SetVehicleForwardSpeed(GetVehiclePedIsIn(PlayerPedId(), false), cruisespeed)
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
