repeat
    wait()
until game:IsLoaded() and game.Players.LocalPlayer.Character:FindFirstChild("FULLY_LOADED_CHAR") and game.Players.LocalPlayer.PlayerGui.MainScreenGui:FindFirstChild("AnimationPack") and game.Players.LocalPlayer.PlayerGui.MainScreenGui:FindFirstChild("AnimationPlusPack")

if game.ReplicatedStorage.ClientAnimations:FindFirstChild("Lean") then
    game.ReplicatedStorage.ClientAnimations.Lean:Destroy()
end

if game.ReplicatedStorage.ClientAnimations:FindFirstChild("Lay") then
    game.ReplicatedStorage.ClientAnimations.Lay:Destroy()
end

if game.ReplicatedStorage.ClientAnimations:FindFirstChild("Dance1") then
    game.ReplicatedStorage.ClientAnimations.Dance1:Destroy()
end

if game.ReplicatedStorage.ClientAnimations:FindFirstChild("Dance2") then
    game.ReplicatedStorage.ClientAnimations.Dance2:Destroy()
end

if game.ReplicatedStorage.ClientAnimations:FindFirstChild("Greet") then
    game.ReplicatedStorage.ClientAnimations.Greet:Destroy()
end

if game.ReplicatedStorage.ClientAnimations:FindFirstChild("Chest Pump") then
    game.ReplicatedStorage.ClientAnimations["Chest Pump"]:Destroy()
end

if game.ReplicatedStorage.ClientAnimations:FindFirstChild("Praying") then
    game.ReplicatedStorage.ClientAnimations.Praying:Destroy()
end

if game.ReplicatedStorage.ClientAnimations:FindFirstChild("TheDefault") then
    game.ReplicatedStorage.ClientAnimations.TheDefault:Destroy()
end

if game.ReplicatedStorage.ClientAnimations:FindFirstChild("Sturdy") then
    game.ReplicatedStorage.ClientAnimations.Sturdy:Destroy()
end

if game.ReplicatedStorage.ClientAnimations:FindFirstChild("Rossy") then
    game.ReplicatedStorage.ClientAnimations.Rossy:Destroy()
end

if game.ReplicatedStorage.ClientAnimations:FindFirstChild("Griddy") then
    game.ReplicatedStorage.ClientAnimations.Griddy:Destroy()
end

if game.ReplicatedStorage.ClientAnimations:FindFirstChild("TPose") then
    game.ReplicatedStorage.ClientAnimations.TPose:Destroy()
end

if game.ReplicatedStorage.ClientAnimations:FindFirstChild("SpeedBlitz") then
    game.ReplicatedStorage.ClientAnimations.SpeedBlitz:Destroy()
end

local Animations = game.ReplicatedStorage.ClientAnimations

local LeanAnimation = Instance.new("Animation", Animations)
LeanAnimation.Name = "Lean"
LeanAnimation.AnimationId = "rbxassetid://3152375249"

local LayAnimation = Instance.new("Animation", Animations)
LayAnimation.Name = "Lay"
LayAnimation.AnimationId = "rbxassetid://3152378852"

local Dance1Animation = Instance.new("Animation", Animations)
Dance1Animation.Name = "Dance1"
Dance1Animation.AnimationId = "rbxassetid://3189773368"

local Dance2Animation = Instance.new("Animation", Animations)
Dance2Animation.Name = "Dance2"
Dance2Animation.AnimationId = "rbxassetid://3189776546"

local GreetAnimation = Instance.new("Animation", Animations)
GreetAnimation.Name = "Greet"
GreetAnimation.AnimationId = "rbxassetid://3189777795"

local ChestPumpAnimation = Instance.new("Animation", Animations)
ChestPumpAnimation.Name = "Chest Pump"
ChestPumpAnimation.AnimationId = "rbxassetid://3189779152"

local PrayingAnimation = Instance.new("Animation", Animations)
PrayingAnimation.Name = "Praying"
PrayingAnimation.AnimationId = "rbxassetid://3487719500"

local TheDefaultAnimation = Instance.new("Animation", Animations)
TheDefaultAnimation.Name = "TheDefault"
TheDefaultAnimation.AnimationId = "rbxassetid://11710529975"

local SturdyAnimation = Instance.new("Animation", Animations)
SturdyAnimation.Name = "Sturdy"
SturdyAnimation.AnimationId = "rbxassetid://11710524717"

local RossyAnimation = Instance.new("Animation", Animations)
RossyAnimation.Name = "Rossy"
RossyAnimation.AnimationId = "rbxassetid://11710527244"

local GriddyAnimation = Instance.new("Animation", Animations)
GriddyAnimation.Name = "Griddy"
GriddyAnimation.AnimationId = "rbxassetid://11710529220"

local TPoseAnimation = Instance.new("Animation", Animations)
TPoseAnimation.Name = "TPose"
TPoseAnimation.AnimationId = "rbxassetid://11710524200"

local SpeedBlitzAnimation = Instance.new("Animation", Animations)
SpeedBlitzAnimation.Name = "SpeedBlitz"
SpeedBlitzAnimation.AnimationId = "rbxassetid://11710541744"

function AnimationPack(Character)
    Character:WaitForChild'Humanoid'
    repeat
        wait()
    until game.Players.LocalPlayer.Character:FindFirstChild("FULLY_LOADED_CHAR") and game.Players.LocalPlayer.PlayerGui.MainScreenGui:FindFirstChild("AnimationPack") and game.Players.LocalPlayer.PlayerGui.MainScreenGui:FindFirstChild("AnimationPlusPack")

    local AnimationPack = game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.AnimationPack
    local AnimationPackPlus = game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.AnimationPlusPack
    local ScrollingFrame = AnimationPack.ScrollingFrame
    local CloseButton = AnimationPack.CloseButton
    local ScrollingFramePlus = AnimationPackPlus.ScrollingFrame
    local CloseButtonPlus = AnimationPackPlus.CloseButton

    local Lean = game:GetService("Players").LocalPlayer.Character.Humanoid:LoadAnimation(LeanAnimation)

    local Lay = game:GetService("Players").LocalPlayer.Character.Humanoid:LoadAnimation(LayAnimation)

    local Dance1 = game:GetService("Players").LocalPlayer.Character.Humanoid:LoadAnimation(Dance1Animation)

    local Dance2 = game:GetService("Players").LocalPlayer.Character.Humanoid:LoadAnimation(Dance2Animation)

    local Greet = game:GetService("Players").LocalPlayer.Character.Humanoid:LoadAnimation(GreetAnimation)

    local ChestPump = game:GetService("Players").LocalPlayer.Character.Humanoid:LoadAnimation(ChestPumpAnimation)

    local Praying = game:GetService("Players").LocalPlayer.Character.Humanoid:LoadAnimation(PrayingAnimation)

    local TheDefault = game:GetService("Players").LocalPlayer.Character.Humanoid:LoadAnimation(TheDefaultAnimation)

    local Sturdy = game:GetService("Players").LocalPlayer.Character.Humanoid:LoadAnimation(SturdyAnimation)

    local Rossy = game:GetService("Players").LocalPlayer.Character.Humanoid:LoadAnimation(RossyAnimation)

    local Griddy = game:GetService("Players").LocalPlayer.Character.Humanoid:LoadAnimation(GriddyAnimation)

    local TPose = game:GetService("Players").LocalPlayer.Character.Humanoid:LoadAnimation(TPoseAnimation)

    local SpeedBlitz = game:GetService("Players").LocalPlayer.Character.Humanoid:LoadAnimation(SpeedBlitzAnimation)

    AnimationPack.Visible = true

    AnimationPackPlus.Visible = true

    ScrollingFrame.UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

    ScrollingFramePlus.UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

    for i,v in pairs(ScrollingFrame:GetChildren()) do
        if v.Name == "TextButton" then
            if v.Text == "Lean" then
                v.Name = "LeanButton"
            end
        end
    end

    for i,v in pairs(ScrollingFrame:GetChildren()) do
        if v.Name == "TextButton" then
            if v.Text == "Lay" then
                v.Name = "LayButton"
            end
        end
    end

    for i,v in pairs(ScrollingFrame:GetChildren()) do
        if v.Name == "TextButton" then
            if v.Text == "Dance1" then
                v.Name = "Dance1Button"
            end
        end
    end

    for i,v in pairs(ScrollingFrame:GetChildren()) do
        if v.Name == "TextButton" then
            if v.Text == "Dance2" then
                v.Name = "Dance2Button"
            end
        end
    end

    for i,v in pairs(ScrollingFrame:GetChildren()) do
        if v.Name == "TextButton" then
            if v.Text == "Greet" then
                v.Name = "GreetButton"
            end
        end
    end

    for i,v in pairs(ScrollingFrame:GetChildren()) do
        if v.Name == "TextButton" then
            if v.Text == "Chest Pump" then
                v.Name = "ChestPumpButton"
            end
        end
    end

    for i,v in pairs(ScrollingFrame:GetChildren()) do
        if v.Name == "TextButton" then
            if v.Text == "Praying" then
                v.Name = "PrayingButton"
            end
        end
    end

    for i,v in pairs(ScrollingFramePlus:GetChildren()) do
        if v.Name == "TextButton" then
            if v.Text == "The Default" then
                v.Name = "TheDefaultButton"
            end
        end
    end

    for i,v in pairs(ScrollingFramePlus:GetChildren()) do
        if v.Name == "TextButton" then
            if v.Text == "Sturdy" then
                v.Name = "SturdyButton"
            end
        end
    end

    for i,v in pairs(ScrollingFramePlus:GetChildren()) do
        if v.Name == "TextButton" then
            if v.Text == "Rossy" then
                v.Name = "RossyButton"
            end
        end
    end

    for i,v in pairs(ScrollingFramePlus:GetChildren()) do
        if v.Name == "TextButton" then
            if v.Text == "Griddy" then
                v.Name = "GriddyButton"
            end
        end
    end

    for i,v in pairs(ScrollingFramePlus:GetChildren()) do
        if v.Name == "TextButton" then
            if v.Text == "T Pose" then
                v.Name = "TPoseButton"
            end
        end
    end

    for i,v in pairs(ScrollingFramePlus:GetChildren()) do
        if v.Name == "TextButton" then
            if v.Text == "Speed Blitz" then
                v.Name = "SpeedBlitzButton"
            end
        end
    end

    function Stop()
        Lean:Stop()
        Lay:Stop()
        Dance1:Stop()
        Dance2:Stop()
        Greet:Stop()
        ChestPump:Stop()
        Praying:Stop()
        TheDefault:Stop()
        Sturdy:Stop()
        Rossy:Stop()
        Griddy:Stop()
        TPose:Stop()
        SpeedBlitz:Stop()
    end

    --credit Zackary#1011 (again cuz someone might skid this to their script)

    local LeanTextButton = ScrollingFrame.LeanButton
    local LayTextButton = ScrollingFrame.LayButton
    local Dance1TextButton = ScrollingFrame.Dance1Button
    local Dance2TextButton = ScrollingFrame.Dance2Button
    local GreetTextButton = ScrollingFrame.GreetButton
    local ChestPumpTextButton = ScrollingFrame.ChestPumpButton
    local PrayingTextButton = ScrollingFrame.PrayingButton
    local TheDefaultTextButton = ScrollingFramePlus.TheDefaultButton
    local SturdyTextButton = ScrollingFramePlus.SturdyButton
    local RossyTextButton = ScrollingFramePlus.RossyButton
    local GriddyTextButton = ScrollingFramePlus.GriddyButton
    local TPoseTextButton = ScrollingFramePlus.TPoseButton
    local SpeedBlitzTextButton = ScrollingFramePlus.SpeedBlitzButton

    AnimationPack.MouseButton1Click:Connect(function()
        if ScrollingFrame.Visible == false then
            ScrollingFrame.Visible = true
            CloseButton.Visible = true
            AnimationPackPlus.Visible = false
        end
    end)
    AnimationPackPlus.MouseButton1Click:Connect(function()
        if ScrollingFramePlus.Visible == false then
            ScrollingFramePlus.Visible = true
            CloseButtonPlus.Visible = true
            AnimationPack.Visible = false
        end
    end)
    CloseButton.MouseButton1Click:Connect(function()
        if ScrollingFrame.Visible == true then
            ScrollingFrame.Visible = false
            CloseButton.Visible = false
            AnimationPackPlus.Visible = true
        end
    end)
    CloseButtonPlus.MouseButton1Click:Connect(function()
        if ScrollingFramePlus.Visible == true then
            ScrollingFramePlus.Visible = false
            CloseButtonPlus.Visible = false
            AnimationPack.Visible = true
        end
    end)

    LeanTextButton.MouseButton1Click:Connect(function()
        Stop()
        Lean:Play()
    end)
    LayTextButton.MouseButton1Click:Connect(function()
        Stop()
        Lay:Play()
    end)
    Dance1TextButton.MouseButton1Click:Connect(function()
        Stop()
        Dance1:Play()
    end)
    Dance2TextButton.MouseButton1Click:Connect(function()
        Stop()
        Dance2:Play()
    end)
    GreetTextButton.MouseButton1Click:Connect(function()
        Stop()
        Greet:Play()
    end)
    ChestPumpTextButton.MouseButton1Click:Connect(function()
        Stop()
        ChestPump:Play()
    end)
    PrayingTextButton.MouseButton1Click:Connect(function()
        Stop()
        Praying:Play()
    end)
    TheDefaultTextButton.MouseButton1Click:Connect(function()
        Stop()
        TheDefault:Play()
    end)
    SturdyTextButton.MouseButton1Click:Connect(function()
        Stop()
        Sturdy:Play()
    end)
    RossyTextButton.MouseButton1Click:Connect(function()
        Stop()
        Rossy:Play()
    end)
    GriddyTextButton.MouseButton1Click:Connect(function()
        Stop()
        Griddy:Play()
    end)
    TPoseTextButton.MouseButton1Click:Connect(function()
        Stop()
        TPose:Play()
    end)
    SpeedBlitzTextButton.MouseButton1Click:Connect(function()
        Stop()
        SpeedBlitz:Play()
    end)

    game:GetService("Players").LocalPlayer.Character.Humanoid.Running:Connect(function()
        Stop()
    end)

    game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function()
        Stop()
    end)
end
AnimationPack(game.Players.LocalPlayer.Character)
game.Players.LocalPlayer.CharacterAdded:Connect(AnimationPack)
