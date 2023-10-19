local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Network = ReplicatedStorage:WaitForChild("Network")
local Hit = Network:WaitForChild("Hit")
local Aim = Network:WaitForChild("Aim")

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Character = Player.Character or (Player.CharacterAdded:Wait() and Player.Character)
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

Player.CharacterAdded:Connect(function(Char)
    Character = Char 
    HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
end)

local IsTargeting = function()
    local Targeted = Character:FindFirstChild("Targeted")
    return Targeted and Targeted.Enabled 
end

local GetMagnitude = function(A, B)
    return (A.Position - B.Position).Magnitude
end 

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/UI-Library/main/Source/MyUILib(Unamed).lua"))()
local window = Library:Create("Anime Blitz")

if UIS.TouchEnabled then
local ToggleGui = Instance.new("ScreenGui")
local Toggle = Instance.new("TextButton")

ToggleGui.Name = "ToggleGui_AB"
ToggleGui.Parent = game.CoreGui

Toggle.Name = "Toggle"
Toggle.Parent = ToggleGui
Toggle.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
Toggle.BackgroundTransparency = 0.660
Toggle.Position = UDim2.new(0, 0, 0.454706937, 0)
Toggle.Size = UDim2.new(0.0650164187, 0, 0.0888099447, 0)
Toggle.Font = Enum.Font.SourceSans
Toggle.Text = "Toggle"
Toggle.TextScaled = true
Toggle.TextColor3 = Color3.fromRGB(40, 40, 40)
Toggle.TextSize = 24.000
Toggle.TextXAlignment = Enum.TextXAlignment.Left
Toggle.Active = true
Toggle.Draggable = true
Toggle.MouseButton1Click:connect(function()
    Library:ToggleUI()
end)
end

local Tab1 = window:Tab("Main","rbxassetid://10888331510")

Tab1:InfoLabel("BETA")

Tab1:Toggle("Auto Parry", function(state)
    local autoParry = state
	while autoParry do 
        local Ball = workspace:FindFirstChild("Ball")
        if Ball and IsTargeting() then 
            if GetMagnitude(HumanoidRootPart, Ball) <= (Ball.Velocity.Magnitude / 2) then 
                local Hits = Ball:GetAttribute("Hit")
                Hit:FireServer(Vector3.zero)
                repeat task.wait() until (Ball:GetAttribute("Hit") == Hits + 1) or (not Ball.Parent)
            end 
        end 
        task.wait()
    end
end)

local manualSpam = false
Tab1:Keybind("Manual Spam", Enum.KeyCode.E, function()
if manualSpam == false then
    manualSpam = true
    repeat
    game:GetService("VirtualInputManager"):SendKeyEvent(true, "F" ,false ,game)
    task.wait()
    until manualSpam == false
else
    manualSpam = false
end
end)

Tab1:Keybind("Toggle UI", Enum.KeyCode.X, function()
    Library:ToggleUI()
end)
