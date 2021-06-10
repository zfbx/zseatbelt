SetFlyThroughWindscreenParams(Config.ejectVelocity, Config.unknownEjectVelocity, Config.unknownModifier, Config.minDamage);
local seatbeltOn = false

Citizen.CreateThread(function()
    local ped = PlayerPedId()
    while true do
        Citizen.Wait(1)
        if IsPedInAnyVehicle(ped) then
            if seatbeltOn and Config.fixedWhileBuckled then
                DisableControlAction(0, 75, true) -- Disable exit vehicle when stop
                DisableControlAction(27, 75, true) -- Disable exit vehicle when Driving
            end
        elseif seatbeltOn then
            seatbeltOn = false
            TriggerEvent("seatbelt:client:ToggleSeatbelt", false, false)
            Citizen.Wait(1000)
        else
            Citizen.Wait(1000)
        end
    end
end)

RegisterCommand('seatbelt', function(source, args, rawCommand)
    local ped = PlayerPedId()
    if IsPedInAnyVehicle(ped, false) then
        local class = GetVehicleClass(GetVehiclePedIsIn(ped))
        if class ~= 8 and class ~= 13 and class ~= 14 then
            TriggerEvent("seatbelt:client:ToggleSeatbelt", true)
        end
    end
end, false)

RegisterNetEvent("seatbelt:client:ToggleSeatbelt")
AddEventHandler("seatbelt:client:ToggleSeatbelt", function(makeSound, toggle)
    if toggle == nil then
        if seatbeltOn then
            playSound("unbuckle")
            SetFlyThroughWindscreenParams(Config.ejectVelocity, Config.unknownEjectVelocity, Config.unknownModifier, Config.minDamage);
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
            SetFlyThroughWindscreenParams(Config.ejectVelocity, Config.unknownEjectVelocity, Config.unknownModifier, Config.minDamage);
        end
        seatbeltOn = toggle
    end
end)

function playSound(action)
    if Config.playSound then
        if Config.playSoundForPassengers then
            local veh = GetVehiclePedIsUsing(PlayerPedId())
            local maxpeds = GetVehicleMaxNumberOfPassengers(veh) - 2
            local passengers = {}
            for i = -1, maxpeds do
                if not IsVehicleSeatFree(veh, i) then
                    local ped = GetPlayerServerId(NetworkGetPlayerIndexFromPed(GetPedInVehicleSeat(veh, i)))
                    table.insert(passengers, ped)
                end
            end
            TriggerServerEvent('seatbelt:server:PlaySound', action, json.encode(passengers))
        else
            TriggerEvent('seatbelt:client:PlaySound', action, Config.volume)
        end
    end
end

RegisterNetEvent('seatbelt:client:PlaySound')
AddEventHandler('seatbelt:client:PlaySound', function(action, volume)
    SendNUIMessage({ type = action, volume = volume })
end)

exports("status", function()
    return seatbeltOn
end)

RegisterKeyMapping('seatbelt', 'Toggle Seatbelt', 'keyboard', Config.Keybind)