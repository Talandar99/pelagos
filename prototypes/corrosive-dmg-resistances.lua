-- huge asteroid corrosive resistance
for name, asteroid in pairs(data.raw["asteroid"]) do
	if string.find(name, "^huge%-") then
		asteroid.resistances = asteroid.resistances or {}
		table.insert(asteroid.resistances, {
			type = "corrosive",
			decrease = 0,
			percent = 99,
		})
	end
end

-- demolisher corrosive resistances
for _, proto in pairs(data.raw["segmented-unit"]) do
	if string.find(proto.name, "demolisher") then
		proto.resistances = proto.resistances or {}
		table.insert(proto.resistances, {
			type = "corrosive",
			decrease = 0,
			percent = 20,
		})
	end
end

for _, proto in pairs(data.raw["segment"]) do
	if string.find(proto.name, "demolisher") then
		proto.resistances = proto.resistances or {}
		table.insert(proto.resistances, {
			type = "corrosive",
			decrease = 0,
			percent = 20,
		})
	end
end
