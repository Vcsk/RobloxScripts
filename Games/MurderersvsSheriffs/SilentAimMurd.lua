--[[

NOTE:
This is not legit silent aim.
You can kill people through walls.
Set SilentAimRange to math.huge if you want a kill aura.

--]]

local plrs = game:GetService("Players")
local uis = game:GetService("UserInputService")
local rs = game:GetService("RunService")

getgenv().SilentAimRange = 70
getgenv().SilentAimVisible = true
getgenv().SilentAimColor = Color3.new(1, 1, 1)

local Circle = Drawing.new("Circle")
Circle.Radius = SilentAimRange
Circle.Visible = SilentAimVisible
Circle.Color = SilentAimColor
Circle.Thickness = 1

local camera = workspace.CurrentCamera

local gmt = getrawmetatable(game)
setreadonly(gmt, false)

local nameCall = gmt.__namecall

local function GetClosest()
    
    local mouse = uis:GetMouseLocation()
    local closest = {math.huge}
    for i,plr in pairs(plrs:GetPlayers()) do
        if plr.Team == plrs.LocalPlayer.Team then
            continue
        end
        local chr = plr.Character
        if not chr then continue end
        local position, onScreen = camera:WorldToScreenPoint(chr.HumanoidRootPart.Position)
        local distance = (mouse - Vector2.new(position.X, position.Y)).Magnitude
        if distance < closest[1] and distance < SilentAimRange then
            closest[1] = distance
            closest[2] = chr
        end
    end

return closest[2]
end

local function KillCharacter(Character : Model)
    local args = {
        [1] = Character.Head,
        [2] = Character.Head.Position,
        [3] = plrs.LocalPlayer.Character.HumanoidRootPart.Position
    }
    
    plrs.LocalPlayer.Character.Knife.Damage:FireServer(unpack(args))

end

gmt.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()
    if tostring(method) == "FireServer" and tostring(self) == "ReplicateKnife" then
        local closest = GetClosest()
        if closest then
            KillCharacter(closest)
        end
    end
    return nameCall(self, ...)
end)

rs.RenderStepped:Connect(function()
    Circle.Position = uis:GetMouseLocation()
end)
