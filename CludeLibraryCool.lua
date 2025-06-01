local Library = {}

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- UI Setup
local AdminGui = Instance.new("ScreenGui", playerGui)
AdminGui.Name = "AdminGui"
AdminGui.ResetOnSpawn = false

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 300, 0, 380)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -190)
MainFrame.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = AdminGui

-- Top Bar
local TopBar = Instance.new("Frame", MainFrame)
TopBar.Size = UDim2.new(1, 0, 0, 43)
TopBar.BackgroundColor3 = Color3.fromRGB(0, 130, 190)

local WindowTitle = Instance.new("TextLabel", TopBar)
WindowTitle.Size = UDim2.new(0, 200, 1, 0)
WindowTitle.Position = UDim2.new(0, 10, 0, 0)
WindowTitle.BackgroundTransparency = 1
WindowTitle.Text = "Commands"
WindowTitle.Font = Enum.Font.BuilderSansBold
WindowTitle.TextSize = 32
WindowTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
WindowTitle.TextXAlignment = Enum.TextXAlignment.Left

local CloseButton = Instance.new("TextButton", TopBar)
CloseButton.Size = UDim2.new(0, 43, 0, 39)
CloseButton.Position = UDim2.new(1, -45, 0, 2)
CloseButton.Text = "X"
CloseButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
CloseButton.BackgroundTransparency = 0.5
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.Font = Enum.Font.BuilderSansBold
CloseButton.TextSize = 32
CloseButton.MouseButton1Click:Connect(function()
	AdminGui:Destroy()
end)

-- Input Box
local CommandBox = Instance.new("TextBox", MainFrame)
CommandBox.Position = UDim2.new(0, 0, 0, 50)
CommandBox.Size = UDim2.new(1, 0, 0, 30)
CommandBox.PlaceholderText = "Type a command (e.g., fly)"
CommandBox.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
CommandBox.TextColor3 = Color3.fromRGB(255, 255, 255)
CommandBox.Font = Enum.Font.SourceSans
CommandBox.TextSize = 14
CommandBox.ClearTextOnFocus = false

-- Command List
local CommandListFrame = Instance.new("ScrollingFrame", MainFrame)
CommandListFrame.Position = UDim2.new(0, 0, 0, 85)
CommandListFrame.Size = UDim2.new(1, 0, 1, -90)
CommandListFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
CommandListFrame.ScrollBarThickness = 6
CommandListFrame.BackgroundTransparency = 1

local UIListLayout = Instance.new("UIListLayout", CommandListFrame)
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

-- Command System
local commands = {}

function Library.AddCommandList(usageText)
	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(1, -10, 0, 25)
	label.BackgroundTransparency = 1
	label.TextColor3 = Color3.fromRGB(255, 255, 255)
	label.Text = usageText
	label.Font = Enum.Font.SourceSans
	label.TextSize = 14
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.Parent = CommandListFrame
	CommandListFrame.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 5)
end

function Library.AddCommand(name, callback)
	commands[name:lower()] = callback
end

-- Command Execution
CommandBox.FocusLost:Connect(function(enterPressed)
	if not enterPressed then return end
	local text = CommandBox.Text:lower()
	local commandName = text:match("^(%S+)")
	if commandName and commands[commandName] then
		commands[commandName](text)
	end
	CommandBox.Text = ""
end)

return Library
