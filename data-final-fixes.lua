require("asteroid-spawn-frequency")
local rm = require("__pf-functions__/recipe-manipulation")
local misc = require("__pf-functions__/misc.lua")

if mods["planet-muluna"] then
    rm.ReplaceIngredientProportional("rocket-part", "processing-unit", "rocket-control-unit")
end

local asteroid_reprocessing = {
    ["metallic-asteroid-reprocessing"] = "metallic-asteroid-chunk",
    ["carbonic-asteroid-reprocessing"] = "carbonic-asteroid-chunk",
    ["oxide-asteroid-reprocessing"] = "oxide-asteroid-chunk",
}

local out_of = 5

if mods["BrassTacksMk2"] then
    asteroid_reprocessing["brassteroid-reprocessing"] = "brass-asteroid-chunk"
    out_of = out_of + 1
end

if mods["BrimStuffMk2"] then
    asteroid_reprocessing["panspermia-asteroid-reprocessing"] = "panspermia-asteroid-chunk"
    out_of = out_of + 1
end

for k, v in pairs(asteroid_reprocessing) do
    local result_list = {}
    for k2, v2 in pairs(asteroid_reprocessing) do
        if k == k2 then
            table.insert(result_list, {type="item", name=v2, amount=1, probability=2/out_of})
        else
            table.insert(result_list, {type="item", name=v2, amount=1, probability=1/out_of})
        end
    end
    data.raw.recipe[k].results = table.deepcopy(result_list)
end