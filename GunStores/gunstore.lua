_menuPool = NativeUI.CreatePool()
mainMenu = NativeUI.CreateMenu("AMMU Nation", "Gun Store")
_menuPool:Add(mainMenu)
_menuPool:MouseControlsEnabled(false)
_menuPool:MouseEdgeEnabled(false)

bool = false

function FirstItem(menu)
    local switchblade = NativeUI.CreateItem("Switchblade", "Get Switchblade")
    local pistol = NativeUI.CreateItem("Pistol", "Get Pistol")
    local microsmg = NativeUI.CreateItem("Submachine gun", "Get Submachine gun")
    local shotgn = NativeUI.CreateItem("Pump Shotgun", "Get Pump Shotgun")
    local assaultrfl = NativeUI.CreateItem("Assault Rifle", "Get Assault Rifle")
    menu:AddItem(switchblade)
    menu:AddItem(pistol)
    menu:AddItem(microsmg)
    menu:AddItem(shotgn)
    menu:AddItem(assaultrfl)
    menu.OnItemSelect = function(sender, item, index)
        if item == switchblade then
            giveWeapon("weapon_switchblade")
            notify("You now have a Switchblade")
        end
        if item == pistol then
            giveWeapon("weapon_pistol")
            notify("You now have a Pistol")
        end
        if item == microsmg then
            giveWeapon("weapon_microsmg")
            notify("You now have a Micro SMG")
        end
        if item == shotgn then
            giveWeapon("weapon_pumpshotgun")
            notify("You now have a Pump Shotgun")
        end
        if item == assaultrfl then
            giveWeapon("weapon_assaultrifle")
            notify("You now have a Micro SMG")
        end
    end
end

FirstItem(mainMenu)
_menuPool:RefreshIndex()

GunStoreLocations = {
	vector3(-662.1, -935.3, 20.8),
	vector3(810.2, -2157.3, 28.6),
	vector3(1693.4, 3759.5, 33.7),
	vector3(-330.2, 6083.8, 30.4),
	vector3(252.3, -50.0, 68.9),
	vector3(22.0, -1107.2, 28.8),
	vector3(2567.6, 294.3, 107.7),
	vector3(-1117.5, 2698.6, 17.5),
	vector3(842.4, -1033.4, 27.1)
}

Citizen.CreateThread(function()
    for i,v in pairs(GunStoreLocations) do
        local stores = AddBlipForCoord(v[1],v[2])
        -- sets the blip id (which icon will be desplayed)
        SetBlipSprite(stores, 110)
        -- sets where the blip to be shown on both the minimap and the menu map
        SetBlipColour(stores, 39)
        -- colour of blip
        SetBlipDisplay(stores, 6)
        -- how big the blip will be
        SetBlipScale(stores, 0.9)
        -- blip entry type
        SetBlipAsShortRange(stores, true)
        -- Sets whether or not the specified blip should only be displayed when nearby, or on the minimap.
        BeginTextCommandSetBlipName("STRING")
        -- The title of the blip
        AddTextComponentString("Gun Store")
        EndTextCommandSetBlipName(stores)
        end
        Wait(0)
end)

Citizen.CreateThread(function()
    while true do
        for i,v in pairs(GunStoreLocations) do
            Citizen.Wait(0)
            local strlocs = vector3(v[1],v[2],v[3])
            local plrpos = GetEntityCoords(PlayerPedId())
            local distance = #(plrpos - strlocs)
            if distance <= 1.5 then
                notify("Press E to browse weapons")
            end
        end
    end
end)

function notify(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(true, true)
end

Citizen.CreateThread(function()
    while true do
        _menuPool:ProcessMenus()
        Citizen.Wait(0)
        for i,v in pairs(GunStoreLocations) do
            local strlocs = vector3(v[1],v[2],v[3])
            local plrpos = GetEntityCoords(PlayerPedId())
            local distance = #(plrpos - strlocs)
            if distance <= 2.5 then
                if IsControlJustReleased(0, 46) then
                    mainMenu:Visible(not mainMenu:Visible())
                end
            end
        end
    end
end)

function giveWeapon(hash)
    GiveWeaponToPed(PlayerPedId(), GetHashKey(hash), 999, false, false)
end
