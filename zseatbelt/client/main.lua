SetFlyThroughWindscreenParams(Config.ejectVelocity, Config.unknownEjectVelocity, Config.unknownModifier, Config.minDamage);
local seatbeltOn = false
local ped = nil
local uiactive = false

Citizen.CreateThread(function()
    while true do
        ped = PlayerPedId()
        Citizen.Wait(500)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        if IsPedInAnyVehicle(ped) then
            if seatbeltOn then
                if Config.fixedWhileBuckled then
                    DisableControlAction(0, 75, true) -- Disable exit vehicle when stop
                    DisableControlAction(27, 75, true) -- Disable exit vehicle when Driving
                end
                toggleUI(false)
            else
                toggleUI(true)
            end
        else
            if seatbeltOn then
                seatbeltOn = false
                toggleSeatbelt(false, false)
            end
            toggleUI(false)
            Citizen.Wait(1000)
        end
    end
end)

function toggleSeatbelt(makeSound, toggle)
    if toggle == nil then
        if seatbeltOn then
            playSound("unbuckle")
            SetFlyThroughWindscreenParams(Config.ejectVelocity, Config.unknownEjectVelocity, Config.unknownModifier, Config.minDamage)
        else
            playSound("buckle")
            SetFlyThroughWindscreenParams(10000.0, 10000.0, 17.0, 500.0);
        end
        seatbeltOn = not seatbeltOn
    else
        if toggle then
            playSound("buckle")
            SetFlyThroughWindscreenParams(10000.0, 10000.0, 17.0, 500.0);
        else
            playSound("unbuckle")
            SetFlyThroughWindscreenParams(Config.ejectVelocity, Config.unknownEjectVelocity, Config.unknownModifier, Config.minDamage)
        end
        seatbeltOn = toggle
    end
end

function toggleUI(status)
    if Config.showUnbuckledIndicator then
        if uiactive ~= status then
            uiactive = status
            if status then
                SendNUIMessage({type = "showindicator"})
            else
                SendNUIMessage({type = "hideindicator"})
            end
        end
    end
end

function playSound(action)
    if Config.playSound then
        if Config.playSoundForPassengers then
            local veh = GetVehiclePedIsUsing(ped)
            local maxpeds = GetVehicleMaxNumberOfPassengers(veh) - 2
            local passengers = {}
            for i = -1, maxpeds do
                if not IsVehicleSeatFree(veh, i) then
                    local ped = GetPlayerServerId( NetworkGetPlayerIndexFromPed(GetPedInVehicleSeat(veh, i)) )
                    table.insert(passengers, ped)
                end
            end
            TriggerServerEvent('seatbelt:server:PlaySound', action, json.encode(passengers))
        else
            SendNUIMessage({type = action, volume = Config.volume})
        end
    end
end

RegisterCommand('toggleseatbelt', function(source, args, rawCommand)
    if IsPedInAnyVehicle(ped, false) then
        local class = GetVehicleClass(GetVehiclePedIsIn(ped))
        if class ~= 8 and class ~= 13 and class ~= 14 then
            toggleSeatbelt(true)
        end
    end
end, false)

RegisterNetEvent('seatbelt:client:PlaySound')
AddEventHandler('seatbelt:client:PlaySound', function(action, volume)
    SendNUIMessage({type = action, volume = volume})
end)

exports("status", function() return seatbeltOn end)

RegisterKeyMapping('toggleseatbelt', 'Toggle Seatbelt', 'keyboard', 'B')
