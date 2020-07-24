--[[
    Sonaran CAD Plugins

    Plugin Name: kick
    Creator: Taylor McGaw
    Description: Kicks user from the cad upon exiting the server
]]

local pluginConfig = Config.GetPluginConfig("kick")

registerApiType("KICK_UNIT", "emergency")
    AddEventHandler("playerDropped", function()
        local source = source
        local identifier = GetIdentifiers(source)[Config.primaryIdentifier]
        if not identifier then
            debugLog("kick: no API ID, skip")
            return
        end
        local data = {['apiId'] = identifier, ['reason'] = "You have Exited the server"}
        performApiRequest({data}, 'KICK_UNIT', function() end)
    end)
