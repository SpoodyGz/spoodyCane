local function find()
    ESX = exports['es_extended']:getSharedObject()

    if IsDuplicityVersion() then
        ESX = exports['es_extended']:getSharedObject()
    end
end 

config = {
    anim = {
        walk = "move_lester_caneup",
    },

    prop = {
        object = "prop_cs_walking_stick",
    },

    item = {
        name = "cane",
    },

    notify = function(message)
        ESX.ShowNotification(message)
    end,
}

find()