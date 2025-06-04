local AdminGui = {}

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

function AdminGui:CreateWindow(title)
	local ScreenGui = Instance.new("ScreenGui")
	ScreenGui.Name = "AdminGui"
	ScreenGui.ResetOnSpawn = false
	ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

	local Frame = Instance.new("Frame")
	Frame.Name = "AddWindow"
	Frame.BackgroundColor3 = Color3.fromRGB(18, 12, 21)
	Frame.Size = UDim2.new(0.202, 275, 0.202, 290)
	Frame.Position = UDim2.new(0.2, 0, 0, 0)
	Frame.Parent = ScreenGui

	local UICorner = Instance.new("UICorner", Frame)

	local Title = Instance.new("TextLabel")
	Title.Name = "Title"
	Title.Text = title or "Title"
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextStrokeColor3 = Color3.fromRGB(127, 127, 127)
	Title.TextStrokeTransparency = 0
	Title.TextSize = 28
	Title.TextScaled = true
	Title.Font = Enum.Font.SourceSansBold
	Title.BackgroundTransparency = 1
	Title.Size = UDim2.new(1, -60, 0, 29)
	Title.Position = UDim2.new(0, 19, 0, 0)
	Title.TextXAlignment = Enum.TextXAlignment.Left
	Title.Parent = Frame

	local Line = Instance.new("Frame")
	Line.Name = "TitleLine"
	Line.BackgroundColor3 = Color3.fromRGB(38, 32, 47)
	Line.Size = UDim2.new(1, 0, 0, 1)
	Line.Position = UDim2.new(0, 0, 0, 30)
	Line.BorderSizePixel = 0
	Line.Parent = Frame

	local ProfileImage = Instance.new("ImageLabel")
	ProfileImage.Name = "ProfileImage"
	ProfileImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ProfileImage.Size = UDim2.new(0, 50, 0, 50)
	ProfileImage.Position = UDim2.new(0, 3, 0, 30)
	ProfileImage.Image = ""
	ProfileImage.Parent = Frame
	Instance.new("UICorner", ProfileImage)

	local UsernameLabel = Instance.new("TextLabel")
	UsernameLabel.Name = "UsernameLabel"
	UsernameLabel.Text = "Username"
	UsernameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	UsernameLabel.TextStrokeColor3 = Color3.fromRGB(127, 127, 127)
	UsernameLabel.TextStrokeTransparency = 0
	UsernameLabel.TextSize = 18
	UsernameLabel.Font = Enum.Font.SourceSansBold
	UsernameLabel.BackgroundTransparency = 1
	UsernameLabel.Size = UDim2.new(0, 220, 0, 29)
	UsernameLabel.Position = UDim2.new(0, 67, 0, 40)
	UsernameLabel.TextXAlignment = Enum.TextXAlignment.Left
	UsernameLabel.Parent = Frame

	local function createStatLabel(name, text, yPos)
		local lbl = Instance.new("TextLabel")
		lbl.Name = name
		lbl.Text = text
		lbl.TextColor3 = Color3.fromRGB(255, 255, 255)
		lbl.TextStrokeColor3 = Color3.fromRGB(127, 127, 127)
		lbl.TextStrokeTransparency = 0
		lbl.TextSize = 18
		lbl.Font = Enum.Font.SourceSansBold
		lbl.BackgroundTransparency = 1
		lbl.Size = UDim2.new(0, 120, 0, 29)
		lbl.Position = UDim2.new(0, 3, 0, yPos)
		lbl.TextXAlignment = Enum.TextXAlignment.Left
		lbl.TextWrapped = true
		lbl.Parent = Frame
		return lbl
	end

	local HealthLabel = createStatLabel("HealthLabel", "Health: 100", 80)
	local DistanceLabel = createStatLabel("DistanceLabel", "Distance:", 101)
	local SpeedLabel = createStatLabel("SpeedLabel", "WalkSpeed:", 121)
	local JumpLabel = createStatLabel("JumpLabel", "JumpPower:", 138)

	local Line2 = Instance.new("Frame")
	Line2.Name = "Line"
	Line2.BackgroundColor3 = Color3.fromRGB(38, 32, 47)
	Line2.Size = UDim2.new(1, 0, 0, 1)
	Line2.Position = UDim2.new(0, 0, 0, 190)
	Line2.BorderSizePixel = 0
	Line2.Parent = Frame

	local UsernameSelection = Instance.new("ScrollingFrame")
	UsernameSelection.Name = "UsernameSelection"
	UsernameSelection.BackgroundColor3 = Color3.fromRGB(17, 12, 21)
	UsernameSelection.Size = UDim2.new(0.1, 156, 0, 157)
	UsernameSelection.Position = UDim2.new(0.2, 149, 0, 29)
	UsernameSelection.BorderSizePixel = 0
	UsernameSelection.ScrollBarThickness = 0
	UsernameSelection.AutomaticCanvasSize = Enum.AutomaticSize.Y
	UsernameSelection.CanvasSize = UDim2.new(0, 0, 0, 0)
	UsernameSelection.Parent = Frame

	local UIListLayout1 = Instance.new("UIListLayout", UsernameSelection)
	UIListLayout1.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout1.Padding = UDim.new(0, 4)

	local Stroke1 = Instance.new("UIStroke", UsernameSelection)
	Stroke1.Color = Color3.fromRGB(90, 80, 100)
	Stroke1.Thickness = 1
	Instance.new("UICorner", UsernameSelection)

	local Container = Instance.new("ScrollingFrame")
	Container.Name = "Container"
	Container.BackgroundTransparency = 1
	Container.Size = UDim2.new(0.1, 394, 0, 184)
	Container.Position = UDim2.new(0, 3, 0, 192)
	Container.ScrollBarThickness = 0
	Container.AutomaticCanvasSize = Enum.AutomaticSize.Y
	Container.CanvasSize = UDim2.new(0, 0, 0, 0)
	Container.Parent = Frame

	local UIListLayout2 = Instance.new("UIListLayout", Container)
	UIListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout2.Padding = UDim.new(0, 4)

	local selectedPlayer = nil

	for _, player in pairs(Players:GetPlayers()) do
		if player ~= LocalPlayer then
			local btn = Instance.new("TextButton")
			btn.Name = "UsernameButton"
			btn.Text = player.Name
			btn.TextColor3 = Color3.fromRGB(255, 255, 255)
			btn.TextStrokeColor3 = Color3.fromRGB(127, 127, 127)
			btn.TextStrokeTransparency = 0
			btn.TextSize = 18
			btn.Font = Enum.Font.SourceSansBold
			btn.BackgroundColor3 = Color3.fromRGB(32, 26, 40)
			btn.Size = UDim2.new(1, -10, 0, 29)
			btn.BorderSizePixel = 0
			btn.Parent = UsernameSelection
			Instance.new("UICorner", btn)

			btn.MouseButton1Click:Connect(function()
				selectedPlayer = player
				UsernameLabel.Text = player.Name
				local userId = player.UserId
				ProfileImage.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. userId .. "&width=420&height=420&format=png"

				if player.Character then
					local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
					if humanoid then
						HealthLabel.Text = "Health: " .. math.floor(humanoid.Health)
						SpeedLabel.Text = "WalkSpeed: " .. humanoid.WalkSpeed
						JumpLabel.Text = "JumpPower: " .. humanoid.JumpPower
					end
					local distance = (player.Character:GetPivot().Position - LocalPlayer.Character:GetPivot().Position).Magnitude
					DistanceLabel.Text = "Distance: " .. math.floor(distance)
				end
			end)
		end
	end

	Frame:GetPropertyChangedSignal("Parent"):Connect(function()
		Container.CanvasSize = UDim2.new(0, 0, 0, UIListLayout2.AbsoluteContentSize.Y)
	end)

	return Frame
end

function AdminGui:AddButton(window, label, callback)
	local container = window:FindFirstChild("Container")
	if not container then return end

	local btn = Instance.new("TextButton")
	btn.Name = "AddButton"
	btn.Text = label
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.TextStrokeColor3 = Color3.fromRGB(127, 127, 127)
	btn.TextStrokeTransparency = 0
	btn.TextSize = 18
	btn.Font = Enum.Font.SourceSansBold
	btn.BackgroundColor3 = Color3.fromRGB(28, 22, 36)
	btn.Size = UDim2.new(0, 143, 0, 34)
	btn.TextWrapped = true
	btn.Parent = container
	Instance.new("UICorner", btn)

	btn.MouseButton1Click:Connect(function()
		if callback and typeof(callback) == "function" then
			local selectedLabel = window:FindFirstChild("UsernameLabel")
			if selectedLabel then
				local target = Players:FindFirstChild(selectedLabel.Text)
				if target then
					callback(target)
				end
			end
		end
	end)
end

return AdminGui
