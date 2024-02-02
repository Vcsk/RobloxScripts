local Library = loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local window = Library:NewWindow("TBS Void V1")

local mainTab = window:NewSection("Main")
local tpTab = window:NewSection("Tp")

mainTab:CreateButton("void v1", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(72, 26, 84)
end)

tpTab:CreateButton("tp up mountain", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(635, 678, 384)
end)

tpTab:CreateButton("tp middle", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(145, 441, 34)
end)

--[[
tpTab:CreateButton("tp 1", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(362, 441, 177)
end)

tpTab:CreateButton("tp 2", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(212, 441, -231)
end)

tpTab:CreateButton("tp 3", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-42, 441, -121)
end)

tpTab:CreateButton("tp 4", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(101, 441, 268)
end)

-- -52, -448, 219]]
