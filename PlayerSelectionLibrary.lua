local AdminGui = {}

function AdminGui:CreateWindow(title)
    local Frame = Instance.new("Frame")
    Frame.Name = "AddWindow"
    Frame.BackgroundColor3 = Color3.fromRGB(26, 18, 30)
    Frame.Size = UDim2.new(0.202, 275, 0.202, 290)
    Frame.Position = UDim2.new(0.2, 0, 0, 0)

    local ImageLabel = Instance.new("ImageLabel")
    ImageLabel.Name = "ProfileImage"
    ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ImageLabel.Size = UDim2.new(0, 50, 0, 50)
    ImageLabel.Position = UDim2.new(0, 3, 0, 30)
    local UICorner = Instance.new("UICorner")
    UICorner.Parent = ImageLabel
    ImageLabel.Parent = Frame

    local TitleLine = Instance.new("Frame")
    TitleLine.Name = "TitleLine"
    TitleLine.BackgroundColor3 = Color3.fromRGB(54, 46, 63)
    TitleLine.Size = UDim2.new(1, 0, 0, 1)
    TitleLine.Position = UDim2.new(0, 0, 0, 30)
    TitleLine.BorderSizePixel = 0
    TitleLine.Parent = Frame

    local JumpLabel = Instance.new("TextLabel")
    JumpLabel.Name = "JumpLabel"
    JumpLabel.Text = "JumpPower:"
    JumpLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    JumpLabel.TextSize = 18
    JumpLabel.Font = Enum.Font.SourceSansBold
    JumpLabel.BackgroundTransparency = 1
    JumpLabel.Size = UDim2.new(0, 120, 0, 29)
    JumpLabel.Position = UDim2.new(0, 3, 0, 138)
    JumpLabel.TextWrapped = true
    JumpLabel.TextXAlignment = Enum.TextXAlignment.Left
    JumpLabel.Parent = Frame

    local SpeedLabel = Instance.new("TextLabel")
    SpeedLabel.Name = "SpeedLabel"
    SpeedLabel.Text = "WalkSpeed:"
    SpeedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    SpeedLabel.TextSize = 18
    SpeedLabel.Font = Enum.Font.SourceSansBold
    SpeedLabel.BackgroundTransparency = 1
    SpeedLabel.Size = UDim2.new(0, 120, 0, 29)
    SpeedLabel.Position = UDim2.new(0, 3, 0, 121)
    SpeedLabel.TextWrapped = true
    SpeedLabel.TextXAlignment = Enum.TextXAlignment.Left
    SpeedLabel.Parent = Frame

    local DistanceLabel = Instance.new("TextLabel")
    DistanceLabel.Name = "DistanceLabel"
    DistanceLabel.Text = "Distance:"
    DistanceLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    DistanceLabel.TextSize = 18
    DistanceLabel.Font = Enum.Font.SourceSansBold
    DistanceLabel.BackgroundTransparency = 1
    DistanceLabel.Size = UDim2.new(0, 120, 0, 29)
    DistanceLabel.Position = UDim2.new(0, 3, 0, 101)
    DistanceLabel.TextWrapped = true
    DistanceLabel.TextXAlignment = Enum.TextXAlignment.Left
    DistanceLabel.Parent = Frame

    local Line = Instance.new("Frame")
    Line.Name = "Line"
    Line.BackgroundColor3 = Color3.fromRGB(54, 46, 62)
    Line.Size = UDim2.new(1, 0, 0, 1)
    Line.Position = UDim2.new(0, 0, 0, 190)
    Line.BorderSizePixel = 0
    Line.Parent = Frame

    local UsernameLabel = Instance.new("TextLabel")
    UsernameLabel.Name = "UsernameLabel"
    UsernameLabel.Text = ""
    UsernameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    UsernameLabel.TextSize = 18
    UsernameLabel.Font = Enum.Font.SourceSansBold
    UsernameLabel.BackgroundTransparency = 1
    UsernameLabel.Size = UDim2.new(0, 220, 0, 29)
    UsernameLabel.Position = UDim2.new(0, 67, 0, 40)
    UsernameLabel.TextWrapped = true
    UsernameLabel.TextXAlignment = Enum.TextXAlignment.Left
    UsernameLabel.Parent = Frame

    local UICornerFrame = Instance.new("UICorner")
    UICornerFrame.Parent = Frame

    local UsernameSelection = Instance.new("ScrollingFrame")
    UsernameSelection.Name = "UsernameSelection"
    UsernameSelection.BackgroundColor3 = Color3.fromRGB(25, 17, 29)
    UsernameSelection.Size = UDim2.new(0, 156, 0, 157)
    UsernameSelection.Position = UDim2.new(0.2, 149, 0, 29)
    UsernameSelection.CanvasSize = UDim2.new(0, 0, 0, 0)
    UsernameSelection.ScrollBarThickness = 6
    UsernameSelection.Parent = Frame

    local UICornerUsername = Instance.new("UICorner")
    UICornerUsername.Parent = UsernameSelection

    local UsernameListLayout = Instance.new("UIListLayout")
    UsernameListLayout.FillDirection = Enum.FillDirection.Vertical
    UsernameListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UsernameListLayout.Padding = UDim.new(0, 2)
    UsernameListLayout.Parent = UsernameSelection

    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.Text = title or "Title"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 28
    Title.TextScaled = true
    Title.Font = Enum.Font.SourceSansBold
    Title.BackgroundTransparency = 1
    Title.Size = UDim2.new(1, -60, 0, 29)
    Title.Position = UDim2.new(0, 19, 0, 0)
    Title.TextWrapped = true
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Parent = Frame

    local Container = Instance.new("ScrollingFrame")
    Container.Name = "Container"
    Container.BackgroundTransparency = 1
    Container.Size = UDim2.new(0, 394, 0, 184)
    Container.Position = UDim2.new(0, 3, 0, 192)
    Container.CanvasSize = UDim2.new(0, 0, 0, 0)
    Container.ScrollBarThickness = 6
    Container.Parent = Frame

    local ContainerListLayout = Instance.new("UIListLayout")
    ContainerListLayout.FillDirection = Enum.FillDirection.Horizontal
    ContainerListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    ContainerListLayout.Padding = UDim.new(0, 6)
    ContainerListLayout.Parent = Container

    local HealthLabel = Instance.new("TextLabel")
    HealthLabel.Name = "HealthLabel"
    HealthLabel.Text = "Health: 100"
    HealthLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    HealthLabel.TextSize = 18
    HealthLabel.Font = Enum.Font.SourceSansBold
    HealthLabel.BackgroundTransparency = 1
    HealthLabel.Size = UDim2.new(0, 190, 0, 29)
    HealthLabel.Position = UDim2.new(0, 3, 0, 80)
    HealthLabel.TextXAlignment = Enum.TextXAlignment.Left
    HealthLabel.Parent = Frame

    local Players = game:GetService("Players")
    local localPlayer = Players.LocalPlayer

    local selectedPlayer = nil

    -- Function to update all stats UI labels
    local function updateUI(player)
        if not player then return end
        selectedPlayer = player

        UsernameLabel.Text = player.Name

        -- Update Profile Image
        pcall(function()
            local thumbUrl = Players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100)
            ImageLabel.Image = thumbUrl
        end)

        local character = player.Character
        local humanoid = character and character:FindFirstChildOfClass("Humanoid")
        local hrp = character and character:FindFirstChild("HumanoidRootPart")

        if humanoid then
            SpeedLabel.Text = "WalkSpeed: " .. tostring(humanoid.WalkSpeed)
            JumpLabel.Text = "JumpPower: " .. tostring(humanoid.JumpPower)
            HealthLabel.Text = "Health: " .. tostring(math.floor(humanoid.Health))
        else
            SpeedLabel.Text = "WalkSpeed: N/A"
            JumpLabel.Text = "JumpPower: N/A"
            HealthLabel.Text = "Health: N/A"
        end

        if hrp then
            local dist = (hrp.Position - localPlayer.Character.HumanoidRootPart.Position).Magnitude
            DistanceLabel.Text = string.format("Distance: %.2f", dist)
        else
            DistanceLabel.Text = "Distance: N/A"
        end
    end

    -- Fill UsernameSelection with buttons for all players
    local function refreshPlayerButtons()
        UsernameSelection:ClearAllChildren()
        UsernameListLayout.Parent = UsernameSelection -- Reset layout

        for _, player in pairs(Players:GetPlayers()) do
            local button = Instance.new("TextButton")
            button.Text = player.Name
            button.Size = UDim2.new(1, -10, 0, 30)
            button.BackgroundColor3 = Color3.fromRGB(50, 35, 60)
            button.TextColor3 = Color3.fromRGB(255, 255, 255)
            button.Font = Enum.Font.SourceSansBold
            button.TextSize = 18
            button.AutoButtonColor = true
            button.Parent = UsernameSelection

            local buttonUICorner = Instance.new("UICorner")
            buttonUICorner.Parent = button

            button.MouseButton1Click:Connect(function()
                updateUI(player)
            end)
        end

        wait() -- wait a frame for layout to update
        UsernameSelection.CanvasSize = UDim2.new(0, 0, 0, UsernameListLayout.AbsoluteContentSize.Y)
    end

    refreshPlayerButtons()

    -- AddButton function, adds a button to Container that acts on selectedPlayer
    function Frame:AddButton(labelText, callback)
        local btn = Instance.new("TextButton")
        btn.Text = labelText
        btn.Size = UDim2.new(0, 100, 0, 30)
        btn.BackgroundColor3 = Color3.fromRGB(50, 35, 60)
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.Font = Enum.Font.SourceSansBold
        btn.TextSize = 18
        btn.Parent = Container

        local btnUICorner = Instance.new("UICorner")
        btnUICorner.Parent = btn

        btn.MouseButton1Click:Connect(function()
            if selectedPlayer and callback then
                callback(selectedPlayer)
                updateUI(selectedPlayer) -- refresh stats in case changed
            end
        end)

        wait() -- wait a frame to update layout
        Container.CanvasSize = UDim2.new(0, ContainerListLayout.AbsoluteContentSize.X, 0, 0)
    end

    -- Return the Frame (window) so user can call AddButton on it
    return Frame
end

return AdminGui
