local rm = require("__pf-functions__/recipe-manipulation")
local tm = require("__pf-functions__/technology-manipulation")
local misc = require("__pf-functions__/misc")

if mods["se-space-trains"] then
    if misc.difficulty == 3 and not (mods["LasingAroundMk2"] or mods["LunarLandings"]) then
        rm.ReplaceIngredientProportional("space-locomotive", "processing-unit", "rocket-control-unit")
    end
end