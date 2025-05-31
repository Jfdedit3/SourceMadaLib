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
	main.Size = UDim2.new(0, 310, 0, 380)
	main.Position = UDim2.new(0.5, -155, 0.5, -190)
	main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	main.BorderSizePixel = 0
	main.Name = "MainPanel"
	Instance.new("UICorner", main).CornerRadius = UDim.new(0, 6)

	local topBar = Instance.new("Frame", main)
	topBar.Size = UDim2.new(1, 0, 0, 32)
	topBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	topBar.BorderSizePixel = 0

	local title = Instance.new("TextLabel", topBar)
	title.Size = UDim2.new(1, 0, 1, 0)
	title.Text = titleText or "COMMANDS"
	title.TextColor3 = Color3.fromRGB(255, 255, 255)
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

	local inputBar = Instance.new("Frame", main)
	inputBar.Size = UDim2.new(1, -20, 0, 26)
	inputBar.Position = UDim2.new(0, 10, 0, 42)
	inputBar.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
	inputBar.BorderSizePixel = 0
	Instance.new("UICorner", inputBar).CornerRadius = UDim.new(0, 4)

	local icon = Instance.new("TextLabel", inputBar)
	icon.Size = UDim2.new(0, 20, 1, 0)
	icon.Position = UDim2.new(0, 5, 0, 0)
	icon.BackgroundTransparency = 1
	icon.Text = "💻"
	icon.TextColor3 = Color3.fromRGB(140, 140, 140)
	icon.Font = Enum.Font.Gotham
	icon.TextSize = 13

	local inputBox = Instance.new("TextBox", inputBar)
	inputBox.Size = UDim2.new(1, -30, 1, 0)
	inputBox.Position = UDim2.new(0, 28, 0, 0)
	inputBox.BackgroundTransparency = 1
	inputBox.Text = ""
	inputBox.PlaceholderText = ";command <args>"
	inputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
	inputBox.Font = Enum.Font.Gotham
	inputBox.TextSize = 13
	inputBox.TextXAlignment = Enum.TextXAlignment.Left
	inputBox.ClearTextOnFocus = false

	local scroll = Instance.new("ScrollingFrame", main)
	scroll.Size = UDim2.new(1, -20, 1, -84)
	scroll.Position = UDim2.new(0, 10, 0, 74)
	scroll.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	scroll.BorderSizePixel = 0
	scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
	scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
	scroll.ScrollBarThickness = 4

	local layout = Instance.new("UIListLayout", scroll)
	layout.Padding = UDim.new(0, 4)
	layout.SortOrder = Enum.SortOrder.LayoutOrder

	local commandCallbacks = {}

	local function AddCommand(pattern, callback)
		table.insert(commandCallbacks, {
			pattern = pattern,
			callback = callback
		})

		local cmdLabel = Instance.new("TextLabel")
		cmdLabel.Size = UDim2.new(1, -10, 0, 22)
		cmdLabel.Text = pattern
		cmdLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
		cmdLabel.Font = Enum.Font.Gotham
		cmdLabel.TextSize = 12
		cmdLabel.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
		cmdLabel.TextXAlignment = Enum.TextXAlignment.Left
		cmdLabel.BorderSizePixel = 0
		cmdLabel.Parent = scroll
		Instance.new("UICorner", cmdLabel).CornerRadius = UDim.new(0, 3)
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
		AddCommand = AddCommand
	}
end

return Library
