local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/UI-Library/main/Source/MyUILib(Unamed).lua"))();
local window = library:Create("DH - Anti Lock")

local main = window:Tab("Main","rbxassetid://10888331510")

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

main:WarningLabel("If they use anti lock resolver then the anti lock not gonna work cuz i don't know how to bypass it")
