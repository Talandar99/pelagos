local function hide_technology_and_rewire(old_tech, new_tech)
	local old = data.raw.technology[old_tech]
	local new = data.raw.technology[new_tech]

	if not old or not new then
		return
	end

	for _, tech in pairs(data.raw.technology) do
		if tech.prerequisites then
			for i = #tech.prerequisites, 1, -1 do
				if tech.prerequisites[i] == old_tech then
					table.remove(tech.prerequisites, i)

					local exists = false
					for _, p in pairs(tech.prerequisites) do
						if p == new_tech then
							exists = true
							break
						end
					end

					if not exists then
						table.insert(tech.prerequisites, new_tech)
					end
				end
			end
		end
	end

	if old.effects then
		new.effects = new.effects or {}
		for _, effect in pairs(old.effects) do
			table.insert(new.effects, effect)
		end
	end

	old.hidden = true
	old.enabled = false
end
-- remove unused researches
data.raw["technology"]["cargo_ships"].effects = {}
data.raw["technology"]["water_transport"].effects = {}
hide_technology_and_rewire("water_transport", "automated_water_transport")
hide_technology_and_rewire("cargo_ships", "automated_water_transport")
