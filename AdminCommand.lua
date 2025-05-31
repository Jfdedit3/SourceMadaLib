local Library = {}

function Library:CreateWindow(titleText)
	local player = game.Players.LocalPlayer

	local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
	gui.IgnoreGuiInset = true
	gui.ResetOnSpawn = false
	gui.Name = "ExploitUI"

	local uiScale = Instance.new("UIScale", gui)
	uiScale.Scale = game:GetService("UserInputService").TouchEnabled and 0.9 or 1

	local main = Instance.new("Frame", gui)
	main.Size = UDim2.new(0, 310, 0, 340)
	main.Position = UDim2.new(0.5, -155, 0.5, -170)
	main.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
	main.BorderSizePixel = 0
	main.Name = "MainPanel"
	Instance.new("UICorner", main).CornerRadius = UDim.new(0, 6)

	local topBar = Instance.new("Frame", main)
	topBar.Size = UDim2.new(1, 0, 0, 32)
	topBar.BackgroundColor3 = Color3.fromRGB(18, 18, 18)

	local title = Instance.new("TextLabel", topBar)
	title.Size = UDim2.new(1, 0, 1, 0)
	title.Text = titleText or "COMMANDS"
	title.TextColor3 = Color3.fromRGB(255, 255, 255)
	title.Font = Enum.Font.GothamBold
	title.TextSize = 14
	title.BackgroundTransparency = 1

	local imageButton = Instance.new("ImageButton")
imageButton.Name = "cmdsOpenButton"
imageButton.BackgroundTransparency = 1
imageButton.Image = "rbxassetid://106862526260246"
imageButton.Size = UDim2.new(0.005, 42, 0.01, 42)
imageButton.Position = UDim2.new(0.211792737, 0, 0.1, 34)
imageButton.Draggable = true
imageButton.Active = true
imageButton.Selectable = true
imageButton.Parent = ScreenGui
imageButton.Visible = true

local uiCorner8 = Instance.new("UICorner")
uiCorner8.CornerRadius = openradius
uiCorner8.Parent = imageButton

	local closeBtn = Instance.new("TextButton", topBar)
	closeBtn.Size = UDim2.new(0, 28, 1, 0)
	closeBtn.Position = UDim2.new(1, -28, 0, 0)
	closeBtn.Text = "X"
	closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	closeBtn.Font = Enum.Font.GothamBold
	closeBtn.TextSize = 14
	closeBtn.BackgroundTransparency = 1

	imageButton.MouseButton1Click:Connect(function()
	if main and imageButton then
		main.Visible = true
		imageButton.Visible = false
	end
end)
	closeBtn.MouseButton1Click:Connect(function()
        if main and imageButton then
		main.Visible = false
		imageButton.Visible = true
	end
end)

	local inputBar = Instance.new("Frame", main)
	inputBar.Size = UDim2.new(1, -20, 0, 26)
	inputBar.Position = UDim2.new(0, 10, 0, 42)
	inputBar.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
	Instance.new("UICorner", inputBar).CornerRadius = UDim.new(0, 4)

	local icon = Instance.new("TextLabel", inputBar)
	icon.Size = UDim2.new(0, 20, 1, 0)
	icon.Position = UDim2.new(0, 4, 0, 0)
	icon.BackgroundTransparency = 1
	icon.Text = "💻"
	icon.TextColor3 = Color3.fromRGB(160, 160, 160)
	icon.Font = Enum.Font.Gotham
	icon.TextSize = 13

	local inputBox = Instance.new("TextBox", inputBar)
	inputBox.Size = UDim2.new(1, -30, 1, 0)
	inputBox.Position = UDim2.new(0, 26, 0, 0)
	inputBox.BackgroundTransparency = 1
	inputBox.Text = ""
	inputBox.PlaceholderText = ";command <args>"
	inputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
	inputBox.Font = Enum.Font.Gotham
	inputBox.TextSize = 13
	inputBox.TextXAlignment = Enum.TextXAlignment.Left
	inputBox.ClearTextOnFocus = false

	local scroll = Instance.new("ScrollingFrame", main)
	scroll.Size = UDim2.new(1, -20, 1, -80)
	scroll.Position = UDim2.new(0, 10, 0, 70)
	scroll.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
	scroll.BorderSizePixel = 0
	scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
	scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
	scroll.ScrollBarThickness = 5

	local layout = Instance.new("UIListLayout", scroll)
	layout.Padding = UDim.new(0, 4)
	layout.SortOrder = Enum.SortOrder.LayoutOrder

	local commandCallbacks = {}

	local function AddCommand(pattern, callback, parent)
		table.insert(commandCallbacks, {
			pattern = pattern,
			callback = callback
		})

		local cmdLabel = Instance.new("TextLabel")
		cmdLabel.Size = UDim2.new(1, -10, 0, 22)
		cmdLabel.Text = pattern
		cmdLabel.TextColor3 = Color3.fromRGB(210, 210, 210)
		cmdLabel.Font = Enum.Font.Gotham
		cmdLabel.TextSize = 12
		cmdLabel.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
		cmdLabel.TextXAlignment = Enum.TextXAlignment.Left
		Instance.new("UICorner", cmdLabel).CornerRadius = UDim.new(0, 3)
		cmdLabel.Parent = parent or scroll
	end

	local function AddList(name)
		local section = Instance.new("Frame", scroll)
		section.Size = UDim2.new(1, 0, 0, 28)
		section.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

		local header = Instance.new("TextButton", section)
		header.Size = UDim2.new(1, 0, 1, 0)
		header.Text = "  >  " .. name
		header.TextColor3 = Color3.fromRGB(200, 200, 200)
		header.Font = Enum.Font.Gotham
		header.TextSize = 13
		header.BackgroundTransparency = 1
		header.TextXAlignment = Enum.TextXAlignment.Left

		local content = Instance.new("Frame", scroll)
		content.Size = UDim2.new(1, 0, 0, 0)
		content.BackgroundTransparency = 1
		content.Visible = false

		local contentLayout = Instance.new("UIListLayout", content)
		contentLayout.SortOrder = Enum.SortOrder.LayoutOrder
		contentLayout.Padding = UDim.new(0, 4)

		header.MouseButton1Click:Connect(function()
			content.Visible = not content.Visible
			header.Text = (content.Visible and "  v  " or "  >  ") .. name
		end)

		return content
	end

	inputBox.FocusLost:Connect(function(enter)
		if enter then
			local input = inputBox.Text:lower()
			for _, cmd in ipairs(commandCallbacks) do
				local args = {input:match(cmd.pattern)}
				if #args > 0 then
					cmd.callback(table.unpack(args))
					break
				end
			end
			inputBox.Text = ""
		end
	end)

	return {
		AddList = AddList,
		AddCommand = AddCommand
	}
end

return Library
