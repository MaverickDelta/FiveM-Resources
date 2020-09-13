RegisterServerEvent("announce")
AddEventHandler("announce", function(param)
    if IsPlayerAceAllowed(source, "administrator") then
    print("^7[^1Announcement^7]^5:" .. param )
    TriggerClientEvent("chatMessage", -1, "^7[^1Announcement^7]^2", {0,0,0}, param)
    else
        TriggerClientEvent("no-perms", source)
    end
end)
