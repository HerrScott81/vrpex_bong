
local Proxy = module("vrp", "lib/Proxy")
tvRP = Proxy.getInterface("vRP")

local function LoadAnim(dict)
	while not HasAnimDictLoaded(dict) do
		RequestAnimDict(dict)
		Wait(10)
	end
end

local function LoadModel(model)
	while not HasModelLoaded(model) do
		RequestModel(model)
		Wait(10)
	end
end




RegisterNetEvent("vrp_drugs_prop:bong:spawn")
AddEventHandler("vrp_drugs_prop:bong:spawn", function()
	LoadModel('prop_bong_01')
	LoadModel("p_cs_lighter_01")
	local bong = CreateObject(GetHashKey('prop_bong_01'), GetEntityCoords(PlayerPedId()), true)
	local lighter = CreateObject(GetHashKey('p_cs_lighter_01'), GetEntityCoords(PlayerPedId()), true)
	LoadAnim("anim@safehouse@bong")
	local pedCoords = GetEntityCoords(PlayerPedId())
	local objectBong = GetClosestObjectOfType(pedCoords, 10.0, GetHashKey("prop_bong_01"), false)
	local objectLighter = GetClosestObjectOfType(pedCoords, 10.0, GetHashKey("p_cs_lighter_01"), false)
	AttachEntityToEntity(objectBong,GetPlayerPed(PlayerId()),GetPedBoneIndex(GetPlayerPed(PlayerId()), 18905),0.10,-0.25,0.0,95.0,190.0,180.0,1,1,0,1,0,1)
	AttachEntityToEntity(objectLighter, PlayerPedId(), GetPedBoneIndex(PlayerPedId(),28422),  0.0, 0.0, 0.0, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
	TaskPlayAnim(PlayerPedId(), 'anim@safehouse@bong', 'bong_stage1', 8.0, 8.0, -1, 69, 1, false, false, false)
	tvRP.notify("~g~Чёткое дерьмо")
	Wait(8000)
	tvRP.playScreenEffect("DMT_flight", 30)
	DetachEntity(objectBong, true, true)
	DeleteObject(objectBong)
	DeleteObject(objectLighter)
	tvRP.stopAnim(true) -- upper
	tvRP.stopAnim(false) -- full
	Wait(10000)
	tvRP.notify("~g~Йоу чувак, да тебя накрыло!")
end)