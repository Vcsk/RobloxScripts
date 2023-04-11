--// Services \\--
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local VirtualInputManager = game:GetService("VirtualInputManager")

--// Variables \\--
local Player = Players.LocalPlayer
local Enabled = false
local Mouse = Player:GetMouse()
local X, Y = 0, 0
local LastC = Color3.new(1, 0, 0)
local LastU = tick()

getgenv().autoClicking = false
getgenv().clickWait = 1

--// Exploit Fix \\--
if not pcall(function() return syn.protect_gui end) then
    syn = {}
    syn.protect_gui = function(A_1)
        A_1.Parent = CoreGui
    end
end

--// UI Library \\--
local CoastingLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/UI-Library/main/Source/Coasting.lua"))()

local autoClickerTab = CoastingLibrary:CreateTab("Auto Clicker")
local mainSection = autoClickerTab:CreateSection("Main")
local settingsSection = autoClickerTab:CreateSection("Settings")

mainSection:CreateToggle("Status:", function(s)
    getgenv().autoClicking = s
    while autoClicking do
        VirtualInputManager:SendMouseButtonEvent(Mouse.X, Mouse.Y, 0, true, game, 1)
        VirtualInputManager:SendMouseButtonEvent(Mouse.X, Mouse.Y, 0, false, game, 1)
        task.wait(clickWait)
    end
end)

settingsSection:CreateSlider("Click wait", 0,100000,1, function(v)
    getgenv().clickWait = v
end)
