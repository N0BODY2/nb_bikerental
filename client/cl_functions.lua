function DrawText3D(x,y,z, text)
	local onScreen,_x,_y=World3dToScreen2d(x,y,z)

	SetTextScale(0.25, 0.25)
	SetTextFont(0)
	SetTextProportional(1)
	SetTextColour(255, 255, 255, 215)
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(text)
	DrawText(_x,_y)
	local factor = (string.len(text)) / 350
	DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
end

function startcooldown(newtime)
	time = newtime
	Citizen.CreateThread(function()
		while time > 0 do 
			Citizen.Wait(1000)
			if time > 0 then
				time = time - 1
			end
		end
	end)
end