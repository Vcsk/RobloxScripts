getgenv().settings = {
    AutoTap = false,
	AutoWork = false,
    AutoCollectWork = false,
	AutoLoadSave = false,
}

local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/UI-Library/main/Source/Orion.lua"))()
local window = OrionLib:MakeWindow({Name = "Online Business Simulator 3", HidePremium = false, SaveConfig = true, ConfigFolder = "VX_OBS3", IntroEnabled = true, IntroText = "Made by vcsk0"})

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

homeTab:AddParagraph("UPDATES","UPDATE 1: Added Auto Work, Added Auto Collect Work\nUPDATE 2: Added Auto Tap")

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
    Name = "Auto Tap",
    Default = false,
	Save = true,
	Flag = "AutoTap",
    Callback = function(toggle)
        getgenv().settings.AutoTap = toggle
    end
})

mainTab:AddToggle({
    Name = "Auto Work",
    Default = false,
	Save = true,
	Flag = "AutoWork",
    Callback = function(toggle)
        getgenv().settings.AutoWork = toggle
    end
})

mainTab:AddToggle({
    Name = "Auto Collect Work",
    Default = false,
	Save = true,
	Flag = "AutoCollectWork",
    Callback = function(toggle)
        getgenv().settings.AutoCollectWork = toggle
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
    if getgenv().settings.AutoTap == true then
        game:GetService("Players").LocalPlayer.PlayerGui.TapTapGameplay.TapServer.ServerEvent:FireServer()
    end
end)

game:GetService("RunService").Heartbeat:Connect(function()
    if getgenv().settings.AutoWork == true then
        game:GetService("ReplicatedStorage").Events.StartWorking:FireServer()
    end
end)

game:GetService("RunService").Heartbeat:Connect(function()
    if getgenv().settings.AutoCollectWork == true then
        game:GetService("ReplicatedStorage").Events.CollectWork:InvokeServer()
    end
end)

game:GetService("RunService").Heartbeat:Connect(function()
    if OrionLib.Flags["AutoLoadSave"].Value == true and OrionLib.Flags["AutoTap"].Value == true then
        game:GetService("Players").LocalPlayer.PlayerGui.TapTapGameplay.TapServer.ServerEvent:FireServer()
    end
end)

game:GetService("RunService").Heartbeat:Connect(function()
    if OrionLib.Flags["AutoLoadSave"].Value == true and OrionLib.Flags["AutoWork"].Value == true then
        game:GetService("ReplicatedStorage").Events.StartWorking:FireServer()
    end
end)

game:GetService("RunService").Heartbeat:Connect(function()
    if OrionLib.Flags["AutoLoadSave"].Value == true and OrionLib.Flags["AutoCollectWork"].Value == true then
        game:GetService("ReplicatedStorage").Events.CollectWork:InvokeServer()
    end
end)

OrionLib:Init()
