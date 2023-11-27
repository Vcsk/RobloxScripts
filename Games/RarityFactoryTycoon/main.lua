getgenv().settings = {
	AutoCollectOrbs = false,
	AutoCollectDiamonds = false,
	AutoCollectTreeOrbs = false,
	AutoSell = false,
	AutoBuy = false,
	AutoRebirth = false,
	AutoClaimGift = false,
	AutoObby = false,
	AutoLoadSave = false,
}

local player = game.Players.LocalPlayer
local pTycoon
for _, v in pairs(game.Workspace.Tycoons:GetDescendants()) do
	if v.Name == "Owner" then 
		if v.Value == player.Name then 
		    pTycoon = v.Parent
		end
	end
end

local function AutoCollectOrbs()
    for _, v in pairs(pTycoon.Drops:GetDescendants()) do
        if v.ClassName == "Part" then 
            v.CFrame = player.Character.Pickup.CFrame
        end
    end
end

local function AutoCollectDiamonds()
    for _, v in pairs(pTycoon.Drops:GetDescendants()) do
        if v.Name == "DiamondSmall" or v.Name == "DiamondMedium" then 
            v.CFrame = player.Character.Pickup.CFrame
        end
    end
end

local function AutoCollectTreeOrbs()
    for _, v in pairs(pTycoon.RebirthTree.Drops:GetDescendants()) do
        if v.ClassName == "Part" then 
            v.CFrame = player.Character.Pickup.CFrame
        end
    end
end

local function AutoBuy()
    for _, v in pairs(pTycoon.Buttons:GetDescendants()) do
        if v.ClassName == "TouchTransmitter" then
            firetouchinterest(v.Parent, player.Character.HumanoidRootPart, 0)
            firetouchinterest(v.Parent, player.Character.HumanoidRootPart, 1)
        end
    end
end

local function AutoSell()
    for _, v in pairs(pTycoon["Orb Processor"]:GetDescendants()) do
        if v.ClassName == "TouchTransmitter" then
            firetouchinterest(v.Parent, player.Character.HumanoidRootPart, 0)
            firetouchinterest(v.Parent, player.Character.HumanoidRootPart, 1)
        end
    end
end

local function AutoRebirth()
    for _, v in pairs(pTycoon.Rebirth:GetDescendants()) do
        if v.ClassName == "TouchTransmitter" then
            firetouchinterest(v.Parent, player.Character.HumanoidRootPart, 0)
            firetouchinterest(v.Parent, player.Character.HumanoidRootPart, 1)
        end
    end
end

local function AutoClaimGift()
    game:GetService("ReplicatedStorage").Remotes.ClaimGift:FireServer(1)
    game:GetService("ReplicatedStorage").Remotes.ClaimGift:FireServer(2)
    game:GetService("ReplicatedStorage").Remotes.ClaimGift:FireServer(3)
    game:GetService("ReplicatedStorage").Remotes.ClaimGift:FireServer(4)
    game:GetService("ReplicatedStorage").Remotes.ClaimGift:FireServer(5)
    game:GetService("ReplicatedStorage").Remotes.ClaimGift:FireServer(6)
    game:GetService("ReplicatedStorage").Remotes.ClaimGift:FireServer(7)
    game:GetService("ReplicatedStorage").Remotes.ClaimGift:FireServer(8)
    game:GetService("ReplicatedStorage").Remotes.ClaimGift:FireServer(9)
    game:GetService("ReplicatedStorage").Remotes.ClaimGift:FireServer(10)
    game:GetService("ReplicatedStorage").Remotes.ClaimGift:FireServer(11)
    game:GetService("ReplicatedStorage").Remotes.ClaimGift:FireServer(12)
end

local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/UI-Library/main/Source/Orion.lua"))()
local window = OrionLib:MakeWindow({Name = "Rarity Factory Tycoon", HidePremium = false, SaveConfig = true, ConfigFolder = "VX_RFT", IntroEnabled = true, IntroText = "Made by vcsk0"})

local homeTab = window:MakeTab({
    Name = "Home",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
local mainTab = window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local settingsTab = window:MakeTab({
    Name = "Settings",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

homeTab:AddParagraph("UPDATES","UPDATE 1: Added Auto Collect Orbs, Added Auto Sell, Added Auto Buy, Added Auto Rebirth, Added Auto Obby\nUPDATE 2: Added Auto Collect Tree Orbs\nUPDATE 3: Added Auto Collect Diamonds")

homeTab:AddButton({
    Name = "Discord Invite",
    Callback = function()
              setclipboard("https://discord.com/invite/cNBNvSufYw")
              OrionLib:MakeNotification({
                  Name = "Notification",
                  Content = "Copied to your clipboard!",
                  Image = "rbxassetid://4483345998",
                  Time = 5
              })
      end
})

mainTab:AddToggle({
    Name = "Auto Collect Orbs",
    Default = false,
    Save = true,
	Flag = "AutoCollectOrbs",
    Callback = function(toggle)
        getgenv().settings.AutoCollectOrbs = toggle
    end
})

mainTab:AddToggle({
    Name = "Auto Collect Diamonds",
    Default = false,
	Save = true,
	Flag = "AutoCollectDiamonds",
    Callback = function(toggle)
        getgenv().settings.AutoCollectDiamonds = toggle
    end
})


mainTab:AddToggle({
    Name = "Auto Collect Tree Orbs",
    Default = false,
	Save = true,
	Flag = "AutoCollectTreeOrbs",
    Callback = function(toggle)
        getgenv().settings.AutoCollectTreeOrbs = toggle
    end
})

mainTab:AddToggle({
    Name = "Auto Sell",
    Default = false,
	Save = true,
	Flag = "AutoSell",
    Callback = function(toggle)
        getgenv().settings.AutoSell = toggle
    end
})

mainTab:AddToggle({
    Name = "Auto Buy",
    Default = false,
	Save = true,
	Flag = "AutoBuy",
    Callback = function(toggle)
        getgenv().settings.AutoBuy = toggle
    end
})

mainTab:AddToggle({
    Name = "Auto Rebirth",
    Default = false,
	Save = true,
	Flag = "AutoRebirth",
    Callback = function(toggle)
        getgenv().settings.AutoRebirth = toggle
    end
})

mainTab:AddToggle({
    Name = "Auto Claim Gift",
    Default = false,
	Save = true,
	Flag = "AutoClaimGift",
    Callback = function(toggle)
        getgenv().settings.AutoClaimGift = toggle
    end
})

getgenv().ObbyReward = ""
mainTab:AddDropdown({
	Name = "Obby Reward",
	Default = "2x Money",
	Options = {"3x ProcessSpeed", "2x Luck", "2x Money"},
	Callback = function(selected)
		getgenv().ObbyReward = selected
	end    
})

mainTab:AddToggle({
    Name = "Auto Obby",
    Default = false,
    Save = true,
    Flag = "AutoObby",
    Callback = function(toggle)
        getgenv().settings.AutoObby = toggle
	while getgenv().settings.AutoObby ~= false do
		if getgenv().settings.AutoObby == true and getgenv().ObbyReward == "2x Money" then
			player.Character.HumanoidRootPart.CFrame = CFrame.new(-327, 53, 1697)
		elseif getgenv().settings.AutoObby == true and getgenv().ObbyReward == "2x Luck" then
			player.Character.HumanoidRootPart.CFrame = CFrame.new(-318, 53, 1698)
		elseif getgenv().settings.AutoObby == true and getgenv().ObbyReward == "3x ProcessSpeed" then
			player.Character.HumanoidRootPart.CFrame = CFrame.new(-309, 53, 1699)
		end
		task.wait(61.5)
	end
    end
})

settingsTab:AddToggle({
    Name = "Auto Load Saved Configs",
    Default = false,
	Save = true,
	Flag = "AutoLoadSave",
    Callback = function(toggle)
        getgenv().settings.AutoLoadSave = toggle
    end
})

--// Main Codes

game:GetService("RunService").Heartbeat:Connect(function()
	if getgenv().settings.AutoCollectOrbs == true then
	    AutoCollectOrbs()
	end
end)

game:GetService("RunService").Heartbeat:Connect(function()
	if getgenv().settings.AutoCollectDiamonds == true then
	    AutoCollectDiamonds()
	end
end)

game:GetService("RunService").Heartbeat:Connect(function()
	if getgenv().settings.AutoCollectTreeOrbs == true then
	    AutoCollectTreeOrbs()
	end
end)

game:GetService("RunService").Heartbeat:Connect(function()
	if getgenv().settings.AutoSell == true then
	    AutoSell()
	end
end)

game:GetService("RunService").Heartbeat:Connect(function()
	if getgenv().settings.AutoBuy == true then
	    AutoBuy()
	end
end)

game:GetService("RunService").Heartbeat:Connect(function()
	if getgenv().settings.AutoRebirth == true then
	    AutoRebirth()
	end
end)

game:GetService("RunService").Heartbeat:Connect(function()
	if getgenv().settings.AutoClaimGift == true then
	    AutoClaimGift()
	end
end)

--[[ Saves

game:GetService("RunService").Heartbeat:Connect(function()
    if OrionLib.Flags["AutoLoadSave"].Value == true and OrionLib.Flags["AutoCollectOrbs"].Value == true then
	    AutoCollectOrbs()
    end
end)

game:GetService("RunService").Heartbeat:Connect(function()
    if OrionLib.Flags["AutoLoadSave"].Value == true and OrionLib.Flags["AutoCollectDiamonds"].Value == true then
        AutoCollectDiamonds()
    end
end)

game:GetService("RunService").Heartbeat:Connect(function()
    if OrionLib.Flags["AutoLoadSave"].Value == true and OrionLib.Flags["AutoCollectTreeOrbs"].Value == true then
        AutoCollectTreeOrbs()
    end
end)

game:GetService("RunService").Heartbeat:Connect(function()
    if OrionLib.Flags["AutoLoadSave"].Value == true and OrionLib.Flags["AutoSell"].Value == true then
        AutoSell()
    end
end)

game:GetService("RunService").Heartbeat:Connect(function()
    if OrionLib.Flags["AutoLoadSave"].Value == true and OrionLib.Flags["AutoBuy"].Value == true then
        AutoBuy()
    end
end)

game:GetService("RunService").Heartbeat:Connect(function()
    if OrionLib.Flags["AutoLoadSave"].Value == true and OrionLib.Flags["AutoRebirth"].Value == true then
        AutoRebirth()
    end
end)

game:GetService("RunService").Heartbeat:Connect(function()
    if OrionLib.Flags["AutoLoadSave"].Value == true and OrionLib.Flags["AutoClaimGift"].Value == true then
        AutoClaimGift()
    end
end)
--]]
--// end

OrionLib:Init()
