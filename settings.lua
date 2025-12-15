data:extend({
	{
		type = "bool-setting",
		name = "pelagos-fluid-value-based-flamethrower",
		setting_type = "startup",
		default_value = true,
		order = "pelagos-e",
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

-- ignore cargo ships powerpole settings to save some collision layers
-- moved to separate mod
--local function force_setting(setting_type, setting_name, value)
--	local setting = data.raw[setting_type .. "-setting"][setting_name]
--	if setting then
--		if setting_type == "bool" then
--			setting.forced_value = value
--		else
--			setting.allowed_values = { value }
--		end
--		setting.default_value = value
--		setting.hidden = true
--	end
--end
--force_setting("bool", "floating_pole_fulgora", true)
--force_setting("bool", "floating_pole_aquilo", true)
