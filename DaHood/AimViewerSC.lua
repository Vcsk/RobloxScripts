--Aim Viewer
--------------------------------------------------

if game.PlaceId == 2788229376 then
    _G.method = "MousePos"
end




---------------------------------------------------------------
local rs = game:GetService("RunService")
local localPlayer = game.Players.LocalPlayer
local mouse = localPlayer:GetMouse()
local target;



function getgun()
    for i,v in pairs(target.Character:GetChildren()) do
        if v and (v:FindFirstChild('Default') or v:FindFirstChild('Handle') )then
            return v
        end
    end
end

function sendnotifi(message)


    game.StarterGui:SetCore("SendNotification", {
        Title = '';
        Text = message;
        Duration = "1";
    })

    end


function get_closet()
    local a = math.huge
    local b;



    for i, v in pairs(game.Players:GetPlayers()) do
        if v ~= localPlayer and v.Character and v.Character:FindFirstChild("Head") and  v.Character:FindFirstChild("HumanoidRootPart")  then
            local c = game.Workspace.CurrentCamera:WorldToViewportPoint(v.Character.PrimaryPart.Position)
            local d = (Vector2.new(mouse.X, mouse.Y) - Vector2.new(c.X, c.Y)).Magnitude

            if a > d then
                b = v
                a = d
            end
        end
    end

    return b
end

--- 
mouse.KeyDown:Connect(function(z)
    if z == _G.toggle_keybind then
        if _G.enable == false then
            _G.enable = true
            sendnotifi("enabled")
        elseif _G.enable == true then
            _G.enable = false 
            sendnotifi("disabled")
        end
    end
end)

mouse.KeyDown:Connect(function(z)
    if z == _G.swith_nigga then
        target = get_closet()
        sendnotifi("targeting: "..tostring(target.Name))
    end
end)
---

-- minified it 
local a=Instance.new("Beam")a.Segments=1;a.Width0=0.2;a.Width1=0.2;a.Color=ColorSequence.new(_G.color)a.FaceCamera=true;local b=Instance.new("Attachment")local c=Instance.new("Attachment")a.Attachment0=b;a.Attachment1=c;a.Parent=workspace.Terrain;b.Parent=workspace.Terrain;c.Parent=workspace.Terrain

task.spawn(function()
    rs.RenderStepped:Connect(function()
 
    local character = localPlayer.Character
        if not character then
        a.Enabled = false
        return
    end


 



    if _G.enable  and getgun() and target.Character:FindFirstChild("BodyEffects") and target.Character:FindFirstChild("Head")  then
        a.Enabled = true
        b.Position =  target.Character:FindFirstChild("Head").Position
        c.Position = target.Character.BodyEffects[_G.method].Value ---edit this if some random ass game got some weird ass other name :palingface
    else
        a.Enabled = false
    end

    end)
end)

--Bind
--------------------------------------------------
getgenv().VelocityChanger = false
getgenv().Velocity = Vector3.new(200,700,200)
getgenv().KeyBind = "z"
--Velocity
--------------------------------------------------
local Players     = game:GetService("Players")
local RunService  = game:GetService("RunService")
local UIS = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer
local Character   = LocalPlayer.Character
local RootPart    = Character:FindFirstChild("HumanoidRootPart")


local Heartbeat, RStepped, Stepped = RunService.Heartbeat, RunService.RenderStepped, RunService.Stepped

LocalPlayer.CharacterAdded:Connect(function(NewCharacter)
    Character = NewCharacter
end)

local RVelocity, YVelocity = nil, 0.1
--Notify Function
--------------------------------------------------
function sendnotifi(message)


    game.StarterGui:SetCore("SendNotification", {
        Title = 'CAUGHT GGS';
        Text = message;
        Duration = "1";
    })
    end
--Notify
-------------------------------------------------
if _G.antilockenabled == true then
    UIS.InputBegan:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.Z then
            if VelocityChanger == false then
                sendnotifi("ANTI OFF")
            elseif VelocityChanger == true then
                sendnotifi("ANTI ON")
            end
        end
    end)
    
--Velocity Function
-------------------------------------------------

UIS.InputBegan:Connect(function(input)
if not (UIS:GetFocusedTextBox()) then
    if input.KeyCode == Enum.KeyCode.Z then
        if VelocityChanger then
            VelocityChanger = false
        else
            VelocityChanger = true
            task.spawn(function()
                    while VelocityChanger do
                        print("Running")
                        if (not RootPart) or (not RootPart.Parent) or (not RootPart.Parent.Parent) then
                            repeat task.wait() RootPart = Character:FindFirstChild("HumanoidRootPart") until RootPart ~= nil
                        else
                            RVelocity = RootPart.Velocity

                            RootPart.Velocity = type(Velocity) == "vector" and Velocity or Velocity(RVelocity)

                            RStepped:wait()

                            RootPart.Velocity = RVelocity
                        end
                    Heartbeat:wait()
                end
            end)
        end
        end
    end
end)
end
