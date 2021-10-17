Config = {}
-- If you want people to have cooldown on renting a bike 
-- You can put 0 if you dont
Config.Cooldowntime = 100 -- Seconds
-- Blips 
Config.EnableBlips = true
Config.BlipSprite = 376
Config.BlipDisplay = 4
Config.BlipScale = 0.65
Config.BlipColour = 2
Config.BlipName = "Bike Rental"

Config.KolaPointy = {
    vector3(401.8681640625 , 282.47201538086 , 103.01927185059),
    vector3(1164.1743164063 , -667.25158691406 , 60.479835510254)
}
-- Putting price as 0 will automatically make it free
Config.Kolamore = {
    FirstBike = {
        name = 'BMX ',
        price = 150,
        spawncode = 'bmx'
    },
    SecondBike = {
        name = 'Cruiser ',
        price = 0,
        spawncode = 'cruiser'
    }
}