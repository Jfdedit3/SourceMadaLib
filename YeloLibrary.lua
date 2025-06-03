local CludeLib = {}

function CludeLib:CreateWindow()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "CludeLib"
    ScreenGui.Parent = game:GetService("CoreGui")

    local Frame = Instance.new("Frame")
    Frame.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
    Frame.Size = UDim2.new(0.20000000298023224, 275, 0.20000000298023224, 290)
    Frame.BorderSizePixel = 0
    Frame.Parent = ScreenGui

    local UICorner = Instance.new("UICorner")
    UICorner.Parent = Frame

    local TabLine = Instance.new("Frame")
    TabLine.Name = "TabLine"
    TabLine.BackgroundColor3 = Color3.fromRGB(58, 58, 58)
    TabLine.Size = UDim2.new(0, 1, 1, -24)
    TabLine.Position = UDim2.new(0, 121, 0, 24)
    TabLine.BorderSizePixel = 0
    TabLine.Parent = Frame

    local TitleLine = Instance.new("Frame")
    TitleLine.Name = "TitleLine"
    TitleLine.BackgroundColor3 = Color3.fromRGB(58, 58, 58)
    TitleLine.Size = UDim2.new(1, 0, 0, 1)
    TitleLine.Position = UDim2.new(0, 0, 0, 24)
    TitleLine.BorderSizePixel = 0
    TitleLine.Parent = Frame

    local TabHolder = Instance.new("ScrollingFrame")
    TabHolder.Name = "TabHolder"
    TabHolder.BackgroundColor3 = Color3.fromRGB(162, 162, 162)
    TabHolder.BackgroundTransparency = 1
    TabHolder.Size = UDim2.new(0, 119, 0, 351)
    TabHolder.Position = UDim2.new(0, 0, 0, 25)
    TabHolder.ScrollBarThickness = 1
    TabHolder.Parent = Frame

    local UIListLayout = Instance.new("UIListLayout")
    UIListLayout.FillDirection = Enum.FillDirection.Vertical
    UIListLayout.Parent = TabHolder

    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.Text = "CludeHub"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 24
    Title.Font = Enum.Font.SourceSansBold
    Title.BackgroundColor3 = Color3.fromRGB(162, 162, 162)
    Title.BackgroundTransparency = 1
    Title.Size = UDim2.new(1, -13, 0, 28)
    Title.Position = UDim2.new(0, 13, 0, 0)
    Title.TextWrapped = true
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Parent = Frame

    local ContentHolder = Instance.new("Frame")
    ContentHolder.Name = "ContentHolder"
    ContentHolder.BackgroundTransparency = 1
    ContentHolder.Position = UDim2.new(0, 122, 0, 25)
    ContentHolder.Size = UDim2.new(1, -122, 1, -25)
    ContentHolder.Parent = Frame

    local Tabs = {}

    local Window = {}

    function Window:CreateTab(tabName)
        local TabButton = Instance.new("TextButton")
        TabButton.Name = "TabButton"
        TabButton.Text = tabName
        TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        TabButton.TextSize = 18
        TabButton.Font = Enum.Font.SourceSansBold
        TabButton.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
        TabButton.Size = UDim2.new(0, 118, 0, 29)
        TabButton.BorderSizePixel = 0

        local UICorner = Instance.new("UICorner")
        UICorner.Parent = TabButton

        TabButton.Parent = TabHolder

        local TabFrame = Instance.new("Frame")
        TabFrame.Name = tabName .. "_Frame"
        TabFrame.Size = UDim2.new(1, 0, 1, 0)
        TabFrame.BackgroundTransparency = 1
        TabFrame.Visible = false
        TabFrame.Parent = ContentHolder

        -- Left and right sections as ScrollingFrames
        local Left = Instance.new("ScrollingFrame")
        Left.Name = "Left"
        Left.BackgroundTransparency = 1
        Left.Position = UDim2.new(0, 0, 0, 0)
        Left.Size = UDim2.new(0.5, -5, 1, 0)
        Left.CanvasSize = UDim2.new(0, 0, 0, 0)
        Left.AutomaticCanvasSize = Enum.AutomaticSize.Y
        Left.ScrollBarThickness = 1
        Left.Parent = TabFrame

        local LeftLayout = Instance.new("UIListLayout")
        LeftLayout.SortOrder = Enum.SortOrder.LayoutOrder
        LeftLayout.Padding = UDim.new(0, 5)
        LeftLayout.Parent = Left

        local Right = Instance.new("ScrollingFrame")
        Right.Name = "Right"
        Right.BackgroundTransparency = 1
        Right.Position = UDim2.new(0.5, 5, 0, 0)
        Right.Size = UDim2.new(0.5, -5, 1, 0)
        Right.CanvasSize = UDim2.new(0, 0, 0, 0)
        Right.AutomaticCanvasSize = Enum.AutomaticSize.Y
        Right.ScrollBarThickness = 1
        Right.Parent = TabFrame

        local RightLayout = Instance.new("UIListLayout")
        RightLayout.SortOrder = Enum.SortOrder.LayoutOrder
        RightLayout.Padding = UDim.new(0, 5)
        RightLayout.Parent = Right

        Tabs[tabName] = {TabFrame = TabFrame, Left = Left, Right = Right, Button = TabButton}

        TabButton.MouseButton1Click:Connect(function()
            for _, v in pairs(Tabs) do
                v.TabFrame.Visible = false
                v.Button.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
            end
            Tabs[tabName].TabFrame.Visible = true
            TabButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        end)

        -- Show first tab by default
        if #TabHolder:GetChildren() == 1 then
            TabButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            TabFrame.Visible = true
        end

        function Tabs[tabName].AddSection(text, side)
            local Section = Instance.new("Frame")
            Section.Size = UDim2.new(1, 0, 0, 50)
            Section.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            Section.BorderSizePixel = 0
            local corner = Instance.new("UICorner", Section)

            local Label = Instance.new("TextLabel")
            Label.Size = UDim2.new(1, -10, 1, 0)
            Label.Position = UDim2.new(0, 5, 0, 0)
            Label.BackgroundTransparency = 1
            Label.Text = text
            Label.TextColor3 = Color3.fromRGB(255, 255, 255)
            Label.Font = Enum.Font.SourceSans
            Label.TextSize = 18
            Label.TextXAlignment = Enum.TextXAlignment.Left
            Label.Parent = Section

            if side == "left" then
                Section.Parent = Tabs[tabName].Left
            elseif side == "right" then
                Section.Parent = Tabs[tabName].Right
            else
                Section.Parent = Tabs[tabName].Left -- default left if invalid
            end
        end

        return Tabs[tabName]
    end

    return Window
end

return CludeLib
