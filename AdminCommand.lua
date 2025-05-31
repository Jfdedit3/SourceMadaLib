local NebulaUI = {}

function NebulaUI:CreateWindow(title)
	local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
	ScreenGui.Name = "NebulaUI"
	ScreenGui.ResetOnSpawn = false

	local Main = Instance.new("Frame", ScreenGui)
	Main.Size = UDim2.new(0, 700, 0, 450)
	Main.Position = UDim2.new(0.5, -350, 0.5, -225)
	Main.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
	Main.BorderSizePixel = 0

	local UIScale = Instance.new("UIScale", Main)
	UIScale.Scale = 0.9

	local Tabs = Instance.new("Frame", Main)
	Tabs.Size = UDim2.new(1, 0, 0, 35)
	Tabs.BackgroundTransparency = 1

	local TabLayout = Instance.new("UIListLayout", Tabs)
	TabLayout.FillDirection = Enum.FillDirection.Horizontal
	TabLayout.Padding = UDim.new(0, 8)

	local ContentFrame = Instance.new("Frame", Main)
	ContentFrame.Position = UDim2.new(0, 0, 0, 35)
	ContentFrame.Size = UDim2.new(1, 0, 1, -35)
	ContentFrame.BackgroundTransparency = 1

	local allTabs = {}

	function NebulaUI:CreateTab(tabName)
		local Button = Instance.new("TextButton", Tabs)
		Button.Text = tabName
		Button.Size = UDim2.new(0, 100, 1, 0)
		Button.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
		Button.TextColor3 = Color3.fromRGB(255, 255, 255)
		Button.Font = Enum.Font.GothamSemibold
		Button.TextSize = 14
		Button.AutoButtonColor = false

		local TabFrame = Instance.new("Frame", ContentFrame)
		TabFrame.Size = UDim2.new(1, 0, 1, 0)
		TabFrame.Visible = false
		TabFrame.BackgroundTransparency = 1

		local Left = Instance.new("Frame", TabFrame)
		Left.Position = UDim2.new(0, 0, 0, 0)
		Left.Size = UDim2.new(0.5, -10, 1, 0)
		Left.BackgroundTransparency = 1

		local Right = Instance.new("Frame", TabFrame)
		Right.Position = UDim2.new(0.5, 10, 0, 0)
		Right.Size = UDim2.new(0.5, -10, 1, 0)
		Right.BackgroundTransparency = 1

		local LeftLayout = Instance.new("UIListLayout", Left)
		LeftLayout.Padding = UDim.new(0, 10)

		local RightLayout = Instance.new("UIListLayout", Right)
		RightLayout.Padding = UDim.new(0, 10)

		table.insert(allTabs, TabFrame)

		Button.MouseButton1Click:Connect(function()
			for _, tab in pairs(allTabs) do tab.Visible = false end
			TabFrame.Visible = true
		end)

		local tabAPI = {}

		local function createSection(parent, title)
			local Section = Instance.new("Frame", parent)
			Section.Size = UDim2.new(1, 0, 0, 150)
			Section.BackgroundColor3 = Color3.fromRGB(30, 30, 36)
			Section.BorderSizePixel = 0

			local Label = Instance.new("TextLabel", Section)
			Label.Text = title
			Label.Font = Enum.Font.GothamBold
			Label.TextSize = 14
			Label.TextColor3 = Color3.fromRGB(255, 255, 255)
			Label.Size = UDim2.new(1, -10, 0, 20)
			Label.Position = UDim2.new(0, 10, 0, 5)
			Label.BackgroundTransparency = 1
			Label.TextXAlignment = Enum.TextXAlignment.Left

			local Layout = Instance.new("UIListLayout", Section)
			Layout.SortOrder = Enum.SortOrder.LayoutOrder
			Layout.Padding = UDim.new(0, 5)

			local sectionAPI = {}

			function sectionAPI:AddToggle(label, default, callback)
				local Toggle = Instance.new("TextButton", Section)
				Toggle.Size = UDim2.new(1, -20, 0, 25)
				Toggle.Position = UDim2.new(0, 10, 0, 25)
				Toggle.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
				Toggle.Text = ""

				local Text = Instance.new("TextLabel", Toggle)
				Text.Text = label
				Text.Font = Enum.Font.Gotham
				Text.TextSize = 13
				Text.TextColor3 = Color3.fromRGB(255, 255, 255)
				Text.Size = UDim2.new(1, -30, 1, 0)
				Text.Position = UDim2.new(0, 5, 0, 0)
				Text.BackgroundTransparency = 1
				Text.TextXAlignment = Enum.TextXAlignment.Left

				local Box = Instance.new("Frame", Toggle)
				Box.Size = UDim2.new(0, 20, 0, 20)
				Box.Position = UDim2.new(1, -25, 0.5, -10)
				Box.BackgroundColor3 = default and Color3.fromRGB(130, 85, 255) or Color3.fromRGB(50, 50, 60)

				local state = default

				Toggle.MouseButton1Click:Connect(function()
					state = not state
					Box.BackgroundColor3 = state and Color3.fromRGB(130, 85, 255) or Color3.fromRGB(50, 50, 60)
					pcall(callback, state)
				end)
			end

			function sectionAPI:AddDropdown(label, options, callback)
				local Drop = Instance.new("TextButton", Section)
				Drop.Size = UDim2.new(1, -20, 0, 25)
				Drop.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
				Drop.Text = label .. " ▼"
				Drop.Font = Enum.Font.Gotham
				Drop.TextSize = 13
				Drop.TextColor3 = Color3.fromRGB(255, 255, 255)

				local Open = false

				Drop.MouseButton1Click:Connect(function()
					if Open then return end
					Open = true

					for _, opt in ipairs(options) do
						local OptBtn = Instance.new("TextButton", Section)
						OptBtn.Size = UDim2.new(1, -20, 0, 25)
						OptBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
						OptBtn.Text = opt
						OptBtn.Font = Enum.Font.Gotham
						OptBtn.TextSize = 13
						OptBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

						OptBtn.MouseButton1Click:Connect(function()
							Drop.Text = label .. ": " .. opt
							callback(opt)
							Open = false
							for _, child in ipairs(Section:GetChildren()) do
								if child:IsA("TextButton") and child ~= Drop then
									child:Destroy()
								end
							end
						end)
					end
				end)
			end

			return sectionAPI
		end

		function tabAPI:AddLeftSection(title)
			return createSection(Left, title)
		end

		function tabAPI:AddRightSection(title)
			return createSection(Right, title)
		end

		return tabAPI
	end

	return NebulaUI
end

return NebulaUI
