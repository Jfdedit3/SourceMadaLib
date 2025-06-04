local Players = game:GetService("Players")
local AdminGui = {}
local SelectedPlayer = nil

function AdminGui:CreateWindow(title)
	local Frame = Instance.new("Frame")
	Frame.Name = "AdminWindow"
	Frame.BackgroundColor3 = Color3.fromRGB(26, 18, 30)
	Frame.Size = UDim2.new(0, 550, 0, 400)
	Frame.Position = UDim2.new(0.2, 0, 0.2, 0)

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

	local labels = {
		DistanceLabel = "Distance:",
		SpeedLabel = "WalkSpeed:",
		JumpLabel = "JumpPower:",
		HealthLabel = "Health:"
	}
	local y = 80
	for name, text in pairs(labels) do
		local label = Instance.new("TextLabel", Frame)
		label.Name = name
		label.Text = text
		label.Position = UDim2.new(0, 3, 0, y)
		label.Size = UDim2.new(0, 200, 0, 29)
		label.TextColor3 = Color3.new(1, 1, 1)
		label.Font = Enum.Font.SourceSansBold
		label.TextSize = 18
		label.BackgroundTransparency = 1
		label.TextXAlignment = Enum.TextXAlignment.Left
		y += 20
	end

	local UsernameSelection = Instance.new("ScrollingFrame", Frame)
	UsernameSelection.Name = "UsernameSelection"
	UsernameSelection.Size = UDim2.new(0, 180, 0, 150)
	UsernameSelection.Position = UDim2.new(0, 360, 0, 30)
	UsernameSelection.BackgroundColor3 = Color3.fromRGB(25, 17, 29)
	UsernameSelection.ScrollBarThickness = 1
	Instance.new("UICorner", UsernameSelection)
	Instance.new("UIListLayout", UsernameSelection)

	for _, player in ipairs(Players:GetPlayers()) do
		local button = Instance.new("TextButton", UsernameSelection)
		button.Name = player.Name
		button.Text = player.Name
		button.Size = UDim2.new(1, -10, 0, 30)
		button.BackgroundColor3 = Color3.fromRGB(46, 39, 57)
		button.TextColor3 = Color3.new(1, 1, 1)
		button.Font = Enum.Font.SourceSansBold
		button.TextSize = 18
		Instance.new("UICorner", button)

		button.MouseButton1Click:Connect(function()
			SelectedPlayer = player
			UsernameLabel.Text = player.Name
			local userId = player.UserId
			ProfileImage.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. userId .. "&width=420&height=420&format=png"

			local character = player.Character
			if character then
				local humanoid = character:FindFirstChildOfClass("Humanoid")
				local root = character:FindFirstChild("HumanoidRootPart")

				Frame.HealthLabel.Text = "Health: " .. (humanoid and humanoid.Health or 0)
				Frame.SpeedLabel.Text = "WalkSpeed: " .. (humanoid and humanoid.WalkSpeed or "N/A")
				Frame.JumpLabel.Text = "JumpPower: " .. (humanoid and humanoid.JumpPower or "N/A")
				local dist = root and Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
				if dist then
					local d = (dist.Position - root.Position).Magnitude
					Frame.DistanceLabel.Text = "Distance: " .. math.floor(d)
				end
			end
		end)
	end

	local Container = Instance.new("ScrollingFrame", Frame)
	Container.Name = "Container"
	Container.Size = UDim2.new(0, 394, 0, 100)
	Container.Position = UDim2.new(0, 3, 0, 250)
	Container.BackgroundTransparency = 1
	Container.ScrollBarThickness = 1
	Instance.new("UIListLayout", Container)

	Frame:SetAttribute("Container", Container)
	Frame:SetAttribute("SelectedPlayer", nil)

	return Frame
end

function AdminGui:AddButton(frame, label, callback)
	local Container = frame:GetAttribute("Container")
	local button = Instance.new("TextButton")
	button.Name = label
	button.Text = label
	button.Size = UDim2.new(0, 140, 0, 30)
	button.BackgroundColor3 = Color3.fromRGB(38, 31, 50)
	button.TextColor3 = Color3.new(1, 1, 1)
	button.Font = Enum.Font.SourceSansBold
	button.TextSize = 18
	button.TextWrapped = true
	Instance.new("UICorner", button)
	button.Parent = Container

	button.MouseButton1Click:Connect(function()
		if SelectedPlayer then
			callback(SelectedPlayer)
		end
	end)
end

return AdminGui
