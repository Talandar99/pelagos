-- hide bridge and all related things

-- items
if data.raw["item"]["bridge_base"] then
	data.raw["item"]["bridge_base"].hidden = true
	data.raw["item"]["bridge_base"].hidden_in_factoriopedia = true
end

if data.raw["item"]["bridge_gate"] then
	data.raw["item"]["bridge_gate"].hidden = true
	data.raw["item"]["bridge_gate"].hidden_in_factoriopedia = true
end

-- hide train-stop entity
if data.raw["train-stop"]["bridge_base"] then
	local e = data.raw["train-stop"]["bridge_base"]
	e.selectable_in_game = false
	e.flags = {
		"placeable-neutral",
		"not-blueprintable",
		"not-deconstructable",
		"not-upgradable",
	}
	e.hidden_in_factoriopedia = true
end

-- hide gate entity
if data.raw["gate"]["bridge_gate"] then
	local g = data.raw["gate"]["bridge_gate"]
	g.selectable_in_game = false
	g.flags = {
		"placeable-neutral",
		"not-blueprintable",
		"not-deconstructable",
	}
	g.hidden_in_factoriopedia = true
end

-- hide recipes
if data.raw["recipe"]["bridge_base"] then
	data.raw["recipe"]["bridge_base"].enabled = false
	data.raw["recipe"]["bridge_base"].hidden = true
	data.raw["recipe"]["bridge_base"].hidden_in_factoriopedia = true
end

if data.raw["recipe"]["bridge_gate"] then
	data.raw["recipe"]["bridge_gate"].enabled = false
	data.raw["recipe"]["bridge_gate"].hidden = true
	data.raw["recipe"]["bridge_gate"].hidden_in_factoriopedia = true
end
-- move cargo ships tips and tricks into pelagos
data.raw["tips-and-tricks-item"]["cargo-ships"].category = "space-age"
data.raw["tips-and-tricks-item"]["cargo-ships"].order = "pelagos-g"
data.raw["tips-and-tricks-item"]["cargo-ships"].indent = 1
data.raw["item"]["oil_rig"].weight = 1000 * kg
