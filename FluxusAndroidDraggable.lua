--// Credits to the Owner

getgenv().notifyme2 = nil -- true/false

if not game:IsLoaded() then
    game.Loaded:Wait()
end


if signal_ then signal_:Disconnect() else end

local RS = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local me = game:GetService("Players").LocalPlayer

local FluxUI = game:GetService("CoreGui"):FindFirstChild("FluxusAndroidUI") or FluxUI
local Container = FluxUI.Container
local ToggleBtn = Container.ToggleBtn
local Border = ToggleBtn.Border
local Icon = ToggleBtn.Icon
local MainUI = Container:FindFirstChild("MainUI") or Container:FindFirstChild("MainUIImage")

local services = setmetatable({}, {
	__index = function(_, k)
	k = (k == "InputService" and "UserInputService") or k
	return game:GetService(k)
	end
})

local client = services.Players.LocalPlayer

local Utility = {}

function Utility.connect(signal, callback)
    local connection = signal:Connect(callback)
    
    return connection
end

local Fluxdrag
function Utility.dragify(import,object, bool)
    local start, objectposition, dragging, currentpos, hasdragged
    
    UserInputService.InputBegan:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and not hasdragged and dragoutline then dragoutline.Visible = false; hasdragged = true end
    end)
    
    local Disabled = false
    
    import.InputBegan:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
            dragging = true
            if bool then end
            start = input.Position
            if dragoutline then
                dragoutline.Visible = true
            end
            objectposition = object.Position
        end
    end)
    
    Utility.connect(services.InputService.InputChanged, function(input)
        if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) and dragging then
            currentpos = UDim2.new(objectposition.X.Scale, objectposition.X.Offset + (input.Position - start).X, objectposition.Y.Scale, objectposition.Y.Offset + (input.Position - start).Y)
            if dragoutline then
                dragoutline.Position = currentpos
            else
                object.Position = currentpos
            end
		end
    end)
    
    Utility.connect(services.InputService.InputEnded, function(input)
        if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and dragging then
	dragging = false
	if bool then end
	if dragoutline then
	dragoutline.Visible = false
	end
	if currentpos then
	object.Position = currentpos
	end
	end
    end)
    
    if bool then
        local Down = false
        ToggleBtn.ClickHandler.MouseButton1Down:Connect(function()
            Down = true
            local time = os.clock()
            repeat task.wait() until not Down
            time = os.clock()-time
            if time < .15 then
                ToggleBtn.Visible = false
                MainUI.Visible = true
            end
        end)
        ToggleBtn.ClickHandler.MouseButton1Up:Connect(function()
            Down = false
        end)
    end
end

for i, v in pairs(getconnections(ToggleBtn.ClickHandler.MouseButton1Click)) do
    Fluxdrag = v
    v:Disable()
end

MainUI.Active = true

Utility.dragify(MainUI,MainUI)

MainUI.Tabs.Active = false

Utility.dragify(ToggleBtn,ToggleBtn,true)

for i, ToggleBtn in pairs(ToggleBtn: GetChildren ()) do
    if not ToggleBtn.ClassName:match("UI") then
        ToggleBtn.Active = false
    end
end

ToggleBtn.Active = true

function Alpha(number)
    ToggleBtn.Transparency = number
    Border.Transparency = number
    Icon.ImageTransparency = number
end


function Colorize(color)
    local main = math.clamp(color,0,200)
    local highlight = math.clamp(color*1.275,0,255)
    local dark = math.clamp(color*0.725,0,255)
    
    return main, highlight, dark
end


local HF,SF = false,false

local S,E = pcall(function() -- To prevent sending commands
    local LP = game:GetService('Players').LocalPlayer
    local PlayerScripts = LP ~= nil and LP:FindFirstChild('PlayerScripts') or nil
    local ChatScript = PlayerScripts ~= nil and PlayerScripts:FindFirstChild('ChatScript') or nil
    local ChatMain = ChatScript ~= nil and ChatScript:FindFirstChild('ChatMain') or nil
    
    if LP and ChatMain ~= nil then
        local Old, Chatted, OldChatted = nil, Instance.new('BindableEvent'), LP.Chatted;
        Chatted.Name = LP.Name..'_Chatted_Event'
        Old = hookmetamethod(game,"__namecall",function(self,...)
            local args = {
                ...
            }
            local method = getnamecallmethod()
            if (self == Chatted or self == OldChatted or tostring(self) == "SayMessageRequest") and method:lower() == "fireserver" then
                if args[1] == "/hf" then
                    HF = true
                    return Old(self,"")
                elseif args[1] == "/sf" then
                    SF = true
                    return Old(self,"")
                end
            end
            return Old(self,...)
        end)
    end
end)


if S then
    getgenv().signal_ = RS.RenderStepped:Connect(function()
        if HF then
            Alpha(1)
            HF = false
        elseif SF then
            Alpha(0)
            SF = false
        end
	end)
else
    getgenv().signal_ = me.Chatted:Connect(function(m)
        if m == "/hf" then
            Alpha(1)
        elseif m == "/sf" then
            Alpha(0)
        end
	end)
end

if getgenv().notifyme == true or getgenv().notifyme2 == true then
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Commands",
        Text = "/hf to hide Fluxus\n/sf to show Fluxus",
        Duration = 10
    })
else
    print("Commands\n/hf to hide Fluxus\n/sf to show Fluxus")
end
