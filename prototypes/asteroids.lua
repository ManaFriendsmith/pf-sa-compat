local function replace_asteroid_graphics(asteroid, find, replace)
    local variations = asteroid.graphics_set.variations
    for k, v in pairs(variations) do
        --hyphen is a special character in searches but you can't escape it. fuck lua
        v.color_texture.filename = string.gsub(v.color_texture.filename, "space", "pf-sa")
        v.color_texture.filename = string.gsub(v.color_texture.filename, "age", "compat")
        v.color_texture.filename = string.gsub(v.color_texture.filename, find, replace)
        v.roughness_map.filename = string.gsub(v.roughness_map.filename, "space", "pf-sa")
        v.roughness_map.filename = string.gsub(v.roughness_map.filename, "age", "compat")
        v.roughness_map.filename = string.gsub(v.roughness_map.filename, find, replace)
    end
end

local function replace_asteroid_drops(asteroid, find, replace)
    if asteroid.dying_trigger_effect then
        for k, v in pairs(asteroid.dying_trigger_effect) do
            if v.entity_name == find then v.entity_name = replace end
            if v.asteroid_name == find then v.asteroid_name = replace end
        end
    end
end

local function duplicate_particle(name, find, replace)
    if data.raw["optimized-particle"][name] then
        local new = table.deepcopy(data.raw["optimized-particle"][name])
        new.name = string.gsub(new.name, find, replace)
        new.pictures.sheet.filename = string.gsub(new.pictures.sheet.filename, "space", "pf-sa")
        new.pictures.sheet.filename = string.gsub(new.pictures.sheet.filename, "age", "compat")
        new.pictures.sheet.filename = string.gsub(new.pictures.sheet.filename, find, replace)
        data:extend({new})
    end
end

local function duplicate_smoke(name, find, replace, color)
    if data.raw["trivial-smoke"][name] then
        local new = table.deepcopy(data.raw["trivial-smoke"][name])
        new.name = string.gsub(new.name, find, replace)
        new.color = color
        data:extend({new})
    end
end

local function duplicate_explosion(name, find, replace, color)
    if data.raw.explosion[name] then
        local new = table.deepcopy(data.raw.explosion[name])
        new.name = string.gsub(new.name, find, replace)
        new.animations[1].tint = color
        local particle_creations = new.created_effect.action_delivery.target_effects
        for k, v in pairs(particle_creations) do
            if v.particle_name then
                v.particle_name = string.gsub(v.particle_name, find, replace)
            end
            if v.smoke_name then
                v.smoke_name = string.gsub(v.smoke_name, find, replace)
            end
        end
        data:extend({new})
    end
end

if mods["BrassTacks"] then

    local brass_color = {0.81, 0.63, 0.23, 0.3}

    duplicate_particle("promethium-asteroid-chunk-particle-small", "promethium", "brass")
    duplicate_particle("promethium-asteroid-chunk-particle-medium", "promethium", "brass")
    duplicate_particle("promethium-asteroid-particle-small", "promethium", "brass")
    duplicate_particle("promethium-asteroid-particle-medium", "promethium", "brass")
    duplicate_particle("promethium-asteroid-particle-big", "promethium", "brass")
    duplicate_particle("promethium-asteroid-particle-top-small", "promethium", "brass")
    duplicate_particle("promethium-asteroid-particle-top-big", "promethium", "brass")
    duplicate_particle("promethium-asteroid-particle-top-huge", "promethium", "brass")

    duplicate_smoke("asteroid-smoke-promethium-chunk", "promethium", "brass", brass_color)
    duplicate_smoke("asteroid-smoke-promethium-small", "promethium", "brass", brass_color)
    duplicate_smoke("asteroid-smoke-promethium-medium", "promethium", "brass", brass_color)
    duplicate_smoke("asteroid-smoke-promethium-big", "promethium", "brass", brass_color)
    duplicate_smoke("asteroid-smoke-promethium-huge", "promethium", "brass", brass_color)

    duplicate_explosion("promethium-asteroid-explosion-1", "promethium", "brass", brass_color)
    duplicate_explosion("promethium-asteroid-explosion-2", "promethium", "brass", brass_color)
    duplicate_explosion("promethium-asteroid-explosion-3", "promethium", "brass", brass_color)
    duplicate_explosion("promethium-asteroid-explosion-4", "promethium", "brass", brass_color)
    duplicate_explosion("promethium-asteroid-explosion-5", "promethium", "brass", brass_color)

    local gold0 = table.deepcopy(data.raw["asteroid-chunk"]["promethium-asteroid-chunk"])
    gold0.name = "brass-asteroid-chunk"
    replace_asteroid_drops(gold0, "promethium-asteroid-explosion-1", "brass-asteroid-explosion-1")
    replace_asteroid_graphics(gold0, "promethium", "brass")
    gold0.icon = "__pf-sa-compat__/graphics/icons/brass-asteroid-chunk.png"
    gold0.order = "caa"

    gold0.minable = {mining_time = 0.2, result = "brass-asteroid-chunk", mining_particle = "brass-asteroid-chunk-particle-medium" }

    local gold1 = table.deepcopy(data.raw["asteroid"]["small-promethium-asteroid"])
    gold1.name = "small-brass-asteroid"
    replace_asteroid_graphics(gold1, "promethium", "brass")
    replace_asteroid_drops(gold1, "promethium-asteroid-explosion-2", "brass-asteroid-explosion-2")
    replace_asteroid_drops(gold1, "promethium-asteroid-chunk", "brass-asteroid-chunk")
    gold1.icon = "__pf-sa-compat__/graphics/icons/small-brass-asteroid.png"
    gold1.max_health = gold1.max_health / 2
    gold1.order = "cab"
    gold1.factoriopedia_simulation.init = string.gsub(gold1.factoriopedia_simulation.init, "promethium", "brass")

    local gold2 = table.deepcopy(data.raw["asteroid"]["medium-promethium-asteroid"])
    gold2.name = "medium-brass-asteroid"
    replace_asteroid_graphics(gold2, "promethium", "brass")
    replace_asteroid_drops(gold2, "promethium-asteroid-explosion-3", "brass-asteroid-explosion-3")
    replace_asteroid_drops(gold2, "small-promethium-asteroid", "small-brass-asteroid")
    gold2.icon = "__pf-sa-compat__/graphics/icons/medium-brass-asteroid.png"
    gold2.max_health = gold2.max_health / 2
    gold2.order = "cac"
    gold2.factoriopedia_simulation.init = string.gsub(gold2.factoriopedia_simulation.init, "promethium", "brass")

    local gold3 = table.deepcopy(data.raw["asteroid"]["big-promethium-asteroid"])
    gold3.name = "big-brass-asteroid"
    replace_asteroid_graphics(gold3, "promethium", "brass")
    replace_asteroid_drops(gold3, "promethium-asteroid-explosion-4", "brass-asteroid-explosion-4")
    replace_asteroid_drops(gold3, "medium-promethium-asteroid", "medium-brass-asteroid")
    gold3.icon = "__pf-sa-compat__/graphics/icons/big-brass-asteroid.png"
    gold3.max_health = gold3.max_health / 2
    gold3.order = "cad"
    gold3.factoriopedia_simulation.init = string.gsub(gold3.factoriopedia_simulation.init, "promethium", "brass")

    local gold4 = table.deepcopy(data.raw["asteroid"]["huge-promethium-asteroid"])
    gold4.name = "huge-brass-asteroid"
    replace_asteroid_graphics(gold4, "promethium", "brass")
    replace_asteroid_drops(gold4, "promethium-asteroid-explosion-5", "brass-asteroid-explosion-5")
    replace_asteroid_drops(gold4, "big-promethium-asteroid", "big-brass-asteroid")
    gold4.icon = "__pf-sa-compat__/graphics/icons/huge-brass-asteroid.png"
    gold4.max_health = gold4.max_health / 2
    gold4.order = "cae"
    gold4.factoriopedia_simulation.init = string.gsub(gold4.factoriopedia_simulation.init, "promethium", "brass")

    data:extend({gold0, gold1, gold2, gold3, gold4})

end

if mods["BrimStuff"] then

    local moss_color = {0.32, 0.56, 0.39, 0.3}

    duplicate_particle("metallic-asteroid-chunk-particle-small", "metallic", "panspermia")
    duplicate_particle("metallic-asteroid-chunk-particle-medium", "metallic", "panspermia")
    duplicate_particle("metallic-asteroid-particle-small", "metallic", "panspermia")
    duplicate_particle("metallic-asteroid-particle-medium", "metallic", "panspermia")
    duplicate_particle("metallic-asteroid-particle-big", "metallic", "panspermia")
    duplicate_particle("metallic-asteroid-particle-top-small", "metallic", "panspermia")
    duplicate_particle("metallic-asteroid-particle-top-big", "metallic", "panspermia")
    duplicate_particle("metallic-asteroid-particle-top-huge", "metallic", "panspermia")

    duplicate_smoke("asteroid-smoke-metallic-chunk", "metallic", "panspermia", moss_color)
    duplicate_smoke("asteroid-smoke-metallic-small", "metallic", "panspermia", moss_color)
    duplicate_smoke("asteroid-smoke-metallic-medium", "metallic", "panspermia", moss_color)
    duplicate_smoke("asteroid-smoke-metallic-big", "metallic", "panspermia", moss_color)
    duplicate_smoke("asteroid-smoke-metallic-huge", "metallic", "panspermia", moss_color)

    duplicate_explosion("metallic-asteroid-explosion-1", "metallic", "panspermia", moss_color)
    duplicate_explosion("metallic-asteroid-explosion-2", "metallic", "panspermia", moss_color)
    duplicate_explosion("metallic-asteroid-explosion-3", "metallic", "panspermia", moss_color)
    duplicate_explosion("metallic-asteroid-explosion-4", "metallic", "panspermia", moss_color)
    duplicate_explosion("metallic-asteroid-explosion-5", "metallic", "panspermia", moss_color)

    local bio0 = table.deepcopy(data.raw["asteroid-chunk"]["metallic-asteroid-chunk"])
    bio0.name = "panspermia-asteroid-chunk"
    replace_asteroid_drops(bio0, "metallic-asteroid-explosion-1", "panspermia-asteroid-explosion-1")
    replace_asteroid_graphics(bio0, "metallic", "panspermia")
    bio0.icon = "__pf-sa-compat__/graphics/icons/panspermia-asteroid-chunk.png"
    bio0.order = "cba"

    bio0.minable = {mining_time = 0.2, result = "panspermia-asteroid-chunk", mining_particle = "panspermia-asteroid-chunk-particle-medium" }

    local bio1 = table.deepcopy(data.raw["asteroid"]["small-metallic-asteroid"])
    bio1.name = "small-panspermia-asteroid"
    replace_asteroid_graphics(bio1, "metallic", "panspermia")
    replace_asteroid_drops(bio1, "metallic-asteroid-explosion-2", "panspermia-asteroid-explosion-2")
    replace_asteroid_drops(bio1, "metallic-asteroid-chunk", "panspermia-asteroid-chunk")
    bio1.icon = "__pf-sa-compat__/graphics/icons/small-panspermia-asteroid.png"
    bio1.max_health = bio1.max_health / 2
    bio1.order = "cbb"
    bio1.factoriopedia_simulation.init = string.gsub(bio1.factoriopedia_simulation.init, "metallic", "panspermia")

    local bio2 = table.deepcopy(data.raw["asteroid"]["medium-metallic-asteroid"])
    bio2.name = "medium-panspermia-asteroid"
    replace_asteroid_graphics(bio2, "metallic", "panspermia")
    replace_asteroid_drops(bio2, "metallic-asteroid-explosion-3", "panspermia-asteroid-explosion-3")
    replace_asteroid_drops(bio2, "small-metallic-asteroid", "small-panspermia-asteroid")
    bio2.icon = "__pf-sa-compat__/graphics/icons/medium-panspermia-asteroid.png"
    bio2.max_health = bio2.max_health / 2
    bio2.order = "cbc"
    bio2.factoriopedia_simulation.init = string.gsub(bio2.factoriopedia_simulation.init, "metallic", "panspermia")

    local bio3 = table.deepcopy(data.raw["asteroid"]["big-metallic-asteroid"])
    bio3.name = "big-panspermia-asteroid"
    replace_asteroid_graphics(bio3, "metallic", "panspermia")
    replace_asteroid_drops(bio3, "metallic-asteroid-explosion-4", "panspermia-asteroid-explosion-4")
    replace_asteroid_drops(bio3, "medium-metallic-asteroid", "medium-panspermia-asteroid")
    bio3.icon = "__pf-sa-compat__/graphics/icons/big-panspermia-asteroid.png"
    bio3.max_health = bio3.max_health / 2
    bio3.order = "cbd"
    bio3.factoriopedia_simulation.init = string.gsub(bio3.factoriopedia_simulation.init, "metallic", "panspermia")

    local bio4 = table.deepcopy(data.raw["asteroid"]["huge-metallic-asteroid"])
    bio4.name = "huge-panspermia-asteroid"
    replace_asteroid_graphics(bio4, "metallic", "panspermia")
    replace_asteroid_drops(bio4, "metallic-asteroid-explosion-5", "panspermia-asteroid-explosion-5")
    replace_asteroid_drops(bio4, "big-metallic-asteroid", "big-panspermia-asteroid")
    bio4.icon = "__pf-sa-compat__/graphics/icons/huge-panspermia-asteroid.png"
    bio4.max_health = bio4.max_health / 2
    bio4.order = "cbe"
    bio4.factoriopedia_simulation.init = string.gsub(bio4.factoriopedia_simulation.init, "metallic", "panspermia")

    data:extend({bio0, bio1, bio2, bio3, bio4})
end