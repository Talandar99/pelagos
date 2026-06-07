data:extend({
	{
		type = "bool-setting",
		name = "pelagos-contribute-to-aquilo-discovery",
		setting_type = "startup",
		default_value = true,
		order = "pelagos-b",
	},
	{
		type = "bool-setting",
		name = "pelagos-contribute-to-promethium-science",
		setting_type = "startup",
		default_value = true,
		order = "pelagos-c",
	},
	{
		type = "bool-setting",
		name = "pelagos-methane-on-vesta",
		setting_type = "startup",
		default_value = false,
		order = "pelagos-d",
	},
	{
		type = "bool-setting",
		name = "pelagos-override-vesta-methane-fluid-icon",
		setting_type = "startup",
		default_value = true,
		order = "pelagos-e",
	},
})

if mods["any-planet-start"] then
	APS.add_choice("pelagos")
end
