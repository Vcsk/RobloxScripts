--game.Players.localPlayer:kick() --remove "--" to kick u self
 
--Auto execute highly recommended (use it)

gui = game.CoreGui.RobloxPromptGui.promptOverlay:WaitForChild("ErrorPrompt")

gui.Size = UDim2.new(0, 400, 0, 230)

leave = gui.MessageArea.ErrorFrame.ButtonArea.LeaveButton

gui.MessageArea.MessageAreaPadding.PaddingTop = UDim.new(0,-20)
gui.MessageArea.ErrorFrame.ErrorFrameLayout.Padding = UDim.new(0, 5)

gui.MessageArea.ErrorFrame.ButtonArea.ButtonLayout.CellPadding = UDim2.new(0, 0, 0, 5)

if not leave.Parent:FindFirstChild"Rejoin" then
rejoin = leave:Clone()
rejoin.Parent = leave.Parent
rejoin.Name="Rejoin"
rejoin.ButtonText.Text = "Rejoin"
end

Players = game:GetService("Players")
TeleportService = game:GetService("TeleportService")

rejoin.MouseButton1Click:Connect(function()
 if #Players:GetPlayers() <= 1 then
game.Players.localPlayer:kick("Rejoining...")
rejoin: destroy ()
wait(1)
  TeleportService:Teleport(game.PlaceId, Players.LocalPlayer)
 else
  TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, Players.LocalPlayer)
 end
end)
