local asteroid_spawn_rates = {
    ["brass-asteroid-chunk"] = {
        nauvis=0.3,
        vulcanus=0.1,
        fulgora=0.1,
        gleba=0.01,
        terrapalus=0.01,
        tenebris=0.03,
        aquilo=0.03,
        maraxsis=0.05,
        castra=0.06,
        paracelsin=0.1,
        muluna=0.04,
        cerys=0.1,
        ["solar-system-edge"]=0.02
    },
    ["medium-brass-asteroid"] = {
        vulcanus=0.1,
        fulgora=0.12,
        gleba=0.02,
        terrapalus=0.02,
        tenebris=0.05,
        castra=0.09,
        cerys=0.12,
    },
    ["big-brass-asteroid"] = {
        aquilo = 0.06,
        maraxsis = 0.1,
        paracelsin = 0.1
    },
    ["huge-brass-asteroid"] = {
        ["solar-system-edge"]=0.09,
        ["shattered-planet"]=0.45
    },
    ["panspermia-asteroid-chunk"] = {
        nauvis=0.5,
        vulcanus=0.02,
        fulgora=0.1,
        gleba=0.6,
        terrapalus=0.6,
        tenebris=0.4,
        aquilo=0.01,
        maraxsis=0.25,
        castra=0.01,
        paracelsin=0.01,
        muluna=0.2,
        cerys=0.1,
        ["solar-system-edge"]=0.01
    },
    ["medium-panspermia-asteroid"] = {
        vulcanus=0.02,
        fulgora=0.03,
        gleba=0.4,
        terrapalus=0.7,
        tenebris=0.4,
        castra=0.01,
        cerys=0.03
    },
    ["big-panspermia-asteroid"] = {
        aquilo = 0.1,
        maraxsis = 0.1,
        paracelsin = 0.1
    },
    ["huge-panspermia-asteroid"] = {
        ["solar-system-edge"]=0.05,
        ["shattered-planet"]=0.6
    }
}

local function populate_location(location, asteroid, angle)
    if not location.asteroid_spawn_definitions then
        location.asteroid_spawn_definitions = {}
    end
    local my_spawn_definitions = {
        asteroid = asteroid,
        probability = asteroid_spawn_rates[asteroid][location.name] * 0.0125,
        speed = 1 * meter/second,
        angle_when_stopped = angle
    }
    if data.raw.asteroid[asteroid] then
        my_spawn_definitions.type = "entity"
    else
        my_spawn_definitions.type = "asteroid-chunk"
    end
    table.insert(location.asteroid_spawn_definitions, my_spawn_definitions)
end

local function populate_route(route, asteroid, angle)
    if not route.asteroid_spawn_definitions then
        route.asteroid_spawn_definitions = {}
    end
    local rates = asteroid_spawn_rates[asteroid]
    local start_rate = (rates[route.from] or 0) * 0.0125
    local end_rate = (rates[route.to] or 0) * 0.0125
    local delta = end_rate - start_rate
    local peak = (start_rate + end_rate) * 1.5

    local my_spawn_definitions = {
        asteroid = asteroid,
        spawn_points = {}
    }
    if data.raw.asteroid[asteroid] then
        my_spawn_definitions.type = "entity"
    else
        my_spawn_definitions.type = "asteroid-chunk"
    end

    table.insert(my_spawn_definitions.spawn_points, {
        distance = 0,
        probability = start_rate,
        speed = 1 * meter/second,
        angle_when_stopped = angle
    })
    table.insert(my_spawn_definitions.spawn_points, {
        distance = 0.2,
        probability = start_rate + (delta * 0.05) + (peak * 0.15),
        speed = 1 * meter/second,
        angle_when_stopped = angle
    })
    table.insert(my_spawn_definitions.spawn_points, {
        distance = 0.5,
        probability = start_rate + (delta * 0.5) + peak,
        speed = 1 * meter/second,
        angle_when_stopped = angle
    })
    table.insert(my_spawn_definitions.spawn_points, {
        distance = 0.8,
        probability = start_rate + (delta * 0.95) + (peak * 0.15),
        speed = 1 * meter/second,
        angle_when_stopped = angle
    })
    table.insert(my_spawn_definitions.spawn_points, {
        distance = 1,
        probability = end_rate,
        speed = 1 * meter/second,
        angle_when_stopped = angle
    })

    table.insert(route.asteroid_spawn_definitions, my_spawn_definitions)
end

local function populate_asteroid_spawn(asteroid, angle)
    local rates = asteroid_spawn_rates[asteroid]
    for k, v in pairs(data.raw.planet) do
        if rates[v.name] and rates[v.name] > 0 then
            populate_location(v, asteroid, angle)
        end
    end
    for k, v in pairs(data.raw["space-location"]) do
        if rates[v.name] and rates[v.name] > 0 then
            populate_location(v, asteroid, angle)
        end
    end
    for k, v in pairs(data.raw["space-connection"]) do
        if rates[v.from] and rates[v.from] > 0 or rates[v.to] and rates[v.to] > 0 then
            populate_route(v, asteroid, angle)
        end
    end
end

--I have no idea what the angle value does, it's not documented.
--These are the values used in vanilla SA, so I will just mimic that.
--chunk_angle = 1
--small_angle = 0.7
--medium_angle = 0.6
--big_angle = 0.5
--huge_angle = 0.4
if mods["BrassTacksMk2"] then
    populate_asteroid_spawn("brass-asteroid-chunk", 1)
    populate_asteroid_spawn("medium-brass-asteroid", 0.6)
    populate_asteroid_spawn("big-brass-asteroid", 0.5)
    populate_asteroid_spawn("huge-brass-asteroid", 0.4)
end

if mods["BrimStuffMk2"] then
    populate_asteroid_spawn("panspermia-asteroid-chunk", 1)
    populate_asteroid_spawn("medium-panspermia-asteroid", 0.6)
    populate_asteroid_spawn("big-panspermia-asteroid", 0.5)
    populate_asteroid_spawn("huge-panspermia-asteroid", 0.4)
end

--more asteroids means more strain on ammo. reduce asteroid health to compensate.
local denominator = 3
if mods["BrassTacksMk2"] then denominator = denominator + 1 end
if mods["BrimStuffMk2"] then denominator = denominator + 1 end

for k, v in pairs(data.raw.asteroid) do
    if not string.find(v.name, "promethium") then
        v.max_health = v.max_health * 3 / denominator
    end
end