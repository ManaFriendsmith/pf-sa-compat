local rr = require("__pf-functions__/rude-renaming")

if not mods["LunarLandings"] then return end

--note: do NOT rename things beyond what is strictly necessary to avoid ID collisions.
--the localised name can be changed later.

rr.Convert("item", "rocket-control-unit", "ll-rocket-control-unit")
rr.Convert("recipe", "rocket-control-unit", "ll-rocket-control-unit")

--now everything that references these
rr.Convert("recipe", "ll-rocket-part-luna")
rr.Convert("recipe", "ll-rocket-part-nauvis")
rr.Convert("recipe", "ll-landing-pad")
rr.Convert("recipe", "ll-mass-driver-capsule")
rr.Convert("recipe", "ll-pack-rocket-control-unit")
rr.Convert("recipe", "ll-unpack-rocket-control-unit")
rr.Convert("technology", "rocket-control-unit")

data.raw.item["ll-packed-rocket-control-unit"].localised_name[2] = {"item-name.ll-rocket-control-unit"}
data.raw.recipe["ll-pack-rocket-control-unit"].localised_name[2] = {"item-name.ll-rocket-control-unit"}
data.raw.recipe["ll-unpack-rocket-control-unit"].localised_name[2] = {"item-name.ll-rocket-control-unit"}

rr.Confirm()
rr.Clear()