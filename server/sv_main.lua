ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('nb_bikerental:server:paying', function(source, cb, price)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.getMoney() >= price then
		xPlayer.removeMoney(price)
		cb(true)
	else
		cb(false)
	end
end)