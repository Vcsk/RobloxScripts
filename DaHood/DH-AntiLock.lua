local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/UI-Library/main/Source/MyUILib(Unamed).lua"))();
local window = library:Create("DH - Anti Lock")

local main = window:Tab("Main","rbxassetid://10888331510")
local others = window:Tab("Others","rbxassetid://12518571678")
local settings = window:Tab("Settings","rbxassetid://12535704100")

main:Toggle("Underground", function(s)
	-- Credits to Halal Gaming
	getgenv().Underground = s
	getgenv().UndergroundAmount = -900
	
	game:GetService("RunService").heartbeat:Connect(function()
        if getgenv().Underground ~= false then 
          local vel = game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity
          game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,      getgenv().UndergroundAmount,0) 
          game:GetService("RunService").RenderStepped:Wait()
          game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = vel
        end 
  end)
end)

main:Toggle("Sky", function(s)
	-- Credits to Halal Gaming
	getgenv().Sky = s
	getgenv().SkyAmount = 900
	
	game:GetService("RunService").heartbeat:Connect(function()
        if getgenv().Sky ~= false then 
          local vel = game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity
          game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,      getgenv().SkyAmount,0) 
          game:GetService("RunService").RenderStepped:Wait()
          game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = vel
        end 
	end)
end)

main:Toggle("Desync", function(s)
	-- Credits to Halal Gaming
	getgenv().Desync = s
	
	local lplr = game.Players.LocalPlayer
	local run  = game:GetService("RunService")
	
	if getgenv().Desync == false then
		if lplr.Character["I_LOADED_I"]["K.O"] then 
			lplr.Character["I_LOADED_I"]["K.O"].Parent = nil 
		end 
		lplr.Character.Humanoid.Health = 0 
	end 
	
	run.heartbeat:Connect(function()
        if getgenv().Desync == true then 
          local lvle = lplr.Character.HumanoidRootPart.Velocity
          local lcf = lplr.Character.HumanoidRootPart.CFrame
          lplr.Character.HumanoidRootPart.CFrame = lcf * CFrame.Angles(0,math.rad(1/100),0)
          lplr.Character.HumanoidRootPart.Velocity = Vector3.new(1,1,1) * -(2^15)
          run.RenderStepped:Wait()
          lplr.Character.HumanoidRootPart.Velocity = lvle 
        end 
	end)
end)

getgenv().odkey = ""
main:Button("Oblivity Desync", function()
local P1000ToggleKey = odkey -- Change that to whatever keybind: "t"


--[[

	Standing still will trick the hitbox, you won't be able to get hit.


	DO NOT EDIT BEYOND THIS POINT IF YOU DON'T UNDERSTAND WHAT IS GOING ON.
	
	ORIGINAL SOURCE PUT INTO SKID FRIENDLY FORMAT TAKE WHAT YOU LIKE AND MAKE MANY MORE OBLIVITIES CLONES WITH THIS OR EVEN YOUR VERY OWN DIY OBLIVITY!
	
	AND REMEMBER TO SAY, SO LOOOOONG OBLIVITYYYYYY!!!


--]]


--// Services
checkcaller = checkcaller
newcclosure = newcclosure
hookmetamethod = hookmetamethod

local PastedSources = false
local BruhXD = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Bullshit = LocalPlayer:GetMouse()


--// Toggles
Bullshit.KeyDown:Connect(function(SayNoToOblivity)
	if SayNoToOblivity == string.lower(P1000ToggleKey) then
		pcall(function()
			if PastedSources == false then
				PastedSources = true
				print("Enabled P1000")
			elseif PastedSources == true then
				PastedSources = false
				print("Disabled P1000")
			end
		end)
	end
end)

Bullshit.KeyDown:Connect(function(SayNoToOblivity)
	if SayNoToOblivity == ("=") then
		game:GetService("TeleportService"):Teleport(game.PlaceId, LocalPlayer) 
	end
end)


--// Desync_Source
function RandomNumberRange(a)
	return math.random(-a * 100, a * 100) / 100
end

function RandomVectorRange(a, b, c)
	return Vector3.new(RandomNumberRange(a), RandomNumberRange(b), RandomNumberRange(c))
end


local DesyncTypes = {}
BruhXD.Heartbeat:Connect(function()
	if PastedSources == true then
		DesyncTypes[1] = LocalPlayer.Character.HumanoidRootPart.CFrame
		DesyncTypes[2] = LocalPlayer.Character.HumanoidRootPart.AssemblyLinearVelocity

		local SpoofThis = LocalPlayer.Character.HumanoidRootPart.CFrame

		SpoofThis = SpoofThis * CFrame.new(Vector3.new(0, 0, 0))
		SpoofThis = SpoofThis * CFrame.Angles(math.rad(RandomNumberRange(180)), math.rad(RandomNumberRange(180)), math.rad(RandomNumberRange(180)))

		LocalPlayer.Character.HumanoidRootPart.CFrame = SpoofThis

		LocalPlayer.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(1, 1, 1) * 16384

		BruhXD.RenderStepped:Wait()

		LocalPlayer.Character.HumanoidRootPart.CFrame = DesyncTypes[1]
		LocalPlayer.Character.HumanoidRootPart.AssemblyLinearVelocity = DesyncTypes[2]
	end
end)


--// Hook_CFrame
local XDDDDDD = nil
XDDDDDD = hookmetamethod(game, "__index", newcclosure(function(self, key)
	if PastedSources == true then
		if not checkcaller() then
			if key == "CFrame" and PastedSources == true and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character:FindFirstChild("Humanoid") and LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 then
				if self == LocalPlayer.Character.HumanoidRootPart then
					return DesyncTypes[1] or CFrame.new()
				elseif self == LocalPlayer.Character.Head then
					return DesyncTypes[1] and DesyncTypes[1] + Vector3.new(0, LocalPlayer.Character.HumanoidRootPart.Size / 2 + 0.5, 0) or CFrame.new()
				end
			end
		end
	end
	return XDDDDDD(self, key)
end))
end)

main:TextBox("Keybind [Oblivity Desync]", function(t)
getgenv().odkey = t
end)

others:Section("Aim Viewer")

others:Button("Aim Viewer", function()
_G.enable = false
_G.color = Color3.fromRGB(255,0,0)
_G.toggle_keybind = "l" -- enable tracer and disable
_G.swith_nigga = 't' -- press t and u will see a noti on the user ur tracer is on 
_G.method = "MousePos" --had a stroke sotkraakdakdakdkadkadkakdakdakdkdakdakdkadkadka
_G.antilockenabled = false -- true/false ANTI KEYBIND IS Z

loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/RobloxScripts/main/DaHood/AimViewerSC.lua"))()
end)

others:InfoLabel("l - enable tracer and disable")
others:InfoLabel("t - u will see a noti on the user ur tracer is on")

others:Section("Locks")

others:Button("Silent Aim [Q]", function()
local Settings = {
    rewrittenmain = {
        Enabled = true,
        Key = "q",
        DOT = true,
        AIRSHOT = true,
        NOTIF = false,
        AUTOPRED = false,
        FOV = math.huge,
        RESOVLER = true
    }
}
 
local SelectedPart = "LowerTorso"
local Prediction = true
local PredictionValue = 0.12467245219812
 
 
    local AnchorCount = 0
    local MaxAnchor = 50
 
    local CC = game:GetService"Workspace".CurrentCamera
    local Plr;
    local enabled = false
    local accomidationfactor = 0.1234772452176
    local mouse = game.Players.LocalPlayer:GetMouse()
    local placemarker = Instance.new("Part", game.Workspace)
 
    function makemarker(Parent, Adornee, Color, Size, Size2)
        local e = Instance.new("BillboardGui", Parent)
        e.Name = "PP"
        e.Adornee = Adornee
        e.Size = UDim2.new(Size, Size2, Size, Size2)
        e.AlwaysOnTop = Settings.rewrittenmain.DOT
        local a = Instance.new("Frame", e)
        if Settings.rewrittenmain.DOT == true then
        a.Size = UDim2.new(1, 0, 1, 0)
        else
        a.Size = UDim2.new(0, 0, 0, 0)
        end
        if Settings.rewrittenmain.DOT == true then
        a.Transparency = 0
        a.BackgroundTransparency = 0
        else
        a.Transparency = 1
        a.BackgroundTransparency = 1
        end
        a.BackgroundColor3 = Color
        local g = Instance.new("UICorner", a)
        if Settings.rewrittenmain.DOT == false then
        g.CornerRadius = UDim.new(0, 0)
        else
        g.CornerRadius = UDim.new(1, 1) 
        end
        return(e)
    end
 
 
    local data = game.Players:GetPlayers()
    function noob(player)
        local character
        repeat wait() until player.Character
        local handler = makemarker(guimain, player.Character:WaitForChild(SelectedPart), Color3.fromRGB(107, 184, 255), 0.3, 3)
        handler.Name = player.Name
        player.CharacterAdded:connect(function(Char) handler.Adornee = Char:WaitForChild(SelectedPart) end)
 
 
        spawn(function()
            while wait() do
                if player.Character then
                end
            end
        end)
    end
 
    for i = 1, #data do
        if data[i] ~= game.Players.LocalPlayer then
            noob(data[i])
        end
    end
 
    game.Players.PlayerAdded:connect(function(Player)
        noob(Player)
    end)
 
    spawn(function()
        placemarker.Anchored = true
        placemarker.CanCollide = false
        if Settings.rewrittenmain.DOT == true then
        placemarker.Size = Vector3.new(8, 8, 8)
        else
        placemarker.Size = Vector3.new(0, 0, 0)
        end
        placemarker.Transparency = 0.75
        if Settings.rewrittenmain.DOT then
        makemarker(placemarker, placemarker, Color3.fromRGB(232, 186, 200), 0.40, 0)
        end
    end)
 
    game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(k)
        if k == Settings.rewrittenmain.Key and Settings.rewrittenmain.Enabled then
            if enabled == true then
                enabled = false
                if Settings.rewrittenmain.NOTIF == true then
                    Plr = getClosestPlayerToCursor()
                game.StarterGui:SetCore("SendNotification", {
						Title = "6akan Locking Alert",
						Text = "Unlocked",
						Icon = "http://www.roblox.com/asset/?id=8850953349",
						Duration = 1,
})
            end
            else
                Plr = getClosestPlayerToCursor()
                enabled = true
                if Settings.rewrittenmain.NOTIF == true then
 
                    game.StarterGui:SetCore("SendNotification", {
						Title = "6akan Locking Alert",
						Text = "Locked on : "..tostring(Plr.Name);
						Icon = "http://www.roblox.com/asset/?id=8850953349",
						Duration = 1,
})
 
                end
            end
        end
    end)
 
 
 
    function getClosestPlayerToCursor()
        local closestPlayer
        local shortestDistance = Settings.rewrittenmain.FOV
 
        for i, v in pairs(game.Players:GetPlayers()) do
            if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("HumanoidRootPart") then
                local pos = CC:WorldToViewportPoint(v.Character.PrimaryPart.Position)
                local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(mouse.X, mouse.Y)).magnitude
                if magnitude < shortestDistance then
                    closestPlayer = v
                    shortestDistance = magnitude
                end
            end
        end
        return closestPlayer
    end
 
    local pingvalue = nil;
    local split = nil;
    local ping = nil;
 
    game:GetService"RunService".Stepped:connect(function()
        if enabled and Plr.Character ~= nil and Plr.Character:FindFirstChild("HumanoidRootPart") then
            placemarker.CFrame = CFrame.new(Plr.Character.HumanoidRootPart.Position+(Plr.Character.HumanoidRootPart.Velocity*accomidationfactor))
        else
            placemarker.CFrame = CFrame.new(0, 9999, 0)
        end
        if Settings.rewrittenmain.AUTOPRED == true then
             pingvalue = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
             split = string.split(pingvalue,'(')
             ping = tonumber(split[1])
            if ping < 130 then
                PredictionValue = 0.151
            elseif ping < 125 then
                PredictionValue = 0.149
            elseif ping < 110 then
                PredictionValue = 0.146
            elseif ping < 105 then
                PredictionValue = 0.138
            elseif ping < 90 then
                PredictionValue = 0.136
            elseif ping < 80 then
                PredictionValue = 0.134
            elseif ping < 70 then
                PredictionValue = 0.131
            elseif ping < 60 then
                PredictionValue = 0.1229
            elseif ping < 50 then
                PredictionValue = 0.1225
            elseif ping < 40 then
                PredictionValue = 0.1256
            end
        end
    end)
 
    local mt = getrawmetatable(game)
    local old = mt.__namecall
    setreadonly(mt, false)
    mt.__namecall = newcclosure(function(...)
        local args = {...}
        if enabled and getnamecallmethod() == "FireServer" and args[2] == "UpdateMousePos" and Settings.rewrittenmain.Enabled and Plr.Character ~= nil then
 
            -- args[3] = Plr.Character.HumanoidRootPart.Position+(Plr.Character.HumanoidRootPart.Velocity*accomidationfactor)
            --[[
            if Settings.rewrittenmain.AIRSHOT == true then
                if game.Workspace.Players[Plr.Name].Humanoid:GetState() == Enum.HumanoidStateType.Freefall then -- Plr.Character:WaitForChild("Humanoid"):GetState() == Enum.HumanoidStateType.Freefall
 
                    --// Airshot
                    args[3] = Plr.Character.LeftFoot.Position+(Plr.Character.LeftFoot.Velocity*PredictionValue)
 
                else
                    args[3] = Plr.Character.HumanoidRootPart.Position+(Plr.Character.HumanoidRootPart.Velocity*PredictionValue)
 
                end
            else
                    args[3] = Plr.Character.HumanoidRootPart.Position+(Plr.Character.HumanoidRootPart.Velocity*PredictionValue)
            end
            ]]
            if Prediction == true then
 
            args[3] = Plr.Character[SelectedPart].Position+(Plr.Character[SelectedPart].Velocity*PredictionValue)
 
            else
 
            args[3] = Plr.Character[SelectedPart].Position
 
            end
 
            return old(unpack(args))
        end
        return old(...)
    end)
 
    game:GetService("RunService").RenderStepped:Connect(function()
        if Settings.rewrittenmain.RESOVLER == true and Plr.Character ~= nil and enabled and Settings.rewrittenmain.Enabled then
        if Settings.rewrittenmain.AIRSHOT == true and enabled and Plr.Character ~= nil then
 
            if game.Workspace.Players[Plr.Name].Humanoid:GetState() == Enum.HumanoidStateType.Freefall then -- Plr.Character:WaitForChild("Humanoid"):GetState() == Enum.HumanoidStateType.Freefall
 
                --// Airshot
 
                --// Anchor Check
 
                if Plr.Character ~= nil and Plr.Character.HumanoidRootPart.Anchored == true then
                    AnchorCount = AnchorCount + 1
                    if AnchorCount >= MaxAnchor then
                        Prediction = false
                        wait(2)
                        AnchorCount = 0;
                    end
                else
                    Prediction = true
                    AnchorCount = 0;
                end
 
                SelectedPart = "LeftFoot"
 
            else
                --// Anchor Check
 
                if Plr.Character ~= nil and Plr.Character.HumanoidRootPart.Anchored == true then
                    AnchorCount = AnchorCount + 1
                    if AnchorCount >= MaxAnchor then
                        Prediction = false
                        wait(2)
                        AnchorCount = 0;
                    end
                else
                    Prediction = true
                    AnchorCount = 0;
                end
 
                SelectedPart = "HumanoidRootPart"
 
            end
            else
 
                --// Anchor Check
 
                if Plr.Character ~= nil and Plr.Character.HumanoidRootPart.Anchored == true then
                    AnchorCount = AnchorCount + 1
                    if AnchorCount >= MaxAnchor then
                        Prediction = false
                        wait(2)
                        AnchorCount = 0;
                    end
                else
                    Prediction = true
                    AnchorCount = 0;
                end
 
                SelectedPart = "HumanoidRootPart"
            end
 
        else
                SelectedPart = "HumanoidRootPart"
        end
    end)
end)

others:Toggle("Anti Lock Resolver", function(s)
getgenv().alrproo = s
local RunService = game:GetService("RunService")

local function zeroOutYVelocity(hrp)
    hrp.Velocity = Vector3.new(hrp.Velocity.X, 0, hrp.Velocity.Z)
    hrp.AssemblyLinearVelocity = Vector3.new(hrp.Velocity.X, 0, hrp.Velocity.Z)
end

local function onPlayerAdded(player)
    player.CharacterAdded:Connect(function(character)
        local hrp = character:WaitForChild("HumanoidRootPart")
        zeroOutYVelocity(hrp)
    end)
end

local function onPlayerRemoving(player)
    player.CharacterAdded:Disconnect()
end

game.Players.PlayerAdded:Connect(onPlayerAdded)
game.Players.PlayerRemoving:Connect(onPlayerRemoving)

RunService.Heartbeat:Connect(function()
if alrproo == true then
    pcall(function()
        for i, player in pairs(game.Players:GetChildren()) do
            if player.Name ~= game.Players.LocalPlayer.Name then
                local hrp = player.Character.HumanoidRootPart
                zeroOutYVelocity(hrp)
            end
        end
    end)
end
end)
end)

others:Section("CFrame Speed")

others:Button("CFrame Speed [Z]", function()
    	repeat
		wait()
	until game:IsLoaded()
	local L_134_ = game:service('Players')
	local L_135_ = L_134_.LocalPlayer
	repeat
		wait()
	until L_135_.Character
	local L_136_ = game:service('UserInputService')
	local L_137_ = game:service('RunService')
	getgenv().Multiplier = 0.5
	local L_138_ = true
	local L_139_
	L_136_.InputBegan:connect(function(L_140_arg0)
		if L_140_arg0.KeyCode == Enum.KeyCode.LeftBracket then
			Multiplier = Multiplier + 0.01
			print(Multiplier)
			wait(0.2)
			while L_136_:IsKeyDown(Enum.KeyCode.LeftBracket) do
				wait()
				Multiplier = Multiplier + 0.01
				print(Multiplier)
			end
		end
		if L_140_arg0.KeyCode == Enum.KeyCode.RightBracket then
			Multiplier = Multiplier - 0.01
			print(Multiplier)
			wait(0.2)
			while L_136_:IsKeyDown(Enum.KeyCode.RightBracket) do
				wait()
				Multiplier = Multiplier - 0.01
				print(Multiplier)
			end
		end
		if L_140_arg0.KeyCode == Enum.KeyCode.Z then
			L_138_ = not L_138_
			if L_138_ == true then
				repeat
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + game.Players.LocalPlayer.Character.Humanoid.MoveDirection * Multiplier
					game:GetService("RunService").Stepped:wait()
				until L_138_ == false
			end
		end
	end)
end)

others:Slider("CFrame Speed", 0,5, function(v)
getgenv().Multiplier = v
end)

settings:Keybind("Toggle UI", Enum.KeyCode.V, function()
library:ToggleUI()
end)
