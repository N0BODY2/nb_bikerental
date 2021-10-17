if Config.EnableBlips then
    Citizen.CreateThread(function()
        for k,v in pairs(Config.KolaPointy) do
            local blip = AddBlipForCoord(v)
            SetBlipSprite(blip, Config.BlipSprite)
            SetBlipDisplay(blip, Config.BlipDisplay)
            SetBlipScale  (blip, Config.BlipScale)
            SetBlipColour (blip, Config.BlipColour)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(Config.BlipName)
            EndTextCommandSetBlipName(blip)
        end
    end)
end