RegisterCommand('stopcane', function(source)
    TriggerClientEvent("spoodyCane:Stop", source)
end)

local function init()
    if not _VERSION:find("5.4") then
        return error("LUA 5.4 Must be enabled, Please don't remove it!")
    end

    if table.type(config) == "empty" or config == nil then
        return error("Config returned broken or empty, please make sure it is proper.")
    end

    print("spoodyCane started successfully!")

    ESX.RegisterUsableItem(config.item.name, function(source)
        TriggerClientEvent("spoodyCane:Use", source)
    end)
end

CreateThread(init)
