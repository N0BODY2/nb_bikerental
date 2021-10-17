ESX = nil
local PlayerData = {}
time = 0
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

Citizen.CreateThread(function()
    local sleep = true
    while true do
        Citizen.Wait(0)
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        for k,v in pairs(Config.KolaPointy) do
            local distance = #(coords - v)
            if distance < 10 then 
                sleep = false
                DrawMarker(2, v, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.15, 0, 255, 0, 200, 0, 0, 0, 1, 0, 0, 0)
                if distance < 2 then 
                    DrawText3D(v.x, v.y, v.z, '~g~[E]~w~ Rent a Bike')
                    if distance < 1 and IsControlJustPressed(0, 38) then
                        if time == 0 then 
                            menunakolo()
                        else
                            ESX.ShowNotification('~r~You already rented a bike before renting another one wait ' .. time .. ' seconds')
                        end
                    end
                end
            end
        end
        if sleep then 
            Citizen.Wait(2000)
        end
    end
end)

function menunakolo()
    local price = 0
    local elements = {}
    for k,v in pairs(Config.Kolamore) do
        name = v.name 
        if v.price == 0 then 
            price = '<span style="color:green;">Free</span>'
        else
            price = '<span style="color:green;">' .. v.price .. ' $</span>'
        end
        table.insert(elements, {label = v.name .. price, value = v.spawncode})
    end

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'menu_na_kolo_idk_dal', {
        title    = 'What Type of Bike you wanna rent',
        align    = 'top-left',
        elements = elements
    }, function(data, menu)
        local action = data.current.value
        local ped = PlayerPedId()

        for k,v in pairs(Config.Kolamore) do
            if v.spawncode == action then 
                if v.price ~= 0 then 
                    ESX.TriggerServerCallback('nb_bikerental:server:paying', function(payed) 
                        if payed then 
                            menu.close()
                            startcooldown(Config.Cooldowntime)
                            ESX.Game.SpawnVehicle(v.spawncode, GetEntityCoords(ped), GetEntityHeading(ped), function(vehicle) 
                                TaskWarpPedIntoVehicle(ped, vehicle, -1)
                            end)
                            ESX.ShowNotification('~g~You paid ' .. v.price .. '$ for ' .. v.name)
                        end
                    end, v.price)
                else
                    menu.close()
                    startcooldown(Config.Cooldowntime)
                    ESX.Game.SpawnVehicle(v.spawncode, GetEntityCoords(ped), GetEntityHeading(ped), function(vehicle) 
                        TaskWarpPedIntoVehicle(ped, vehicle, -1)
                    end)
                end
            end
        end


    end, function(data, menu)
        menu.close()
    end)
end