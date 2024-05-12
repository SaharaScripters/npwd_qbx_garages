lib.versionCheck('Qbox-project/npwd_qbx_garages')

local config = require '@ss_garages.config.garages'
local VEHICLES = exports.qbx_core:GetVehiclesByName()

local function findSimiliarPlate(plate)
	local vehicles = GetAllVehicles()
	for k, v in pairs(vehicles) do
		local p = GetVehicleNumberPlateText(v)
		if plate == p then
			return v
		end
	end
	return nil
end

lib.callback.register('npwd_qbx_garages:server:getPlayerVehicles', function(source)
	local player = exports.qbx_core:GetPlayer(source)
	if not player then return {} end
	local vehicles = exports.ss_playervehicles:fetchEntities({
		citizenid = player.PlayerData.citizenid,
	})
	for i = 1, #vehicles do
		local vehicleData = vehicles[i]
		vehicleData.vehicle = 'Unknown'
		vehicleData.brand = 'Vehicle'
		if vehicleData.state == 0 then
			if not findSimiliarPlate(vehicleData.plate) then
				vehicleData.state = 'impounded'
			else
				vehicleData.state = 'out'
			end
		elseif vehicleData.state == 1 then
			vehicleData.state = 'garaged'
		elseif vehicleData.state == 2 then
			vehicleData.state = 'seized'
		else
			vehicleData.state = 'unknown'
		end
		if VEHICLES[vehicleData.model] then
			vehicleData.vehicle = VEHICLES[vehicleData.model].name
			vehicleData.brand = VEHICLES[vehicleData.model].brand
		end
		local vehProps = json.decode(vehicleData.props)
		vehicleData.engine = vehProps?.engineHealth or 1000
		vehicleData.fuel = vehProps?.fuelLevel or 100
		vehicleData.body = vehProps?.bodyHealth or 1000
		vehicleData.garage = config.locations[vehicleData.garage]?.label or 'Unknown Garage'
	end
	return vehicles
end)

lib.callback.register('npwd_qbx_garages:server:getVehicleLocation', function(source, plate)
	local vehicle = findSimiliarPlate(plate)
	if vehicle then
		return GetEntityCoords(vehicle)
	end
	return nil
end)