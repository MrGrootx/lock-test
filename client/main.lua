ESX = nil
ESX = exports["es_extended"]:getSharedObject()

RegisterCommand('lockpick', function(source, args, raw)
   local playerped = PlayerPedId()
   local pedcoords = GetEntityCoords(playerped)
   local closestVehicle = ESX.Game.GetClosestVehicle(pedcoords)

   local vehPos = GetEntityCoords(closestVehicle)
   local distance = #(vehPos - pedcoords)

   if distance < 6.0 then
      TaskStartScenarioInPlace(playerped, 'WORLD_HUMAN_WELDING', 0, true)

      SetVehicleAlarm(closestVehicle, true)
      SetVehicleAlarmTimeLeft(closestVehicle, 7000)
      SetVehicleAlarm(closestVehicle)

      Wait(5000) -- like setTimeOut
      ClearPedTasksImmediately(playerped)
      SetVehicleDoorsLocked(closestVehicle, 1)
      SetVehicleDoorsLockedForAllPlayers(closestVehicle, false)
   end
end, false)
