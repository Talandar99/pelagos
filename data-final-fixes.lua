-- reenables fishing settings disabled by cargo ships
if settings.startup["pelagos-allow-fishing"].value then
	for _, inserter in pairs(data.raw.inserter) do
		inserter.use_easter_egg = true
	end
else
	for _, inserter in pairs(data.raw.inserter) do
		inserter.use_easter_egg = false
	end
end

-- make sure plants can grow on sand-1
require("prototypes.plants-autoplace-settings")

-- force small electric generator
if settings.startup["pelagos-force-small-electric-generator"].value then
	if data.raw["generator"]["or_power_electric"] then
		local gen = data.raw["generator"]["or_power_electric"]

		-- wymuszamy zawsze tryb "only-when-moduled"
		gen.max_power_output = "850kW"
		gen.energy_source.output_flow_limit = "850kW"
		gen.fluid_box.volume = 500
	end
end

require("prototypes.liquid-fuel.barrel-fuel")

require("prototypes.pirate-ship")

-- barreling category
local original_recipes = {}
for name, _ in pairs(data.raw.recipe) do
	table.insert(original_recipes, name)
end

for _, name in ipairs(original_recipes) do
	local recipe = data.raw.recipe[name]
	if recipe then
		if string.sub(name, -6) == "barrel" and string.len(name) > 6 then
			local copy = table.deepcopy(recipe)
			copy.name = name .. "-barreling-copy"
			copy.category = "barreling"
			copy.hidden = false
			copy.hidden_in_factoriopedia = true
			copy.enabled = true
			data:extend({ copy })
		end
	end
end
