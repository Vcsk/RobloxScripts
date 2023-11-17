getgenv().settings = {
	AutoCollectOrbs = false,
	AutoCollectTreeOrbs = false,
	AutoSell = false,
	AutoBuy = false,
	AutoRebirth = false,
	AutoClaimGift = false,
	AutoObby = false
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

function AutoCollectOrbs()
    for _, v in pairs(pTycoon.Drops:GetDescendants()) do
        if v.ClassName == "Part" then 
            v.CFrame = player.Character.Pickup.CFrame
        end
    end
end

function AutoCollectTreeOrbs()
    for _, v in pairs(pTycoon.RebirthTree.Drops:GetDescendants()) do
        if v.ClassName == "Part" then 
            v.CFrame = player.Character.Pickup.CFrame
        end
    end
end

function AutoBuy()
    for _, v in pairs(pTycoon.Buttons:GetDescendants()) do
        if v.ClassName == "TouchTransmitter" then
            firetouchinterest(v.Parent, player.Character.HumanoidRootPart, 0)
            firetouchinterest(v.Parent, player.Character.HumanoidRootPart, 1)
        end
    end
end

function AutoSell()
    for _, v in pairs(pTycoon["Orb Processor"]:GetDescendants()) do
        if v.ClassName == "TouchTransmitter" then
            firetouchinterest(v.Parent, player.Character.HumanoidRootPart, 0)
            firetouchinterest(v.Parent, player.Character.HumanoidRootPart, 1)
        end
    end
end

function AutoRebirth()
    for _, v in pairs(pTycoon.Rebirth:GetDescendants()) do
        if v.ClassName == "TouchTransmitter" then
            firetouchinterest(v.Parent, player.Character.HumanoidRootPart, 0)
            firetouchinterest(v.Parent, player.Character.HumanoidRootPart, 1)
        end
    end
end

function AutoClaimGift()
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

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/UI-Library/main/Source/Orion.lua"))()
local window = library:MakeWindow({Name = "Rarity Factory Tycoon", HidePremium = false, SaveConfig = true, ConfigFolder = "VX_RFT", IntroEnabled = false})

local mainTab = window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

mainTab:AddToggle({
    Name = "Auto Collect Orbs",
    Default = false,
    Callback = function(toggle)
        getgenv().settings.AutoCollectOrbs = toggle
    end
})

mainTab:AddToggle({
    Name = "Auto Collect Tree Orbs",
    Default = false,
    Callback = function(toggle)
        getgenv().settings.AutoCollectTreeOrbs = toggle
    end
})

mainTab:AddToggle({
    Name = "Auto Sell",
    Default = false,
    Callback = function(toggle)
        getgenv().settings.AutoSell = toggle
    end
})

mainTab:AddToggle({
    Name = "Auto Buy",
    Default = false,
    Callback = function(toggle)
        getgenv().settings.AutoBuy = toggle
    end
})

mainTab:AddToggle({
    Name = "Auto Rebirth",
    Default = false,
    Callback = function(toggle)
        getgenv().settings.AutoRebirth = toggle
    end
})

mainTab:AddToggle({
    Name = "Auto Claim Gift",
    Default = false,
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

--// Main Codes

game:GetService("RunService").Heartbeat:Connect(function()
	if getgenv().settings.AutoCollectOrbs == true then
	    AutoCollectOrbs()
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

library:Init()
