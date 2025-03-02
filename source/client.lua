local using = false
local _obj = nil

---@param walk string
local function requestWalk(walk)
    RequestAnimSet(walk)

    while not HasAnimSetLoaded(walk) do
        Wait(1)
    end

    SetPedMovementClipset(PlayerPedId(), walk, 0.2)
end

---@param obj string
local function requestObject(obj)
    local ped = PlayerPedId()

    RequestModel(obj)

    while not HasModelLoaded(obj) do
        Wait(1)
    end

    local object = CreateObject(obj, GetEntityCoords(ped), true, false, false)

    _obj = object

    AttachEntityToEntity(object, ped, GetPedBoneIndex(ped, 57005), 0.15, 0.05, -0.03, 0.0, 266.0, 180.0, true, true, false, true, 1, true)
end

local function useCane()
    if table.type(config) == "empty" or config == nil then
        return error("Your config is broken, fix it!")
    end

    local player = PlayerPedId()
    local anim <const> = config.anim.walk
    local object <const> = config.prop.object

    if not using then
        requestWalk(anim)
        requestObject(object)

        using = true

    else return config.notify("You are already using a cane!") end
end

local function stopCane()
    local player = PlayerPedId()

    if using then
        ResetPedMovementClipset(player, 0.2)
        
        DeleteObject(_obj)
        ClearPedTasks(player)

        using = false
    end
end

RegisterNetEvent('spoodyCane:Stop', stopCane)
RegisterNetEvent('spoodyCane:Use', useCane)
