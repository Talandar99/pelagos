if mods["planetaris-arig"] then
	data.raw.planet["arig"].surface_properties["diesel-dragon"] = 1
end
if mods["foliax"] then
	data.raw.planet["foliax"].surface_properties["diesel-dragon"] = 2
end
if mods["lignumis"] then
	data.raw.planet["lignumis"].surface_properties["diesel-dragon"] = 2
	table.insert(
		data.raw["recipe"]["biosphere-diesel-rocket-part"].ingredients,
		{ type = "item", name = "lumber", amount = 1 }
	)
end
