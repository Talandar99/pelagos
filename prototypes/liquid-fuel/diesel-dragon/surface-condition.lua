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
