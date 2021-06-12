Config = {}

-- fixedWhileBuckled - Don't allow the person to jump/get out of the car while seatbelt is on
Config.fixedWhileBuckled = true

-- showUnbuckledIndicator - Enabled seatbelt indicator if you don't have your own
Config.showUnbuckledIndicator = true


-- ejectVelocity - The gta velocity at which ejection from the car should happen when not wearing seatbelt
--      This is NOT MPH or KPH but instead GTA Velocity. to convert:
--      MPH -> Vel = (MPH / 2.236936)
--      KPH -> Vel = (KPH / 3.6)
--  Default: (60 / 2.236936)
Config.ejectVelocity = (60 / 2.236936)

-- unknownEjectVelocity - This value should be equal or greater than the value of ejectVelocity
--      The purpose of this variable is confusing https://docs.fivem.net/natives/?_0x4D3118ED
--  Default: (70 / 2.236936)
Config.unknownEjectVelocity = (70 / 2.236936)

-- unknownModifier - Don't know the purpose of this value, probably best to leave as is
Config.unknownModifier = 17.0 --  Default: 17.0

-- minDamage - Minimum damage given when ejected from car?
Config.minDamage = 2000 -- 0-2000?




-- playSound - Should a buckle/unbuckle sound be played
Config.playSound = true

-- volume - sets how loud the buckle/unbuckle sound plays
Config.volume = 0.25 -- 0.0 - 1.0

-- volume - sets how loud the buckle/unbuckle sound plays for passenger if playSoundForPassengers = true
Config.passengerVolume = 0.20 -- 0.0 - 1.0

--  playSoundForPassengers
--      true = Play for everyone in the car
--      false = Play only for the person who triggers it
Config.playSoundForPassengers = true