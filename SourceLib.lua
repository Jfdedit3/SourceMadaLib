local TweenService = game:GetService("TweenService")
local Clude = {}

function Clude:CreateWindow(config)
    local gui = Instance.new("ScreenGui")
    gui.Name = "CludeGui"
    gui.ResetOnSpawn = false
    gui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

    local window = Instance.new("Frame")
    window.Size = UDim2.new(0, 0, 0, 0)
    window.Position = UDim2.new(0.3, 0, 0.01, 0)
    window.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    window.Draggable = true
    window.Active = true
    window.Parent = gui
    Instance.new("UICorner", window).CornerRadius = UDim.new(0, 5)

    local uiStroke = Instance.new("UIStroke")
    uiStroke.Thickness = 3
    uiStroke.Color = Color3.fromRGB(0, 0, 0)  -- Black stroke
    uiStroke.Parent = window

    local closeOpenButton = Instance.new("TextButton")
    closeOpenButton.Size = UDim2.new(0, 40, 0, 40)
    closeOpenButton.Position = UDim2.new(1, -40, 0, 0)
    closeOpenButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    closeOpenButton.Text = "-"
    closeOpenButton.TextColor3 = Color3.new(1, 1, 1)
    closeOpenButton.Font = Enum.Font.SourceSansBold
    closeOpenButton.TextSize = 23
    closeOpenButton.ZIndex = 3
    closeOpenButton.Parent = gui
    Instance.new("UICorner", closeOpenButton).CornerRadius = UDim.new(0, 5)

    closeOpenButton.MouseButton1Click:Connect(function()
    if window.Visible then
        window.Visible = false
        closeOpenButton.Text = "+"
    else
        window.Visible = true
        closeOpenButton.Text = "-"
    end
end)

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 40)
    title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    title.Text = config.Title or "Clude UI"
    title.TextColor3 = Color3.new(1, 1, 1)
    title.Font = Enum.Font.SourceSansBold
    title.TextSize = 22
    title.Parent = window
    Instance.new("UICorner", title).CornerRadius = UDim.new(0, 5)

    local tabbuttons = Instance.new("ScrollingFrame")
    tabbuttons.Size = UDim2.new(0, 110, 1, -40)
    tabbuttons.Position = UDim2.new(0, 0, 0, 40)
    tabbuttons.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    tabbuttons.ScrollBarThickness = 4
    tabbuttons.AutomaticCanvasSize = Enum.AutomaticSize.Y
    tabbuttons.CanvasSize = UDim2.new(0, 0, 0, 0)
    tabbuttons.Parent = window
    Instance.new("UICorner", tabbuttons).CornerRadius = UDim.new(0, 5)

    local tabListLayout = Instance.new("UIListLayout", tabbuttons)
    tabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    tabListLayout.Padding = UDim.new(0, 6)

    local tabfolder = Instance.new("Folder", window)
    tabfolder.Name = "Tabs"

    TweenService:Create(window, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Size = UDim2.new(0, 500, 0, 360),
    Position = UDim2.new(0.3, 0, 0.01, 0)
}):Play()
    
    function Clude:CreateTab(name)
        local container = Instance.new("Frame")
        container.Size = UDim2.new(1, -120, 1, -50)
        container.Position = UDim2.new(0, 114, 0, 45)
        container.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        container.Visible = false
        container.Parent = tabfolder
        Instance.new("UICorner", container).CornerRadius = UDim.new(0, 5)
        
        local scroll = Instance.new("ScrollingFrame")
        scroll.Size = UDim2.new(1, 0, 1, 0)
        scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
        scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
        scroll.ScrollBarThickness = 5
        scroll.BackgroundTransparency = 1
        scroll.Parent = container

        local layout = Instance.new("UIListLayout")
        layout.Padding = UDim.new(0, 8)
        layout.SortOrder = Enum.SortOrder.LayoutOrder
        layout.Parent = scroll

        local tabButton = Instance.new("TextButton")
        tabButton.Size = UDim2.new(1, -10, 0, 32)
        tabButton.Text = name
        tabButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        tabButton.TextColor3 = Color3.new(1, 1, 1)
        tabButton.Font = Enum.Font.SourceSansBold
        tabButton.TextSize = 16
        tabButton.Parent = tabbuttons
        Instance.new("UICorner", tabButton).CornerRadius = UDim.new(0, 5)

        tabButton.MouseButton1Click:Connect(function()
            for _, other in pairs(tabfolder:GetChildren()) do
                other.Visible = false
            end
            container.Visible = true
        end)

        return scroll
    end

    function Clude:CreateButton(tab, text, callback)
        local button = Instance.new("TextButton")
        button.Size = UDim2.new(1, -20, 0, 40)
        button.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
        button.Text = text
        button.TextXAlignment = Enum.TextXAlignment.Left
        button.TextColor3 = Color3.new(1, 1, 1)
        button.Font = Enum.Font.GothamBold
        button.TextSize = 15
        button.Parent = tab
        Instance.new("UICorner", button).CornerRadius = UDim.new(0, 5)
        button.MouseButton1Click:Connect(callback)
    end

    function Clude:CreateToggle(tab, text, default, callback)
    local toggle = Instance.new("TextButton")
    toggle.Size = UDim2.new(1, -20, 0, 50)
    toggle.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    toggle.TextColor3 = Color3.new(1, 1, 1)
    toggle.Font = Enum.Font.GothamBold
    toggle.TextSize = 18
    toggle.Text = text
    toggle.TextXAlignment = Enum.TextXAlignment.Left
    toggle.Parent = tab
    Instance.new("UICorner", toggle).CornerRadius = UDim.new(0, 8)

    -- Toggle switch container (background bar)
    local box = Instance.new("Frame")
    box.Size = UDim2.new(0, 50, 0, 24)
    box.Position = UDim2.new(1, -60, 0.5, -12)
    box.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    box.Parent = toggle
    box.BorderSizePixel = 0
    Instance.new("UICorner", box).CornerRadius = UDim.new(1, 0)

    local uiStroke = Instance.new("UIStroke")
    uiStroke.Thickness = 2
    uiStroke.Color = Color3.fromRGB(0, 0, 0)  -- Black stroke
    uiStroke.Parent = box
        
    -- Switch knob
    local innerBox = Instance.new("Frame")
    innerBox.Size = UDim2.new(0, 22, 0, 22)
    innerBox.Position = UDim2.new(0, 2, 0, 1)
    innerBox.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
    innerBox.Parent = box
    inerBox.ZIndex = 20
    innerBox.BorderSizePixel = 0
    Instance.new("UICorner", innerBox).CornerRadius = UDim.new(1, 0)

    -- State logic
    local state = default
    if state then
        innerBox.Position = UDim2.new(1, -24, 0, 1)
        box.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
    end

    toggle.MouseButton1Click:Connect(function()
        state = not state
        toggle.Text = text
        if state then
            innerBox:TweenPosition(UDim2.new(1, -24, 0, 1), "Out", "Quad", 0.3, true)
            box.BackgroundColor3 = Color3.fromRGB(0, 102, 255)
        else
            innerBox:TweenPosition(UDim2.new(0, 2, 0, 1), "Out", "Quad", 0.3, true)
            box.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
        end
        if callback then callback(state) end
    end)
    end

    function Clude:CreateSlider(tab, text, min, max, default, callback)
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(1, -20, 0, 50)
        frame.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
        frame.Parent = tab
        Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 5)

        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, 0, 0, 20)
        label.BackgroundTransparency = 1
        label.Text = text .. ": " .. default
        label.TextColor3 = Color3.new(1, 1, 1)
        label.Font = Enum.Font.GothamBold
        label.TextSize = 14
        label.Parent = frame

        local slider = Instance.new("TextButton")
        slider.Size = UDim2.new(1, -10, 0, 20)
        slider.Position = UDim2.new(0, 5, 0, 25)
        slider.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        slider.Text = ""
        slider.Parent = frame
        Instance.new("UICorner", slider).CornerRadius = UDim.new(0, 5)

        local value = default
        slider.MouseButton1Click:Connect(function()
            value = value + 1
            if value > max then value = min end
            label.Text = text .. ": " .. value
            if callback then callback(value) end
        end)
    end

    function Clude:CreateInput(tab, label, placeholder, callback)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, -20, 0, 40)
    frame.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    frame.Parent = tab
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 5)

    local labelText = Instance.new("TextLabel")
    labelText.Size = UDim2.new(0, 100, 1, 0)
    labelText.Position = UDim2.new(0, 10, 0, 0)
    labelText.BackgroundTransparency = 1
    labelText.Text = label
    labelText.TextColor3 = Color3.new(1, 1, 1)
    labelText.Font = Enum.Font.GothamBold
    labelText.TextSize = 15
    labelText.TextXAlignment = Enum.TextXAlignment.Left
    labelText.Parent = frame

    local input = Instance.new("TextBox")
    input.Size = UDim2.new(0, 150, 1, -10)
    input.Position = UDim2.new(1, -160, 0, 5)
    input.PlaceholderText = placeholder
    input.Text = ""
    input.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
    input.TextColor3 = Color3.new(1, 1, 1)
    input.Font = Enum.Font.Gotham
    input.TextSize = 15
    input.Parent = frame
    Instance.new("UICorner", input).CornerRadius = UDim.new(0, 5)

 input.FocusLost:Connect(function(enter)
     if enter then callback(input.Text) end
   end)
  end
    
    function Clude:CreateLabel(tab, text)
        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, -20, 0, 40)
        label.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        label.Text = text
        label.TextColor3 = Color3.new(1, 1, 1)
        label.Font = Enum.Font.SourceSansBold
        label.TextSize = 15
        label.Parent = tab
        Instance.new("UICorner", label).CornerRadius = UDim.new(0, 5)
    end

    function Clude:CreateParagraph(tab, text)
        local paragraph = Instance.new("TextLabel")
        paragraph.Size = UDim2.new(1, -20, 0, 60)
        paragraph.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        paragraph.Text = text
        paragraph.TextColor3 = Color3.new(1, 1, 1)
        paragraph.Font = Enum.Font.Gotham
        paragraph.TextSize = 14
        paragraph.TextWrapped = true
        paragraph.TextYAlignment = Enum.TextYAlignment.Top
        paragraph.Parent = tab
        Instance.new("UICorner", paragraph).CornerRadius = UDim.new(0, 5)
    end

    function Clude:CreateDropdown(tab, title, options, callback)
        local drop = Instance.new("TextButton")
        drop.Size = UDim2.new(1, -20, 0, 40)
        drop.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
        drop.Text = title
        drop.TextXAlignment = Enum.TextXAlignment.Left
        drop.TextColor3 = Color3.new(1, 1, 1)
        drop.Font = Enum.Font.GothamBold
        drop.TextSize = 15
        drop.Parent = tab
        Instance.new("UICorner", drop).CornerRadius = UDim.new(0, 5)

        local open = false
        local list = {}

        drop.MouseButton1Click:Connect(function()
            open = not open
            for _, item in ipairs(list) do
                item.Visible = open
            end
        end)

        for _, option in ipairs(options) do
            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(1, -40, 0, 30)
            btn.Position = UDim2.new(0, 20, 0, 0)
            btn.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
            btn.Text = option
            btn.TextColor3 = Color3.new(1, 1, 1)
            btn.Font = Enum.Font.Gotham
            btn.TextSize = 14
            btn.Visible = false
            btn.Parent = tab
            Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 5)
            table.insert(list, btn)
            btn.MouseButton1Click:Connect(function()
                callback(option)
                drop.Text = title .. ": " .. option
                for _, b in ipairs(list) do b.Visible = false end
                open = false
            end)
        end
    end
    
    return Clude
end

function Clude:Destroy()
    local gui = game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui"):FindFirstChild("CludeGui")
    if gui then
        gui:Destroy()
    end
end

return Clude
