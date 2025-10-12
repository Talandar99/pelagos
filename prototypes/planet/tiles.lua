local tile_graphics = require("__base__/prototypes/tile/tile-graphics")
-------------------------------------------------------------------------------
-- deepwater initialization (finished in data-final-fix)
local deepwater = table.deepcopy(data.raw.tile["deepwater"])
deepwater.name = "pelagos-deepsea"
deepwater.localised_name = { "tile-name.pelagos-deepsea" }
deepwater.map_color = { r = 0.165, g = 0.278, b = 0.306 }
deepwater.default_cover_tile = "wooden-platform"
--deepwater.effect_color = { 34, 123, 136 }
--deepwater.effect_color = { 24, 123, 136 }
--deepwater.effect_color_secondary = { 74, 163, 176 }
--deepwater.effect_color_secondary = { 64, 163, 176 }
data:extend({ deepwater })
-------------------------------------------------------------------------------
-- sand_transitions
-------------------------------------------------------------------------------
---
local pelagossand3 = table.deepcopy(data.raw.tile["sand-1"])
pelagossand3.name = "pelagos-sand-3"
pelagossand3.localised_name = { "tile-name.pelagos-sand-3" }
pelagossand3.effect_color = { 194, 147, 78 }
data:extend({ pelagossand3 })

local pelagossand4 = table.deepcopy(data.raw.tile["sand-2"])
pelagossand4.name = "pelagos-sand-4"
pelagossand4.localised_name = { "tile-name.pelagos-sand-4" }
pelagossand4.effect_color = { 165, 120, 57 }
data:extend({ pelagossand4 })
