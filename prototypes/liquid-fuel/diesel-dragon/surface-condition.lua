data:extend({
	{
		type = "surface-property",
		name = "diesel-dragon",
		default_value = 0,
	},
})
--
data.raw["rocket-silo"]["diesel-dragon"].surface_conditions = {
	{
		property = "diesel-dragon",
		min = 1,
	},
}

data.raw.planet["nauvis"].surface_properties["diesel-dragon"] = 1
data.raw.planet["fulgora"].surface_properties["diesel-dragon"] = 1
data.raw.planet["aquilo"].surface_properties["diesel-dragon"] = 1
--biosphere
data.raw.planet["pelagos"].surface_properties["diesel-dragon"] = 2
data.raw.planet["gleba"].surface_properties["diesel-dragon"] = 2
--high-durability
data.raw.planet["vulcanus"].surface_properties["diesel-dragon"] = 1
