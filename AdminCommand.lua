local CommandUILib = {}

function CommandUILib:Create()
	local Players = game:GetService("Players")
	local LocalPlayer = Players.LocalPlayer

	local gui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
	gui.Name = "CommandUI"
	gui.ResetOnSpawn = false

	local commands = {}

	-- UI Elements
	local mainFrame = Instance.new("Frame", gui)
	mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
	mainFrame.Size = UDim2.new(0.85, 0, 0.6, 0)
	mainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

	-- TopBar
	local topBar = Instance.new("Frame", mainFrame)
	topBar.Size = UDim2.new(1, 0, 0.1, 0)
	topBar.BackgroundColor3 = Color3.fromRGB(0, 120, 215)

	local minus = Instance.new("TextButton", topBar)
	minus.Text = "-"
	minus.Font = Enum.Font.SourceSansBold
	minus.TextColor3 = Color3.new(0, 0, 0)
	minus.Size = UDim2.new(0, 30, 1, 0)
	minus.BackgroundTransparency = 0.5
	minus.BackgroundColor3 = Color3.new(1, 1, 1)

	local close = Instance.new("TextButton", topBar)
	close.Text = "X"
	close.Font = Enum.Font.SourceSansBold
	close.TextColor3 = Color3.new(0, 0, 0)
	close.Size = UDim2.new(0, 30, 1, 0)
	close.Position = UDim2.new(0, 30, 0, 0)
	close.BackgroundTransparency = 0.5
	close.BackgroundColor3 = Color3.new(1, 1, 1)

	local title = Instance.new("TextLabel", topBar)
	title.Text = "Command"
	title.Font = Enum.Font.SourceSansBold
	title.TextColor3 = Color3.new(1, 1, 1)
	title.TextXAlignment = Enum.TextXAlignment.Left
	title.Size = UDim2.new(1, -60, 1, 0)
	title.Position = UDim2.new(0, 60, 0, 0)
	title.BackgroundTransparency = 1

	-- Header
	local header = Instance.new("Frame", mainFrame)
	header.Size = UDim2.new(1, 0, 0.08, 0)
	header.Position = UDim2.new(0, 0, 0.1, 0)
	header.BackgroundColor3 = topBar.BackgroundColor3
	header.BackgroundTransparency = 0.4

	local leftBtn = Instance.new("TextButton", header)
	leftBtn.Text = "<"
	leftBtn.Size = UDim2.new(0, 30, 1, 0)
	leftBtn.BackgroundTransparency = 1
	leftBtn.TextColor3 = Color3.new(1, 1, 1)

	local rightBtn = Instance.new("TextButton", header)
	rightBtn.Text = ">"
	rightBtn.Size = UDim2.new(0, 30, 1, 0)
	rightBtn.Position = UDim2.new(1, -30, 0, 0)
	rightBtn.BackgroundTransparency = 1
	rightBtn.TextColor3 = Color3.new(1, 1, 1)

	local centerTitle = Instance.new("TextLabel", header)
	centerTitle.Text = "Commands"
	centerTitle.Font = Enum.Font.SourceSansBold
	centerTitle.TextColor3 = Color3.new(1, 1, 1)
	centerTitle.TextScaled = true
	centerTitle.Size = UDim2.new(0.6, 0, 1, 0)
	centerTitle.Position = UDim2.new(0.2, 0, 0, 0)
	centerTitle.BackgroundTransparency = 1

	-- Textbox
	local textbox = Instance.new("TextBox", mainFrame)
	textbox.Size = UDim2.new(1, 0, 0.08, 0)
	textbox.Position = UDim2.new(0, 0, 0.18, 0)
	textbox.BackgroundColor3 = topBar.BackgroundColor3
	textbox.BackgroundTransparency = 0.6
	textbox.PlaceholderText = "Enter command..."
	textbox.TextColor3 = Color3.new(1, 1, 1)
	textbox.Font = Enum.Font.SourceSans
	textbox.TextScaled = true

	-- ScrollFrame
	local scroll = Instance.new("ScrollingFrame", mainFrame)
	scroll.Position = UDim2.new(0, 0, 0.26, 0)
	scroll.Size = UDim2.new(1, 0, 0.74, 0)
	scroll.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
	scroll.ScrollBarThickness = 6
	scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
	scroll.ScrollingDirection = Enum.ScrollingDirection.Y

	local layout = Instance.new("UIListLayout", scroll)
	layout.Padding = UDim.new(0, 5)
	layout.SortOrder = Enum.SortOrder.LayoutOrder

	-- Command Functions
	local function AddCommand(name, func)
		local btn = Instance.new("TextButton")
		btn.Text = name
		btn.Size = UDim2.new(1, -10, 0, 30)
		btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
		btn.TextColor3 = Color3.new(1, 1, 1)
		btn.Font = Enum.Font.SourceSans
		btn.TextScaled = true
		btn.Parent = scroll
		commands[name:lower()] = func
	end

	local function RefreshCommandList()
		scroll:ClearAllChildren()
		layout.Parent = scroll
		for name in pairs(commands) do
			local btn = Instance.new("TextButton")
			btn.Text = name
			btn.Size = UDim2.new(1, -10, 0, 30)
			btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
			btn.TextColor3 = Color3.new(1, 1, 1)
			btn.Font = Enum.Font.SourceSans
			btn.TextScaled = true
			btn.Parent = scroll
		end
	end

	-- Command Trigger
	textbox.FocusLost:Connect(function(enter)
		if enter then
			local input = textbox.Text:lower()
			if commands[input] then
				commands[input]()
			end
			textbox.Text = ""
		end
	end)

	-- Tab Buttons
	rightBtn.MouseButton1Click:Connect(function()
		scroll:ClearAllChildren()
		layout.Parent = scroll
		for _, name in pairs({"clude80", "paulparasplaythis"}) do
			local id = Players:GetUserIdFromNameAsync(name)
			local thumb = Players:GetUserThumbnailAsync(id, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100)
			local img = Instance.new("ImageLabel")
			img.Image = thumb
			img.Size = UDim2.new(0, 100, 0, 100)
			img.BackgroundTransparency = 1
			img.Parent = scroll
		end
	end)

	leftBtn.MouseButton1Click:Connect(function()
		RefreshCommandList()
	end)

	-- Close/Minimize
	close.MouseButton1Click:Connect(function()
		gui:Destroy()
	end)
	minus.MouseButton1Click:Connect(function()
		mainFrame.Visible = not mainFrame.Visible
	end)

	-- Return API
	return {
		AddCommand = AddCommand,
		Refresh = RefreshCommandList
	}
end

return CommandUILib
