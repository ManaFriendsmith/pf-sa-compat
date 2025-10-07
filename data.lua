require("prototypes/asteroids")
local item_sounds = require("__base__.prototypes.item_sounds")

local misc = require("__pf-functions__/misc")

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