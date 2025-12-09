local rm = require("__pf-functions__/recipe-manipulation")
local tm = require("__pf-functions__/technology-manipulation")
local misc = require("__pf-functions__/misc")

if mods["se-space-trains"] then
    if misc.difficulty == 3 and not (mods["LasingAroundMk2"] or mods["LunarLandings"]) then
        rm.ReplaceIngredientProportional("space-locomotive", "processing-unit", "rocket-control-unit")
    end
end

if mods["scrap-industry"] then
    ScrapIndustry.items["rocket-control-unit"] = {scrap={"circuit-scrap"}, scale=ScrapIndustry.EPIC, failrate=misc.difficulty == 3 and 0.05 or 0.02}
    if mods["BrassTacksMk2"] then
        if data.raw.item["mech-scrap"] then
            table.insert(ScrapIndustry.items["rocket-control-unit"].scrap, "mech-scrap")
        else
            table.insert(ScrapIndustry.items["rocket-control-unit"].scrap, "brass-scrap")
        end
    end
    ScrapIndustry.items["philosophers-hormone"] = {scrap={"spoilage"}, scale=ScrapIndustry.FLAVOR}

    ScrapIndustry.recipes["superposition-transport-belt"] = {ignore=true}
    ScrapIndustry.recipes["superposition-underground-belt"] = {ignore=true}
    ScrapIndustry.recipes["superposition-splitter"] = {ignore=true}
    ScrapIndustry.recipes["superposition-transport-belt-loader"] = {ignore=true}
    ScrapIndustry.recipes["superposition-transport-belt-beltbox"] = {ignore=true}
end