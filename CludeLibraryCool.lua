-- ModuleScript: UILib
local UILib = {}

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "AdminGui"

local commands = {}

-- Main Frame
local frame = Instance.new("Frame")
frame.Name = "MainFrame"
frame.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
frame.Size = UDim2.new(0, 300, 0, 340)
frame.Position = UDim2.new(0.2, 149, 0, 0)
frame.Parent = gui

-- Top Bar
local topBar = Instance.new("Frame")
topBar.Name = "TopBar"
topBar.BackgroundColor3 = Color3.fromRGB(0, 130, 190)
topBar.BackgroundTransparency = 0.167
topBar.Size = UDim2.new(1, 0, 0, 43)
topBar.Parent = frame

local title = Instance.new("TextLabel")
title.Name = "WindowTitle"
title.BackgroundTransparency = 1
title.Text = "Commands"
title.Font = Enum.Font.BuilderSansBold
title.TextSize = 32
title.TextColor3 = Color3.new(1, 1, 1)
title.Size = UDim2.new(0, 200, 0, 43)
title.Position = UDim2.new(0.1, -18, 0, 0)
title.Parent = topBar

local hideBtn = Instance.new("TextButton")
hideBtn.Name = "HideButton"
hideBtn.Text = "-"
hideBtn.Size = UDim2.new(0, 43, 0, 39)
hideBtn.Position = UDim2.new(1, -92, 0, 2)
hideBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
hideBtn.BackgroundTransparency = 0.5
hideBtn.Font = Enum.Font.BuilderSansBold
hideBtn.TextSize = 32
hideBtn.TextColor3 = Color3.new(1, 1, 1)
hideBtn.Parent = topBar

local closeBtn = Instance.new("TextButton")
closeBtn.Name = "CloseButton"
closeBtn.Text = "x"
closeBtn.Size = UDim2.new(0, 43, 0, 39)
closeBtn.Position = UDim2.new(1, -45, 0, 2)
closeBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
closeBtn.BackgroundTransparency = 0.5
closeBtn.Font = Enum.Font.BuilderSansBold
closeBtn.TextSize = 32
closeBtn.TextColor3 = Color3.new(1, 1, 1)
closeBtn.Parent = topBar

closeBtn.MouseButton1Click:Connect(function()
	frame.Visible = false
end)

-- Bottom Tab Bar
local bottomBar = Instance.new("Frame")
bottomBar.Name = "BottomTopBar"
bottomBar.BackgroundColor3 = Color3.fromRGB(0, 130, 190)
bottomBar.BackgroundTransparency = 0.539
bottomBar.Size = UDim2.new(1, 0, 0, 43)
bottomBar.Position = UDim2.new(0, 0, 0, 43)
bottomBar.Parent = frame

local tabLabel = Instance.new("TextLabel")
tabLabel.Name = "TabTitle"
tabLabel.BackgroundTransparency = 1
tabLabel.Size = UDim2.new(1, 0, 0, 50)
tabLabel.Text = "Commands"
tabLabel.Font = Enum.Font.BuilderSansBold
tabLabel.TextSize = 32
tabLabel.TextColor3 = Color3.new(1, 1, 1)
tabLabel.Parent = bottomBar

-- Command TextBox
local commandBox = Instance.new("TextBox")
commandBox.Name = "CommandBox"
commandBox.Size = UDim2.new(1, 0, 0, 29)
commandBox.Position = UDim2.new(0, 0, 0, 87)
commandBox.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
commandBox.BorderSizePixel = 0
commandBox.Font = Enum.Font.SourceSans
commandBox.TextSize = 11
commandBox.TextColor3 = Color3.new(1, 1, 1)
commandBox.Text = ""
commandBox.ClearTextOnFocus = false
commandBox.Parent = frame

-- Command List Panel
local commandList = Instance.new("ScrollingFrame")
commandList.Name = "CommandList"
commandList.Position = UDim2.new(0, 0, 0, 120)
commandList.Size = UDim2.new(1, 0, 1, -120)
commandList.BackgroundTransparency = 1
commandList.BorderSizePixel = 0
commandList.ScrollBarThickness = 6
commandList.CanvasSize = UDim2.new(0, 0, 0, 0)
commandList.Parent = frame

local layout = Instance.new("UIListLayout")
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.Parent = commandList

-- Update Canvas Size
local function updateCanvas()
	task.wait()
	commandList.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y)
end
layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(updateCanvas)

-- AddCommandList
function UILib.AddCommandList(usage)
	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(1, -8, 0, 20)
	label.BackgroundTransparency = 1
	label.TextColor3 = Color3.new(1, 1, 1)
	label.TextSize = 14
	label.Font = Enum.Font.SourceSans
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.Text = "> " .. usage
	label.Parent = commandList
end

-- AddCommand
function UILib.AddCommand(command, callback)
	commands[command:lower()] = callback
end

-- Handle input
commandBox.FocusLost:Connect(function(enter)
	if not enter then return end

	local input = commandBox.Text
	local args = input:split(" ")
	local cmd = args[1]:lower()
	table.remove(args, 1)
	local joinedArgs = table.concat(args, " ")

	local func = commands[cmd]
	if func then
		func(joinedArgs)
	end

	commandBox.Text = ""
end)

return UILib
