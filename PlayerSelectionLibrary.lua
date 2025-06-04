local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local AdminGui = {}
local selectedPlayer = nil

function AdminGui:CreateWindow(titleText)
	local ScreenGui = Instance.new("ScreenGui")
	ScreenGui.Name = "AdminGui"
	ScreenGui.ResetOnSpawn = false
	ScreenGui.IgnoreGuiInset = true
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	ScreenGui.Parent = game:GetService("CoreGui")

	local Frame = Instance.new("Frame")
	Frame.Name = "AddWindow"
	Frame.BackgroundColor3 = Color3.fromRGB(20, 14, 24)
	Frame.Size = UDim2.new(0.202, 275, 0.202, 290)
	Frame.Position = UDim2.new(0.2, 0, 0, -300)
	Frame.ClipsDescendants = true
	Frame.Parent = ScreenGui

	local Corner = Instance.new("UICorner", Frame)
	Corner.CornerRadius = UDim.new(0, 6)

	-- Open animation
	TweenService:Create(Frame, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		Position = UDim2.new(0.2, 0, 0, 0)
	}):Play()

	-- Make draggable
	local dragging, dragInput, dragStart, startPos
	Frame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
			dragStart = input.Position
			startPos = Frame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	Frame.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement then
			dragInput = input
		end
	end)
	game:GetService("UserInputService").InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			local delta = input.Position - dragStart
			Frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		end
	end)

	local function createLabel(name, text, posY)
		local Label = Instance.new("TextLabel")
		Label.Name = name
		Label.Text = text
		Label.TextColor3 = Color3.fromRGB(255, 255, 255)
		Label.TextStrokeColor3 = Color3.fromRGB(127, 127, 127)
		Label.TextStrokeTransparency = 0
		Label.TextSize = 18
		Label.Font = Enum.Font.SourceSansBold
		Label.BackgroundTransparency = 1
		Label.Size = UDim2.new(0, 190, 0, 29)
		Label.Position = UDim2.new(0, 3, 0, posY)
		Label.TextXAlignment = Enum.TextXAlignment.Left
		Label.Parent = Frame
		return Label
	end

	local ProfileImage = Instance.new("ImageLabel", Frame)
	ProfileImage.Name = "ProfileImage"
	ProfileImage.Size = UDim2.new(0, 50, 0, 50)
	ProfileImage.Position = UDim2.new(0, 3, 0, 30)
	ProfileImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Instance.new("UICorner", ProfileImage)

	local UsernameLabel = createLabel("UsernameLabel", "", 40)
	UsernameLabel.Position = UDim2.new(0, 67, 0, 40)
	UsernameLabel.Size = UDim2.new(0, 220, 0, 29)

	local HealthLabel = createLabel("HealthLabel", "Health: ", 80)
	local DistanceLabel = createLabel("DistanceLabel", "Distance: ", 101)
	local SpeedLabel = createLabel("SpeedLabel", "WalkSpeed: ", 121)
	local JumpLabel = createLabel("JumpLabel", "JumpPower: ", 138)

	local Title = Instance.new("TextLabel", Frame)
	Title.Name = "Title"
	Title.Text = titleText
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextStrokeColor3 = Color3.fromRGB(127, 127, 127)
	Title.TextStrokeTransparency = 0
	Title.Font = Enum.Font.SourceSansBold
	Title.TextSize = 28
	Title.BackgroundTransparency = 1
	Title.Size = UDim2.new(1, -60, 0, 29)
	Title.Position = UDim2.new(0, 19, 0, 0)
	Title.TextXAlignment = Enum.TextXAlignment.Left

	local Line = Instance.new("Frame", Frame)
	Line.Name = "Line"
	Line.BackgroundColor3 = Color3.fromRGB(54, 46, 62)
	Line.BorderSizePixel = 0
	Line.Size = UDim2.new(1, 0, 0, 1)
	Line.Position = UDim2.new(0, 0, 0, 190)

	-- UsernameSelection
	local UsernameSelection = Instance.new("ScrollingFrame", Frame)
	UsernameSelection.Name = "UsernameSelection"
	UsernameSelection.BackgroundColor3 = Color3.fromRGB(25, 17, 29)
	UsernameSelection.Position = UDim2.new(0.2, 149, 0, 29)
	UsernameSelection.Size = UDim2.new(0.1, 156, 0, 157)
	UsernameSelection.ScrollBarThickness = 0
	Instance.new("UICorner", UsernameSelection)
	local stroke = Instance.new("UIStroke", UsernameSelection)
	stroke.Color = Color3.fromRGB(54, 46, 62)
	stroke.Thickness = 1
	local list = Instance.new("UIListLayout", UsernameSelection)
	list.SortOrder = Enum.SortOrder.LayoutOrder
	list.Padding = UDim.new(0, 4)

	local function updatePlayerList()
		UsernameSelection:ClearAllChildren()
		Instance.new("UICorner", UsernameSelection).Parent = UsernameSelection
		stroke.Parent = UsernameSelection
		list.Parent = UsernameSelection

		for _, player in ipairs(Players:GetPlayers()) do
			local button = Instance.new("TextButton")
			button.Name = "UsernameButton"
			button.Text = player.Name
			button.Size = UDim2.new(1, 0, 0, 29)
			button.BackgroundColor3 = Color3.fromRGB(46, 39, 57)
			button.TextColor3 = Color3.fromRGB(255, 255, 255)
			button.Font = Enum.Font.SourceSansBold
			button.TextSize = 18
			button.BackgroundTransparency = 0
			Instance.new("UICorner", button)
			button.Parent = UsernameSelection

			button.MouseButton1Click:Connect(function()
				selectedPlayer = player
				UsernameLabel.Text = player.Name
				local character = player.Character
				if character and character:FindFirstChild("HumanoidRootPart") and character:FindFirstChild("Humanoid") then
					local hrp = character.HumanoidRootPart
					local humanoid = character:FindFirstChild("Humanoid")
					local dist = (Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and
						(Players.LocalPlayer.Character.HumanoidRootPart.Position - hrp.Position).Magnitude) or 0
					HealthLabel.Text = "Health: " .. math.floor(humanoid.Health)
					JumpLabel.Text = "JumpPower: " .. math.floor(humanoid.JumpPower)
					SpeedLabel.Text = "WalkSpeed: " .. math.floor(humanoid.WalkSpeed)
					DistanceLabel.Text = "Distance: " .. math.floor(dist)
					ProfileImage.Image = Players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100)
				end
			end)
		end
	end

	updatePlayerList()
	Players.PlayerAdded:Connect(updatePlayerList)
	Players.PlayerRemoving:Connect(updatePlayerList)

	local Container = Instance.new("ScrollingFrame", Frame)
	Container.Name = "Container"
	Container.BackgroundTransparency = 1
	Container.Position = UDim2.new(0, 3, 0, 192)
	Container.Size = UDim2.new(0.1, 394, 0, 184)
	Container.ScrollBarThickness = 0
	local containerLayout = Instance.new("UIListLayout", Container)
	containerLayout.FillDirection = Enum.FillDirection.Horizontal
	containerLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
	containerLayout.Padding = UDim.new(0, 6)

	function AdminGui:AddButton(label, callback)
		local button = Instance.new("TextButton")
		button.Name = "AddButton"
		button.Text = label
		button.TextColor3 = Color3.fromRGB(255, 255, 255)
		button.TextSize = 18
		button.Font = Enum.Font.SourceSansBold
		button.BackgroundColor3 = Color3.fromRGB(38, 31, 50)
		button.Size = UDim2.new(0, 143, 0, 34)
		button.TextWrapped = true
		Instance.new("UICorner", button)
		button.Parent = Container

		button.MouseButton1Click:Connect(function()
			if selectedPlayer then
				callback(selectedPlayer)
			end
		end)
	end

	return ScreenGui
end

return AdminGui
