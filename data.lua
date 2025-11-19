require("prototypes/asteroids")
local item_sounds = require("__base__.prototypes.item_sounds")

local misc = require("__pf-functions__/misc")
local rm = require("__pf-functions__/recipe-manipulation")

if misc.difficulty > 1 then
    data:extend(
    {
        {
            type = "item-subgroup",
            name = "rocket-components",
            group = "intermediate-products",
            order = "h2"
        },
        {
            type = "item",
            name = "rocket-control-unit",
            icon = "__pf-sa-compat__/graphics/icons/rocket-control-unit.png",
            icon_size = 64,
            subgroup = "rocket-components",
            order = "a",
            inventory_move_sound = item_sounds.rocket_control_inventory_move,
            pick_sound = item_sounds.rocket_control_inventory_pickup,
            drop_sound = item_sounds.rocket_control_inventory_move,
            stack_size = 20,
            default_import_location = "nauvis",
            weight = 5*kg
        },
        {
            type = "recipe",
            name = "rocket-control-unit",
            category = "electronics",
            ingredients = {
                {type="item", name="processing-unit", amount=1},
                {type="item", name="battery", amount=3},
                {type="item", name="electronic-circuit", amount=3}
            },
            results = {
                {type="item", name="rocket-control-unit", amount=1}
            },
            energy_required = 10,
            lasermill_dlc = {helium = -1},
            enabled = false
        }
    })
end

if mods["BrassTacks"] or mods["IfNickel"] or mods["ThemTharHills"] then
    data:extend({
        {
            type = "technology",
            name = "full-spectrum-magmallurgy",
            icons = {
                {
                    icon = "__pf-sa-compat__/graphics/technology/full-spectrum-magmallurgy.png",
                    icon_size = 256,
                    icon_mipmaps = 4
                }
            },
            effects = {
            },
            prerequisites = {"promethium-science-pack"},
            unit = {
                count = 50000,
                time = 60,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"military-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"production-science-pack", 1},
                    {"utility-science-pack", 1},
                    {"space-science-pack", 1},
                    {"metallurgic-science-pack", 1},
                    {"electromagnetic-science-pack", 1},
                    {"agricultural-science-pack", 1},
                    {"cryogenic-science-pack", 1},
                    {"promethium-science-pack", 1}
                }
            }
        }
    })
end

if mods["BrassTacks"] or mods["IfNickel"] then

    if 1 == 2 then
        data.raw.item["iron-plate"].localised_description = {"recipe-description.hint-nonstandard-recycling"}
        data.raw.item["copper-plate"].localised_description = {"recipe-description.hint-nonstandard-recycling"}
        data.raw.item["steel-plate"].localised_description = {"recipe-description.hint-nonstandard-recycling"}

        data:extend({
            {
                type = "recipe",
                name = "custom-iron-plate-recycling",
                localised_name = {"recipe-name.recycling", {"item-name.iron-plate"}},
                icons = {
                        {
                            icon = "__quality__/graphics/icons/recycling.png",
                            icon_size = 64
                        },
                        {
                            icon = "__base__/graphics/icons/iron-plate.png",
                            icon_size = 64
                        },
                        {
                            icon = "__quality__/graphics/icons/recycling-top.png",
                            icon_size = 64
                        }
                },
                category = "recycling",
                ingredients = {
                    {type="item", name="iron-plate", amount=1}
                },
                results = {
                    {type="item", name="iron-ore", amount=1, probability = 0.06}
                },
                bespoke = "iron-plate",
                energy_required = 3.2/16,
                allow_productivity = false,
                enabled = true,
                hidden = true,
                allow_decomposition = false,
                unlock_results = false
            },
            {
                type = "recipe",
                name = "custom-copper-plate-recycling",
                localised_name = {"recipe-name.recycling", {"item-name.copper-plate"}},
                icons = {
                        {
                            icon = "__quality__/graphics/icons/recycling.png",
                            icon_size = 64
                        },
                        {
                            icon = "__base__/graphics/icons/copper-plate.png",
                            icon_size = 64
                        },
                        {
                            icon = "__quality__/graphics/icons/recycling-top.png",
                            icon_size = 64
                        }
                },
                category = "recycling",
                ingredients = {
                    {type="item", name="copper-plate", amount=1}
                },
                results = {
                    {type="item", name="copper-ore", amount=1, probability = 0.06}
                },
                bespoke = "copper-plate",
                energy_required = 3.2/16,
                allow_productivity = false,
                enabled = true,
                hidden = true,
                allow_decomposition = false,
                unlock_results = false
            },
            {
                type = "recipe",
                name = "custom-steel-plate-recycling",
                localised_name = {"recipe-name.recycling", {"item-name.steel-plate"}},
                icons = {
                        {
                            icon = "__quality__/graphics/icons/recycling.png",
                            icon_size = 64
                        },
                        {
                            icon = "__base__/graphics/icons/steel-plate.png",
                            icon_size = 64
                        },
                        {
                            icon = "__quality__/graphics/icons/recycling-top.png",
                            icon_size = 64
                        }
                },
                category = "recycling",
                ingredients = {
                    {type="item", name="steel-plate", amount=1}
                },
                results = {
                    {type="item", name="iron-ore", amount=1, probability = 0.18}
                },
                bespoke = "steel-plate",
                energy_required = 1,
                allow_productivity = false,
                enabled = true,
                hidden = true,
                allow_decomposition = false,
                unlock_results = false
            },
        })
    end

    data:extend({
        {
            type = "item",
            name = "philosophers-hormone",
            icon = "__pf-sa-compat__/graphics/icons/philosophers-hormone.png",
            icon_size = 64,
            subgroup = "agriculture-processes",
            order = "b[agriculture]-ba",
            inventory_move_sound = item_sounds.science_inventory_move,
            pick_sound = item_sounds.science_inventory_pickup,
            drop_sound = item_sounds.science_inventory_move,
            stack_size = 100,
            default_import_location = "gleba",
            weight = 1*kg
        },
        {
            type = "recipe",
            name = "philosophers-hormone-from-iron-bacteria",
            icons = {
                {
                    icon = "__pf-sa-compat__/graphics/icons/philosophers-hormone.png",
                    icon_size = 64,
                    icon_mipmaps = 4,        
                },
                {
                    icon = "__space-age__/graphics/icons/iron-bacteria.png",
                    icon_size = 64,
                    icon_mipmaps = 4,
                    shift = {-8, -8},
                    scale = 0.25
                }
            },
            subgroup = "agriculture-processes",
            order = "b[agriculture]-bb",
            category = mods["Age-of-Production"] and "biochemistry-or-organic" or "organic",
            ingredients = {
                {type="item", name="iron-bacteria", amount=1, ignored_by_stats=1},
                {type="item", name="nutrients", amount=1},
            },
            results = {
                {type="item", name="philosophers-hormone", amount=1},
                {type="item", name=misc.difficulty == 3 and "copper-bacteria" or "iron-bacteria", amount=1, probability=0.15, ignored_by_stats=1}
            },
            energy_required = 1,
            allow_productivity = true,
            allow_decomposition = false,
            enabled = false,
            crafting_machine_tint =
            {
              primary = {0, 0.5, 1, 1},
              secondary = {0.4, 0.6, 0.8, 1},
            }
        },
        {
            type = "recipe",
            name = "philosophers-hormone-from-copper-bacteria",
            icons = {
                {
                    icon = "__pf-sa-compat__/graphics/icons/philosophers-hormone.png",
                    icon_size = 64,
                    icon_mipmaps = 4,        
                },
                {
                    icon = "__space-age__/graphics/icons/copper-bacteria.png",
                    icon_size = 64,
                    icon_mipmaps = 4,
                    shift = {8, -8},
                    scale = 0.25
                }
            },
            subgroup = "agriculture-processes",
            order = "b[agriculture]-bb",
            category = mods["Age-of-Production"] and "biochemistry-or-organic" or "organic",
            ingredients = {
                {type="item", name="copper-bacteria", amount=1, ignored_by_stats=1},
                {type="item", name="nutrients", amount=1},
            },
            results = {
                {type="item", name="philosophers-hormone", amount=1},
                {type="item", name=misc.difficulty == 3 and "iron-bacteria" or "copper-bacteria", amount=1, probability=0.15, ignored_by_stats=1}
            },
            energy_required = 1,
            allow_productivity = true,
            allow_decomposition = false,
            enabled = false,
            crafting_machine_tint =
            {
              primary = {1, 0.5, 0, 1},
              secondary = {0.8, 0.6, 0.4, 1},
            }
        }
    })

    if misc.difficulty == 3 then
        data.raw.item["philosophers-hormone"].spoil_ticks = 15 * minute
        data.raw.item["philosophers-hormone"].spoil_result = "spoilage"
    end

    if false then
        data:extend({
            {
                type = "technology",
                name = "bacteria-productivity",
                icons = {
                    {
                      icon = "__space-age__/graphics/technology/bacteria-cultivation",
                      icon_size = 256
                    },
                    {
                      icon = "__core__/graphics/icons/technology/constants/constant-mining-productivity.png",
                      icon_size = 128,
                      scale = 0.5,
                      shift = {50, 50}
                    }
                  },
                effects =
                {
                  {
                    type = "change-recipe-productivity",
                    recipe = "iron-bacteria-cultivation",
                    change = 0.1
                  },
                  {
                    type = "change-recipe-productivity",
                    recipe = "copper-bacteria-cultivation",
                    change = 0.1
                  },
                  {
                    type = "change-recipe-productivity",
                    recipe = "philosophers-hormone-from-iron-bacteria",
                    change = 0.1
                  },
                  {
                    type = "change-recipe-productivity",
                    recipe = "philosophers-hormone-from-copper-bacteria",
                    change = 0.1
                  }
                },
                prerequisites = {"agricultural-science-pack"},
                unit =
                {
                  count_formula = "1.5^L*1000",
                  ingredients =
                  {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"production-science-pack", 1},
                    {"space-science-pack", 1},
                    {"agricultural-science-pack", 1}
                  },
                  time = 60
                },
                max_level = "infinite",
                upgrade = true
              }
        })
    end
end

if misc.difficulty > 1 then
    data:extend({
        {
            type = "recipe-category",
            name = "electronics-or-organic",
            can_recycle = true
        },
        {
            type = "recipe-category",
            name = "electronics-or-metallurgy",
            can_recycle = true
        }
    })
    if misc.difficulty == 3 then
        data:extend({
            {
                type = "recipe-category",
                name = "electronics-or-cryogenics",
                can_recycle = true
            }    
        })
    end
end

if misc.difficulty == 3 and mods["BrassTacks"] and mods["IfNickel"] and mods["ThemTharHills"] and mods["BrimStuff"] and mods["LasingAround"] then
    data:extend({
        {
            type = "item",
            name = "quantum-encabulator",
            icon = "__pf-sa-compat__/graphics/icons/quantum-encabulator.png",
            icon_size = 64,
            subgroup = "space-processing",
            order = "z",
            inventory_move_sound = item_sounds.atomic_bomb_inventory_move,
            pick_sound = item_sounds.atomic_bomb_inventory_pickup,
            drop_sound = item_sounds.atomic_bomb_inventory_move,
            stack_size = 1,
            default_import_location = "solar-system-edge",
            weight = 1001*kg
        },
        {
            type = "recipe",
            name = "quantum-encabulator",
            category = "cryogenics",
            surface_conditions = {
                {
                    property = "gravity",
                    max = 0
                }
            },
            ingredients = {
                {type="item", name="quantum-processor", amount=10},
                {type="item", name="weird-alien-gizmo", amount=10},
                {type="item", name="malleable-logarithmic-casing", amount=10},
                {type="item", name="ambifacient-lunar-waneshaft", amount=10},
                {type="item", name="differential-girdlespring", amount=10},
                {type="item", name="semiboloid-stator", amount=10},
                {type="item", name="spurving-bearing", amount=5},
                {type="item", name="hydrocoptic-marzelvane", amount=5},
                {type="item", name="non-reversible-tremie-pipe", amount=5},
                {type="item", name="cardinal-grammeter", amount=5},
            },
            results = {
                {type="item", name="quantum-encabulator", amount=1, ignored_by_productivity=1},
                {type="item", name="scrap", amount=15}
            },
            main_product = "quantum-encabulator",
            energy_required = 15,
            allow_productivity = true,
            allow_decomposition = false,
            enabled = false,
            crafting_machine_tint =
            {
              primary = {0.5, 0, 1, 1},
              secondary = {0.5, 0.2, 0.8, 1},
              tertiary = {1, 1, 1, 1},
              secondary = {1, 0, 1, 1},
            }
        }
    })
end

if tune_up_data then
    tune_up_data.recipes["quantum-encabulator"] = {
        category = "tuning-up",
        count = 1,
        energy_required = 5,
        surface_conditions = {{property = "gravity", max = 0}},
        ingredients = {{{"ai-girlfriend", 5}, {"perpendicular-processor", 5}, {"random-number-nullifier", 5}}, {{"ai-girlfriend", 5}, {"logic-deregulator", 5}, {"random-number-nullifier", 5}}}
    }

    tune_up_data.recipes["philosophers-hormone"] = {
        category = "purification",
        count = 4,
        energy_required = 2,
        ingredients = {{{"bioflux", 1}}}
    }

    tune_up_data.recipes["rocket-control-unit"] = {
        category = "tuning-up",
        count = 2,
        energy_required = 20,
        ingredients = {{{"supercapacitor", 1}, {"tracker", 1}}, {{"supercapacitor", 1}, {"processing-unit", 1}}}
    }
end

if settings.startup["planetfall-postgame-logistics"].value then
    local function promethify_recursive(some_table)
        if type(some_table) ~= "table" then
            return
        end
        for k, v in pairs(some_table) do
            if type(v) == "string" and k ~= "particle_name" then
                local newstring = string.gsub(v, "turbo", "superposition")
                newstring = string.gsub(newstring, "__space", "__pf-sa")
                newstring = string.gsub(newstring, "age__", "compat__")
                some_table[k] = newstring
            end
            if type(v) == "table" then
                promethify_recursive(v)
            end
        end
    end

    local function promethify(prototype)
        local newprototype = table.deepcopy(prototype)
        promethify_recursive(newprototype)
        if newprototype.order then
            newprototype.order = string.gsub(newprototype.order, "d", "e")
        end
        if newprototype.speed then
            newprototype.speed = newprototype.speed * 2
            if not data.raw.item[newprototype.name].hidden then
                prototype.next_upgrade = newprototype.name
            end
        end
        data:extend({newprototype})
    end

    promethify(data.raw["item"]["turbo-transport-belt"])
    promethify(data.raw["transport-belt"]["turbo-transport-belt"])
    promethify(data.raw["corpse"]["turbo-transport-belt-remnants"])
    promethify(data.raw["explosion"]["turbo-transport-belt-explosion"])

    promethify(data.raw["item"]["turbo-underground-belt"])
    promethify(data.raw["underground-belt"]["turbo-underground-belt"])
    promethify(data.raw["corpse"]["turbo-underground-belt-remnants"])
    promethify(data.raw["explosion"]["turbo-underground-belt-explosion"])

    promethify(data.raw["item"]["turbo-splitter"])
    promethify(data.raw["splitter"]["turbo-splitter"])
    promethify(data.raw["corpse"]["turbo-splitter-remnants"])
    promethify(data.raw["explosion"]["turbo-splitter-explosion"])
    
    promethify(data.raw["item"]["turbo-loader"])
    promethify(data.raw["loader"]["turbo-loader"])

    promethify(data.raw["explosion"]["turbo-transport-belt-explosion-base"])
    promethify(data.raw["explosion"]["turbo-underground-belt-explosion-base"])

    data.raw["underground-belt"]["superposition-underground-belt"].max_distance = 13
    data.raw["splitter"]["superposition-splitter"].frozen_patch = data.raw["splitter"]["turbo-splitter"].frozen_patch
    data.raw["underground-belt"]["superposition-underground-belt"].structure.frozen_patch_in = data.raw["underground-belt"]["turbo-underground-belt"].structure.frozen_patch_in
    data.raw["underground-belt"]["superposition-underground-belt"].structure.frozen_patch_out = data.raw["underground-belt"]["turbo-underground-belt"].structure.frozen_patch_out

    local new_cargo_wagon = table.deepcopy(data.raw["cargo-wagon"]["cargo-wagon"])
    new_cargo_wagon.name = "extradimensional-cargo-wagon"
    new_cargo_wagon.minable.result = "extradimensional-cargo-wagon"
    new_cargo_wagon.weight = 500
    new_cargo_wagon.inventory_size = 100
    new_cargo_wagon.quality_affects_inventory_size = true
    new_cargo_wagon.icon = nil
    new_cargo_wagon.icons = {{
        icon = "__base__/graphics/icons/cargo-wagon.png",
        icon_size = 64,
        tint = {r=0.7,g=0.8,b=1}
    }}
    for k, v in pairs(new_cargo_wagon.pictures.rotated.layers) do
        v.tint = {r=0.5,g=0.75,b=1}
        v.apply_runtime_tint = false
    end
    for k, v in pairs(new_cargo_wagon.pictures.sloped.layers) do
        v.tint = {r=0.5,g=0.75,b=1}
        v.apply_runtime_tint = false
    end
    for k, v in pairs(new_cargo_wagon.horizontal_doors.layers) do
        v.tint = {r=0.5,g=0.75,b=1}
        v.apply_runtime_tint = false
    end
    for k, v in pairs(new_cargo_wagon.vertical_doors.layers) do
        v.tint = {r=0.5,g=0.75,b=1}
        v.apply_runtime_tint = false
    end
    new_cargo_wagon.factoriopedia_simulation.init = [[
    game.simulation.camera_position = {1, 0.5}
    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqNk91uwjAMhd/F1wFR2gDtq6CpSotXrKUOSsKfqr77XMrGBZuUy5z4fLZle4DGnvHkiSNUA1DrOEC1HyBQx8ZOGpseoQJvyMKogPiAN6iy8UMBcqRIODsej3vN575BLwHqxxmieLtjXDwQCk4uiMvxBBeS3iq4Q1VogR/IYzv/FaN6Y66TmWUyM09lbrJkZvHLxJtAD9QjB4k2dtEa37nF1XTifU+RLzO9WetXImTTWKyt6yhEakN9PZK8e3ch7qD6NDagAudJKjAzabXc6mlMF5GcFxCfrf2jSJ3ceJ7c+CaZqZOZ22Rm+iLtkpn/LZJsf4iu/arlYniWn4czqc8IithLjteJKbigDw+EzLksylLvsrwsV8U4fgMdVy/B",
      position = {0, 0}
    }
  ]]
    local new_cargo_wagon_item = table.deepcopy(data.raw["item-with-entity-data"]["cargo-wagon"])
    new_cargo_wagon_item.name = "extradimensional-cargo-wagon"
    new_cargo_wagon_item.place_result = "extradimensional-cargo-wagon"
    new_cargo_wagon_item.weight = 200 * kg
    new_cargo_wagon_item.icon = nil
    new_cargo_wagon_item.icons = {{
        icon = "__base__/graphics/icons/cargo-wagon.png",
        icon_size = 64,
        tint = {r=0.6,g=0.8,b=1}
    }}

    local new_fluid_wagon = table.deepcopy(data.raw["fluid-wagon"]["fluid-wagon"])
    new_fluid_wagon.name = "extradimensional-fluid-wagon"
    new_fluid_wagon.minable.result = "extradimensional-fluid-wagon"
    new_fluid_wagon.weight = 500
    new_fluid_wagon.capacity = 100000
    new_fluid_wagon.quality_affects_capacity = true
    new_fluid_wagon.icon = nil
    new_fluid_wagon.icons = {{
        icon = "__base__/graphics/icons/fluid-wagon.png",
        icon_size = 64,
        tint = {r=0.7,g=0.8,b=1}
    }}
    new_fluid_wagon.factoriopedia_simulation.init = [[
    game.simulation.camera_position = {1, 0.5}
    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqN081ugzAMAOB38TmtoBBoeJVpQim41FpIKpL+CfHuM9Cth25SjnHsz4lkj3AwFzwPZANUI1DjrIfqYwRPndVmjlndI1QwaDIwCSDb4h2qdPoUgDZQIFwrlsOjtpf+gAMniJ9KH7i2O4XNQgg4O89Vzs44S7IU8IAqV4y3NGCz3uWTeDN30aaKNrNYs0ijzfzXxDujLfVoPWdrszmaC7Wbm+649r1Ftk1UVspXI7T6YLA2riMfqPH17UR87t2VbAfVURuPAtxA/AK9Ssm2lH+8SUb/M4v+ZxFtymizjDbj52Yfbf43NzzsPrjmq+YFsWv4uSdz9JlBAXvu8dooAVcc/ELIYqdypeQ+zZRK8mn6Bk/IKZs=",
      position = {0, 0}
    }
  ]]
    for k, v in pairs(new_fluid_wagon.pictures.rotated.layers) do
        v.tint = {r=0.5,g=0.75,b=1}
        v.apply_runtime_tint = false
    end
    for k, v in pairs(new_fluid_wagon.pictures.sloped.layers) do
        v.tint = {r=0.5,g=0.75,b=1}
        v.apply_runtime_tint = false
    end
    local new_fluid_wagon_item = table.deepcopy(data.raw["item-with-entity-data"]["fluid-wagon"])
    new_fluid_wagon_item.name = "extradimensional-fluid-wagon"
    new_fluid_wagon_item.place_result = "extradimensional-fluid-wagon"
    new_fluid_wagon_item.order = new_fluid_wagon_item.order .. "a"
    new_fluid_wagon_item.weight = 200 * kg
    new_fluid_wagon_item.icon = nil
    new_fluid_wagon_item.icons = {{
        icon = "__base__/graphics/icons/fluid-wagon.png",
        icon_size = 64,
        tint = {r=0.6,g=0.8,b=1}
    }}

    local new_cargo_bay = table.deepcopy(data.raw["cargo-bay"]["cargo-bay"])
    new_cargo_bay.inventory_size_bonus = 40
    new_cargo_bay.name = "extradimensional-cargo-bay"
    new_cargo_bay.minable.result = "extradimensional-cargo-bay"
    new_cargo_bay.icon = nil
    new_cargo_bay.icons = {{
        icon = "__space-age__/graphics/icons/cargo-bay.png",
        icon_size = 64,
        tint = {r=0.7,g=0.8,b=1}
    }}
    for k, v in pairs(new_cargo_bay.graphics_set.connections) do
        for k2, v2 in pairs(v) do
            for k3, v3 in pairs(v2) do
                if v3.layers then
                    v3.layers[1].tint = {r=0.5,g=0.75,b=1}
                else
                    v3.tint = {r=0.5,g=0.75,b=1}
                end
            end
        end
    end
    for k, v in pairs(new_cargo_bay.graphics_set.picture) do
        for k2, v2 in pairs(v.layers) do
            if v2.layers then
                v2.layers[1].tint = {r=0.5,g=0.75,b=1}
            else
                v2.tint = {r=0.5,g=0.75,b=1}
            end
        end
    end
    for k, v in pairs(new_cargo_bay.platform_graphics_set.connections) do
        for k2, v2 in pairs(v) do
            for k3, v3 in pairs(v2) do
                if v3.layers then
                    v3.layers[1].tint = {r=0.5,g=0.75,b=1}
                else
                    v3.tint = {r=0.5,g=0.75,b=1}
                end
            end
        end
    end
    for k, v in pairs(new_cargo_bay.platform_graphics_set.picture) do
        for k2, v2 in pairs(v.layers) do
            if v2.layers then
                v2.layers[1].tint = {r=0.5,g=0.75,b=1}
            else
                v2.tint = {r=0.5,g=0.75,b=1}
            end
        end
    end
    local new_cargo_bay_item = table.deepcopy(data.raw.item["cargo-bay"])
    new_cargo_bay_item.name = "extradimensional-cargo-bay"
    new_cargo_bay_item.place_result = "extradimensional-cargo-bay"
    new_cargo_bay_item.weight = 200*kg
    new_cargo_bay_item.icon = nil
    new_cargo_bay_item.icons = {{
        icon = "__space-age__/graphics/icons/cargo-bay.png",
        icon_size = 64,
        tint = {r=0.7,g=0.8,b=1}
    }}

    data:extend({
        {
            type = "recipe",
            name = "superposition-transport-belt",
            category = "cryogenics",
            surface_conditions = {
                {
                    property = "gravity",
                    max = 0
                }
            },
            ingredients = {
                {type="item", name="foundation", amount=2},
                {type="item", name="turbo-transport-belt", amount=5},
                {type="item", name="promethium-asteroid-chunk", amount=2}
            },
            results = {
                {type="item", name="superposition-transport-belt", amount=1}
            },
            energy_required = 2,
            enabled = false,
            crafting_machine_tint =
            {
              primary = {0.5, 0, 1, 1},
              secondary = {1, 0, 1, 1},
              tertiary = {1, 0, 1, 1},
              secondary = {0.5, 0, 1, 1},
            }
        },
        {
            type = "recipe",
            name = "superposition-underground-belt",
            category = "cryogenics",
            surface_conditions = {
                {
                    property = "gravity",
                    max = 0
                }
            },
            ingredients = {
                {type="item", name="foundation", amount=16},
                {type="item", name="turbo-underground-belt", amount=10},
                {type="item", name="promethium-asteroid-chunk", amount=16}
            },
            results = {
                {type="item", name="superposition-underground-belt", amount=2}
            },
            energy_required = 2,
            enabled = false,
            crafting_machine_tint =
            {
              primary = {0.5, 0, 1, 1},
              secondary = {1, 0, 1, 1},
              tertiary = {1, 0, 1, 1},
              secondary = {0.5, 0, 1, 1},
            }
        },
        {
            type = "recipe",
            name = "superposition-splitter",
            category = "cryogenics",
            surface_conditions = {
                {
                    property = "gravity",
                    max = 0
                }
            },
            ingredients = {
                {type="item", name="foundation", amount=2},
                {type="item", name="turbo-splitter", amount=5},
                {type="item", name="quantum-processor", amount=10},
                {type="item", name="promethium-asteroid-chunk", amount=2}
            },
            results = {
                {type="item", name="superposition-splitter", amount=1}
            },
            energy_required = 2,
            enabled = false,
            crafting_machine_tint =
            {
              primary = {0.5, 0, 1, 1},
              secondary = {1, 0, 1, 1},
              tertiary = {1, 0, 1, 1},
              secondary = {0.5, 0, 1, 1},
            }
        },
        {
            type = "technology",
            name = "superposition-transport-belt",
            icons = {
                {
                    icon = "__pf-sa-compat__/graphics/technology/superposition-transport-belt.png",
                    icon_size = 256,
                    icon_mipmaps = 4
                }
            },
            effects = {
                {
                    type = "unlock-recipe",
                    recipe = "superposition-transport-belt"
                },
                {
                    type = "unlock-recipe",
                    recipe = "superposition-underground-belt"
                },
                {
                    type = "unlock-recipe",
                    recipe = "superposition-splitter"
                }
            },
            prerequisites = {"promethium-science-pack", "foundation", "turbo-transport-belt"},
            unit = {
                count = 50000,
                time = 60,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"military-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"production-science-pack", 1},
                    {"utility-science-pack", 1},
                    {"space-science-pack", 1},
                    {"metallurgic-science-pack", 1},
                    {"electromagnetic-science-pack", 1},
                    {"agricultural-science-pack", 1},
                    {"cryogenic-science-pack", 1},
                    {"promethium-science-pack", 1}
                }
            }
        },
        {
            type = "technology",
            name = "superposition-insertion",
            icons = {
                {
                    icon = "__pf-sa-compat__/graphics/technology/superposition-insertion.png",
                    icon_size = 256,
                    icon_mipmaps = 4
                }
            },
            effects = {
                {
                    type = "inserter-stack-size-bonus",
                    modifier = 2
                },
                {
                    type = "bulk-inserter-capacity-bonus",
                    modifier = 2
                },
                                {
                    type = "belt-stack-size-bonus",
                    modifier = 2
                }
            },
            prerequisites = {"superposition-transport-belt", "transport-belt-capacity-2"},
            research_trigger = {
                type = "craft-item",
                item = "superposition-transport-belt",
                count = 1000
            }
        },
        new_cargo_wagon,
        new_cargo_wagon_item,
        new_fluid_wagon,
        new_fluid_wagon_item,
        new_cargo_bay,
        new_cargo_bay_item,
        {
            type = "recipe",
            name = "extradimensional-cargo-wagon",
            category = "cryogenics",
            ingredients = {
                {type="item", name="cargo-wagon", amount=10},
                {type="item", name="quantum-processor", amount=20},
                {type="item", name="electric-engine-unit", amount=30},
                {type="fluid", name="fluoroketone-cold", amount=100},
            },
            results = {
                {type="item", name="extradimensional-cargo-wagon", amount=1}
            },
            energy_required = 20,
            enabled = false,
            crafting_machine_tint =
            {
              primary = {0, 0.5, 1, 1},
              secondary = {0, 1, 1, 1},
              tertiary = {0, 1, 1, 1},
              secondary = {0, 0.5, 1, 1},
            }
        },
        {
            type = "recipe",
            name = "extradimensional-fluid-wagon",
            category = "cryogenics",
            ingredients = {
                {type="item", name="fluid-wagon", amount=10},
                {type="item", name="quantum-processor", amount=20},
                {type="item", name="engine-unit", amount=30},
                {type="fluid", name="fluoroketone-cold", amount=100},
            },
            results = {
                {type="item", name="extradimensional-fluid-wagon", amount=1}
            },
            energy_required = 20,
            enabled = false,
            crafting_machine_tint =
            {
              primary = {0, 0.5, 1, 1},
              secondary = {0, 1, 1, 1},
              tertiary = {0, 1, 1, 1},
              secondary = {0, 0.5, 1, 1},
            }
        },
        {
            type = "recipe",
            name = "extradimensional-cargo-bay",
            category = "cryogenics",
            ingredients = {
                {type="item", name="cargo-bay", amount=5},
                {type="item", name="quantum-processor", amount=20},
                {type="item", name="supercapacitor", amount=30},
                {type="fluid", name="fluoroketone-cold", amount=100},
            },
            results = {
                {type="item", name="extradimensional-cargo-bay", amount=1}
            },
            energy_required = 20,
            enabled = false,
            crafting_machine_tint =
            {
              primary = {0, 0.5, 1, 1},
              secondary = {0, 1, 1, 1},
              tertiary = {0, 1, 1, 1},
              secondary = {0, 0.5, 1, 1},
            }
        },
        {
            type = "technology",
            name = "extradimensional-cargo-space",
            icons = {
                {
                    icon = "__pf-sa-compat__/graphics/technology/extradimensional-cargo-space.png",
                    icon_size = 256,
                    icon_mipmaps = 4
                }
            },
            effects = {
                {
                    type = "unlock-recipe",
                    recipe = "extradimensional-cargo-wagon"
                },
                {
                    type = "unlock-recipe",
                    recipe = "extradimensional-fluid-wagon"
                },
                {
                    type = "unlock-recipe",
                    recipe = "extradimensional-cargo-bay"
                }
            },
            prerequisites = {"promethium-science-pack"},
            unit = {
                count = 50000,
                time = 60,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"military-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"production-science-pack", 1},
                    {"utility-science-pack", 1},
                    {"space-science-pack", 1},
                    {"metallurgic-science-pack", 1},
                    {"electromagnetic-science-pack", 1},
                    {"agricultural-science-pack", 1},
                    {"cryogenic-science-pack", 1},
                    {"promethium-science-pack", 1}
                }
            }
        }
    })

    data.raw["utility-constants"].default.max_belt_stack_size = math.max(data.raw["utility-constants"].default.max_belt_stack_size, 6)
    data.raw.inserter["stack-inserter"].max_belt_stack_size = math.max(data.raw.inserter["stack-inserter"].max_belt_stack_size, 6)

    if data.raw.item["quantum-encabulator"] then
        rm.MultiplyRecipe("superposition-transport-belt", 5)
        rm.AddIngredient("superposition-transport-belt", "quantum-encabulator", 1)

        rm.AddIngredient("superposition-underground-belt", "quantum-encabulator", 2)
        
        rm.MultiplyRecipe("superposition-splitter", 5)
        rm.AddIngredient("superposition-splitter", "quantum-encabulator", 2)
    else
        rm.AddIngredient("superposition-transport-belt", "quantum-processor", 1)
        rm.AddIngredient("superposition-underground-belt", "quantum-processor", 8)
    end

    if misc.difficulty == 3 and mods["BrassTacks"] and mods["IfNickel"] then
        rm.AddIngredient("extradimensional-cargo-wagon", "spurving-bearing", 10)
        rm.AddIngredient("extradimensional-fluid-wagon", "non-reversible-tremie-pipe", 10)
    end
end