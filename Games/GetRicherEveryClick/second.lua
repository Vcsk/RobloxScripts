getgenv().settings = {
	AutoClick = false,
	AutoRebirth = false,
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

--// main code

game:GetService("RunService").Heartbeat:Connect(function()
    if getgenv().settings.AutoClick == true then
        game:GetService("ReplicatedStorage"):WaitForChild("events-shared/network@GlobalEvents"):WaitForChild("placeBlock"):FireServer()
    end
end)

game:GetService("RunService").Heartbeat:Connect(function()
    if getgenv().settings.AutoRebirth == true then
	    local args = {[1] = 0}
		game:GetService("ReplicatedStorage"):FindFirstChild("functions-shared/network@GlobalFunctions"):FindFirstChild("s:rebirth"):FireServer(unpack(args))
	end
end)

OrionLib:Init()
