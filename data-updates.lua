local rm = require("__pf-functions__/recipe-manipulation")
local tm = require("__pf-functions__/technology-manipulation")
local misc = require("__pf-functions__/misc")

if misc.difficulty > 1 then
    rm.ReplaceIngredientProportional("rocket-part", "processing-unit", "rocket-control-unit")
    rm.ReplaceIngredientProportional("rocket-part-muluna", "processing-unit", "rocket-control-unit")
    rm.ReplaceIngredientProportional("maraxsis-rocket-part", "processing-unit", "rocket-control-unit")
    rm.ReplaceIngredientProportional("asteroid-collector", "processing-unit", "rocket-control-unit")
    rm.ReplaceIngredientProportional("thruster", "processing-unit", "rocket-control-unit")
    rm.ReplaceIngredientProportional("atomic-bomb", "processing-unit", "rocket-control-unit")
    rm.ReplaceIngredientProportional("capture-robot-rocket", "processing-unit", "rocket-control-unit")
    rm.ReplaceIngredientProportional("rocket-silo", "processing-unit", "rocket-control-unit")
    rm.ReplaceIngredientProportional("cargo-landing-pad", "processing-unit", "rocket-control-unit")
    rm.ReplaceIngredientProportional("space-platform-starter-pack", "processing-unit", "rocket-control-unit")
    rm.ReplaceIngredientProportional("cargo-bay", "processing-unit", "rocket-control-unit")
    rm.ReplaceIngredientProportional("artillery-turret", "processing-unit", "rocket-control-unit")
    rm.ReplaceIngredientProportional("artillery-wagon", "processing-unit", "rocket-control-unit")
    rm.ReplaceIngredientProportional("rocket-turret", "processing-unit", "rocket-control-unit")


    rm.ReplaceIngredientProportional("orbital-transfer-provider", "processing-unit", "rocket-control-unit")
    rm.ReplaceIngredientProportional("orbital-transfer-requester", "processing-unit", "rocket-control-unit")

    tm.AddUnlock("rocket-silo", "rocket-control-unit", "-rocket-part")

    data.raw.item["low-density-structure"].subgroup = "rocket-components"
    data.raw.item["low-density-structure"].order = "b"
    data.raw.recipe["casting-low-density-structure"].subgroup = "rocket-components"
    data.raw.recipe["casting-low-density-structure"].order = "b2"

    data.raw.item["rocket-fuel"].subgroup = "rocket-components"
    data.raw.item["rocket-fuel"].order = "c"
    data.raw.recipe["rocket-fuel-from-jelly"].subgroup = "rocket-components"
    data.raw.recipe["rocket-fuel-from-jelly"].order = "c2"
    data.raw.recipe["ammonia-rocket-fuel"].subgroup = "rocket-components"
    data.raw.recipe["ammonia-rocket-fuel"].order = "c3"

    data.raw.item["rocket-part"].subgroup = "rocket-components"
    data.raw.item["rocket-part"].order = "z"
    if mods["maraxsis"] then
        data.raw.item["maraxsis-super-sealant-substance"].subgroup = "rocket-components"
        data.raw.item["maraxsis-super-sealant-substance"].order = "e"    

        data.raw.recipe["maraxsis-hydrolox-rocket-fuel"].subgroup = "rocket-components"
        data.raw.recipe["maraxsis-hydrolox-rocket-fuel"].order = "c4"    
    end

    if mods["IfNickel"] then
        data.raw.item["gimbaled-rocket-engine"].subgroup = "rocket-components"
        data.raw.item["gimbaled-rocket-engine"].order = "d"    
    end
end

--this probably counts as spiritually cheating.
--i don't want to add more than one product per mod to scrap recycling.
--i want the recycling products to be interesting intermediates, instead of plates, to preserve the uncrafting meta.
--i don't want to compromise the recipes of basic infrastructure on nauvis to make fulgora playable.
--i want a failsafe for unforeseen mod combination weirdness: as long as there is a way to get each resource from recycling, you are in some sense "safe."
--all this needs is a guaranteed on-ramp to electricity and recyclers.
table.insert(data.raw["simple-entity"]["fulgoran-ruin-vault"].minable.results, {type="item", name="recycler", amount=2})
table.insert(data.raw["simple-entity"]["fulgoran-ruin-vault"].minable.results, {type="item", name="accumulator", amount=4})
table.insert(data.raw["simple-entity"]["fulgoran-ruin-vault"].minable.results, {type="item", name="medium-electric-pole", amount=6})

if mods["IfNickel"] and mods["BrassTacks"] then
    rm.RemoveProduct("advanced-metallic-asteroid-crushing", "copper-ore", 4)

    data.raw.recipe["metallic-asteroid-crushing"].localised_name = {"recipe-name.ferrous-asteroid-crushing"}
    data.raw.recipe["metallic-asteroid-reprocessing"].localised_name = {"recipe-name.ferrous-asteroid-reprocessing"}
    data.raw.recipe["advanced-metallic-asteroid-crushing"].localised_name = {"recipe-name.advanced-ferrous-asteroid-crushing"}
    data.raw.recipe["advanced-metallic-asteroid-crushing"].icon = "__pf-sa-compat__/graphics/icons/advanced-ferrous-asteroid-crushing.png"    

    data.raw["asteroid"]["huge-metallic-asteroid"].localised_name = {"entity-name.huge-ferrous-asteroid"}
    data.raw["asteroid"]["big-metallic-asteroid"].localised_name = {"entity-name.big-ferrous-asteroid"}
    data.raw["asteroid"]["medium-metallic-asteroid"].localised_name = {"entity-name.medium-ferrous-asteroid"}
    data.raw["asteroid"]["small-metallic-asteroid"].localised_name = {"entity-name.small-ferrous-asteroid"}
    data.raw["asteroid-chunk"]["metallic-asteroid-chunk"].localised_name = {"asteroid-chunk-name.ferrous-asteroid-chunk"}
    data.raw["item"]["metallic-asteroid-chunk"].localised_name = {"item-name.ferrous-asteroid-chunk"}
end

if data.raw.item["philosophers-hormone"] then
    table.insert(data.raw["simple-entity"]["copper-stromatolite"].minable.results, {type="item", name="philosophers-hormone", amount_min=1, amount_max=5})
    table.insert(data.raw["simple-entity"]["iron-stromatolite"].minable.results, {type="item", name="philosophers-hormone", amount_min=1, amount_max=5})

    tm.AddUnlock("biochamber", "philosophers-hormone-from-copper-bacteria")
    tm.AddUnlock("biochamber", "philosophers-hormone-from-iron-bacteria")

    rm.AddIngredient("capture-robot-rocket", "philosophers-hormone", 10)
    if misc.difficulty == 3 then
        data.raw.ammo["capture-robot-rocket"].weight = 10 * kg
        --hormone spoils too fast to reasonably export. capture bots must therefore be made on gleba, so increase their rocket capacity from 10 to 100.
    end

    --hormone costs bioflux, bioflux opportunity-costs a bunch of nutrients.
    --i'm not sure why dosing pentapod eggs with estrogen makes them duplicate
    --i'm sure there is a very good joke here but the last time i made an egg joke in the vicinity of a factorio community i got accused of trying to groom the king from chess.
    rm.AddIngredient("pentapod-egg", "philosophers-hormone", 2)
    rm.RemoveIngredient("pentapod-egg", "nutrients", 10)
end

if mods["BrassTacks"] or mods["IfNickel"] or mods["BrimStuff"] then
    --Multiple relevant intermediates in chemical plants, chemical plants are mostly obsoleted by cryos and biochambers anyway
    rm.AddIngredient("cryogenic-plant", "chemical-plant", 4)
    data.raw.item["chemical-plant"].weight = 50 * kg
end

if misc.difficulty == 3 then
    local candidate_intermediates = {"gyro", "invar-plate", "stepper-motor", "differential-girdlespring"}
    local multiplier = 1
    for k, v in pairs(candidate_intermediates) do
        if data.raw.item[v] then
            multiplier = multiplier + 1
        end
    end
    if multiplier > 1 then
        rm.RemoveProduct("space-science-pack", "space-science-pack", 1)
        rm.MultiplyRecipe("space-science-pack", multiplier)
        for k, v in pairs(candidate_intermediates) do
            if data.raw.item[v] then
                rm.AddIngredient("space-science-pack", v, 1)
            end
        end

        tm.AddSciencePack("steel-plate-productivity", "space-science-pack")
        tm.AddPrerequisite("steel-plate-productivity", "space-science-pack")
        tm.AddSciencePack("processing-unit-productivity", "space-science-pack")
        tm.AddSciencePack("low-density-structure-productivity", "space-science-pack")
        tm.AddSciencePack("rocket-fuel-productivity", "space-science-pack")
        tm.AddSciencePack("plastic-bar-productivity", "space-science-pack")
        tm.AddSciencePack("explosives-productivity", "space-science-pack")
        tm.AddSciencePack("scrap-recycling-productivity", "space-science-pack")
    else
        rm.RemoveProduct("space-science-pack", "space-science-pack", 3)
    end
end

--minimal viable space platforms must now be a bit larger to accommodate more complex recipes for ammo and fuel/ox
--to compensate, make thrusters slightly stronger
local thruster_power = 1
if mods["BrassTacks"] then
    thruster_power = 1.05
end
if mods["BrimStuff"] then
    if misc.difficulty == 1 then
        thruster_power = thruster_power + 0.15
    else
        thruster_power = thruster_power + 0.05
    end
end

for k, v in pairs(data.raw.thruster) do
    v.min_performance.effectivity = v.min_performance.effectivity * thruster_power
    v.max_performance.effectivity = v.max_performance.effectivity * thruster_power
end

if misc.difficulty == 3 then
    --Nuisance byproducts... but it's free and gives you options!
    --vulcanus grants some help with oft-bottlenecking iron and nickel from processing other resources
    --fulgora grants productivity for copper (emplant) and zinc (adv electroplater) already
    --gleba is gleba
    rm.AddProduct("molten-iron", "lava", 25)
    rm.AddProduct("molten-copper", "lava", 25)
    if mods["BrassTacks"] then
        rm.AddProduct("molten-zinc", "lava", 25)
    end
    if mods["IfNickel"] then
        rm.AddProduct("molten-nickel", "lava", 25)
    end
    if mods["castra"] then
        rm.AddProduct("advanced-nickel-processing", "lava", 20)
    end
end

if data.raw.item["quantum-encabulator"] then
    tm.AddUnlock("promethium-science-pack", "quantum-encabulator", "-promethium-science-pack")
    rm.ReplaceIngredientProportional("promethium-science-pack", "quantum-processor", "quantum-encabulator")
    data.raw.tool["promethium-science-pack"].localised_name = {"item-name.encabulation-science-pack"}
    data.raw.technology["promethium-science-pack"].localised_name = {"technology-name.encabulation-science-pack"}

    if mods["Age-of-Production"] then
        rm.ReplaceIngredientProportional("aop-quantum-stabilizer", "quantum-processor", "quantum-encabulator", 0.1)
        rm.ReplaceIngredientProportional("aop-quantum-assembler", "quantum-processor", "quantum-encabulator", 0.1)
        rm.ReplaceIngredientProportional("aop-quantum-computer", "quantum-processor", "quantum-encabulator", 0.1)
        rm.ReplaceIngredientProportional("aop-quantum-computer", "quantum-processor", "quantum-encabulator", 0.1)
        rm.ReplaceIngredientProportional("aop-core-miner", "quantum-processor", "quantum-encabulator", 0.1)
    end

    if mods["castra"] then
        rm.RemoveIngredient("promethium-science-pack", "lithium-battery")
        rm.AddIngredient("quantum-encabulator", "lithium-battery", 5)
    end
end

if mods["Paracelsin"] then
    tm.AddSciencePack("full-spectrum-magmallurgy", "galvanization-science-pack")
    if settings.startup["planetfall-postgame-logistics"].value then
        tm.AddSciencePack("superposition-transport-belt", "galvanization-science-pack")
        tm.AddSciencePack("extradimensional-cargo-space", "galvanization-science-pack")
    end
end

if mods["castra"] then
    tm.AddSciencePack("full-spectrum-magmallurgy", "battlefield-science-pack")
    if settings.startup["planetfall-postgame-logistics"].value then
        tm.AddSciencePack("superposition-transport-belt", "battlefield-science-pack")
        tm.AddSciencePack("extradimensional-cargo-space", "battlefield-science-pack")
    end
end

if mods["maraxsis"] then
    tm.AddSciencePack("full-spectrum-magmallurgy", "hydraulic-science-pack")
    if settings.startup["planetfall-postgame-logistics"].value then
        tm.AddSciencePack("superposition-transport-belt", "hydraulic-science-pack")
        tm.AddSciencePack("extradimensional-cargo-space", "hydraulic-science-pack")
    end
end

data.raw.module["efficiency-module-2"].effect = {
    consumption = -0.5,
    pollution = -0.1
}
data.raw.module["efficiency-module-3"].effect = {
    consumption = -0.75,
    pollution = -0.2
}
data.raw.module["quality-module-3"].effect = {
    speed = -0.05,
    quality = 0.3
}

if misc.difficulty > 1 then
    
    rm.RemoveRecipeCategory("speed-module-3", "electronics")
    rm.AddRecipeCategory("speed-module-3", "electromagnetics")
    rm.AddRecipeCategory("speed-module-3", "metallurgy")

    rm.RemoveRecipeCategory("efficiency-module-3", "electronics")
    rm.AddRecipeCategory("efficiency-module-3", "electromagnetics")
    rm.AddRecipeCategory("efficiency-module-3", "organic")

    rm.RemoveRecipeCategory("quality-module-3", "electronics")
    rm.AddRecipeCategory("quality-module-3", "electromagnetics")

    data.raw.recipe["speed-module-3"].surface_conditions = {
        {
            property = "pressure",
            min = 4000,
            max = 4000
        }
    }
    data.raw.recipe["efficiency-module-3"].surface_conditions = {
        {
            property = "pressure",
            min = 2000,
            max = 2000
        }
    }
    data.raw.recipe["quality-module-3"].surface_conditions = {
        {
            property = "magnetic-field",
            min = 99
        }
    }

    rm.ReplaceIngredientProportional("speed-module-3", "advanced-circuit", "tungsten-plate")
    rm.AddIngredient("speed-module-3", "tungsten-carbide", 4)

    rm.ReplaceIngredientProportional("efficiency-module-3", "advanced-circuit", "copper-bacteria")

    rm.ReplaceIngredientProportional("quality-module-3", "superconductor", "supercapacitor")
    rm.ReplaceIngredientProportional("quality-module-3", "advanced-circuit", "superconductor", 2)
    
    data.raw.module["speed-module-3"].default_import_location = "vulcanus"
    data.raw.module["efficiency-module-3"].default_import_location = "gleba"
    data.raw.module["quality-module-3"].default_import_location = "fulgora"

    if misc.difficulty == 3 then
        data.raw.module["productivity-module-3"].default_import_location = "aquilo"
        data.raw.recipe["productivity-module-3"].surface_conditions = {
            {
                property = "pressure",
                max = 600
            }
        }
    
        tm.AddPrerequisite("productivity-module-3", "quantum-processor")
        tm.AddSciencePack("productivity-module-3", "metallurgic-science-pack")
        tm.AddSciencePack("productivity-module-3", "electromagnetic-science-pack")
        tm.AddSciencePack("productivity-module-3", "cryogenic-science-pack")
        tm.AddSciencePack("productivity-module-3", "production-science-pack")
        tm.AddSciencePack("productivity-module-3", "utility-science-pack")
        
        rm.RemoveRecipeCategory("productivity-module-3", "electronics")
        rm.AddRecipeCategory("productivity-module-3", "electromagnetics")
        rm.AddRecipeCategory("productivity-module-3", "cryogenics")    

        table.insert(data.raw["assembling-machine"]["electromagnetic-plant"].crafting_categories, "electronics-or-cryogenics")
        table.insert(data.raw["assembling-machine"]["cryogenic-plant"].crafting_categories, "electronics-or-cryogenics")

        rm.ReplaceIngredientProportional("productivity-module-3", "processing-unit", "quantum-processor")
        rm.ReplaceIngredientProportional("productivity-module-3", "advanced-circuit", "ice", 10)

        tm.AddPrerequisite("biolab", "efficiency-module-3")
        rm.ReplaceIngredientProportional("biolab", "refined-concrete", "efficiency-module-3", 0.04)

        tm.AddPrerequisite("planet-discovery-aquilo", "speed-module-3")
        --bz silicon replaces the processing units with optical fibers, hence why this is not a ReplaceProportional
        rm.AddIngredient("cryogenic-plant", "speed-module-3", 1)
        rm.RemoveIngredient("cryogenic-plant", "processing-unit", 20)

        if not (mods["no-more-quality"] or mods["unquality"] or mods["no-quality"]) then
            tm.AddPrerequisite("fusion-reactor", "quality-module-3")
            rm.AddIngredient("fusion-reactor", "quality-module-3")
        end

        if mods["Paracelsin"] then
            tm.AddSciencePack("productivity-module-3", "galvanization-science-pack")
        end
    else
        data.raw.recipe["productivity-module-3"].surface_conditions = {
            {
                property = "pressure",
                min = 1000,
                max = 1000
            }
        }

        tm.AddPrerequisite("productivity-module-3", "uranium-processing")
        rm.ReplaceIngredientProportional("productivity-module-3", "advanced-circuit", "uranium-238")
    end
end

if misc.difficulty == 3 and data.raw.item["philosophers-hormone"] then
    rm.AddIngredient("agricultural-science-pack", "philosophers-hormone")
end

--fix some items with autogenerated weights having really weird rocket capacities
data.raw.item["fast-underground-belt"].weight = 20 * kg
data.raw.item["fast-splitter"].weight = 20 * kg
data.raw.item["substation"].weight = 20 * kg
data.raw.item["logistic-robot"].weight = misc.difficulty == 3 and (40 * kg) or (20 * kg)


if settings.startup["planetfall-fulgora-islands-scaling"].value then
    --make islands on fulgora a little bigger per mod installed.
    --with high levels of complexity and default island size you are effectively forced into a primarily-bot setup for your initial base, which is boring.
    local fulgora_island_size_base = 175
    local function fulgora_island_boost(ModName, diff1, diff2, diff3)
        if mods[ModName] then
            if misc.difficulty == 1 then
                fulgora_island_size_base = fulgora_island_size_base + diff1
            end
            if misc.difficulty == 2 then
                fulgora_island_size_base = fulgora_island_size_base + diff2
            end
            if misc.difficulty == 3 then
                fulgora_island_size_base = fulgora_island_size_base + diff3
            end
        end
    end
    
    fulgora_island_boost("BrassTacks", 10, 20, 25)
    fulgora_island_boost("IfNickel", 10, 20, 25)
    fulgora_island_boost("ThemTharHills", 10, 15, 20)
    fulgora_island_boost("BrimStuff", 15, 20, 25)
    fulgora_island_boost("LasingAround", 5, 20, 25)
    
    --bz mods are generally less deeply integrated into crafting trees, their resources are needed in less absolute bulk, and have fewer intermediates, so will need less space for processing
    if mods["bzlead"] then
        fulgora_island_size_base = fulgora_island_size_base + 5
    end
    if mods["bztitanium"] then
        fulgora_island_size_base = fulgora_island_size_base + 4
    end
    if mods["bztin"] then
        fulgora_island_size_base = fulgora_island_size_base + 7
    end
    if mods["bzcarbon"] then
        fulgora_island_size_base = fulgora_island_size_base + 7
    end
    if mods["bzzirconium"] then
        fulgora_island_size_base = fulgora_island_size_base + 5
    end

    local relative_fulgora_island_size_factor = fulgora_island_size_base * 50 / 175

    data.raw["noise-expression"]["fulgora_grid"].expression = fulgora_island_size_base .. " - slider_to_linear(control:fulgora_islands:frequency, -" .. relative_fulgora_island_size_factor ..", " .. relative_fulgora_island_size_factor ..")"
end