--[[

Main script:
--(
getgenv().ToggleGUI = true -- true/false

loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/RobloxScripts/main/FEYeetGuiV4.lua"))()
--)

--// Read
Made by !vcsk0#1516
Don't claim this as yours or you'll have bad luck
Don't steal my code and claim it you make the code
you can use but credits to me

]]

local input = game:GetService("UserInputService")
local lplayer = game:GetService('Players').LocalPlayer

function notif(title, text, dur)
	game:FindService("StarterGui"):SetCore("SendNotification", {
			Title = title,
			Text = text,
			Duration = dur
	})
end

local yeeting = false
function GetPlayer(String)
	local Found = {}
	local strl = String:lower()
	if strl == "all" then
		for i,v in pairs(game:GetService("Players"):GetPlayers()) do
			table.insert(Found,v)
		end
	elseif strl == "others" then
		for i,v in pairs(game:GetService("Players"):GetPlayers()) do
			if v.Name ~= lplayer.Name then
				table.insert(Found,v)
			end
		end 
	elseif strl == "me" then
		for i,v in pairs(game:GetService("Players"):GetPlayers()) do
			if v.Name == lplayer.Name then
				table.insert(Found,v)
			end
		end 
	else
		for i,v in pairs(game:GetService("Players"):GetPlayers()) do
			if v.Name:lower():sub(1, #String) == String:lower() then
				table.insert(Found,v)
			end
		end 
	end
	return Found 
end

local GUIName = "FEYeetGuiV4_"..math.random(100000)
function ToggleGUI(enabled)
	local ToggleGui = Instance.new("ScreenGui")
	local Toggle = Instance.new("TextButton")
	
	ToggleGui.Name = "ToggleGui_"..GUIName
	ToggleGui.Parent = game.CoreGui
	ToggleGui.Enabled = enabled

	Toggle.Name = "Toggle"
	Toggle.Parent = ToggleGui
	Toggle.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
	Toggle.BackgroundTransparency = 0.660
	Toggle.Position = UDim2.new(0, 0, 0.454706937, 0)
	Toggle.Size = UDim2.new(0.0650164187, 0, 0.0888099447, 0)
	Toggle.Font = Enum.Font.SourceSans
	Toggle.Text = "Toggle"
	Toggle.TextScaled = true
	Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
	Toggle.TextSize = 24.000
	Toggle.TextXAlignment = Enum.TextXAlignment.Left
	Toggle.Active = true
	Toggle.Draggable = true
	Toggle.MouseButton1Click:Connect(function()
		if game.CoreGui[GUIName].Enabled then
			game.CoreGui[GUIName].Enabled = false
		else
			game.CoreGui[GUIName].Enabled = true
		end
	end)
end

local FEYeetGuiV4 = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local TopBar = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local Frame = Instance.new("Frame")
local Target = Instance.new("TextBox")
local YEET = Instance.new("TextButton")
local ULTRAYEET = Instance.new("TextButton")
local STOPYEETING = Instance.new("TextButton")
local VIEW = Instance.new("TextButton")
local GOTO = Instance.new("TextButton")

FEYeetGuiV4.Name = GUIName
FEYeetGuiV4.Parent = game:GetService("CoreGui")
FEYeetGuiV4.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Main.Name = "Main"
Main.Parent = FEYeetGuiV4
Main.BackgroundColor3 = Color3.fromRGB(54, 54, 54)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.317007214, 0, 0.392480195, 0)
Main.Size = UDim2.new(0, 389, 0, 129)

TopBar.Name = "TopBar"
TopBar.Parent = Main
TopBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TopBar.BorderSizePixel = 0
TopBar.Position = UDim2.new(0, 0, -0.240310073, 0)
TopBar.Size = UDim2.new(0, 389, 0, 31)

TextLabel.Parent = TopBar
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
TextLabel.BorderSizePixel = 0
TextLabel.Size = UDim2.new(0, 389, 0, 31)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "FE Yeet Gui V4"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextSize = 16.000

Frame.Parent = TopBar
Frame.BackgroundColor3 = Color3.fromRGB(186, 0, 3)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0, 0, 0.709677398, 0)
Frame.Size = UDim2.new(0, 389, 0, 9)

Target.Name = "Target"
Target.Parent = Main
Target.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
Target.BorderSizePixel = 0
Target.Position = UDim2.new(0.205655515, 0, 0.162790686, 0)
Target.Size = UDim2.new(0, 229, 0, 35)
Target.Font = Enum.Font.SourceSans
Target.PlaceholderColor3 = Color3.fromRGB(148, 148, 148)
Target.PlaceholderText = "Player you wanna yeet/view/goto"
Target.Text = ""
Target.TextColor3 = Color3.fromRGB(255, 255, 255)
Target.TextSize = 14.000

YEET.Name = "YEET"
YEET.Parent = Main
YEET.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
YEET.BorderSizePixel = 0
YEET.Position = UDim2.new(0.0668380484, 0, 0.63565892, 0)
YEET.Size = UDim2.new(0, 94, 0, 28)
YEET.Font = Enum.Font.SourceSans
YEET.Text = "Y E E T"
YEET.TextColor3 = Color3.fromRGB(255, 255, 255)
YEET.TextSize = 14.000

ULTRAYEET.Name = "ULTRAYEET"
ULTRAYEET.Parent = Main
ULTRAYEET.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
ULTRAYEET.BorderSizePixel = 0
ULTRAYEET.Position = UDim2.new(0.377892047, 0, 0.63565892, 0)
ULTRAYEET.Size = UDim2.new(0, 94, 0, 28)
ULTRAYEET.Font = Enum.Font.SourceSans
ULTRAYEET.Text = "U L T R A Y E E T"
ULTRAYEET.TextColor3 = Color3.fromRGB(255, 255, 255)
ULTRAYEET.TextSize = 14.000

STOPYEETING.Name = "STOPYEETING"
STOPYEETING.Parent = Main
STOPYEETING.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
STOPYEETING.BorderSizePixel = 0
STOPYEETING.Position = UDim2.new(0.691516697, 0, 0.63565892, 0)
STOPYEETING.Size = UDim2.new(0, 94, 0, 28)
STOPYEETING.Font = Enum.Font.SourceSans
STOPYEETING.Text = "Stop Y E E T ing"
STOPYEETING.TextColor3 = Color3.fromRGB(255, 255, 255)
STOPYEETING.TextSize = 14.000

VIEW.Name = "VIEW"
VIEW.Parent = Main
VIEW.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
VIEW.BorderSizePixel = 0
VIEW.Position = UDim2.new(0.814910054, 0, 0.0930232555, 0)
VIEW.Size = UDim2.new(0, 63, 0, 24)
VIEW.Font = Enum.Font.SourceSans
VIEW.Text = "VIEW"
VIEW.TextColor3 = Color3.fromRGB(255, 255, 255)
VIEW.TextSize = 14.000

GOTO.Name = "GOTO"
GOTO.Parent = Main
GOTO.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
GOTO.BorderSizePixel = 0
GOTO.Position = UDim2.new(0.814910054, 0, 0.325581402, 0)
GOTO.Size = UDim2.new(0, 63, 0, 24)
GOTO.Font = Enum.Font.SourceSans
GOTO.Text = "GOTO"
GOTO.TextColor3 = Color3.fromRGB(255, 255, 255)
GOTO.TextSize = 14.000

local dragging = false
local dragInput, mousePos, framePos

TopBar.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		mousePos = input.Position
		framePos = Main.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

TopBar.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
	end
end)

input.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		local delta = input.Position - mousePos
		Main.Position  = UDim2.new(framePos.X.Scale, framePos.X.Offset + delta.X, framePos.Y.Scale, framePos.Y.Offset + delta.Y)
	end
end)

if getgenv().ToggleGUI == true then
    ToggleGUI(true)
else
	ToggleGUI(false)
end

function ShrinkName()
    Target.FocusLost:connect(function()
        for i,v in pairs(game.Players:GetChildren()) do
            if (string.sub(string.lower(v.Name),1,string.len(Target.Text))) == string.lower(Target.Text) or (string.sub(string.lower(v.DisplayName),1,string.len(Target.Text))) == string.lower(Target.Text) then
                Target.Text = v.Name
            end
        end
    end)
end
ShrinkName()

function view(plr)
    wait()
    if game.Players:FindFirstChild(plr) then
        if game.Players[plr].Character then
            game.Workspace:FindFirstChildWhichIsA('Camera').CameraSubject = game.Players:FindFirstChild(plr).Character.Head
        else
            VIEW.Text = 'VIEW'
        end
    else
        VIEW.Text = 'VIEW'
    end
end

YEET.MouseButton1Click:Connect(function()
    local target = GetPlayer(Target.Text)
    
    if target[1] then
        target = target[1]
        
        game:GetService'Players'.LocalPlayer.Character.Humanoid.PlatformStand = true
        yeeting = true
        local Thrust = Instance.new('BodyThrust',game:GetService'Players'.LocalPlayer.Character.HumanoidRootPart)
        Thrust.Force = Vector3.new(2590,0,2590)
        Thrust.Name = "yeetforce"
        repeat
            game:GetService'Players'.LocalPlayer.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame
            Thrust.Location = target.Character.HumanoidRootPart.Position
            game["Run Service"].Heartbeat:wait()
        until not target.Character.HumanoidRootPart or yeeting == false
    else
        notif("FE Yeet Gui V4","Invalid Player!",5)
    end
end)

ULTRAYEET.MouseButton1Click:Connect(function()
    local target = GetPlayer(Target.Text)
    
    if target[1] then
        target = target[1]
        
        game:GetService'Players'.LocalPlayer.Character.Humanoid.PlatformStand = true
        yeeting = true
        local Thrust = Instance.new('BodyThrust',game:GetService'Players'.LocalPlayer.Character.HumanoidRootPart)
        Thrust.Force = Vector3.new(9999,9999,9999)
        Thrust.Name = "yeetforce"
        repeat
            game:GetService'Players'.LocalPlayer.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame
            Thrust.Location = target.Character.HumanoidRootPart.Position
            game["Run Service"].Heartbeat:wait()
        until not target.Character.HumanoidRootPart or yeeting == false
    else
        notif("FE Yeet Gui V4","Invalid Player!",5)
    end
end)

STOPYEETING.MouseButton1Click:Connect(function()
	pcall(function()
		game:GetService'Players'.LocalPlayer.Character.HumanoidRootPart.yeetforce:Destroy()
		game:GetService'Players'.LocalPlayer.Character.Humanoid.PlatformStand = false
	end)
	yeeting = false
end)

VIEW.MouseButton1Click:Connect(function()
    local target = Target.Text

	if VIEW.Text == 'VIEW' then
        VIEW.Text = 'UNVIEW'
        repeat view(target) until VIEW.Text == 'VIEW'
        game.Workspace:FindFirstChildWhichIsA('Camera').CameraSubject = lplayer.Character:FindFirstChildWhichIsA('Humanoid')
    else
        VIEW.Text = 'VIEW'
    end
end)

GOTO.MouseButton1Click:Connect(function()
	local target = Target.Text
	
	pcall(function()
		lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[target].Character.HumanoidRootPart.CFrame
	end)
end)

notif("FE Yeet Gui V4","Loaded!",5)
notif("FE Yeet Gui V4","Made by !vcsk0#1516",6)
