local Players = game:GetService("Players")
local AdminGui = {}

function AdminGui:CreateWindow(title)
	local Frame = Instance.new("Frame")
	Frame.Name = "AdminWindow"
	Frame.BackgroundColor3 = Color3.fromRGB(26, 18, 30)
	Frame.Size = UDim2.new(0, 550, 0, 400)
	Frame.Position = UDim2.new(0.2, 0, 0.2, 0)
	Frame.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

	local UICorner = Instance.new("UICorner", Frame)

	local TitleLabel = Instance.new("TextLabel", Frame)
	TitleLabel.Name = "Title"
	TitleLabel.Text = title or "Admin Panel"
	TitleLabel.Size = UDim2.new(1, -60, 0, 29)
	TitleLabel.Position = UDim2.new(0, 19, 0, 0)
	TitleLabel.TextColor3 = Color3.new(1, 1, 1)
	TitleLabel.Font = Enum.Font.SourceSansBold
	TitleLabel.TextSize = 28
	TitleLabel.BackgroundTransparency = 1
	TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

	local ProfileImage = Instance.new("ImageLabel", Frame)
	ProfileImage.Name = "ProfileImage"
	ProfileImage.Size = UDim2.new(0, 50, 0, 50)
	ProfileImage.Position = UDim2.new(0, 3, 0, 30)
	ProfileImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Instance.new("UICorner", ProfileImage)

	local UsernameLabel = Instance.new("TextLabel", Frame)
	UsernameLabel.Name = "UsernameLabel"
	UsernameLabel.Text = "Select a player"
	UsernameLabel.Position = UDim2.new(0, 67, 0, 40)
	UsernameLabel.Size = UDim2.new(0, 220, 0, 29)
	UsernameLabel.TextColor3 = Color3.new(1, 1, 1)
	UsernameLabel.Font = Enum.Font.SourceSansBold
	UsernameLabel.TextSize = 18
	UsernameLabel.BackgroundTransparency = 1
	UsernameLabel.TextXAlignment = Enum.TextXAlignment.Left

	local DistanceLabel = Instance.new("TextLabel", Frame)
	DistanceLabel.Name = "DistanceLabel"
	DistanceLabel.Text = "Distance:"
	DistanceLabel.Position = UDim2.new(0, 3, 0, 80)
	DistanceLabel.Size = UDim2.new(0, 300, 0, 25)
	DistanceLabel.TextColor3 = Color3.new(1, 1, 1)
	DistanceLabel.Font = Enum.Font.SourceSansBold
	DistanceLabel.TextSize = 18
	DistanceLabel.BackgroundTransparency = 1
	DistanceLabel.TextXAlignment = Enum.TextXAlignment.Left

	local SpeedLabel = Instance.new("TextLabel", Frame)
	SpeedLabel.Name = "SpeedLabel"
	SpeedLabel.Text = "WalkSpeed:"
	SpeedLabel.Position = UDim2.new(0, 3, 0, 105)
	SpeedLabel.Size = UDim2.new(0, 300, 0, 25)
	SpeedLabel.TextColor3 = Color3.new(1, 1, 1)
	SpeedLabel.Font = Enum.Font.SourceSansBold
	SpeedLabel.TextSize = 18
	SpeedLabel.BackgroundTransparency = 1
	SpeedLabel.TextXAlignment = Enum.TextXAlignment.Left

	local JumpLabel = Instance.new("TextLabel", Frame)
	JumpLabel.Name = "JumpLabel"
	JumpLabel.Text = "JumpPower:"
	JumpLabel.Position = UDim2.new(0, 3, 0, 130)
	JumpLabel.Size = UDim2.new(0, 300, 0, 25)
	JumpLabel.TextColor3 = Color3.new(1, 1, 1)
	JumpLabel.Font = Enum.Font.SourceSansBold
	JumpLabel.TextSize = 18
	JumpLabel.BackgroundTransparency = 1
	JumpLabel.TextXAlignment = Enum.TextXAlignment.Left

	local HealthLabel = Instance.new("TextLabel", Frame)
	HealthLabel.Name = "HealthLabel"
	HealthLabel.Text = "Health:"
	HealthLabel.Position = UDim2.new(0, 3, 0, 155)
	HealthLabel.Size = UDim2.new(0, 300, 0, 25)
	HealthLabel.TextColor3 = Color3.new(1, 1, 1)
	HealthLabel.Font = Enum.Font.SourceSansBold
	HealthLabel.TextSize = 18
	HealthLabel.BackgroundTransparency = 1
	HealthLabel.TextXAlignment = Enum.TextXAlignment.Left

	local UsernameSelection = Instance.new("ScrollingFrame", Frame)
	UsernameSelection.Name = "UsernameSelection"
	UsernameSelection.Size = UDim2.new(0, 180, 0, 150)
	UsernameSelection.Position = UDim2.new(0, 360, 0, 30)
	UsernameSelection.BackgroundColor3 = Color3.fromRGB(25, 17, 29)
	UsernameSelection.ScrollBarThickness = 1
	Instance.new("UICorner", UsernameSelection)

	local layout = Instance.new("UIListLayout", UsernameSelection)
	layout.Padding = UDim.new(0, 5)

	-- Setup selection logic
	for _, player in ipairs(Players:GetPlayers()) do
		local button = Instance.new("TextButton", UsernameSelection)
		button.Size = UDim2.new(1, -10, 0, 30)
		button.BackgroundColor3 = Color3.fromRGB(46, 39, 57)
		button.TextColor3 = Color3.new(1, 1, 1)
		button.Font = Enum.Font.SourceSansBold
		button.TextSize = 18
		button.Text = player.Name
		Instance.new("UICorner", button)

		button.MouseButton1Click:Connect(function()
			Frame:SetAttribute("SelectedPlayer", player)
			UsernameLabel.Text = player.Name
			ProfileImage.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. player.UserId .. "&width=420&height=420&format=png"

			local char = player.Character
			local humanoid = char and char:FindFirstChildWhichIsA("Humanoid")
			local root = char and char:FindFirstChild("HumanoidRootPart")
			local localRoot = Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

			HealthLabel.Text = "Health: " .. (humanoid and math.floor(humanoid.Health) or "N/A")
			SpeedLabel.Text = "WalkSpeed: " .. (humanoid and humanoid.WalkSpeed or "N/A")
			JumpLabel.Text = "JumpPower: " .. (humanoid and humanoid.JumpPower or "N/A")
			DistanceLabel.Text = "Distance: " .. ((root and localRoot) and math.floor((localRoot.Position - root.Position).Magnitude) or "N/A")
		end)
	end

	local Container = Instance.new("Frame", Frame)
	Container.Name = "Container"
	Container.Position = UDim2.new(0, 3, 0, 250)
	Container.Size = UDim2.new(1, -6, 0, 140)
	Container.BackgroundTransparency = 1

	local containerLayout = Instance.new("UIListLayout", Container)
	containerLayout.Padding = UDim.new(0, 4)

	Frame:SetAttribute("ButtonContainer", Container)

	return Frame
end

function AdminGui:AddButton(frame, label, callback)
	local container = frame:GetAttribute("ButtonContainer")
	if not container then warn("Container not found") return end

	local button = Instance.new("TextButton", container)
	button.Size = UDim2.new(0, 140, 0, 30)
	button.BackgroundColor3 = Color3.fromRGB(38, 31, 50)
	button.TextColor3 = Color3.new(1, 1, 1)
	button.Font = Enum.Font.SourceSansBold
	button.TextSize = 18
	button.Text = label
	Instance.new("UICorner", button)

	button.MouseButton1Click:Connect(function()
		local selected = frame:GetAttribute("SelectedPlayer")
		if selected then
			callback(selected)
		else
			warn("No player selected")
		end
	end)
end

return AdminGui
