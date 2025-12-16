local tm = require("__pf-functions__/technology-manipulation")
local misc = require("__pf-functions__/misc")


if misc.difficulty > 1 then
    local base_tech_name = "mining-productivity"


    local function snip_research_path(technology, maxlevel)
        if type(technology) == "string" then
            if data.raw.technology[technology] then
                technology = data.raw.technology[technology]
            end
        end

        local tech_out = table.deepcopy(technology)
        tech_out.effects = technology.effects

        technology.max_level = maxlevel
        if not base_tech_name then
            base_tech_name = technology.name
        end
        tech_out.name = base_tech_name .. "-" .. (maxlevel + 1)
        tech_out.prerequisites = {technology.name}
        return tech_out
    end

    data.raw.technology["mining-productivity-6"] = nil
    local mp1 = mods["LunarLandings"] and data.raw.technology["mining-productivity-5"] or snip_research_path("mining-productivity-3", 5)
    tm.RemoveSciencePack(mp1, "ll-quantum-science-pack")
    tm.AddSciencePack(mp1, "space-science-pack")
    tm.AddPrerequisite(mp1, "space-science-pack")
    local mp2 = snip_research_path(mp1, 10)
    tm.AddSciencePack(mp2, "agricultural-science-pack")
    tm.AddPrerequisite(mp2, "agricultural-science-pack")
    local mp3 = snip_research_path(mp2, 15)
    tm.AddSciencePack(mp3, "metallurgic-science-pack")
    tm.AddPrerequisite(mp3, "metallurgic-science-pack")
    local mp4 = snip_research_path(mp3, 20)
    tm.AddSciencePack(mp4, "electromagnetic-science-pack")
    tm.AddPrerequisite(mp4, "electromagnetic-science-pack")
    local mp5 = snip_research_path(mp4, 30)
    tm.AddSciencePack(mp5, "cryogenic-science-pack")
    tm.AddPrerequisite(mp5, "cryogenic-science-pack")
    if mods["Paracelsin"] then
        tm.AddSciencePack(mp5, "galvanization-science-pack")
        tm.AddPrerequisite(mp5, "galvanization-science-pack")
    end
    local mp7 = false
    if mods["maraxsis"] or mods["castra"] or mods["LunarLandings"] then
        local mp6 = snip_research_path(mp5, 40)
        tm.AddSciencePacks(mp6, tm.post_aquilo_sciences)
        if mods["maraxsis"] then
            tm.AddSciencePack(mp6, "hydraulic-science-pack")
            tm.AddPrerequisite(mp6, "hydraulic-science-pack")
        end
        if mods["castra"] then
            tm.AddSciencePack(mp6, "battlefield-science-pack")
            tm.AddPrerequisite(mp6, "battlefield-science-pack")
        end
        if mods["LunarLandings"] then
            tm.AddSciencePack(mp6, "ll-quantum-science-pack")
            tm.AddPrerequisite(mp6, "ll-quantum-science-pack")
        end
        data:extend({mp6})
        mp7 = snip_research_path(mp6, 60)
    else
        mp7 = snip_research_path(mp5, 40)
    end
    tm.AddSciencePacks(mp7, tm.post_promethium_sciences)
    tm.AddPrerequisite(mp7, "promethium-science-pack")

    data:extend({mp1, mp2, mp3, mp4, mp5, mp7})
    base_tech_name = false

    local steel1 = snip_research_path("steel-plate-productivity", 5)
    tm.AddSciencePack(steel1, "metallurgic-science-pack")
    tm.AddSciencePack(steel1, "space-science-pack")
    tm.AddPrerequisite(steel1, "metallurgic-science-pack")
    local steel2 = snip_research_path(steel1, 10)
    tm.AddSciencePack(steel2, mods["castra"] and "battlefield-science-pack" or "agricultural-science-pack")
    tm.AddPrerequisite(steel2, mods["castra"] and "battlefield-science-pack" or "agricultural-science-pack")
    tm.AddSciencePack(steel2, "electromagnetic-science-pack")
    tm.AddPrerequisite(steel2, "electromagnetic-science-pack")
    local steel3 = snip_research_path(steel2, 15)
    tm.AddSciencePacks(steel3, tm.post_aquilo_sciences)
    tm.AddPrerequisite(steel3, "cryogenic-science-pack")
    if mods["Paracelsin"] then
        tm.AddSciencePack(steel3, "galvanization-science-pack")
        tm.AddPrerequisite(steel3, "galvanization-science-pack")
    end
    local steel4 = snip_research_path(steel3, 20)
    tm.AddSciencePacks(steel4, tm.post_promethium_sciences)
    tm.AddPrerequisite(steel4, "promethium-science-pack")
    steel4.max_level = 30
    data:extend({steel1, steel2, steel3, steel4})
    base_tech_name = false

    local lds1 = snip_research_path("low-density-structure-productivity", 5)
    tm.AddSciencePack(lds1, "agricultural-science-pack")
    tm.AddSciencePack(lds1, "space-science-pack")
    tm.AddPrerequisite(lds1, "agricultural-science-pack")
    local lds2 = snip_research_path(lds1, 10)
    tm.AddSciencePack(lds2, "electromagnetic-science-pack")
    tm.AddPrerequisite(lds2, "electromagnetic-science-pack")
    local lds3 = snip_research_path(lds2, 15)
    tm.AddSciencePacks(lds3, tm.post_aquilo_sciences)
    tm.AddPrerequisite(lds3, "cryogenic-science-pack")
    if mods["Paracelsin"] then
        tm.AddSciencePack(lds3, "galvanization-science-pack")
        tm.AddPrerequisite(lds3, "galvanization-science-pack")
    end
    local lds4 = snip_research_path(lds3, 20)
    tm.AddSciencePacks(lds4, tm.post_promethium_sciences)
    tm.AddPrerequisite(lds4, "promethium-science-pack")
    lds4.max_level = 30
    data:extend({lds1, lds2, lds3, lds4})
    base_tech_name = false

    local pu1 = snip_research_path("processing-unit-productivity", 5)
    tm.AddSciencePack(pu1, "metallurgic-science-pack")
    tm.AddSciencePack(pu1, "space-science-pack")
    tm.AddPrerequisite(pu1, "metallurgic-science-pack")
    local pu2 = snip_research_path(pu1, 10)
    tm.AddSciencePack(pu2, "agricultural-science-pack")
    tm.AddPrerequisite(pu2, "agricultural-science-pack")
    local pu3 = snip_research_path(pu2, 15)
    tm.AddSciencePacks(pu3, tm.post_aquilo_sciences)
    tm.AddPrerequisite(pu3, "cryogenic-science-pack")
    if mods["castra"] then
        tm.AddSciencePack(pu3, "battlefield-science-pack")
        tm.AddPrerequisite(pu3, "battlefield-science-pack")
    end
    local pu4 = snip_research_path(pu3, 20)
    tm.AddSciencePacks(pu4, tm.post_promethium_sciences)
    tm.AddPrerequisite(pu4, "promethium-science-pack")
    pu4.max_level = 30
    data:extend({pu1, pu2, pu3, pu4})
    base_tech_name = false

    local rf1 = snip_research_path("rocket-fuel-productivity", 5)
    tm.AddSciencePack(rf1, "electromagnetic-science-pack")
    tm.AddSciencePack(rf1, "space-science-pack")
    tm.AddPrerequisite(rf1, "electromagnetic-science-pack")
    local rf2 = snip_research_path(rf1, 10)
    tm.AddSciencePack(rf2, "metallurgic-science-pack")
    tm.AddPrerequisite(rf2, "metallurgic-science-pack")
    local rf3 = snip_research_path(rf2, 15)
    tm.AddSciencePacks(rf3, tm.post_aquilo_sciences)
    tm.AddPrerequisite(rf3, "cryogenic-science-pack")
    if mods["maraxsis"] then
        tm.AddSciencePack(rf3, "hydraulic-science-pack")
        tm.AddPrerequisite(rf3, "hydraulic-science-pack")
    end
    local rf4 = snip_research_path(rf3, 20)
    tm.AddSciencePacks(rf4, tm.post_promethium_sciences)
    tm.AddPrerequisite(rf4, "promethium-science-pack")
    rf4.max_level = 30
    data:extend({rf1, rf2, rf3, rf4})
    base_tech_name = false

    local pb1 = snip_research_path("plastic-bar-productivity", 5)
    tm.AddSciencePack(pb1, "metallurgic-science-pack")
    tm.AddSciencePack(pb1, "space-science-pack")
    tm.AddPrerequisite(pb1, "metallurgic-science-pack")
    local pb2 = snip_research_path(pb1, 10)
    tm.AddSciencePack(pb2, "electromagnetic-science-pack")
    tm.AddPrerequisite(pb2, "electromagnetic-science-pack")
    local pb3 = snip_research_path(pb2, 15)
    tm.AddSciencePacks(pb3, tm.post_aquilo_sciences)
    tm.AddPrerequisite(pb3, "cryogenic-science-pack")
    if mods["maraxsis"] then
        tm.AddSciencePack(pb3, "hydraulic-science-pack")
        tm.AddPrerequisite(pb3, "hydraulic-science-pack")
    end
    local pb4 = snip_research_path(pb3, 20)
    tm.AddSciencePacks(pb4, tm.post_promethium_sciences)
    tm.AddPrerequisite(pb4, "promethium-science-pack")
    pb4.max_level = 30
    data:extend({pb1, pb2, pb3, pb4})
    base_tech_name = false

    local sr1 = snip_research_path("scrap-recycling-productivity", 5)
    tm.AddSciencePack(sr1, "space-science-pack")
    tm.AddSciencePack(sr1, mods["castra"] and "battlefield-science-pack" or "agricultural-science-pack")
    tm.AddPrerequisite(sr1, mods["castra"] and "battlefield-science-pack" or "agricultural-science-pack")
    local sr2 = snip_research_path(sr1, 10)
    tm.AddSciencePack(sr2, "metallurgic-science-pack")
    tm.AddPrerequisite(sr2, "metallurgic-science-pack")
    if mods["castra"] then
        tm.AddSciencePack(sr2, "agricultural-science-pack")
        tm.AddPrerequisite(sr2, "agricultural-science-pack")
    end
    local sr3 = snip_research_path(sr2, 15)
    tm.AddSciencePacks(sr3, tm.post_aquilo_sciences)
    tm.AddPrerequisite(sr3, "cryogenic-science-pack")
    local sr4 = snip_research_path(sr3, 20)
    tm.AddSciencePacks(sr4, tm.post_promethium_sciences)
    tm.AddPrerequisite(sr4, "promethium-science-pack")
    sr4.max_level = 30
    data:extend({pb1, pb2, pb3, pb4})
    base_tech_name = false

    local ap1 = snip_research_path("asteroid-productivity", 5)
    tm.AddSciencePack(ap1, "space-science-pack")
    tm.AddSciencePack(ap1, mods["planet-muluna"] and "interstellar-science-pack" or "metallurgic-science-pack")
    tm.AddPrerequisite(ap1, mods["planet-muluna"] and "interstellar-science-pack" or "metallurgic-science-pack")
    local ap2 = snip_research_path(ap1, 10)
    tm.AddSciencePack(ap2, "electromagnetic-science-pack")
    tm.AddPrerequisite(ap2, "electromagnetic-science-pack")
    if mods["castra"] then
        tm.AddSciencePack(ap2, "metallurgic-science-pack")
        tm.AddPrerequisite(ap2, "metallurgic-science-pack")
    end
    local ap3 = snip_research_path(ap2, 15)
    tm.AddSciencePacks(ap3, tm.post_aquilo_sciences)
    tm.AddPrerequisite(ap3, "cryogenic-science-pack")
    local ap4 = snip_research_path(ap3, 20)
    tm.AddSciencePacks(ap4, tm.post_promethium_sciences)
    tm.AddPrerequisite(ap4, "promethium-science-pack")
    sr4.max_level = 30
    data:extend({ap1, ap2, ap3, ap4})
    base_tech_name = false

    local rp1 = snip_research_path(mods["planet-muluna"] and "rocket-part-productivity-aquilo" or "rocket-part-productivity", mods["planet-muluna"] and 5 or 10)
    tm.AddPrerequisite(rp1, "promethium-science-pack")
    tm.AddSciencePacks(rp1, tm.post_promethium_sciences)
    data:extend({rp1})
    sr4.max_level = 20
    base_tech_name = false

    if data.raw.technology["explosives-productivity"] then
        local exp1 = snip_research_path("explosives-productivity", 5)
        tm.AddSciencePack(exp1, mods["castra"] and "battlefield-science-pack" or "metallurgic-science-pack")
        tm.AddPrerequisite(exp1, mods["castra"] and "battlefield-science-pack" or "metallurgic-science-pack")
        local exp2 = snip_research_path(exp1, 10)
        tm.AddSciencePack(exp2, "electromagnetic-science-pack")
        tm.AddPrerequisite(exp2, "electromagnetic-science-pack")
        if mods["castra"] then
            tm.AddSciencePack(exp2, "metallurgic-science-pack")
            tm.AddPrerequisite(exp2, "metallurgic-science-pack")
        end
        local exp3 = snip_research_path(exp2, 15)
        tm.AddSciencePacks(exp3, tm.post_aquilo_sciences)
        tm.AddPrerequisite(exp3, "cryogenic-science-pack")
        if mods["maraxsis"] then
            tm.AddSciencePack(exp3, "hydraulic-science-pack")
            tm.AddPrerequisite(exp3, "hydraulic-science-pack")
        end
        local exp4 = snip_research_path(exp3, 20)
        tm.AddPrerequisite(exp4, "promethium-science-pack")
        tm.AddSciencePacks(exp4, tm.post_promethium_sciences)
        exp4.max_level = 30
        data:extend({exp1, exp2, exp3, exp4})
        base_tech_name = false
    end

    if data.raw.technology["bioculture-productivity"] then
        local bc1 = snip_research_path("bioculture-productivity", 10)
        tm.AddSciencePacks(bc1, tm.post_promethium_sciences)
        tm.AddPrerequisite(bc1, "promethium-science-pack")
        data:extend({bc1})
        base_tech_name = false
    end

    if data.raw.technology["gimbaled-rocket-engine-productivity"] then
        local grp1 = snip_research_path("gimbaled-rocket-engine-productivity", 10)
        tm.AddSciencePacks(grp1, tm.post_promethium_sciences)
        tm.AddPrerequisite(grp1, "promethium-science-pack")
        grp1.max_level = 30
        data:extend({grp1})
        base_tech_name = false
    end

    if data.raw.technology["concrete-productivity"] then
        local conc1 = snip_research_path("concrete-productivity", 5)
        tm.AddSciencePacks(conc1, tm.post_aquilo_sciences)
        tm.AddPrerequisite(conc1, "cryogenic-science-pack")
        local conc2 = snip_research_path(conc1, 10)
        tm.AddSciencePacks(conc2, tm.post_promethium_sciences)
        tm.AddPrerequisite(conc2, "promethium-science-pack")
        conc2.max_level = 30
        data:extend({conc1, conc2})
        base_tech_name = false
    end

    if data.raw.technology["engine-unit-productivity"] then
        local eup1 = snip_research_path("engine-unit-productivity", 5)
        tm.AddSciencePack(eup1, "electromagnetic-science-pack")
        tm.AddPrerequisite(eup1, "electromagnetic-science-pack")
        local eup2 = snip_research_path(eup1, 10)
        tm.AddSciencePack(eup2, "metallurgic-science-pack")
        tm.AddPrerequisite(eup2, "metallurgic-science-pack")
        tm.AddSciencePack(eup2, "agricultural-science-pack")
        tm.AddPrerequisite(eup2, "agricultural-science-pack")
        local eup3 = snip_research_path(eup2, 15)
        if mods["Paracelsin"] and mods["maraxsis"] then
            tm.AddSciencePack(eup3, "hydraulic-science-pack")
            tm.AddPrerequisite(eup3, "hydraulic-science-pack")
            tm.AddSciencePack(eup3, "galvanization-science-pack")
            tm.AddPrerequisite(eup3, "galvanization-science-pack")
        else
            tm.AddSciencePacks(eup3, tm.post_aquilo_sciences)
            tm.AddPrerequisite(eup3, "cryogenic-science-pack")
            if mods["maraxsis"] then
                tm.AddSciencePack(eup3, "hydraulic-science-pack")
                tm.AddPrerequisite(eup3, "hydraulic-science-pack")
            end
            if mods["Paracelsin"] then
                tm.AddSciencePack(eup3, "galvanization-science-pack")
                tm.AddPrerequisite(eup3, "galvanization-science-pack")
            end
        end
        local eup4 = snip_research_path(eup3, 20)
        tm.AddPrerequisite(eup4, "promethium-science-pack")
        tm.AddSciencePacks(eup4, tm.post_promethium_sciences)
        eup4.max_level = 30
        data:extend({eup1, eup2, eup3, eup4})
        base_tech_name = false
    end

    if data.raw.technology["water-recycling-productivity"] then
        local wr1 = snip_research_path("water-recycling-productivity", 10)
        tm.AddSciencePacks(wr1, tm.post_aquilo_sciences)
        tm.AddPrerequisite(wr1, "cryogenic-science-pack")
        if mods["maraxsis"] then
            tm.AddSciencePack(wr1, "hydraulic-science-pack")
            tm.AddPrerequisite(wr1, "hydraulic-science-pack")
        end
        local wr2 = snip_research_path(wr1, 20)
        tm.AddPrerequisite(wr2, "promethium-science-pack")
        tm.AddSciencePacks(wr2, tm.post_promethium_sciences)
        wr2.max_level = 30
        data:extend({wr1, wr2})
        base_tech_name = false
    end


end