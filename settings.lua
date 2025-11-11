data:extend({
	{
		type = "bool-setting",
		name = "pelagos-force-small-electric-generator",
		setting_type = "startup",
		default_value = true,
		order = "pelagos-a",
	},
	{
		type = "int-setting",
		name = "pelagos-boat-inventory",
		setting_type = "startup",
		minimum_value = 10,
		default_value = 50,
		maximum_value = 80,
		order = "pelagos-b",
	},
	{
		type = "int-setting",
		name = "pelagos-cargoship-inventory",
		setting_type = "startup",
		minimum_value = 100,
		default_value = 300,
		maximum_value = 1000,
		order = "pelagos-c",
	},
	{
		type = "int-setting",
		name = "pelagos-tanker-capacity",
		setting_type = "startup",
		minimum_value = 1000,
		default_value = 150000,
		maximum_value = 250000,
		order = "pelagos-d",
	},
	{
		type = "bool-setting",
		name = "pelagos-fluid-value-based-flamethrower",
		setting_type = "startup",
		default_value = true,
		order = "pelagos-e",
	},
	{
		type = "double-setting",
		name = "pelagos-boat-friction",
		setting_type = "startup",
		minimum_value = 0.0001,
		default_value = 0.001,
		--maximum_value = 0.002,
		maximum_value = 0.01,
		order = "pelagos-f",
	},
	{
		type = "bool-setting",
		name = "allow-galleon-before-pelagos",
		setting_type = "startup",
		default_value = false,
		order = "pelagos-f",
	},
	{
		type = "bool-setting",
		name = "pelagos-methane-on-vesta",
		setting_type = "startup",
		default_value = false,
		order = "pelagos-g",
	},
	{
		type = "bool-setting",
		name = "pelagos-override-vesta-methane-fluid-icon",
		setting_type = "startup",
		default_value = true,
		order = "pelagos-h",
	},
})

if mods["any-planet-start"] then
	APS.add_choice("pelagos")
end
