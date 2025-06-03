local CludeLib = {}

function CludeLib:CreateWindow(name)
	local gui = Instance.new("ScreenGui")
	gui.Name = "CludeLib"
	gui.Parent = game:GetService("CoreGui")

	local Frame = Instance.new("Frame")
	Frame.Name = "MainFrame"
	Frame.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
	Frame.Size = UDim2.new(0, 550, 0, 400)
	Frame.Position = UDim2.new(0.5, -275, 0.5, -560)
	Frame.BorderSizePixel = 0
	Frame.Parent = gui

	local UICorner = Instance.new("UICorner", Frame)

	local Title = Instance.new("TextLabel")
	Title.Name = "Title"
	Title.Text = name or "CludeHub"
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextSize = 24
	Title.Font = Enum.Font.SourceSansBold
	Title.BackgroundTransparency = 1
	Title.Size = UDim2.new(1, -13, 0, 28)
	Title.Position = UDim2.new(0, 13, 0, 0)
	Title.TextXAlignment = Enum.TextXAlignment.Left
	Title.Parent = Frame

	local TitleLine = Instance.new("Frame", Frame)
	TitleLine.Name = "TitleLine"
	TitleLine.BackgroundColor3 = Color3.fromRGB(58, 58, 58)
	TitleLine.Size = UDim2.new(1, 0, 0, 1)
	TitleLine.Position = UDim2.new(0, 0, 0, 24)
	TitleLine.BorderSizePixel = 0

	local TabHolder = Instance.new("ScrollingFrame")
	TabHolder.Name = "TabHolder"
	TabHolder.BackgroundTransparency = 1
	TabHolder.Position = UDim2.new(0, 0, 0, 25)
	TabHolder.Size = UDim2.new(0, 119, 1, -25)
	TabHolder.ScrollBarThickness = 1
	TabHolder.Parent = Frame

	local TabList = Instance.new("UIListLayout")
	TabList.Parent = TabHolder
	TabList.SortOrder = Enum.SortOrder.LayoutOrder

	local TabLine = Instance.new("Frame", Frame)
	TabLine.Name = "TabLine"
	TabLine.BackgroundColor3 = Color3.fromRGB(58, 58, 58)
	TabLine.Position = UDim2.new(0, 119, 0, 25)
	TabLine.Size = UDim2.new(0, 1, 1, -25)
	TabLine.BorderSizePixel = 0

	local TabContainers = Instance.new("Frame")
	TabContainers.Name = "TabContainers"
	TabContainers.Position = UDim2.new(0, 120, 0, 25)
	TabContainers.Size = UDim2.new(1, -120, 1, -25)
	TabContainers.BackgroundTransparency = 1
	TabContainers.Parent = Frame

	local Tabs = {}

	local Window = {}

	function Window:CreateTab(tabName)
		local TabButton = Instance.new("TextButton")
		TabButton.Name = tabName .. "Tab"
		TabButton.Text = tabName
		TabButton.Font = Enum.Font.SourceSansBold
		TabButton.TextColor3 = Color3.new(1, 1, 1)
		TabButton.TextSize = 18
		TabButton.Size = UDim2.new(1, -1, 0, 30)
		TabButton.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
		TabButton.BorderSizePixel = 0
		TabButton.Parent = TabHolder

		local UICorner = Instance.new("UICorner", TabButton)

		local TabContent = Instance.new("Frame")
		TabContent.Name = tabName .. "Content"
		TabContent.Size = UDim2.new(1, 0, 1, 0)
		TabContent.BackgroundTransparency = 1
		TabContent.Visible = false
		TabContent.Parent = TabContainers

		local LeftContainer = Instance.new("ScrollingFrame")
		LeftContainer.Name = "Left"
		LeftContainer.Size = UDim2.new(0.5, -5, 1, 0)
		LeftContainer.Position = UDim2.new(0, 0, 0, 0)
		LeftContainer.BackgroundTransparency = 1
		LeftContainer.ScrollBarThickness = 1
		LeftContainer.AutomaticCanvasSize = Enum.AutomaticSize.Y
		LeftContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
		LeftContainer.Parent = TabContent

		local LeftLayout = Instance.new("UIListLayout")
		LeftLayout.Parent = LeftContainer
		LeftLayout.SortOrder = Enum.SortOrder.LayoutOrder
		LeftLayout.Padding = UDim.new(0, 4)

		local RightContainer = Instance.new("ScrollingFrame")
		RightContainer.Name = "Right"
		RightContainer.Size = UDim2.new(0.5, -5, 1, 0)
		RightContainer.Position = UDim2.new(0.5, 5, 0, 0)
		RightContainer.BackgroundTransparency = 1
		RightContainer.ScrollBarThickness = 1
		RightContainer.AutomaticCanvasSize = Enum.AutomaticSize.Y
		RightContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
		RightContainer.Parent = TabContent

		local RightLayout = Instance.new("UIListLayout")
		RightLayout.Parent = RightContainer
		RightLayout.SortOrder = Enum.SortOrder.LayoutOrder
		RightLayout.Padding = UDim.new(0, 4)

		-- Tab button logic
		TabButton.MouseButton1Click:Connect(function()
			for _, t in pairs(TabContainers:GetChildren()) do
				t.Visible = false
			end
			TabContent.Visible = true
		end)

		local Tab = {}

		function Tab:AddSection(text, side)
			side = side:lower()
			local Section = Instance.new("TextLabel")
			Section.Text = text
			Section.Size = UDim2.new(1, 0, 0, 30)
			Section.TextSize = 18
			Section.Font = Enum.Font.SourceSans
			Section.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
			Section.TextColor3 = Color3.new(1, 1, 1)
			Section.BorderSizePixel = 0

			local UICorner = Instance.new("UICorner", Section)

			if side == "left" then
				Section.Parent = LeftContainer
			elseif side == "right" then
				Section.Parent = RightContainer
			else
				warn("Invalid side: use 'left' or 'right'")
			end
		end

		table.insert(Tabs, Tab)
		return Tab
	end

	return Window
end

return CludeLib
