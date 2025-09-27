data:extend({
	{
		type = "explosion",
		name = "nuke-effects-pelagos",
		flags = { "not-on-map" },
		hidden = true,
		icons = {
			{ icon = "__base__/graphics/icons/explosion.png" },
			{ icon = "__base__/graphics/icons/atomic-bomb.png" },
		},
		localised_name = { "entity-name.nuke-explosion" },
		order = "a-d-a-b",
		subgroup = "explosions",
		height = 0,
		animations = util.empty_sprite(),
		surface_conditions = {
			{
				property = "pressure",
				min = 1500,
				max = 1500,
			},
		},
		created_effect = {
			type = "direct",
			action_delivery = {
				type = "instant",
				target_effects = {
					{
						type = "set-tile",
						tile_name = "pelagos-deepsea",
						radius = 12,
						apply_projection = true,
						tile_collision_mask = { layers = { water_tile = true } },
					},
				},
			},
		},
	},
})
local function atomic_rocket_surface_explosion(explosion_name)
	-- target index 2, otherwise the lava tiles can remove cliffs first and you'd not get the achievement for cliff destruction.
	table.insert(data.raw.projectile["atomic-rocket"].action.action_delivery.target_effects, 2, {
		type = "create-entity",
		check_buildability = true,
		entity_name = explosion_name,
	})
end
atomic_rocket_surface_explosion("nuke-effects-pelagos")
