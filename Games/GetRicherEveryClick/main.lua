-- ITS VERY BUGGY RN::: DONT USE IT



getgenv().settings = {
	AutoClick = false,
	AutoRebirth = false,
	AutoSpinWheel = false,
	AutoEquipBest = false,
	AutoCraftAllPets = false,
	AutoClaimGift = false,
}

local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/UI-Library/main/Source/Orion.lua"))()
local Window = OrionLib:MakeWindow({Name = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name, HidePremium = false, SaveConfig = false, IntroEnabled = true, IntroText = "Made By vcsk0"})

local MainTab = Window:MakeTab({
Name = "Main",
Icon = "rbxassetid://4483345998",
PremiumOnly = false
})

MainTab:AddToggle({
Name = "Auto Click",
Default = false,
Callback = function(Value)
    getgenv().settings.AutoClick = Value
end    
})

MainTab:AddToggle({
Name = "Auto Rebirth",
Default = false,
Callback = function(Value)
    getgenv().settings.AutoRebirth = Value
end    
})

MainTab:AddToggle({
Name = "Auto Spin Wheel",
Default = false,
Callback = function(Value)
    getgenv().settings.AutoSpinWheel = Value
    while getgenv().settings.AutoSpinWheel == true do
      if getgenv().settings.AutoSpinWheel == true then
          local args2 = {[1] = 0}
          game:GetService("ReplicatedStorage"):WaitForChild("functions-shared/network@GlobalFunctions"):WaitForChild("s:spin"):FireServer(unpack(args2))
          wait(301)
      end
    end
end    
})

MainTab:AddToggle({
Name = "Auto Claim Gift",
Default = false,
Callback = function(Value)
    getgenv().settings.AutoClaimGift = Value
end    
})

--// main code

game:GetService("RunService").Heartbeat:Connect(function()
    if getgenv().settings.AutoClick == true then
      game:GetService("ReplicatedStorage"):WaitForChild("events-shared/network@GlobalEvents"):WaitForChild("placeBlock"):FireServer()
    end
end)

game:GetService("RunService").Heartbeat:Connect(function()
    if getgenv().settings.AutoClaimGift == true then
      wait(62)
      local args5 = { [1] = 1, [2] = 60 }
      game:GetService("ReplicatedStorage"):WaitForChild("functions-shared/network@GlobalFunctions"):WaitForChild("s:claimTimeGift"):FireServer(unpack(args))
      wait(182)
      local args6 = { [1] = 2, [2] = 180 }
      game:GetService("ReplicatedStorage"):WaitForChild("functions-shared/network@GlobalFunctions"):WaitForChild("s:claimTimeGift"):FireServer(unpack(args))
      wait(302)
      local args7 = { [1] = 3, [2] = 300 }
      game:GetService("ReplicatedStorage"):WaitForChild("functions-shared/network@GlobalFunctions"):WaitForChild("s:claimTimeGift"):FireServer(unpack(args))
      wait(422)
      local args8 = { [1] = 4, [2] = 420 }
      game:GetService("ReplicatedStorage"):WaitForChild("functions-shared/network@GlobalFunctions"):WaitForChild("s:claimTimeGift"):FireServer(unpack(args))
      wait(602)
      local args9 = { [1] = 5, [2] = 600 }
      game:GetService("ReplicatedStorage"):WaitForChild("functions-shared/network@GlobalFunctions"):WaitForChild("s:claimTimeGift"):FireServer(unpack(args))
      wait(902)
      local args10 = { [1] = 6, [2] = 900 }
      game:GetService("ReplicatedStorage"):WaitForChild("functions-shared/network@GlobalFunctions"):WaitForChild("s:claimTimeGift"):FireServer(unpack(args))
      wait(999999999999999)
    end
end)

OrionLib:Init()
