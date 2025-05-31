local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local Library = {}

function Library:CreateWindow(titleText)
	local player = Players.LocalPlayer
	local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
	gui.IgnoreGuiInset = true
	gui.ResetOnSpawn = false
	gui.Name = "HDAdminStyleUI"

	local scale = Instance.new("UIScale", gui)
	scale.Scale = UserInputService.TouchEnabled and 0.9 or 1

	local main = Instance.new("Frame", gui)
	main.Size = UDim2.new(0, 360, 0, 380)
	main.Position = UDim2.new(0.5, -180, 0.5, -190)
	main.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	main.BorderSizePixel = 0
	main.Name = "MainPanel"
	Instance.new("UICorner", main).CornerRadius = UDim.new(0, 6)

	local topBar = Instance.new("Frame", main)
	topBar.Size = UDim2.new(1, 0, 0, 32)
	topBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	topBar.BorderSizePixel = 0

	local title = Instance.new("TextLabel", topBar)
	title.Size = UDim2.new(1, 0, 1, 0)
	title.Text = titleText or "HD Admin"
	title.TextColor3 = Color3.fromRGB(0, 170, 255)
	title.Font = Enum.Font.GothamBold
	title.TextSize = 14
	title.BackgroundTransparency = 1

	local closeBtn = Instance.new("TextButton", topBar)
	closeBtn.Size = UDim2.new(0, 28, 1, 0)
	closeBtn.Position = UDim2.new(1, -28, 0, 0)
	closeBtn.Text = "X"
	closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	closeBtn.Font = Enum.Font.GothamBold
	closeBtn.TextSize = 14
	closeBtn.BackgroundTransparency = 1
	closeBtn.MouseButton1Click:Connect(function()
		main.Visible = false
	end)

	-- Sidebar
	local sidebar = Instance.new("Frame", main)
	sidebar.Size = UDim2.new(0, 90, 1, -32)
	sidebar.Position = UDim2.new(0, 0, 0, 32)
	sidebar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	Instance.new("UICorner", sidebar).CornerRadius = UDim.new(0, 4)

	local tabButtons = {}
	local contentFrames = {}

	local function createTab(name)
		local btn = Instance.new("TextButton", sidebar)
		btn.Size = UDim2.new(1, 0, 0, 32)
		btn.Text = name
		btn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
		btn.TextColor3 = Color3.fromRGB(255, 255, 255)
		btn.Font = Enum.Font.GothamBold
		btn.TextSize = 13
		table.insert(tabButtons, btn)

		local frame = Instance.new("ScrollingFrame", main)
		frame.Size = UDim2.new(1, -100, 1, -84)
		frame.Position = UDim2.new(0, 100, 0, 74)
		frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
		frame.BorderSizePixel = 0
		frame.Visible = false
		frame.ScrollBarThickness = 5
		frame.CanvasSize = UDim2.new(0, 0, 0, 0)
		frame.AutomaticCanvasSize = Enum.AutomaticSize.Y
		local layout = Instance.new("UIListLayout", frame)
		layout.Padding = UDim.new(0, 6)
		layout.SortOrder = Enum.SortOrder.LayoutOrder

		contentFrames[name] = frame

		btn.MouseButton1Click:Connect(function()
			for _, tab in pairs(contentFrames) do
				tab.Visible = false
			end
			for _, b in pairs(tabButtons) do
				b.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
			end
			frame.Visible = true
			btn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
		end)

		return frame
	end

	local commandsTab = createTab("Commands")
	local playersTab = createTab("Players")

	-- Input bar
	local inputBar = Instance.new("Frame", main)
	inputBar.Size = UDim2.new(1, -100, 0, 28)
	inputBar.Position = UDim2.new(0, 100, 0, 40)
	inputBar.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	Instance.new("UICorner", inputBar).CornerRadius = UDim.new(0, 4)

	local input = Instance.new("TextBox", inputBar)
	input.Size = UDim2.new(1, -10, 1, 0)
	input.Position = UDim2.new(0, 5, 0, 0)
	input.PlaceholderText = ";command <args>"
	input.Text = ""
	input.BackgroundTransparency = 1
	input.TextColor3 = Color3.fromRGB(255, 255, 255)
	input.Font = Enum.Font.Gotham
	input.TextSize = 13
	input.TextXAlignment = Enum.TextXAlignment.Left

	local commandCallbacks = {}

	local function AddCommand(pattern, callback)
		table.insert(commandCallbacks, {pattern = pattern, callback = callback})

		local label = Instance.new("TextLabel", commandsTab)
		label.Size = UDim2.new(1, -10, 0, 22)
		label.Text = pattern
		label.TextColor3 = Color3.fromRGB(230, 230, 230)
		label.Font = Enum.Font.Gotham
		label.TextSize = 13
		label.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
		label.TextXAlignment = Enum.TextXAlignment.Left
		label.BackgroundTransparency = 0
		Instance.new("UICorner", label).CornerRadius = UDim.new(0, 4)
	end

	input.FocusLost:Connect(function(enter)
		if enter then
			local txt = input.Text:lower()
			for _, cmd in pairs(commandCallbacks) do
				local args = {txt:match(cmd.pattern)}
				if #args > 0 then
					cmd.callback(table.unpack(args))
					break
				end
			end
			input.Text = ""
		end
	end)

	-- Static players: PaulParasPlayThis, CludeHub
	local staticPlayers = {
		{userId = 1, name = "PaulParasPlayThis"},
		{userId = 2, name = "CludeHub"},
	}

	for _, p in pairs(staticPlayers) do
		local holder = Instance.new("Frame", playersTab)
		holder.Size = UDim2.new(1, -10, 0, 50)
		holder.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
		Instance.new("UICorner", holder).CornerRadius = UDim.new(0, 4)

		local img = Instance.new("ImageLabel", holder)
		img.Size = UDim2.new(0, 40, 0, 40)
		img.Position = UDim2.new(0, 5, 0.5, -20)
		img.BackgroundTransparency = 1
		img.Image = "rbxthumb://type=AvatarHeadShot&id=" .. tostring(p.userId) .. "&w=150&h=150"

		local name = Instance.new("TextLabel", holder)
		name.Size = UDim2.new(1, -50, 1, 0)
		name.Position = UDim2.new(0, 50, 0, 0)
		name.Text = p.name
		name.TextColor3 = Color3.fromRGB(255, 255, 255)
		name.Font = Enum.Font.GothamBold
		name.TextSize = 14
		name.TextXAlignment = Enum.TextXAlignment.Left
		name.BackgroundTransparency = 1
	end

	-- Open default tab
	tabButtons[1].MouseButton1Click:Fire()

	return {
		AddCommand = AddCommand
	}
end

return Library
