local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_for_medic")

local function ch_soundbong(player,choice)
	local name = "bong="
	local url = "https://cdn.discordapp.com/attachments/632769262913585153/681966043836842038/Sound_05868.mp3"
	local x,y,z = vRPclient.getPosition(player)
	Wait(2500)
  vRPclient.setAudioSource(-1,name, url, 0.3, x, y, z, 5)
	Wait(6500)
	vRPclient.removeAudioSource(-1,name)
end

-- Build item menu
local wb_choices = {}  
wb_choices["Курить"] = {function(player,choice) -- 
  local user_id = vRP.getUserId(player) -- get user_id
  if user_id then
    if vRP.tryGetInventoryItem(user_id,"weed",1) then -- try to remove one bottle
      vRP.varyThirst(user_id,5) -- decrease thirst
      vRPclient.varyHealth(player,25)
      TriggerClientEvent("vrp_drugs_prop:bong:spawn",player)
      ch_soundbong(player)
      vRP.closeMenu(player) -- the weed is consumed by the action, close the menu
    end
end
end,"Чёткое дерьмо"}

-- add item definition
vRP.defInventoryItem("smokebong","Бонг","<img src='https://i.imgur.com/PAig5Wj.png' height='50' width='50' />",function() return wb_choices end,0.5)