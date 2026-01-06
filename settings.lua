data:extend({
	{
		type = "bool-setting",
		name = "allow-galleon-before-pelagos",
		setting_type = "startup",
		default_value = false,
		order = "pelagos-a",
	},
	{
		type = "bool-setting",
		name = "pelagos-contribute-to-aquilo-discovery",
		setting_type = "startup",
		default_value = false,
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

-- ignore cargo ships powerpole settings to save some collision layers
-- moved to separate mod
local function force_setting(setting_type, setting_name, value)
	local setting = data.raw[setting_type .. "-setting"][setting_name]
	if setting then
		if setting_type == "bool" then
			setting.forced_value = value
		else
			setting.allowed_values = { value }
		end
		setting.default_value = value
		setting.hidden = true
	end
end
force_setting("bool", "cargo-crates-can-use-regular-assembling-machines", false)
