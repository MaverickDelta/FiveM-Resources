RegisterCommand('help', function()

TriggerEvent('chat:addMessage', {
  color = {255,0,0},
  multiline= true,
  args = {'[Server]','Join the discord for help, https://discord.gg/vwc3xwE'}
})

end) -- / help


-- [Server] : Join the discord for help, https://discord.gg/vwc3xwE


RegisterCommand('rules', function()

TriggerEvent('chat:addMessage', {
  color = {255,0,0},
  multiline= true,
  args = {'[Server]','No RDM/ VDM --- No Racism --- No Trolling --- No advertising.'}
})

end) -- / rules


-- [Server] : No RDM/ VDM No Racism No Trolling No advertising


RegisterCommand('info', function()

TriggerEvent('chat:addMessage', {
  color = {255,0,0},
  multiline= true,
  args = {'[Server]','This is a development and testing server used to learn and develop skills, if you have any questions feel free to join my Discord and ill be happy to help you out. https://discord.gg/vwc3xwE '}
})

end) -- / rules


-- [Server] : This is a development and testing server used to learn and develop skills, if you have any questions feel free to join my Discord and ill be happy to help you out. https://discord.gg/vwc3xwE


-- Spawning Cars
RegisterCommand('spawnvehicle', function(source, args) -- e.g. "/SpawnVehicle adder"
    local car = GetHashKey(args[1])
    local playerSrc = PlayerPedId()
    RequestModel(car)
    while not HasModelLoaded(car) do
        Citizen.Wait(1)
        RequestModel(car)
    end
    local x, y, z = table.unpack(GetEntityCoords(playerSrc))
    CreateVehicle(car, x, y + 2 , z + 0.25 , GetEntityHeading(playerSrc), true, false)
end)


-- Spawning Weapons
RegisterCommand('giveweapon', function(source, args) -- e.g. "/GiveWeapon WEAPON_PISTOL"
    local weaponSrc = GetHashKey(args[1])
    local playerSrc = PlayerPedId()
    GiveWeaponToPed(playerSrc, weaponSrc,1000,false,true)
end)


-- Anouncements
RegisterCommand("announce", function(source, args)
  TriggerServerEvent("announce", table.concat(args, " "))
end)


-- No Perms Message
RegisterNetEvent("no-perms")
AddEventHandler("no-perms", function()
  TriggerEvent("chatMessage", "[Error]", {255,0,0}, "Sorry, you dont have permissions to do that!")
end)


-- Show Coords
RegisterCommand("getcoords", function()
x, y, z = table.unpack(GetEntityCoords(PlayerPedId()))
h = GetEntityHeading(PlayerPedId())
  TriggerEvent('chat:addMessage', {
    color = {255,0,0},
    multiline= true,
    args = {'[Server]',"[x : " .. x .. ']   [y : ' .. y .. ']   [z : ' .. z .. ']   [h : ' .. h .. ']'}
  })
end)
