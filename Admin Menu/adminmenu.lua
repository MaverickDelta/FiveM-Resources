_menuPool = NativeUI.CreatePool()
mainMenu = NativeUI.CreateMenu("Admin Menu", "Server Admin Menu")
_menuPool:Add(mainMenu)
_menuPool:MouseControlsEnabled(false)
_menuPool:MouseEdgeEnabled(false)

-- Used in "FirstMenu"
bool = false

-- this menu is a checkbox item
function FirstItem(menu)
   local checkbox = NativeUI.CreateCheckboxItem("God Mode", bool, "Toggle Gode Mode")
   menu:AddItem(checkbox)
   menu.OnCheckboxChange = function (sender, item, checked_)
      -- check if what changed is from this menu
      if item == checkbox then
        bool = checked_
        --[[ Outputs what the checkbox state is ]]
        if bool == true then
            notify('~g~God Mode Enabled')
            SetEntityInvincible(PlayerPedId(),bool)
        end
        if bool == false then
            notify('~r~God Mode Disabled')
            SetEntityInvincible(PlayerPedId(),bool)
        end
      end
   end
end

function SecondItem(menu)
    local submenu = _menuPool:AddSubMenu(menu, "Health Features -->","~g~Heal~w~/~r~Kill") 
    local heal = NativeUI.CreateItem("Heal me", "~g~Heal yourself")
    local kill = NativeUI.CreateItem("Kill me", "~r~Kill yourself")
    submenu:AddItem(heal)
    submenu:AddItem(kill) 
    submenu.OnItemSelect = function(sender, item, index)
        if item == heal then
            SetEntityHealth(PlayerPedId(), 200)
            AddArmourToPed(PlayerPedId(), 100)
            notify("~g~Healed.")
        end
        if item == kill then
            SetEntityHealth(PlayerPedId(), 0)
            notify("~r~Killed.")
        end
    end
end

-- Used in "ThirdItem"
meleeweapons = {
    "weapon_knife","weapon_bat","weapon_flashlight","weapon_golfclub","weapon_hammer","weapon_knuckle","weapon_machete","weapon_switchblade",
    "weapon_nightstick"}
handguns = {
    "weapon_pistol","weapon_stungun","weapon_flaregun","weapon_marksmanpistol","weapon_revolver","weapon_raypistol"}
subweapons ={
    "weapon_microsmg","weapon_smg",}
shotguns = {
    "weapon_pumpshotgun","weapon_sawnoffshotgun","weapon_assaultshotgun","weapon_musket"}
assaultrifles = {
    "weapon_assaultrifle","weapon_specialcarbine","weapon_carbinerifle","weapon_compactrifle"}
lmgs = {
    "weapon_mg","weapon_combatmg","weapon_gusenberg"}
snipers = {
    "weapon_sniperrifle","weapon_heavysniper"}
heavy = {
    "weapon_rpg","weapon_grenadelauncher","weapon_minigun","weapon_firework","weapon_railgun","weapon_hominglauncher"}
throw = {
    "weapon_grenade","weapon_bzgas","weapon_molotov","weapon_stickybomb","weapon_snowball","weapon_ball","weapon_smokegrenade","weapon_flare"}
misc = {
    "weapon_petrolcan","weapon_fireextinguisher","gadget_parachute"}
function ThirdItem(menu)
    local submenu = _menuPool:AddSubMenu(menu, "Weapons -->","Weapon Features") 
    local meleeList = NativeUI.CreateListItem("Melee Weapons", meleeweapons, 1)
    local handgunList = NativeUI.CreateListItem("Hundguns", handguns, 1)
    local subList = NativeUI.CreateListItem("Submachine Guns", subweapons, 1)
    local shotList = NativeUI.CreateListItem("Shotguns", shotguns, 1)
    local assaultList = NativeUI.CreateListItem("Assult Rifles", assaultrifles, 1)
    local lmgList = NativeUI.CreateListItem("Light Machine Guns", lmgs, 1)
    local snipersList = NativeUI.CreateListItem("Sniper Rifles", snipers, 1)
    local heavyList = NativeUI.CreateListItem("Heavy Weapons", heavy, 1)
    local throwList = NativeUI.CreateListItem("Throwables", throw, 1)
    local miscList = NativeUI.CreateListItem("Miscellaneous", misc, 1)
    _menuPool:MouseControlsEnabled(false)
    _menuPool:MouseEdgeEnabled(false)
    submenu:AddItem(meleeList)
    submenu:AddItem(handgunList)
    submenu:AddItem(subList)
    submenu:AddItem(shotList)
    submenu:AddItem(assaultList)
    submenu:AddItem(lmgList)
    submenu:AddItem(snipersList)
    submenu:AddItem(heavyList)    
    submenu:AddItem(throwList)  
    submenu:AddItem(miscList)  
    submenu.OnListSelect = function(sender, item, index)  
        if item == meleeList then
            local selectedGun = item:IndexToItem(index)
            giveWeapon(selectedGun)
            notify("You now have a "..selectedGun)
        end
        if item == handgunList then
            local selectedGun = item:IndexToItem(index)
            giveWeapon(selectedGun)
            notify("You now have a "..selectedGun)
        end   
        if item == subList then
            local selectedGun = item:IndexToItem(index)
            giveWeapon(selectedGun)
            notify("You now have a "..selectedGun)
        end            
        if item == shotList then
            local selectedGun = item:IndexToItem(index)
            giveWeapon(selectedGun)
            notify("You now have a "..selectedGun)
        end   
        if item == assaultList then
            local selectedGun = item:IndexToItem(index)
            giveWeapon(selectedGun)
            notify("You now have a "..selectedGun)
        end  
        if item == lmgList then
            local selectedGun = item:IndexToItem(index)
            giveWeapon(selectedGun)
            notify("You now have a "..selectedGun)
        end  
        if item == snipersList then
            local selectedGun = item:IndexToItem(index)
            giveWeapon(selectedGun)
            notify("You now have a "..selectedGun)
        end 
        if item == heavyList then
            local selectedGun = item:IndexToItem(index)
            giveWeapon(selectedGun)
            notify("You now have a "..selectedGun)
        end 
        if item == throwList then
            local selectedGun = item:IndexToItem(index)
            giveWeapon(selectedGun)
            notify("You now have a "..selectedGun)
        end 
        if item == miscList then
            local selectedGun = item:IndexToItem(index)
            giveWeapon(selectedGun)
            notify("You now have a "..selectedGun)
        end 
    end
end

carveh = {"T20","Zentorno","Osiris"}
moterbikeveh = {"Bati","Manchez"}
truckveh = {"Monster","TrophyTruck",}
cycleveh = {"BMX","Scorcher","TriBike3"}
boatveh = {"dinghy3","submersible2","seashark"}
heliveh = {"Buzzard","Skylift","Savage"}
planeveh ={"Hydra","Lazer","Besra","Stunt"}
miscveh = {"Forklift","Tractor","Blimp","Rhino","Dump","Bulldozer","Dune4"}
-- used in "FourthItem"
function FourthItem(menu) 
   local submenu = _menuPool:AddSubMenu(menu, "Vehicles -->","Vehicle Features") 
   local carlist = NativeUI.CreateListItem("Spawn Car",carveh,1)
   local trucklist = NativeUI.CreateListItem("Spawn Truck",truckveh,1)
   local moterbikelist = NativeUI.CreateListItem("Spawn Moterbike",moterbikeveh,1)
   local cyclelist = NativeUI.CreateListItem("Spawn Cycle",cycleveh,1)
   local boatlist = NativeUI.CreateListItem("Spawn Boats",boatveh,1)
   local helilist = NativeUI.CreateListItem("Spawn Helicopters",heliveh,1)
   local planelist = NativeUI.CreateListItem("Spawn Planes",planeveh,1)
   local misclist = NativeUI.CreateListItem("Spawn Misc",miscveh,1)
   submenu:AddItem(carlist)
   submenu:AddItem(trucklist)
   submenu:AddItem(moterbikelist)
   submenu:AddItem(cyclelist)
   submenu:AddItem(boatlist)
   submenu:AddItem(helilist)
   submenu:AddItem(planelist)
   submenu:AddItem(misclist)
   _menuPool:MouseControlsEnabled(false)
   _menuPool:MouseEdgeEnabled(false)
   submenu.OnListSelect = function(sender, item, index)
        if item == carlist then
            local selectedvehicle = item:IndexToItem(index)
            spawnCar(selectedvehicle)
            notify("Spawned a "..selectedvehicle)
        end
        if item == trucklist then
            local selectedvehicle = item:IndexToItem(index)
            spawnCar(selectedvehicle)
            notify("Spawned a "..selectedvehicle)
        end
        if item == moterbikelist then
            local selectedvehicle = item:IndexToItem(index)
            spawnCar(selectedvehicle)
            notify("Spawned a "..selectedvehicle)
        end
        if item == cyclelist then
            local selectedvehicle = item:IndexToItem(index)
            spawnCar(selectedvehicle)
            notify("Spawned a "..selectedvehicle)
        end
        if item == boatlist then
            local selectedvehicle = item:IndexToItem(index)
            spawnCar(selectedvehicle)
            notify("Spawned a "..selectedvehicle)
        end
        if item == helilist then
            local selectedvehicle = item:IndexToItem(index)
            spawnCar(selectedvehicle)
            notify("Spawned a "..selectedvehicle)
        end
        if item == planelist then
            local selectedvehicle = item:IndexToItem(index)
            spawnCar(selectedvehicle)
            notify("Spawned a "..selectedvehicle)
        end
        if item == misclist then
            local selectedvehicle = item:IndexToItem(index)
            spawnCar(selectedvehicle)
            notify("Spawned a "..selectedvehicle)
        end
   end
end

FirstItem(mainMenu)
SecondItem(mainMenu)
ThirdItem(mainMenu)
FourthItem(mainMenu)
_menuPool:RefreshIndex()

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        _menuPool:ProcessMenus()
        --[[ The "F5" button will activate the menu ]]
        if IsControlJustPressed(1, 166) then
            mainMenu:Visible(not mainMenu:Visible())
        end
    end
end)

function notify(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(true, true)
end

function giveWeapon(hash)
    GiveWeaponToPed(PlayerPedId(), GetHashKey(hash), 999, false, false)
end

function spawnCar(car)
    local car = GetHashKey(car)

    RequestModel(car)
    while not HasModelLoaded(car) do
        RequestModel(car)
        Citizen.Wait(50)
    end

    local x, y, z = table.unpack(GetEntityCoords(PlayerPedId(), false))
    local vehicle = CreateVehicle(car, x + 2, y + 2, z + 1, GetEntityHeading(PlayerPedId()), true, false)
    SetPedIntoVehicle(PlayerPedId(), vehicle, -1)
    
    SetEntityAsNoLongerNeeded(vehicle)
    SetModelAsNoLongerNeeded(vehicleName)
    
    --[[ SetEntityAsMissionEntity(vehicle, true, true) ]]
end
