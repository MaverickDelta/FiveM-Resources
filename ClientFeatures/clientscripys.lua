Citizen.CreateThread(function()
    while true do
        Citizen.Wait(50)
        if IsControlJustReleased(1, 303) then
            SetPedToRagdoll(PlayerPedId(), 5000, 0, 0, true, true, false)
        end
    end
end)

local color ={
    r=247,
    b=223,
    g=88,
    a=255}
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)

        -- The Text
        SetTextFont(0) -- 0 ->4
        SetTextScale(0.4,0.4)
        SetTextColour(color.r, color.b, color.g, color.a)
        SetTextEntry("String")
        AddTextComponentString("⚙️ Maverick's Dev and Testing Server ⚙️")
        DrawText(0.385,0.005)

        -- The Rectangle
        DrawRect(0.503,0.0001,0.25,0.083,66,134,244,245)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)  
        local playersrc = PlayerPedId()
        local headingdir = GetEntityHeading(playersrc)
        if headingdir <= 22.5 and headingdir >= 0 then
        locheading("North")
        end
        if headingdir <= 67.5 and headingdir >= 22.51 then
        locheading("North East")
        end
        if headingdir <= 112.5 and headingdir >= 67.51 then
        locheading("East")
        end
        if headingdir <= 157.5 and headingdir >= 112.51 then
        locheading("South East")
        end
        if headingdir <= 202.5 and headingdir >= 157.51 then
        locheading("South")
        end
        if headingdir <= 247.5 and headingdir >= 202.51 then
        locheading("South West")
        end 
        if headingdir <= 292.5 and headingdir >= 247.51 then
        locheading("West")
        end
        if headingdir <= 337.5 and headingdir >= 292.5 then
        locheading("North West")
        end
        if headingdir <= 360 and headingdir >= 337.51 then
        locheading("North")
        end
    end
end)

function locheading(headingnesw)
        SetTextFont(2)
        SetTextProportional(0)
        SetTextScale(0.8,0.8)
        SetTextEntry("STRING")
        AddTextComponentString(headingnesw)
        DrawText(0.175,0.88)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local x, y, z = table.unpack(GetEntityCoords(PlayerPedId()))
        local strthsh = GetStreetNameAtCoord(x,y,z)
        local strtnm = GetStreetNameFromHashKey(strthsh)
        if (IsPedInAnyVehicle(PlayerPedId(), false)) then
            DrawRect(0.2575,0.8855,0.17,0.16,46,49,49,150)
            streetnamefun(strtnm)
        else
            DrawRect(0.2575,0.925,0.17,0.08,46,49,49,150)
            streetnamefun(strtnm)
        end
    end
end)

function streetnamefun(streetname)
        SetTextFont(2)
        SetTextProportional(0)
        SetTextScale(0.8,0.8)
        SetTextEntry("STRING")
        AddTextComponentString(streetname)
        DrawText(0.175,0.92)
end
