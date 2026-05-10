function add_to_cultivation_productivity(recipe_name, change)
	if data.raw["recipe"][recipe_name] ~= nil then
		table.insert(data.raw["technology"]["cultivation-productivity"].effects, {
			type = "change-recipe-productivity",
			recipe = recipe_name,
			change = change,
		})
	end
end
function add_to_landfill_productivity(recipe_name, change)
	if data.raw["recipe"][recipe_name] ~= nil then
		table.insert(data.raw["technology"]["landfill-productivity"].effects, {
			type = "change-recipe-productivity",
			recipe = recipe_name,
			change = change,
		})
	end
end

if mods["planetaris-arig"] then
	add_to_landfill_productivity("planetaris-sandstone-foundation", 0.1)
	add_to_landfill_productivity("planetaris-landfill-compression", 0.1)
end
if mods["planetaris-tellus"] then
	add_to_cultivation_productivity("planetaris-magnesium-bacteria-cultivation", 0.1)
	add_to_landfill_productivity("planetaris-artificial-chlorophyll-soil", 0.1)
	add_to_landfill_productivity("planetaris-volcanic-soil", 0.1)
	add_to_landfill_productivity("planetaris-artificial-mycelia-soil", 0.1)
	add_to_landfill_productivity("planetaris-dust-soil", 0.1)
	add_to_landfill_productivity("planetaris-overgrowth-chlorophyll-soil", 0.1)
	add_to_landfill_productivity("planetaris-overgrowth-mycelia-soil", 0.1)
end
if mods["foliax"] then
	add_to_landfill_productivity("foliax-soil-grass", 0.1)
	add_to_landfill_productivity("foliax-soil-green", 0.1)
	add_to_landfill_productivity("foliax-soil-orange", 0.1)
	add_to_landfill_productivity("foliax-soil-pink", 0.1)
	add_to_landfill_productivity("foliax-soil-red", 0.1)
	add_to_landfill_productivity("foliax-soil-silver", 0.1)
end
if mods["obsidiax"] then
	add_to_landfill_productivity("obsidiax-foundation", 0.1)
end

if mods["gleba_cultured_soil"] then
	add_to_landfill_productivity("cultured-yumako-soil", 0.1)
	add_to_landfill_productivity("cultured-jellynut-soil", 0.1)
end
if mods["skewer_planet_vesta"] then
	add_to_landfill_productivity("vesta-foundation", 0.1)
end
if mods["apia"] then
	add_to_cultivation_productivity("larvae-cultivation", 0.1)
	add_to_landfill_productivity("wax-platform", 0.1)
end
