local TweenService = game:GetService("TweenService")

local Clude = {}

-- Function for creating a new window
function Clude:CreateWindow(options)
    local window = Instance.new("Frame")
    window.Size = UDim2.new(0, 400, 0, 600)
    window.Position = UDim2.new(0.5, -200, 0.5, -300)
    window.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    window.BackgroundTransparency = 0.5
    window.Parent = game.CoreGui

local goalSize = UDim2.new(0, 500, 0, 360)
    local goalTransparency = 0 -- Start with fully transparent

    local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
    local sizeTween = TweenService:Create(window, tweenInfo, {Size = goalSize})
    local transparencyTween = TweenService:Create(window, tweenInfo, {BackgroundTransparency = 0}) -- Make it visible

    -- Play the tween
    sizeTween:Play()
    transparencyTween:Play()

    -- When the animation finishes, ensure the background is fully visible
    sizeTween.Completed:Connect(function()
        window.BackgroundTransparency = 0
    end)

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 50)
    title.BackgroundTransparency = 1
    title.Text = options.Title or "Clude UI"
    title.TextColor3 = Color3.new(1, 1, 1)
    title.Font = Enum.Font.GothamBold
    title.TextSize = 24
    title.Parent = window

    -- Create Tab container
    local tabContainer = Instance.new("Frame")
    tabContainer.Size = UDim2.new(1, 0, 1, -50)
    tabContainer.Position = UDim2.new(0, 0, 0, 50)
    tabContainer.BackgroundTransparency = 1
    tabContainer.Parent = window

    local tabs = {}
    function Clude:CreateTab(name)
        local tab = Instance.new("Frame")
        tab.Size = UDim2.new(1, 0, 1, 0)
        tab.BackgroundTransparency = 1
        tab.Parent = tabContainer

        -- Store the tab for later use
        table.insert(tabs, { name = name, tab = tab })

        return tab
    end

    -- Create button
    function Clude:CreateButton(tab, label, callback)
        local button = Instance.new("TextButton")
        button.Size = UDim2.new(0, 200, 0, 50)
        button.Position = UDim2.new(0.5, -100, 0, 20)
        button.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
        button.Text = label
        button.TextColor3 = Color3.new(1, 1, 1)
        button.Font = Enum.Font.Gotham
        button.TextSize = 18
        button.Parent = tab
        Instance.new("UICorner", button).CornerRadius = UDim.new(0, 5)

        button.MouseButton1Click:Connect(function()
            if callback then
                callback()
            end
        end)
    end

    -- Create toggle button
    function Clude:CreateToggle(tab, label, defaultState, callback)
        local toggleFrame = Instance.new("Frame")
        toggleFrame.Size = UDim2.new(0, 200, 0, 50)
        toggleFrame.Position = UDim2.new(0.5, -100, 0, 80)
        toggleFrame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
        toggleFrame.Parent = tab

        local toggleButton = Instance.new("TextButton")
        toggleButton.Size = UDim2.new(0, 40, 0, 40)
        toggleButton.Position = UDim2.new(0, 0, 0, 5)
        toggleButton.BackgroundColor3 = Color3.new(0.2, 0.7, 0.2)
        toggleButton.Text = ""
        toggleButton.Parent = toggleFrame
        Instance.new("UICorner", toggleButton).CornerRadius = UDim.new(0, 5)

        local stateLabel = Instance.new("TextLabel")
        stateLabel.Size = UDim2.new(1, -60, 1, 0)
        stateLabel.Position = UDim2.new(0, 50, 0, 0)
        stateLabel.BackgroundTransparency = 1
        stateLabel.Text = label
        stateLabel.TextColor3 = Color3.new(1, 1, 1)
        stateLabel.Font = Enum.Font.Gotham
        stateLabel.TextSize = 16
        stateLabel.Parent = toggleFrame

        toggleButton.MouseButton1Click:Connect(function()
            defaultState = not defaultState
            toggleButton.BackgroundColor3 = defaultState and Color3.new(0.2, 0.7, 0.2) or Color3.new(0.7, 0.2, 0.2)
            if callback then
                callback(defaultState)
            end
        end)

        -- Initialize with default state
        toggleButton.BackgroundColor3 = defaultState and Color3.new(0.2, 0.7, 0.2) or Color3.new(0.7, 0.2, 0.2)
    end

    -- Create slider
    function Clude:CreateSlider(tab, label, min, max, defaultValue, callback)
        local sliderFrame = Instance.new("Frame")
        sliderFrame.Size = UDim2.new(0, 200, 0, 50)
        sliderFrame.Position = UDim2.new(0.5, -100, 0, 140)
        sliderFrame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
        sliderFrame.Parent = tab

        local slider = Instance.new("TextButton")
        slider.Size = UDim2.new(0, 200, 0, 10)
        slider.Position = UDim2.new(0, 0, 0, 20)
        slider.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)
        slider.Text = ""
        slider.Parent = sliderFrame

        local handle = Instance.new("TextButton")
        handle.Size = UDim2.new(0, 20, 0, 20)
        handle.Position = UDim2.new(0, 0, 0, -5)
        handle.BackgroundColor3 = Color3.new(0.6, 0.6, 0.6)
        handle.Text = ""
        handle.Parent = slider

        local valueLabel = Instance.new("TextLabel")
        valueLabel.Size = UDim2.new(1, -60, 1, 0)
        valueLabel.Position = UDim2.new(0, 50, 0, 0)
        valueLabel.BackgroundTransparency = 1
        valueLabel.Text = label .. ": " .. defaultValue
        valueLabel.TextColor3 = Color3.new(1, 1, 1)
        valueLabel.Font = Enum.Font.Gotham
        valueLabel.TextSize = 16
        valueLabel.Parent = sliderFrame

        local function updateSliderPosition(value)
            local percent = (value - min) / (max - min)
            handle.Position = UDim2.new(percent, -10, 0, -5)
            valueLabel.Text = label .. ": " .. math.floor(value)
            if callback then
                callback(value)
            end
        end

        slider.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                local connection
                connection = game:GetService("UserInputService").InputChanged:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseMovement then
                        local xPos = math.clamp(input.Position.X - slider.AbsolutePosition.X, 0, slider.AbsoluteSize.X)
                        local value = min + (xPos / slider.AbsoluteSize.X) * (max - min)
                        updateSliderPosition(value)
                    end
                end)

                game:GetService("UserInputService").InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        connection:Disconnect()
                    end
                end)
            end
        end)

        updateSliderPosition(defaultValue)
    end

    -- Create dropdown menu
    function Clude:CreateDropdown(tab, label, options, callback)
        local dropdownFrame = Instance.new("Frame")
        dropdownFrame.Size = UDim2.new(0, 200, 0, 50)
        dropdownFrame.Position = UDim2.new(0.5, -100, 0, 200)
        dropdownFrame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
        dropdownFrame.Parent = tab

        local button = Instance.new("TextButton")
        button.Size = UDim2.new(0, 200, 0, 40)
        button.Position = UDim2.new(0, 0, 0, 5)
        button.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
        button.Text = label
        button.TextColor3 = Color3.new(1, 1, 1)
        button.Font = Enum.Font.Gotham
        button.TextSize = 16
        button.Parent = dropdownFrame
        Instance.new("UICorner", button).CornerRadius = UDim.new(0, 5)

        local dropdownList = Instance.new("ScrollingFrame")
        dropdownList.Size = UDim2.new(1, 0, 0, 100)
        dropdownList.Position = UDim2.new(0, 0, 0, 45)
        dropdownList.BackgroundTransparency = 1
        dropdownList.Parent = dropdownFrame
        dropdownList.CanvasSize = UDim2.new(0, 0, 0, 0)

        for _, option in pairs(options) do
            local optionButton = Instance.new("TextButton")
            optionButton.Size = UDim2.new(1, 0, 0, 30)
            optionButton.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
            optionButton.Text = option
            optionButton.TextColor3 = Color3.new(1, 1, 1)
            optionButton.Font = Enum.Font.Gotham
            optionButton.TextSize = 16
            optionButton.Parent = dropdownList
            Instance.new("UICorner", optionButton).CornerRadius = UDim.new(0, 5)

            optionButton.MouseButton1Click:Connect(function()
                button.Text = "Selected: " .. option
                dropdownList.Visible = false
                if callback then callback(option) end
            end)
        end

        button.MouseButton1Click:Connect(function()
            dropdownList.Visible = not dropdownList.Visible
        end)
    end

    -- Function for creating a label with text
    function Clude:CreateLabel(tab, text)
        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, -20, 0, 40)
        label.BackgroundTransparency = 1
        label.Text = text
        label.TextColor3 = Color3.new(1, 1, 1)
        label.Font = Enum.Font.Gotham
        label.TextSize = 16
        label.Parent = tab
        Instance.new("UICorner", label).CornerRadius = UDim.new(0, 5)
    end

    -- Function for creating a paragraph of text
    function Clude:CreateParagraph(tab, text)
        local paragraph = Instance.new("TextLabel")
        paragraph.Size = UDim2.new(1, -20, 0, 60)
        paragraph.BackgroundTransparency = 1
        paragraph.Text = text
        paragraph.TextColor3 = Color3.new(1, 1, 1)
        paragraph.Font = Enum.Font.Gotham
        paragraph.TextSize = 14
        paragraph.TextWrapped = true
        paragraph.Parent = tab
        Instance.new("UICorner", paragraph).CornerRadius = UDim.new(0, 5)
    end

    return Clude
end
