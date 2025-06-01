-- Command UI Library

local CommandUI = {}

-- Setup UI
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "CommandUI"

local commands = {}

-- Main Frame
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 400, 0, 300)
frame.Position = UDim2.new(0.5, -200, 0.5, -150)
frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)

-- Title
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, -60, 0, 30)
title.Position = UDim2.new(0, 10, 0, 0)
title.BackgroundTransparency = 1
title.Text = "COMMANDS"
title.Font = Enum.Font.SourceSansBold
title.TextSize = 20
title.TextColor3 = Color3.new(1, 1, 1)
title.TextXAlignment = Enum.TextXAlignment.Left

-- Close Button
local close = Instance.new("TextButton", frame)
close.Size = UDim2.new(0, 30, 0, 30)
close.Position = UDim2.new(1, -30, 0, 0)
close.BackgroundTransparency = 1
close.Text = "X"
close.TextColor3 = Color3.new(1, 1, 1)
close.TextSize = 18
close.Font = Enum.Font.SourceSansBold
close.MouseButton1Click:Connect(function()
	gui:Destroy()
end)

-- Command Box
local box = Instance.new("TextBox", frame)
box.Size = UDim2.new(1, -20, 0, 30)
box.Position = UDim2.new(0, 10, 0, 40)
box.PlaceholderText = "Enter command..."
box.TextColor3 = Color3.new(1, 1, 1)
box.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
box.Font = Enum.Font.SourceSans
box.TextSize = 18
box.ClearTextOnFocus = false

-- Command List (for display)
local list = Instance.new("ScrollingFrame", frame)
list.Size = UDim2.new(1, -20, 1, -80)
list.Position = UDim2.new(0, 10, 0, 80)
list.CanvasSize = UDim2.new(0, 0, 0, 500)
list.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
list.ScrollBarThickness = 4

local layout = Instance.new("UIListLayout", list)
layout.Padding = UDim.new(0, 4)
layout.SortOrder = Enum.SortOrder.LayoutOrder

-- AddCommand API
function CommandUI:AddCommand(name, callback)
	commands[name:lower()] = callback

	local cmd = Instance.new("TextLabel", list)
	cmd.Size = UDim2.new(1, 0, 0, 30)
	cmd.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	cmd.Text = "  >  " .. name
	cmd.Font = Enum.Font.SourceSans
	cmd.TextSize = 16
	cmd.TextColor3 = Color3.new(1, 1, 1)
	cmd.TextXAlignment = Enum.TextXAlignment.Left
end

-- Run command on Enter
box.FocusLost:Connect(function(enterPressed)
	if not enterPressed then return end

	local input = box.Text:lower()
	box.Text = ""

	local args = input:split(" ")
	local command = args[1]
	table.remove(args, 1)

	if commands[command] then
		commands[command](unpack(args))
	else
		warn("Unknown command: " .. command)
	end
end)

return CommandUI
