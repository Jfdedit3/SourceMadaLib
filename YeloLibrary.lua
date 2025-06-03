local CludeLib = {}

function CludeLib:CreateWindow(titleText)
	local ScreenGui = Instance.new("ScreenGui")
	ScreenGui.Name = "CludeLib"
	ScreenGui.Parent = game:GetService("CoreGui")

	local Frame = Instance.new("Frame")
	Frame.Name = "Main"
	Frame.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
	Frame.Size = UDim2.new(0, 550, 0, 400)
	Frame.Position = UDim2.new(0.5, -275, 0.5, -200)
        Frame.AnchorPoint = Vector2.new(0.5, 0.5)
	Frame.BorderSizePixel = 0
	Frame.AnchorPoint = Vector2.new(0.5, 0.5)
	Frame.Parent = ScreenGui
	Instance.new("UICorner", Frame)

	local TitleLine = Instance.new("Frame")
	TitleLine.Name = "TitleLine"
	TitleLine.BackgroundColor3 = Color3.fromRGB(58, 58, 58)
	TitleLine.Size = UDim2.new(1, 0, 0, 1)
	TitleLine.Position = UDim2.new(0, 0, 0, 24)
	TitleLine.BorderSizePixel = 0
	TitleLine.Parent = Frame

	local TabLine = Instance.new("Frame")
	TabLine.Name = "TabLine"
	TabLine.BackgroundColor3 = Color3.fromRGB(58, 58, 58)
	TabLine.Size = UDim2.new(0, 1, 1, -24)
	TabLine.Position = UDim2.new(0, 121, 0, 24)
	TabLine.BorderSizePixel = 0
	TabLine.Parent = Frame

	local Title = Instance.new("TextLabel")
	Title.Name = "Title"
	Title.Text = titleText or "CludeHub"
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextSize = 24
	Title.Font = Enum.Font.SourceSansBold
	Title.BackgroundTransparency = 1
	Title.Size = UDim2.new(1, -13, 0, 28)
	Title.Position = UDim2.new(0, 13, 0, 0)
	Title.TextWrapped = true
	Title.TextXAlignment = Enum.TextXAlignment.Left
	Title.Parent = Frame

	local TabHolder = Instance.new("ScrollingFrame")
	TabHolder.Name = "TabHolder"
	TabHolder.BackgroundTransparency = 1
	TabHolder.BackgroundColor3 = Color3.fromRGB(162, 162, 162)
	TabHolder.Size = UDim2.new(0, 119, 0, 351)
	TabHolder.Position = UDim2.new(0, 0, 0, 25)
	TabHolder.CanvasSize = UDim2.new(0, 0, 0, 0)
	TabHolder.ScrollBarThickness = 1
	TabHolder.AutomaticCanvasSize = Enum.AutomaticSize.Y
	TabHolder.Parent = Frame

	local layout = Instance.new("UIListLayout")
	layout.FillDirection = Enum.FillDirection.Vertical
	layout.SortOrder = Enum.SortOrder.LayoutOrder
	layout.Padding = UDim.new(0, 4)
	layout.Parent = TabHolder

	local ContentHolder = Instance.new("Frame")
	ContentHolder.Name = "ContentHolder"
	ContentHolder.BackgroundTransparency = 1
	ContentHolder.Position = UDim2.new(0, 122, 0, 25)
	ContentHolder.Size = UDim2.new(1, -122, 1, -25)
	ContentHolder.Parent = Frame

	local Tabs = {}

	local Window = {}

	function Window:CreateTab(tabName)
		local Tab = {}

		local TabButton = Instance.new("TextButton")
		TabButton.Name = "TabButton"
		TabButton.Text = tabName
		TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
		TabButton.TextSize = 18
		TabButton.Font = Enum.Font.SourceSansBold
		TabButton.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
		TabButton.Size = UDim2.new(0, 118, 0, 29)
		TabButton.BorderSizePixel = 0
		local TabCorner = Instance.new("UICorner", TabButton)
		TabButton.Parent = TabHolder

		local TabFrame = Instance.new("Frame")
		TabFrame.Name = tabName .. "_Frame"
		TabFrame.Size = UDim2.new(1, 0, 1, 0)
		TabFrame.BackgroundTransparency = 1
		TabFrame.Visible = false
		TabFrame.Parent = ContentHolder

		local Left = Instance.new("ScrollingFrame")
		Left.Name = "Left"
		Left.BackgroundTransparency = 1
		Left.Position = UDim2.new(0, 0, 0, 0)
		Left.Size = UDim2.new(0.5, -5, 1, 0)
		Left.CanvasSize = UDim2.new(0, 0, 0, 0)
		Left.ScrollBarThickness = 1
		Left.AutomaticCanvasSize = Enum.AutomaticSize.Y
		local LeftLayout = Instance.new("UIListLayout", Left)
		LeftLayout.SortOrder = Enum.SortOrder.LayoutOrder
		Left.Parent = TabFrame

		local Right = Left:Clone()
		Right.Name = "Right"
		Right.Position = UDim2.new(0.5, 5, 0, 0)
		Right.Parent = TabFrame

		Tabs[tabName] = {Frame = TabFrame, Left = Left, Right = Right}

		TabButton.MouseButton1Click:Connect(function()
			for _, v in pairs(Tabs) do
				v.Frame.Visible = false
			end
			TabFrame.Visible = true
		end)

		-- Show first created tab by default
		if #TabHolder:GetChildren() <= 3 then
			TabFrame.Visible = true
		end

		function Tab:AddSection(text, side)
			local Section = Instance.new("Frame")
			Section.Size = UDim2.new(1, -10, 0, 50)
			Section.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
			Section.BorderSizePixel = 0
			Instance.new("UICorner", Section)

			local Label = Instance.new("TextLabel")
			Label.Size = UDim2.new(1, -10, 1, 0)
			Label.Position = UDim2.new(0, 5, 0, 0)
			Label.Text = text
			Label.TextColor3 = Color3.new(1, 1, 1)
			Label.BackgroundTransparency = 1
			Label.Font = Enum.Font.SourceSans
			Label.TextSize = 18
			Label.TextXAlignment = Enum.TextXAlignment.Left
			Label.Parent = Section

			if side == "left" then
				Section.Parent = Left
			elseif side == "right" then
				Section.Parent = Right
			end
		end

		return Tab
	end

	return Window
end

return CludeLib
