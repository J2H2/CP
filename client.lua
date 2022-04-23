RegisterCommand('car', function(source, args)
--amount for the argument not being passed
local vehicleName = args[1] or 'zentorno'

--check if the vehicle actually exists
if not IsModelInCdimage(vehicleName) or not IsModelAVehicle(vehicle) then
     TriggerEvent('chat:addMessage', {
        args = {'Vehicle Not Recognised: ' ..vehicleName}
     })
     return
    end

    -- load the car
    RequestModel(vehicleName)

    -- wait for the model to load
    while not HasModelLoaded(vehicleName) do 
        Wait(500) 
    end 

    -- get the player's position
    local playerPed = playerPedId()  -- get the player ped!
    local pos = GetEntityCoords(playerPed) -- get the position of the local player ped!

    -- create the vehicle
    local vehicle = CreateVehicle(vehicleName, pos.x, pos.y, pos.z, GetEntityHeading(playerPed), true, false)

    -- set the player ped into the vehicle's driver seat 1 
    SetPedIntoVehicle(playerPed, vehicle, -1) 

    -- give the vehicle back to the game (this will make the server decide when to get rid of the car)
    SetEntityAsNoLongerNeeded(vehicle)

    --release the model 
    SetModelAsNoLongerNeeded(vehicleName)

    -- tell the player 
    TriggerEvent('chat:addMessage'.(
        args = ('You Have Spawned a ' .. vehicleName.. '.'}
})

 end, false)

RegisterCommand('dv', function()
 -- get the local player ped
 local playerPed = PlayerPedId()
 -- get the vehicle player is in
 local vehicle = GetVehiclePedIsIn(playerPed, false)
 -- delete the car
 DeleteEntity(vehicle) 
end, false)